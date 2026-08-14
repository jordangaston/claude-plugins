---
name: domain-specific-slms
description: >
  Design, adapt, optimize, and ship small, domain-specific language models (SLMs) — the
  practitioner's playbook from Guglielmo Iozzia's *Domain-Specific Small Language Models*
  (Manning). Use whenever someone is working with SLMs or trying to make an LLM run cheaply,
  privately, or on constrained hardware. Triggers: "should I fine-tune or use RAG?", "which
  quantization should I use?", "run an LLM on a laptop / CPU / phone / edge device", "shrink /
  speed up / reduce the cost of a model", LoRA / PEFT, ONNX / ONNX Runtime, INT8 / INT4 / GPTQ /
  ggml / gguf / AWQ / SmoothQuant / BitNet / FlexGen, vLLM, Ollama / LM Studio / Jan / Cortex /
  llama.cpp, MLC LLM, DeepSpeed, model profiling, "deploy an LLM with FastAPI / vLLM",
  domain-specific fine-tuning (code, chemistry, proteins, legal, medical, finance), RAG
  pipelines, vector databases, GraphRAG, agentic RAG, LLM agents, long/short-term memory,
  test-time compute, reasoning models, OptiLLM, or building a private/on-prem generative AI
  system in a regulated industry. Also trigger on "generalist LLM vs domain-specific model",
  "reduce inference cost", "quantize", or "which small model for my domain".
---

# Domain-Specific Small Language Models

## What this skill does

This skill is a practitioner's decision-and-technique reference for building **small language
models (SLMs)** that are **adapted to one domain**, **optimized to run cheaply**, and
**deployed close to the data** — including on-prem clusters, laptops, CPUs, and mobile/edge
devices. It distills Guglielmo Iozzia's *Domain-Specific Small Language Models*.

Use it to answer questions like: *Do I fine-tune or use RAG? Which quantization? How do I get
this onto a CPU or a phone? How do I serve it? How do I turn a small model into an accurate,
reasoning, RAG-grounded agent for my domain?*

The book's thesis: **you rarely need a frontier model.** A carefully chosen, well-tuned model in
the **~100M–10B parameter** range, pushed as close as possible to where data is generated and
decisions are made, delivers outsized business value — lower latency, lower cost, data privacy,
regulatory fit, and no vendor lock-in.

## The mental model: the SLM lifecycle

Every SLM project moves through four stages. Most questions map to one of them.

```
1. CHOOSE & ADAPT      Pick a base model in your domain → adapt it
                       (prompting → RAG → PEFT/LoRA → full fine-tune)
        │
2. OPTIMIZE            Make it small and fast enough for your target
                       (precision/quantization → ONNX → profiling → advanced quant)
        │
3. DEPLOY & SERVE      Put it where the data is
                       (vLLM / FastAPI server → laptop runner → Android/edge)
        │
4. COMPOSE             Make it capable and grounded
                       (RAG → vector DB → agents → GraphRAG → memory → test-time compute)
```

The stages are a pipeline, not a waterfall — optimization choices (e.g. INT4 for a phone)
constrain adaptation choices, and composition (RAG) can substitute for adaptation (fine-tuning).

## Reference routing

Load the reference file that matches the task. Read only what you need.

| Topic | Reference file | Read when |
|-------|----------------|-----------|
| What SLMs are, generalist-vs-domain decision, open-source ecosystem, data prep, fine-tuning, LoRA/PEFT, RAG-vs-fine-tune, end-to-end tuning + evaluation | `references/01-fundamentals-and-adaptation.md` | Choosing a base model; deciding how to adapt; preparing data; running a fine-tune; evaluating a tuned model |
| Generation/decoding params, inference cost math, GPU utilization, batching, DeepSpeed, ONNX format + Runtime + providers, exporting to ONNX, precision formats, INT8/INT4, LLM.int8(), GPTQ, ggml/gguf | `references/02-inference-onnx-quantization.md` | Tuning generation quality; cutting inference cost; converting to ONNX; picking a quantization method |
| Domain playbook: code generation, chemistry/proteins/materials; advanced quantization (FlexGen, SmoothQuant, BitNet 1.58-bit) | `references/03-domain-usecases-advanced-quant.md` | Adapting an SLM to a specialized/scientific domain; squeezing a model past INT4 |
| Profiling ONNX graphs, deployment & serving (vLLM, FastAPI, MLC LLM, Android), local runners (Ollama, LM Studio, Jan, Cortex) | `references/04-profiling-deployment-serving.md` | Finding bottlenecks; choosing how/where to serve; running locally or on-device |
| RAG pipelines, vector DBs, agents, GraphRAG, agentic RAG, memory, test-time compute, reasoning SLMs, OptiLLM | `references/05-llm-applications-and-test-time-compute.md` | Building a real application around the model; grounding, agents, or reasoning |

## Master decision frameworks

These are the high-frequency calls. Deeper criteria live in the reference files.

### 1. Domain-specific SLM vs. generalist LLM

Prefer a **domain-specific SLM** when any of these hold:

- **Data is sensitive / regulated** (health, finance, legal, defense) — you need on-prem or
  air-gapped inference, no data leaving your boundary.
