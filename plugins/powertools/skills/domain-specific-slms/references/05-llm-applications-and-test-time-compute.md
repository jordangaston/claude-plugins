# LLM Applications & Test-Time Compute

Covers: building real applications around an SLM — RAG pipelines, vector databases, agents, GraphRAG,
agentic RAG, memory — and adding reasoning via test-time compute, OptiLLM, reasoning SLMs, and GRPO
training. (Book chapters 13–15.)

---

## 1. Why the model alone isn't the product

The language model is the **engine, not the car** (F1 analogy). Business value comes from the whole
system: inputs enriched from external sources, outputs post-processed by tools, plus scalability,
reliability, and security. Scaling a "bigger engine" won't reach AGI and won't fix the real gaps —
Transformers lose context over long chats, are weak at math/logic, and are **confidently wrong** when
fed outdated or incorrect context. This is what motivates RAG (external, current, citable knowledge),
agents (tools + step decomposition), and memory. Smaller specialized models are preferred: cheaper,
easier to keep compliant (you control the full stack), better for privacy/safety/regulation.

---

## 2. SLM + RAG pipeline (from scratch)

**Two phases:** *offline* (chunk corpus → embed → store in a vector DB + index) and *online* (embed
query → similarity retrieve → assemble enriched prompt → generate).

- **Extract & split:** `PyMuPDF` (`fitz`) for PDFs; **spaCy** (`sentencizer`) for sentence splitting.
- **Chunk:** ~10 sentences per chunk to stay under the embedder's token limit and the generator's
  context window; carry page-number + stats metadata (rough token count ≈ `len(text)/4`).
- **Embed:** `sentence-transformers` (BERT-family encoders). Book uses **`all-mpnet-base-v2`** →
  768-dim, fine-tuned on 1B pairs via **contrastive learning**. **Critical gotcha: embed queries with
  the *same* model used to build the KB** (shared vector space).
- **Similarity:** *dot product* (magnitude + direction) vs **cosine similarity** (normalized,
  direction only — semantic). For L2-normalized embeddings the two are identical. Use
  `util.cos_sim` / `util.dot_score` + `torch.topk`.
- **Generate:** a GGUF 4-bit model via `llama-cpp-python`, e.g. **`Phi-3-mini-4k-instruct-gguf`**
  (`Llama.from_pretrained(repo, filename="*-q4.gguf", n_ctx=1024)`). Assemble the prompt by joining
  retrieved chunks + query, then `tokenizer.apply_chat_template(...)` (base prompt is model-specific).

**RAG vs fine-tuning** decision lives in reference 01 §8 — default to RAG for current/citable facts,
PEFT for behavior/domain-language; **they compose**.

---

## 3. Vector databases

Under a few hundred thousand embeddings, a CSV/flat file is fine; beyond that use a vector DB
implementing **ANN (approximate nearest neighbor)**. Open-source options: **Weaviate, Milvus,
OpenSearch, Chroma, LanceDB, FAISS/Qdrant**. Book uses **LanceDB** (serverless, persistent, local→
distributed; vector + full-text + SQL; auto-versioning; Arrow/pandas/Polars; LangChain/LlamaIndex
integration). Workflow: `lancedb.connect()` → `create_table(..., schema=pa.schema([...,
("embedding", pa.list_(pa.float32(), list_size=768))]))` → **`create_index(metric="cosine",
index_type="IVF_FLAT")`** (avoids brute-force scans) → `.search(query_emb).limit(k).to_list()`.
Index-based retrieval helps most on large, noisy, diverse KBs.

---

## 4. Building an agent

An **agent** autonomously **reasons** (analyze + plan steps), **acts** (call tools/APIs), and
**interacts** (users/other agents). Much "agentic" software is really just RPA around a plain model
call — hold that line.

**Framework: HF `smolagents`** (~1,000 LoC; works with HF endpoints, OpenAI/Azure, Together, LiteLLM,
Ollama; integrates LangChain/LangGraph/MCP). Two agent classes:
- **`CodeAgent`** (default, recommended) — writes + executes **Python** per step; safe by default
  (only configured tools + a safelist; blocks arbitrary imports); production sandboxing via **Docker
  or E2B**. Follows the **ReAct** (reasoning + acting) loop. Grounded in *"Executable Code Actions
  Elicit Better LLM Agents"* (arXiv 2402.01030) — code actions beat text/JSON actions.
