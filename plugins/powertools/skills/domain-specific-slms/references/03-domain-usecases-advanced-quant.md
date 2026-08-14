# Domain Use Cases & Advanced Quantization

Covers: the transferable playbook for adapting SLMs to a specialized domain (code generation;
chemistry/proteins/materials), and advanced quantization for models that still don't fit after
standard methods — FlexGen, SmoothQuant, BitNet. (Book chapters 7–9.)

---

## 1. The transferable domain-adaptation playbook

Both use-case chapters follow the same shape; reuse it for *any* specialized domain (legal, medical,
finance, telecom, scientific):

1. **Reframe the domain task as a text-sequence problem.** Code is text; molecules are **SMILES**
   strings; proteins are amino-acid sequences; crystals are **CIF** text. If you can serialize the
   domain's objects to tokens, a small decoder-only model can learn them.
2. **Pick a small open model already trained in/near the domain**, ideally with open code + weights +
   dataset (control + reproducibility — the reason regulated fields favor small open models over
   closed APIs).
3. **Fine-tune / PEFT on a modest, high-quality domain set.** With the right data you don't need a
   large model.
4. **Validate with a dedicated *domain tool*, not text metrics alone.** Generic loss/perplexity
   doesn't tell you whether output is *correct*. Always pair automated domain checks with **SME
   review**.
5. **Optimize for the target** (ONNX, quantization) — see reference 02 and §4 below.

---

## 2. Code generation

**Why specialize.** Generalist models score poorly on **SWE-bench** (2,294 real Python GitHub
issues/PRs) — real software engineering needs cross-file coordination and environment interaction
beyond next-token prediction. But specialization shrinks the model dramatically: a few-billion-param
coding model can match or beat larger generalists on benchmarks, with cheaper training and less
copyright/IP risk. AI assists; it doesn't replace the developer (you still need domain knowledge to
use it well).

**CodeGen** (Salesforce, arXiv 2203.13474) — Transformer for *conversational program synthesis*
(interactive multi-step NL → subprogram). Two families: **multi** (C, C++, Go, Java, JS, Python) and
**mono** (Python only), each in **350M / 2B / 6B / 16B**. Load via its own `CodeGenForCausalLM` class.
The 350M is for teaching (not production); **2B** is the robust smallest candidate.

**Prompt patterns (code gen differs from text):**
- Small models (350M) work **only** from a descriptively named function definition (`def hello():`).
- 2B+ also accept **pure natural-language prompts** (English), single-line comments (`# Create ...`),
  multiline docstrings, function-def + inline docstring, REPL-style verification (`>>> print(...)`),
  and unit-test generation (`# Write unit test for ...`).

**ONNX + quantization (via Optimum).** `ORTModelForCausalLM.from_pretrained(id, export=True,
provider="CPUExecutionProvider")`; dynamic quantize with `ORTQuantizer` +
`AutoQuantizationConfig.avx512_vnni(is_static=False)`. Measured: ONNX FP ≈ **19% faster** than
PyTorch; **8-bit ONNX** cuts size ~4× (1.33 GB → 346 MB) and latency ~60%. For a model **not
supported by Optimum**, use the CLI export (`python -m transformers.onnx --feature "causal-lm"
--model=<ckpt> onnx/`) then quantize with raw ORT `quantize_dynamic(..., weight_type=QInt8)`.

**Evaluating code.** Tools: HF **Evaluate**, EleutherAI **LLM Evaluation Harness**. Robustness matters
because models are prompt-sensitive — Amazon's **ReCode** (arXiv 2212.10264) measures worst-case
behavior under prompt perturbations. Benchmark dataset **HumanEval** (OpenAI, arXiv 2107.03374): 164
Python problems, each with `prompt`, `canonical_solution`, `test`, `entry_point`. **Validation
pipeline:** (1) parse generated code with Python's built-in `ast` (`ast.parse`) to reject invalid
syntax; (2) execute against the unit tests for pass/fail. **Gotcha:** HumanEval *comments out* its
exec line as a safety measure — you must re-enable it to actually run generated code, which is
dangerous; **sandbox it**.

**Better code models.** **CodeGen 2.5** — single **7B**, robust **infill sampling** (reads left+right of
the cursor via `<mask_1>`/`<sep>` tokens), **FlashAttention**-optimized. **StarCoder2** (BigCode/
ServiceNow/NVIDIA, arXiv 2402.19173) — **3B** trained on 3T+ tokens (The Stack v2), **grouped-query
attention**, **16,384-token context** with 4,096 sliding-window; not instruction-tuned (best for
function-body-from-header). Quantize with `BitsAndBytesConfig(load_in_8bit=True)` or `load_in_4bit`.
(License note: CodeGen 1/2 + 2.5 mono/multi are Apache 2.0; **2.5-instruct is research-only**.)

**Coding assistance on commodity hardware** (target: MacBook Air, M1, 8 GB). **GGUF gotcha:** HF
Transformers can *download* GGUF but can't *run* it quantized — it auto-dequantizes on load, back to
the too-large original. Use **llama.cpp** via **llama-cpp-python** instead (Metal backend:
`CMAKE_ARGS="-DGGML_METAL=on" pip install llama-cpp-python`). Download a GGUF (e.g.
`second-state/StarCoder2-3B-GGUF`, `...Q4_K_M.gguf`), load `Llama(model_path=..., n_ctx=3072,
n_threads=4, n_gpu_layers=0)`. Local 4-bit K_M benchmark (4 threads, no GPU): ~432 ms avg latency —
usable, fully offline after download. llama-cpp-python also runs an **OpenAI-compatible web server**
for IDE integration. Convert FP checkpoints with `llama.cpp/convert_hf_to_gguf.py <dir> --outfile
<name>.gguf --outtype <quant>`.

