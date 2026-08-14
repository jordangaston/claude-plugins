# Profiling, Deployment & Serving

Covers: profiling ONNX-ported LLMs and turning raw traces into optimization decisions; serving with
vLLM and FastAPI; edge/mobile with MLC LLM and Android; and running locally with Ollama, LM Studio,
Jan, and Cortex. (Book chapters 10–12.)

---

## 1. Profiling ONNX-ported LLMs

**Enable ORT profiling** (off by default): `sess_options = rt.SessionOptions();
sess_options.enable_profiling = True`, pass to `InferenceSession`. `sess.end_profiling()` stops it and
returns the JSON filename (`onnxruntime_profile__<timestamp>.json`).

**Raw JSON** = a list of trace events. Per event: `cat` (`Session` or `Node`), `dur` (**microseconds**),
`ts`, `name`, `args`. The real per-op cost is the `<Op>_<idx>_kernel_time` node event; its `args`
carry `op_name`, `provider`, `input_type_shape`, `output_type_shape`, `activation_size`. Raw data
alone gives little insight — you must aggregate.

**Turn traces into insight:**
- **Ort_perf_view** (ships with ORT) renders a treemap of per-op latency — but for large models it's
  only a 10,000-ft overview (thousands of calls per op).
- **Custom pipeline** (recommended): `json.load` → `OnnxWholeSession.process_profiling(js)` from
  **mlprodict** → clean DataFrame → **Plotly Express** bar charts. Three views that surface the
  bottleneck: (1) **total duration per op** (`groupby('args_op_name').sum('dur')`), (2) **call counts
  per op**, (3) **proportion of total inference time** per op. For a GPT-2-small ONNX model the
  dominant ops are **Gemm, MatMul, FastGelu**, then Reshape/Transpose/LayerNormalization — i.e.
  matmul-heavy, as expected.
- **Debug a graph** with `onnx.reference.ReferenceEvaluator` (whole model or a single node);
  `verbose` 1→4 adds op sequence, input values, and intermediate outputs.

**Optimizing ONNX graphs for LLMs:**
- **Operator fusion** combines consecutive ops into one node. You can hand-write custom fused ops
  (extend `OpRun`, register via `new_ops=[...]`) — always **validate accuracy before speed**
  (`np.abs(a-b).max()` should be ~0), then benchmark with `timeit`.
- **Automated:** `onnxruntime.transformers.optimizer.optimize_model(path, model_type='gpt2',
  num_heads=config.n_head, hidden_size=config.n_embd, use_gpu=..., opt_level=1)`, then optionally
  `.convert_float_to_float16()` and `save_model_to_file`. Basic level = constant folding + redundant-
  node removal + safe fusions; extended = EP-specific fusions (CPU/CUDA/ROCm). Naming the
  architecture triggers **Skip Layer Normalization Fusion** and **Fast GELU Fusion**. Concrete GPT-2
  result: **half the size (309 vs 622 MB), 108 nodes removed** (mostly redundant Reshape). Confirm
  with **Netron**.

---

## 2. Serving

### vLLM (high-throughput GPU serving)
Apache-2.0 serving lib built on **PagedAttention** (arXiv 2309.06180): stores KV-cache blocks
**non-contiguously** (like OS virtual memory), eliminating fragmentation and preallocation waste and
enabling memory sharing across parallel/beam sampling — this is what raises throughput and batch
size. Also: **continuous batching**, broad hardware (NVIDIA/AMD/Intel/Gaudi/TPU/Trainium), quantization
(GPTQ/AWQ/INT4/INT8/FP8), speculative decoding, chunked prefill, tensor+pipeline parallelism, prefix
caching, **multi-LoRA**, and **OpenAI-API compatibility**.

- **Offline:** `LLM(model_id)` (one line handles download → load → memory profiling → KV-cache init →
  warmup); `.generate(prompt, SamplingParams(temperature, top_p, top_k, max_tokens))` or `.chat(...)`.
  GGUF: pass `LLM(model=gguf_path, tokenizer=base_id)`.
- **Online (OpenAI-compatible server):** `vllm serve microsoft/Phi-3-mini-4k-instruct --dtype float16
  --api-key ...`; client uses the standard `openai.OpenAI(base_url="http://localhost:8000/v1")`.
  Dockerize → Kubernetes / Nginx / AWS.
- **Benchmark** with `benchmarks/benchmark_serving.py` (datasets ShareGPT / ShareGPT4V); reports
  request + token throughput and mean/median/P99 **TTFT / TPOT / ITL**.

### FastAPI (custom API / microservice)
Async framework on Starlette + Pydantic; auto docs at `/docs` (Swagger) and `/redoc`. Pattern: define
Pydantic input/output models, init the model pipeline at startup, expose a POST route, make inference
**`async`** (frees the CPU during I/O waits). Run `fastapi run app.py`; Dockerize → K8s/cloud.

*Worked "pick the best model then serve it" flow:* benchmark 4 variants of GPT-2 (PyTorch FP32, ONNX,
ONNX-optimized, ONNX-optimized FP16) across prompt lengths 1→1024 tokens with 10 warmups + 100 timed
`timeit` runs. Findings: **ONNX-optimized wins up to 512 tokens**; all converge at 1024; **FP16
consistently *degrades* CPU latency** (FP16 helps GPUs, not CPUs). Deploy the winner behind a FastAPI
`async def generate` that builds ORT inputs (`return_tensors="np"`, cast `input_ids` to int32) and
runs an `InferenceSession` with `CPUExecutionProvider`.

