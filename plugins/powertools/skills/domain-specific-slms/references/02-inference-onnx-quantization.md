# Inference, ONNX & Quantization

Covers: content generation & decoding, inference cost math, GPU utilization, batching, DeepSpeed;
the ONNX format, Runtime, execution providers, export, and graph optimization; precision formats
and 8-bit / 4-bit quantization. (Book chapters 4–6.)

---

## 1. Running inference

**Loading & sizing.** Load with HF Transformers + **Accelerate** (`device_map="auto"` places layers
on the fastest device and transparently offloads overflow to CPU/disk). Estimate memory before
loading: `accelerate estimate-memory <model_id>` prints load size per dtype (the **Total Size**
column is inference-relevant; it counts *load* memory only, not inference overhead). Example
(GPT-Neo 2.7B): FP32 9.89 GB, FP16 4.95 GB, INT8 2.47 GB, INT4 1.24 GB. Open pretrained models
are **not production-ready as-is** — expect hallucinations without fine-tuning / LoRA / RAG.

**Generation methods:**
- **Text completion** — `model.generate(input_ids, do_sample=True, temperature=0.9,
  max_length=200, pad_token_id=<eos>)` then decode.
- **Batch generation** — `tokenizer.padding_side="left"`, `pad_token=eos_token`, tokenize with
  `padding=True`, wrap in `torch.no_grad()`, `batch_decode(skip_special_tokens=True)`.
- **Few-shot learning** — put labeled examples in the prompt (separated by a delimiter like
  `#####`); the model generalizes with **no weight updates**.
- **Code generation** — needs a code-trained base (e.g. GPT-Neo trained on *the Pile*, which
  includes GitHub); always review/lint the output.

**Decoding params:** `do_sample` (on/off sampling), `temperature` (randomness), `top_k` (restrict to
top-k tokens), `top_p` (nucleus), `num_beams` (beam search), `repetition_penalty`,
`no_repeat_ngram_size`, `max_new_tokens`/`max_length`, `pad_token_id`. Temperature + top-k are the
book's primary knobs for open-ended generation; beam search + `top_p` for constrained tasks.

**Evaluating generated content.** Use EleutherAI's **LM-Eval / Evaluation Harness** (200+ tasks,
task *versioning* for reproducibility; sources include HF Hub, OpenAI API, and GPTQ/GGUF-quantized
models). The `wikitext` task reports `word_perplexity`, `byte_perplexity`, `bits_per_byte`.
**Perplexity** = the model's uncertainty predicting the next token (lower is usually better) — but
a single run is unreliable and high perplexity can still be a correct answer.

---

## 2. Inference cost & serving metrics

**Memory formula:** `inference_memory_GB = (4 × P) / (32 ÷ F) × 1.2`
where `4` = bytes/FP32 param, `P` = params in billions, `F` = precision bits (32/16/8), `1.2` = ~20%
overhead. Examples: GPT-Neo 2.7B → 12.96 GB (FP32) / 5.4 GB (FP16); Mistral 7B → 33.6 / 16.2 GB.

**Serving metrics that matter:** **TTFT** (time to first token), **TPOT** (time per output token),
**Latency** (≈ TTFT + TPOT-driven), **Throughput** (tokens/sec across all users).

---

## 3. Getting the most from your GPU

- Choose a GPU by **compute throughput, memory, memory bandwidth**. (T4: 65 TFLOPS FP32/FP16,
  16 GB, 300 GB/s.)
- **ops/byte ratio** = compute ÷ bandwidth (T4 = 216.6). **Arithmetic intensity** = total compute ÷
  total bytes moved (hardware-agnostic). If a model's arithmetic intensity ≪ the GPU's ops/byte,
  it is **memory-bound** — the GPU's compute sits idle waiting on data. GPT-Neo ≈ 30.29 ops/byte ≪
  216.6 → memory-bound.
- **KV cache.** Inference has two phases: **prefill** (ingest all prompt tokens in parallel, populate
  the cache, no generation) and **autoregressive sampling** (decode one token at a time using the
  cache). The cache stores K/V so you don't recompute over all prior tokens — trades a little VRAM
  for a big speedup: measured **10.28 s (cache) vs 51.98 s (no cache)** ≈ 5×. Set
  `generate(..., use_cache=True)` (default True in Transformers; **verify in third-party frameworks**).
  Size: `2 × bytes × n_layers × model_dim` bytes/token.

**Batching.** **Static** (many prompts in one request) vs **dynamic** (queue incoming requests, run
together). Dynamic batching reuses loaded weights → raises arithmetic intensity → higher throughput.
Batch size is bounded by VRAM left after weights + KV cache. Great for **async document queues**;
bad for **chatbots** (queuing hurts felt latency — for those, use a faster GPU or quantization).