- **Cost at scale matters** — per-token API costs of a frontier model dwarf a self-hosted SLM.
- **Latency / offline** — edge, mobile, or real-time needs rule out a round-trip to a hosted API.
- **The task is narrow and repeatable** — a tuned small model matches or beats a generalist on
  *your* task while being 10–100× cheaper to run.
- **You need control** — reproducibility, versioning, no silent model swaps, no vendor lock-in.

Prefer a **generalist (often hosted) LLM** when: the task is broad/open-ended, volume is low,
you have no training data, or time-to-first-prototype dominates cost. Common pattern: prototype
on a generalist, then distill/fine-tune a small model for production.

### 2. RAG vs. fine-tuning (vs. both)

| Use **RAG** when… | Use **fine-tuning / PEFT** when… |
|---|---|
| Knowledge changes often (docs, tickets, policies) | The *behavior/format/style* must change (tone, schema, code dialect) |
| You need source citations / auditability | You need a new *skill* or domain *language*, not just facts |
| Facts are large and enumerable | Latency/prompt-length budget is tight (no room for retrieved context) |
| You must add/remove knowledge without retraining | The domain vocabulary/tokens are alien to the base model |
| Hallucination on facts is the main risk | You need the capability offline with no retrieval store |

**They compose.** The book's headline application pattern is a **fine-tuned (or PEFT-adapted)
domain SLM + RAG**: fine-tune for the domain's *language and behavior*, use RAG for *current,
citable facts*. Default to RAG first (cheaper, faster to iterate); add PEFT/LoRA when RAG can't
fix behavior; reserve full fine-tuning for when PEFT plateaus.

### 3. Quantization / precision picker

Order of preference — stop at the first that meets your accuracy + hardware budget:

1. **FP16 / BF16** (2 bytes) — near-lossless, ~2× smaller than FP32. First step for any GPU.
2. **INT8** (LLM.int8() / bitsandbytes, or ONNX dynamic/static) — ~4× smaller than FP32, small
   accuracy loss; great default for GPU serving and many CPUs.
3. **INT4** — GPTQ (GPU, calibration-based) or ggml/gguf (llama.cpp, CPU/laptop-first). ~8×
   smaller; the workhorse for laptops and commodity hardware. Expect some accuracy cost.
4. **Advanced** — SmoothQuant (better INT8 by moving outliers weight-ward), AWQ, FlexGen
   (offloading for throughput on one GPU), BitNet (1.58-bit ternary, needs a BitNet-native model).

Rule of thumb: **quantize as little as you can get away with.** More bits = more accuracy. Pick
the coarsest precision that still passes your domain evaluation, not the coarsest that runs.

### 4. Deployment / runner picker

| Target | Reach for | Why |
|---|---|---|
| High-throughput GPU serving | **vLLM** (offline batch or OpenAI-compatible online server) | PagedAttention + continuous batching → best tokens/sec |
| Simple custom API / microservice | **FastAPI** wrapping the model | Full control, easy to embed in an app |
| Developer laptop, quick local use | **Ollama** (Modelfile), **LM Studio** (GUI + Python SDK), **Jan**, **Cortex** | Zero-infra, private, gguf-based |
| CPU-only / pure C++ | **llama.cpp** / **ggml/gguf** | No GPU, portable |
| Phone / Android / cross-platform edge | **MLC LLM** (compiles models per-target) | On-device, offline, private |
| CPU/GPU-portable optimized runtime | **ONNX Runtime** | One graph, many execution providers |

## Quick workflow for a new SLM project

1. **Frame the decision** — domain SLM vs generalist (framework 1). If SLM, pick a base model
   from a family already strong in your domain (see fundamentals reference).
2. **Adapt cheaply first** — prompting → RAG → LoRA/PEFT → full fine-tune, in that order. Stop
   when domain evaluation is good enough. (fundamentals + applications references)
3. **Define domain evaluation early** — generic benchmarks lie; build task-specific metrics and a
   validation set before you optimize. (fundamentals reference)
4. **Optimize to the target** — precision/quantization + ONNX; profile to find the real
   bottleneck before optimizing blindly. (inference-onnx-quantization + profiling references)
5. **Deploy where the data is** — pick a runner (framework 4). (deployment reference)
6. **Compose** — add RAG for facts, a vector DB, agents/tools, and (if you need reasoning)
   test-time compute. (applications reference)

## Guardrails the book insists on

- **Measure, don't guess.** Profile before optimizing; benchmark models against *your* task, not
  a leaderboard. Accuracy claims from generic benchmarks rarely survive contact with a domain.
- **Every optimization is a tradeoff.** Quantization and offloading trade accuracy/latency for
  size/throughput. Re-run domain evaluation after every optimization step.
- **Privacy is a feature, not an afterthought.** For regulated data, on-prem/local/on-device
  inference (Ollama, MLC LLM, air-gapped ONNX) is often the *reason* to use an SLM at all.
- **Leave the calibration knob.** Hardware and quantization behave differently than the spec
  sheet — keep tunable params (batch size, precision, decoding params) exposed and re-tune per
  deployment target.