### MLC LLM (cross-platform / edge / mobile)
An ML **compiler** + deployment engine running on **MLCEngine** (one engine, OpenAI-compatible API via
REST/Python/JS/iOS/Android). Targets Linux/Win/macOS, browsers, iOS, Android across Intel/AMD/NVIDIA/
Apple Silicon. **3-step build:** (1) `mlc_llm convert_weight <dir> --quantization q4f16_1 --device
cuda`; (2) `mlc_llm gen_config <dir> --quantization q4f16_1 --conv-template <t>` (produces
`mlc-chat-config.json` + param shards + tokenizer — all required); (3) `mlc_llm compile <config> -o
lib.so`. Serve: `mlc_llm serve MODEL --model-lib lib` with `--mode local|interactive|server` and
`--speculative-mode`.

### Android on-device (avoiding TF Lite / MediaPipe)
1. **MLC LLM** — official Android tutorial; compile runtime + model libs, customize the template app,
   bundle weights, install APK. Con: many non-Python components (Android Studio, rustc, JDK, NDK).
2. **mllm** (UbiquitousLearning) — lightweight **plain C++, no deps**, text + multimodal; prebuilt
   FP32/INT4 models; quantization only Q4_0 / Q4_K.
3. **HF Transformers in Termux (pure Python)** — enable Developer Options, install Termux,
   `pip install torch transformers`, run any model directly. Pick a model the device's RAM/CPU can
   handle; quantize as needed.

---

## 3. Running on a laptop (local runners)

**Why local:** commercial platforms collect interaction data with hard-to-verify opt-outs. Local
open-source runners keep data on-device and work fully offline (internet only to download models) —
the core privacy argument for SLMs.

### Ollama
Built on **llama.cpp**; runs any GGUF from HF Hub (45,000+) or its catalog; packages weights + config
via a **Modelfile**; auto-manages GPU. CLI: `ollama run deepseek-r1:8B`, `ollama run
hf.co/<repo>-GGUF`, `ollama list`/`rm`. **REST API on port 11434** (`GET /api/tags`, `POST /api/chat`).
RAM rule of thumb: ≥8 GB for 7B/8B, 14–16 GB for 13B, 32 GB for 33B. **Import a custom model:** build
llama.cpp → `convert_hf_to_gguf.py <dir> --outfile out.gguf` → write a Modelfile (`FROM out.gguf`,
optional `TEMPLATE`, `PARAMETER num_ctx 4096`, `PARAMETER stop ...`) → `ollama create <name> -f
Modelfile`. **Privacy notes:** an updater checks `ollama.com/api/update` every 60 min sending
anonymized OS/arch/version (no toggle — comment out the checker + rebuild to disable); the history
file stores every prompt in plaintext; the server log records REST calls — all unencrypted, so protect
them. No native GUI (use community frontends; local-only, no auth).

### LM Studio
Free desktop app but **not open source** (its SDKs, `lms` CLI, and Apple **MLX** engine are OSS). Runs
GGUF + MLX models, offline after download. Chat view supports document attach (fits in context →
inserted; else RAG chunking). **`lms` CLI** loads models and runs an OpenAI-like server (`lms server
start`). **Speculative decoding** (a small **draft** model + larger **target**, same tokenizer/family):
on M1, ~30% faster for 500 tokens. **Python SDK** (`pip install lmstudio`, OSS): convenience API
(`lms.llm('...').respond("...")`, `respond_stream`) or scoped `with lms.Client()`; embeddings via
`lms.embedding_model(...)` (default **Nomic Embed Text v1.5**); **agentic** `model.act(prompt, [tools],
on_message=...)` runs automatic multi-round tool calling (tools = plain typed Python functions).

### Jan
**100% open source** desktop app; chats with local models **and** commercial APIs (OpenAI, Anthropic,
Groq, Google, OpenRouter). **GGUF only** currently. Warns when a model is too large for the machine.
Built-in **OpenAI-compatible REST server on port 1337** (not started by default). **Con:** the UI chat
and the API server are **mutually exclusive** (can't run both at once); models are GPU-optimized (more
resource-hungry than Ollama/LM Studio).

### Cortex (the engine behind Jan)
Open-source **C++** engine; switchable backends **llama.cpp (default) or ONNX Runtime**; GPU by
default. CLI: `cortex start` (port 39281), `cortex pull tinyllama:1b`, `cortex run tinyllama`.

### Local-runner decision
Choice is mostly task + preference:
- **Ollama** — fully OSS, CPU-optimized (best on commodity hardware), REST API, huge frontend/plugin
  ecosystem, mature Python/TS SDKs, GGUF conversion scripts. *Con:* no native GUI.
- **LM Studio** — friendliest UI, native Apple MLX, speculative decoding, chat-with-documents, mature
  SDKs. *Cons:* app not open source; standalone server hard to build.
- **Jan** — fully OSS, clean UI, server runs without the app, works with cloud models. *Cons:* UI and
  server can't run together; GPU-optimized; SDKs not yet production-ready.