**Estimating generation time.** `time/token = bytes_moved ÷ bandwidth`; `prefill = num_tokens ×
(bytes ÷ compute_bandwidth)`; `total = prefill + num_tokens × time/token`. These are lower-bound
estimates; measured time is higher (non-GPU overhead). Other latency levers: **operator fusion,
quantization, compression (sparsity/distillation), parallelization (tensor/pipeline)**.

**DeepSpeed** (Microsoft, Apache 2.0) — distributed training/inference integrated with Transformers
+ Accelerate. Features: **ZeRO** (Zero Redundancy Optimizer), mixed precision, model parallelism,
low-latency inference kernels. `deepspeed.init_inference(model, mp_size=1, dtype=float16,
replace_with_kernel_inject=True)` — **kernel injection** swaps graph ops for optimized versions
(`DeepSpeedSelfAttention`, `QKVGemmOp`, …). Measured ~18% latency reduction (10,511 → 8,552 ms).
Always re-validate accuracy after — optimization can change it. (**MoQ** is DeepSpeed's quantization.)

---

## 4. ONNX

**The format.** ONNX (Open Neural Network Exchange, LFAI project; built at Facebook, backed by
Microsoft/IBM/Intel/AMD/Arm/Qualcomm/…) is an open interchange standard that reduces
framework/hardware lock-in. It is a **directed graph** built on protobuf: edges = typed tensors,
**nodes = operators**. Strongly typed; extensible with custom operators; has a Python reference
runtime for semantics/debugging (**not** production).

**Operators & types.** LLM-relevant ops: `Add`, `MatMul`, `Gemm`, `Softmax`, `LayerNormalization`,
`Transpose`, `Reshape`, `Pad`, `QuantizeLinear` (high-precision tensor + scale + zero-point),
`Gather`, `ArgMax`, `Loop`. Types via `onnx.TensorProto`: FLOAT, FLOAT16, **BFLOAT16**, INT8/16/32/64,
UINT8/…, plus FP8 variants. Build/validate graphs with `make_node`/`make_graph`/`make_model` +
`check_model`; visualize with **Netron**.

**ONNX Runtime (ORT).** Runs ONNX models across CPU/GPU/mobile/edge with kernel fusion,
quantization, and layout transforms. Inference: `rt.InferenceSession(path)` →
`session.run([out], {in: data})`. **ONNX Runtime Web** runs in the browser (WASM + WebGL), no install.

**Execution providers (EPs).** ORT maps nodes to hardware via EPs; pass an *ordered* preference list
to `InferenceSession(..., providers=[...])`. Stable: Default CPU, Intel **OpenVINO**, oneDNN,
XNNPACK, **NVIDIA CUDA**, **NVIDIA TensorRT**, DirectML, AMD MIGraphX/ROCm, Android NNAPI,
Qualcomm QNN. Preview: Apache TVM, ARM-NN, **CoreML** (Apple CPU/GPU/Neural Engine), Huawei CANN,
Azure (remote). `rt.get_available_providers()` lists them.

**Export to ONNX (three levels):**
- **Low-level** `torch.onnx.export(model, args, path, opset_version=…, do_constant_folding=True,
  input_names, output_names, dynamic_axes=…)`. `dynamic_axes` allows variable batch/seq length.
- **Mid-level** `transformers.onnx.export` + `FeaturesManager` (or the CLI
  `python -m transformers.onnx --feature "causal-lm" --model=<ckpt> onnx/`).
- **High-level** **Optimum** — `ORTModelForXxx.from_pretrained(..., export=True)` (one line; not all
  architectures supported).

**Graph optimization.** `onnxruntime.transformers.optimizer.optimize_model(path,
model_type='gpt2'|'bert', num_heads, hidden_size, use_gpu)`. Levels: **0 none / 1 basic (constant
folding + redundant-node removal + safe fusions) / 2 extended (complex, EP-specific fusions) / 99
all (+layout)**. **Offline** optimization (serialize the optimized graph → faster startup) vs **online**
(`sess_options.graph_optimization_level` at session init → slower startup). Validate conversions with
`check_model` + `np.allclose(rtol=1e-5, atol=1e-4)` against the original. CPU BERT example: PyTorch
455 ms → ORT 373 ms (~18%) → ORT-optimized 355 ms.

**I/O binding.** *Problem:* by default ORT keeps data (NumPy) on CPU; with a GPU session this forces
a CPU↔GPU copy every call. **IOBinding** keeps inputs/outputs on-device: `binding =
session.io_binding()`; move tensors to `cuda` + `.contiguous()`; `binding.bind_input(name,
device_type='cuda', ..., buffer_ptr=tensor.data_ptr())`; `session.run_with_iobinding(binding)`.
Pre-allocate + `bind_output` too, else the output still copies back to CPU.

---

## 5. Quantization

**Precision formats.**
- **FP32** (1 sign / 8 exp / 23 mantissa; 4 bytes) — DL training standard.
- **FP16** (1/5/10; 2 bytes) — half the memory; pure FP16 training is unstable → **mixed-precision
  training** (compute in FP16, keep FP32 master weights for stable updates; the low-precision noise
  even acts as mild regularization).
- **BF16** (1/8/7; 2 bytes; Google/TPU, NVIDIA Ampere) — **wider dynamic range than FP16, lower
  precision**; similar inference cost. Check `torch.cuda.is_bf16_supported()`.
- **Quantization** maps floats → low-bit integers (INT8 packs ~4× as many values as FP32 in the same
  memory; INT4 ~8×), at the cost of quantization error. Book focus is **PTQ** (post-training) since
  the baseline only needs fine-tuning/PEFT/RAG, not **QAT** (quantization-aware training).

**8-bit (hands-on).** Two schemes: **absmax** (symmetric: `scale = 127/max(|X|)`, map to [−127,127])
and **zero-point** (asymmetric: has scale + zero-point, map to [−127,128]). Quantization is lossy.
**Granularity:** per-tensor degrades quality; per-value has too much overhead; **vector-wise** (per
row/column) is the practical compromise and is usually enough for domain models under ~7B params.
Above ~7B, **outlier features** appear in activations — even one outlier stretches the range and
wrecks precision.

**LLM.int8()** (arXiv 2208.07339) — INT8 matmul with **near-zero accuracy loss**, ~½ memory. Uses
**absmax + mixed precision**: (1) extract outlier columns by threshold; (2) compute outliers in FP16,
the rest vector-wise INT8; (3) dequantize the INT8 results and add to the FP16 outlier results.
Integrated via **Accelerate + bitsandbytes** (**GPU-only**): `from_pretrained(..., device_map='auto',
load_in_8bit=True)`. Adds compute overhead (worse on larger models).

**8-bit with ONNX.** `onnxruntime.quantization.quantize_dynamic(in, out,
weight_type=QuantType.QInt8)` — **dynamic** quantization runs **CPU-only** (activations quantized at
runtime); **static** needs a calibration set. Since quantization is offline, CPU-only is fine.
Optimum path: `ORTQuantizer.from_pretrained(model)` + `AutoQuantizationConfig.avx512_vnni
(is_static=False, per_channel=False)`. Example (distilbert-banking77): 255.76 MB → **64.33 MB**,
accuracy 92.5% → 92.34% (negligible), **1.86× speedup**.

**4-bit — GPTQ** (arXiv 2210.17323) — one-shot weight quantization using approximate second-order
info; reduces to **3–4 bits/weight** with negligible accuracy loss; **GPU-optimized inference** (175B
on a single A100). Impl: **AutoGPTQ** (in Transformers/Optimum/PEFT). `BaseQuantizeConfig(bits=4,
group_size=128, desc_act=False)`; needs **calibration samples** (e.g. 128 from wikitext-2-raw); a few
minutes offline. GPT-2 XL: 6.43 GB → 1.02 GB. Loads on CPU or a **single GPU** (no multi-GPU).

**4-bit — ggml / gguf** (ggerganov / llama.cpp) — C library supporting 8/5/4-bit; **CPU-optimized**
(Apple Silicon first, also x86 AVX/AVX2, Android); no third-party deps, zero runtime allocations →
practical for laptops/PCs. Run in Python via **CTransformers** or **llama-cpp-python**. **GGUF** is
the successor format (llama.cpp's only format now): **single file** (embeds tokenizer +
hyperparameters as key-value metadata; extensible without breaking compatibility). The de facto
standard for C/C++ quantized models.

**Picking a method (rule: quantize as little as you can get away with):**
- **FP16/BF16** first — near-lossless, ~2× smaller.
- **INT8** (LLM.int8() on GPU for >7B outlier safety; ONNX dynamic on CPU) — ~4× smaller, small loss.
- **INT4 GPTQ** — biggest models on a single GPU.
- **INT4 ggml/gguf** — CPU / laptop / Apple Silicon deployment.
- Distillation is an alternative shrink method, but quantization is now preferred for
  hardware-specific deployment. **Always re-validate accuracy (perplexity + task metric) and latency
  (p95) after quantizing — one perplexity run is not conclusive.**