- **`ToolCallingAgent`** — actions as JSON blobs (older, more constrained).

Model classes: `HfApiModel`, **`TransformersModel`** (local, e.g. `SmolLM2-1.7B-Instruct`,
`device_map="auto"`), **`LiteLLMModel`** (Ollama: `ollama serve` + `api_base=".../11434"`). **Tools:**
`@tool` decorator or subclass `Tool` — **each tool requires a docstring + type hints** (the framework
reads them to expose the tool). Base toolbox: web search, Python interpreter, speech-to-text,
visit-webpage, final-answer. Config: `CodeAgent(tools=..., model=..., max_steps=N,
add_base_tools=True)`; `agent.run(task)`.

**Agent best practices:** instruction-tuned models only; **models under ~3B often underperform on
agentic tasks** (unlike other app types); keep the workflow simple and as **deterministic** as
possible (give the SLM only reliably-completable steps, push deterministic work to code); combine
tools to cut the number of SLM calls; validate data formats/ranges inside custom tools.

---

## 5. GraphRAG

**Why:** baseline (vector) RAG retrieves by semantic similarity and struggles with **multihop
reasoning**, connecting information across sources, and details not stated explicitly. A **knowledge
graph** (nodes = entities, edges = relationships) fixes this.

**Microsoft GraphRAG** (arXiv 2404.16130, *"From Local to Global"*) builds a two-stage LLM index:
(1) derive an entity KG from documents; (2) pre-generate **community summaries** for densely
connected entity groups. **Global search** = one partial answer per community summary → combined into
a final answer (better comprehensiveness/diversity than vanilla RAG). **Local search** = KG entities +
source-doc embeddings (needs a vector DB).

**Book's local implementation:** quantized **Mistral 7B** on Ollama for entity/relationship
extraction; **Ollama structured outputs** constrain generation to a **Pydantic JSON schema**
(`format=Schema.model_json_schema(), temperature=0`) — critical, since without it ~6% of entities and
~25% of relationships come out malformed. Graph in **NetworkX**; **community detection** via the
**Leiden algorithm** (arXiv 1810.08473; refines the partition before aggregation, avoiding Louvain's
disconnected communities; optimizes **modularity**; `resolution` controls community size).

**Microsoft's OSS GraphRAG** (MIT) supports **only OpenAI/Azure OpenAI**, persists artifacts in Apache
Parquet, needs a vector DB (LanceDB/Cosmos/Azure AI Search) even for global-search indexing, and has a
CLI (`graphrag init/index/query --method global|local`). It lacks text extraction, graph viz, and
evaluation — fork it to use local/OSS models.

**RAG evaluation metrics** (BLEU/ROUGE miss factual accuracy + context relevance):
- **Retrieval:** *context precision* (relevant / retrieved), *context recall* (relevant retrieved /
  total relevant).
- **Generation:** *faithfulness* (correct facts / total facts), *answer relevancy* (relevant concepts
  / total). Combine into a weighted RAG score by domain importance.
- **Ragas** is the main OSS lib — but supports only OpenAI/Azure/Vertex/Bedrock (custom work needed
  for local SLMs).

---

## 6. Agentic RAG & memory

**Agentic RAG** adds multi-step retrieval, query adaptation, and multi-tool use over baseline RAG
(e.g. search the vector DB → if irrelevant, fall back to web search → generate). Build tools by
subclassing `Tool`:
- **BM25SearchTool** — keyword search (LangChain `BM25Retriever`; BM25 = term freq + IDF + doc length).
- **SemanticSearchTool** — vector search on LanceDB; embeddings via `all-MiniLM-L6-v2` (384-dim, fast).
- **HybridSearchTool** — LangChain **`EnsembleRetriever`** combining BM25 + semantic with weights
  **[0.4, 0.6]**.
Split docs with `RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=100)`. The agent
(SmolLM2-1.7B) auto-selects keyword/semantic/hybrid/web per query and chains tools for multi-step
questions. (Caution: frameworks that hide their logic are harder to debug.)