---

## 3. Chemistry / life sciences (proteins, antibodies, crystals)

Drug discovery and materials science benefit most: proprietary complex data + high fine-tuning cost
of closed models → academia/industry favor small open pretrained models. **Molecular Transformer**
(acscentsci.9b00576) reframes reaction prediction as **machine translation between SMILES strings**
(>90% top-1 accuracy, no handcrafted rules) — the canonical "domain-as-translation" example.

**ProtGPT2** (protein sequences; Nature s41467-022-32007-7) — **decoder-only GPT-2, 738M**,
self-supervised next-oligomer prediction on 87,162 UniRef50 sequences (no annotations). Generation is
identical to text (`pipeline('text-generation')`, prompt `<|endoftext|>`, `top_k=950,
repetition_penalty=1.2`). ~10 sequences in <2 min on a free Colab **CPU** — no acceleration needed.
Evaluated with **perplexity** (proxy only).

**AntibodyGPT** — built on **ProGen2** (Salesforce, arXiv 2206.13517; trained on >280M sequences;
sizes 151M / 765M / 2.7B / 6.4B), fine-tuned on 5,000 resolved antibody-antigen crystal structures.
Prompt = the target **antigen** sequence; generate with `do_sample=True, top_p=0.9, temperature=0.8`.
**Perf gotcha:** needs a **GPU** (2 sequences ≈ 2 hrs on Colab CPU); set
`PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True` to cut allocator fragmentation. **8-bit** cuts
617 MB → 157 MB and latency ~40%. **Validation:** perplexity is meaningless here — use **ANARCI**
(Oxford OPIG) for antibody numbering/classification; SME review required. This is the general lesson:
**the right validator is domain-specific, not a text metric.**

**CrystaLLM** (crystal structures from CIF; arXiv 2307.04340) — GPT-2-based decoder (adapted from
Karpathy's **nanoGPT**), first model trained on textual **CIF** files; generates physically plausible
inorganic crystals; adds **MCTS + a graph neural network** for better sampling (up to 40% structural
match on unseen structures). Sizes 25M / 200M (small runs on CPU). Workflow: build a composition
prompt → `bin/sample.py` (or `bin/mcts.py` for tree-search decoding) → **post-process** raw CIF
(`bin/postprocess.py`) → **validate** with `bin/evaluate_cifs.py` (space-group consistency, atom-site
multiplicity, bond-length reasonableness, validity rate).

---

## 4. Advanced quantization (when standard methods aren't enough)

Domain SLMs are usually ≤7–8B (+ small LoRA/QLoRA), so standard Ch.6 quantization covers most cases.
Reach for these when a model still exceeds hardware after INT8/INT4, or for compute/sustainability
constraints on larger models.

**FlexGen** (arXiv 2303.06865; repo FlexLLMGen) — **high-throughput** engine for **single-GPU /
limited-VRAM** serving of *large* models. Pools GPU + CPU + disk and solves a **linear program** to
decide which tensors (weights, activations, KV cache) go where and when to move them; compresses
weights + cache to **4-bit** with negligible loss. Fits a 175B model on **16 GB VRAM + 200 GB DRAM +
204 GB disk** (vs ~6 A100s). **Throughput-oriented** — offloading raises per-request latency, so it's
for batch jobs over millions of tokens, **not latency-sensitive** use. **NVIDIA-only**; prebuilt for
OPT / Galactica / BLOOM. CLI `python -m flexgen.flex_opt --model facebook/opt-1.3b --percent <6 ints:
weights/cache/activations × GPU/CPU>`. API: `Policy(...)` + `CompressionConfig(num_bits=4,
group_size=64, ...)`.

**SmoothQuant** (arXiv 2211.10438) — **post-training W8A8** (8-bit weights *and* activations). Problem:
models **>6–7B** develop systematic **activation outliers** that stretch the quant range and destroy
accuracy (naive W8A8 on OPT-6.7B crashes LAMBADA 0.798 → 0.423). Core idea: an offline,
mathematically-equivalent **per-channel scaling** that **migrates quantization difficulty from
activations to weights**, making both quantization-friendly (restores 0.799). Gains: up to **1.56×
speedup, ~50% memory**, minimal accuracy loss. `alpha` = migration strength (**0.5** for models
<100B); needs precomputed `act_scales`. Integrated in Intel Neural Compressor, TensorRT-LLM,
SageMaker.

**BitNet** (arXiv 2310.11453) — **1-bit Transformer trained from scratch** (not PTQ). Replaces linear
layers with **BitLinear** (binarizes weights; rest stays 8-bit; embeddings kept high-precision).
Keeps optimizer states + gradients in high precision for stability; **converges at high learning
rates where FP16 fails**; the loss gap to FP16 narrows with scale (small ~30B, ~0.09 near 100B).
Beats every other PTQ (Absmax/SmoothQuant/GPTQ/QuIP-2bit) on zero-/few-shot tasks with far lower
memory + energy. **BitNet with Python:** Microsoft's **BitNet framework** (C++/llama.cpp, **CPU-only**,
lossless 1-bit inference) supports native 0.7B/3.3B + Llama/Falcon (e.g. `Falcon3-7B-Instruct-1.58bit`
— the **1.58-bit ternary** variant); run via `run_inference.py -m <gguf> -p "<prompt>" -cnv`. A
**pure-Python** alternative (`pip install bitnet`, kyegomez) provides PyTorch BitLinear + CUDA and works
with *any* HF model: `replace_linears_in_hf(model)` swaps linear layers, then run normally. **Guidance:**
standard quantization suits most production local-SLM cases; reserve these for larger models,
complex unstructured content, or strict compute/energy budgets.