**Memory.** *Short-term* = the current conversation; *long-term* = user/app data recalled across
sessions. Library **Memoripy** (works with OpenAI/Azure/OpenRouter and **local Ollama SLMs**):
relevance-based retrieval combining embeddings + concepts + past interactions, **graph-based
associations with spreading activation**, hierarchical clustering, and **decay + reinforcement** (old
memories fade, frequently-accessed ones strengthen). Internals: interaction graph in NetworkX, indexed
with FAISS. Backends: in-memory / JSON / DynamoDB (extend via `BaseStorage`). Entry schema: id,
prompt, output, embedding, timestamp, access_count, concepts, decay_factor.

---

## 7. Test-time compute (TTC) & reasoning SLMs

**TTC** spends extra compute at *inference* to "think" — explore alternatives via **beam search** or
**tree search (MCTS)** within a budget, score candidates, pick the best, optionally execute + check
code. Tradeoff: more thinking = more accuracy but more cost. Vendors market this as "reasoning"; it
genuinely helps math/logic/coding where a single static pass fails, but won't yield AGI. **Risk on
closed models:** cost shifts to opaque per-inference pricing and hidden "thinking" steps — a
validation/compliance problem for regulated industries (another reason to run TTC on your own SLM).

**OptiLLM** (github.com/codelion/optillm) — an **OpenAI-API-compatible proxy** that adds reasoning
techniques on top of any compatible backend (it iterates multiple base-model calls, applies a chosen
algorithm, returns the refined answer). Also runs local HF models + LoRA, or proxies to
llama.cpp/Ollama (external servers that can't sample multiple responses limit which techniques work).
Techniques (by ID): `cepo`, `cot_reflection`, `plansearch`, `re2`, `self_consistency`, `z3` (theorem
prover), `rstar`, `bon` (best-of-N), `moa` (mixture of agents), `mcts`, `pvg`; local-only: **CoT
Decoding**, **Entropy Decoding**, **Thinkdeeper** (uses `reasoning_effort`), **AutoThink**. **AutoThink**
combines **query-complexity classification** (adaptive high/low reasoning budget) with **steering-vector
guidance**. **Gotcha:** small models **overthink** — sound reasoning that wanders to a wrong final
answer or wrong output format; hard to auto-evaluate.

**Reasoning SLMs with embedded TTC** (available via HF/Ollama, mostly GGUF-quantized): **Qwen3**
(0.6B–32B), **DeepSeek-R1 / R1-Zero** (distilled 1.5B–70B on Qwen2.5/Llama3), **Phi-4** (14B,
math-focused), **Open R1** (HF reproduction), **Marco-o1** (Alibaba).

**Building a reasoning domain SLM via GRPO** — **GRPO** (Group Relative Policy Optimization; DeepSeek,
arXiv 2402.03300; used to train DeepSeek-R1) is a **PPO variant that drops the value model**, learning
by comparing groups of actions → much less GPU VRAM, no quality loss. **Stack:** HF **TRL**
(`GRPOConfig`/`GRPOTrainer`) + **vLLM** (~50% faster RL generation) + **Unsloth** (up to 70% less
memory, NVIDIA-only) + **QLoRA** (4-bit + LoRA) to fit a **single 16 GB GPU**. Example: Qwen2.5-3B-
Instruct specialized on additive manufacturing; **200–300 samples suffice** for a >1.5B instruction-
tuned base. Setup: `FastLanguageModel.from_pretrained(..., load_in_4bit=True, fast_inference=True,
max_lora_rank=64)`; `get_peft_model(r=64, target_modules=[q/k/v/o_proj, gate/up/down_proj])`
(**rank 64 = good perf/memory tradeoff**). A system prompt enforces `<reasoning>…</reasoning>
<answer>…</answer>` format. **Reward engineering is the core of RL:** combine multiple reward
functions — correctness (matches ground truth) + format rewards (`xmlcount`, `soft_format`,
`strict_format`) that also validate intermediate structure. `GRPOConfig`: `use_vllm=True,
learning_rate=5e-6, lr_scheduler_type="cosine", optim="adamw_8bit", num_generations=6, max_steps=200`.
Success signal: combined reward rises after ~12 steps. Save the adapter (`save_lora`); the tuned model
emits well-formed reasoning + answer blocks. The method generalizes across domains.
