# Fundamentals & Adaptation

Covers: what SLMs are, generalist-vs-domain decision, the open-source ecosystem, how to adapt a
model (prompting → RAG → PEFT/LoRA → full fine-tune), data preparation for each, and how to
run and evaluate an end-to-end domain fine-tune. (Book chapters 1–3.)

---

## 1. What is a small language model?

- An SLM is a model built for NLP tasks with **fewer parameters, smaller memory footprint, and
  less compute** than an LLM. Same **Transformer architecture** as LLMs — the difference is
  **scale, not principles**. It can address the same tasks, optimized for efficiency over raw power.
- **Parameter range the book uses:** roughly **a few hundred million to ~10 billion** params.
  There is no official cutoff, but most SLMs stay **under 10B**. LLMs are "hundreds of billions or
  more" (tens to hundreds of GB).
- Runs on **CPUs (no GPU)** or **consumer GPUs**; optimized for speed and energy efficiency.
  Local execution keeps data local — the key property for sensitive/regulated data.
- Fits offline / embedded / near-real-time settings: phones, lab equipment, appliances, robotics,
  manufacturing machinery.
- The strategic point: an SLM can be **specialized to a domain at low cost** using private/domain
  data plus domain knowledge, via techniques that avoid full fine-tuning — relevant to healthcare,
  pharma/biotech, manufacturing, chemistry, and finance.
- **Agentic angle:** the book cites NVIDIA's 2025 paper *"Small Language Models are the Future of
  Agentic AI"* (arXiv 2506.02153) — SLMs are powerful enough, better-suited, and more economical
  for agentic systems; **heterogeneous** systems that mix LLMs and SLMs are the natural design.

### Transformer essentials (as the book frames them)
- Pre-transformer: **RNNs** (and **LSTM/GRU**) handled sequences but trained slowly because they
  are sequential — limited parallelism. **Attention** emphasized relevant input but didn't fix scale.
- The Transformer (*"Attention is All You Need"*, Vaswani et al., arXiv 1706.03762) changed two
  things: **self-attention** (relates all positions, processes the whole input at once) and **no
  recurrence** (→ far more parallelism → far less training time).
- **Word embeddings**: high-dimensional vectors capturing semantic/syntactic meaning; related
  words sit near each other numerically.
- The original encoder–decoder split into two families:
  - **BERT** (encoder-only, bidirectional) — best for **classification/prediction**.
  - **GPT** (decoder-only) — best for **text generation**.
- **Self-supervised learning** creates labels automatically from raw text (no human annotation).
  **RLHF** further tunes generation toward human preferences.
- LLMs generate any *symbolic* content, not just prose: code, SQL, **SMILES** molecules, structured
  data — which is what makes narrow technical domains (ch. 7–8) tractable.

---

## 2. Domain-specific SLM vs. generalist LLM (the business/technical case)

**Risks of generalist, closed-source LLMs** the book lists:
- **Data leaves your network** — prompts go to infra you don't control and may be used to train the
  provider's model (the Samsung/ChatGPT ban example).
- **Data leakage** — breaches on external infra.
- **Model/version drift** — silent provider updates change behavior/accuracy with no warning.
- **Cost unpredictability** — token billing and price changes.
- **Closedness** — no reproducibility or interpretability (a blocker in regulated sectors).
- **Opaque training data** — can't verify bias or copyright exposure.
- **Hallucinations** — *intrinsic* (conflicts with the source) vs *extrinsic* (unverifiable from the
  source; you can't mitigate it without access to the training data).
- **No sectoral compliance**, harmful-content risk, and code-generation misuse (malware, guardrail
  bypass via crafted prompts).

**When to choose a domain-specific SLM** — any of: sensitive/regulated data needing on-prem or
air-gapped inference; cost at scale; latency/offline/edge needs; a narrow repeatable task where a
tuned small model matches or beats a generalist 10–100× cheaper; or a need for control
(reproducibility, versioning, no lock-in).

**When a generalist is fine:** broad/open-ended tasks, low volume, no training data, or when
time-to-first-prototype dominates. Common pattern: **prototype on a generalist, then
distill/fine-tune a small model for production.**

**Alignment**, in the author's view, should track *user/domain intent* — not the provider's global
definition of right/wrong. Narrowing to a domain gives you more room to align on intent.

---

## 3. The open-source ecosystem & the cost argument

- Tooling throughout: **PyTorch + Hugging Face Transformers**, the **HF Hub** (models, `Datasets`
  library, adapter hosting), **Google Colab** (free tier = one NVIDIA **Tesla T4** — the implicit
  hardware budget for the book's examples).
- ChatGPT's release **tripled** new model releases/forks. **Always check the license** before
  commercial use (weights being public ≠ commercially usable).
- **Cost argument:** building an LLM from scratch, **development** (data collection/cleaning/EDA/
  experimentation) costs *more* than the training run, and deployment/inference/monitoring add
  hard-to-forecast costs. **Starting from a pretrained OS model** removes the architecture+weights
  cost; data prep still matters; **fine-tuning costs far less than scratch training.**

---

## 4. The adaptation ladder — cheapest first

Climb only as far as your domain evaluation forces you:

1. **Prompt engineering** (few-shot, chain-of-thought) — no training, fastest/cheapest. Try first.
2. **RAG** — inject current, citable facts at inference. Best when knowledge changes or must be
   cited. (Full pipeline in reference 05.)
3. **PEFT / LoRA** — change *behavior/format/domain-language* by training a tiny adapter.
4. **Full fine-tuning** — update all weights; reserve for large domain shifts with enough data.

**Specialization options (book Table 1.1):**
- **Full supervised fine-tuning** (train all weights): strong when data is sufficient and the domain
  shift is large; but high compute, overfitting risk, and usually needs "accessory" general data
  mixed in to avoid forgetting.
- **Partial fine-tuning** (unfreeze a subset of layers): cheaper, but requires experimentation to
  choose layers and risks **catastrophic forgetting**.
- **PEFT** (small trainable modules per layer, base frozen): prevents catastrophic forgetting, trains
  a tiny fraction of params with strong performance, supports multiple swappable adapters, and
  needs no layer-selection search; slight runtime overhead (matters only under a tight latency KPI).
- **Catastrophic forgetting** = a noticeable drop in the model's general/original capabilities after
  training on new data. *"When specializing an SLM to a domain, full training is rarely the best option."*

---

## 5. Data preparation by adaptation type

### BERT fine-tuning (classification)
- Model `bert-base-uncased`; data = `(text, label)` tuples. `BertTokenizer.from_pretrained(...)`.
- Special tokens: `[CLS]` (start), `[SEP]` (segment separator). Format `[CLS] {text} [SEP]`.
- Tokenizer params: `padding=True, truncation=True, max_length=128, return_tensors='pt'` →
  `input_ids`, `attention_mask`. Encode labels with scikit-learn `LabelEncoder`.
- Split with `train_test_split(random_state=42, test_size=0.1)`; wrap in a `torch.utils.data.Dataset`
  → `DataLoader(batch_size=4, shuffle=True)` (train) / `shuffle=False` (val).
- Load `BertForSequenceClassification.from_pretrained(..., num_labels=N)`.

### GPT fine-tuning (text completion)
- Model GPT-2 base (**smallest = 124M**); data = `(context, target)` pairs.
- `GPT2Tokenizer`; format `[CLS] {context} [SEP] {target} [SEP]`, manual pad to `max_length` with
  `tokenizer.pad_token_id`. Load `GPT2LMHeadModel`. The HF API stays nearly identical across
  architectures — swapping BERT↔GPT changes model/tokenizer classes, not the shape of the code.

### RAG (embeddings + vector store)
- Convert the knowledge base to **embeddings** in a **vector database** for on-demand retrieval.
- **FAISS** (Meta, MIT license): C++/Python similarity search + clustering of dense vectors,
  nearest-neighbor at million-to-billion scale, GPU (CUDA) support. Default metric **Euclidean/L2**
  — smallest L2 distance = most similar.
- Embed with **`sentence-transformers`** (e.g. `paraphrase-mpnet-base-v2`). Workflow: encode →
  `IndexFlatL2(dim)` → **`faiss.normalize_L2(vectors)` before adding** → `index.add`. Search:
  encode query → normalize → `index.search(vec, k)` returns `(distances, indices)`.

---

## 6. Full fine-tuning (worked pattern)

- Further-trains a pretrained model on a smaller **labeled** task set, updating **all** weights.
- Example: **DistilBERT-base** (distilled from BERT, smaller/faster) for **question answering**.
- QA data fields: `question`, `context`, `answers` (answer start char + text). Load via HF
  `Datasets`; split 80/20.
- Preprocess with `AutoTokenizer`: `max_length=384, truncation="only_second",
  return_offsets_mapping=True, padding="max_length"`; map answer char spans → token start/end;
  out-of-context answers labeled `(0,0)`. Apply with `dataset.map(fn, batched=True)`.
- Model `AutoModelForQuestionAnswering`; `DefaultDataCollator` builds batches.
- `TrainingArguments`: `learning_rate=2e-5, per_device_train_batch_size=16,
  num_train_epochs=3, weight_decay=0.01, evaluation_strategy="epoch"`. Train via **`Trainer`**
  (handles single/multi-GPU). Inference: `argmax` over `start_logits`/`end_logits`, decode the span.

---

## 7. LoRA / PEFT (worked pattern)

- **PEFT** updates only a small fraction of parameters; the pretrained model already encodes
  language patterns. Comparable accuracy to full fine-tuning at a fraction of the compute.
- **PEFT methods:** **LoRA** (freeze weights, train low-rank matrices — arXiv 2106.09685),
  **Prefix tuning**, **LoftQ** (quantize + low-rank init), **AdaLoRA** (budget by importance),
  **P-tuning**, **Prompt tuning**.
- **LoRA config that matters:** `r` (rank, e.g. **16**), `lora_alpha` (e.g. **32**), **`target_modules`**
  (which projections to adapt — e.g. `["q","v"]`, the query/value projections), `lora_dropout`
  (~0.05), `bias="none"`, `task_type`. Wrap with `get_peft_model(model, config)`.
- **Worked example:** FLAN-T5-small (80M) + the `samsum` dialogue-summarization set (14,732
  train / 819 test). Load base in **8-bit** (`load_in_8bit=True, device_map="auto"`) +
  `prepare_model_for_kbit_training`. Replace label pad tokens with **`-100`** (ignored in loss).
  Result: **trained ~688k params ≈ 0.89% of the model.**
- Training is otherwise identical to normal (`Seq2SeqTrainingArguments`, `learning_rate=1e-3`,
  `num_train_epochs=3`, `auto_find_batch_size=True` — **2–3 epochs suffice for small models**).
  Save the **adapter** with `save_pretrained` (tiny; ship separately from the base). Inference: load
  base + `PeftModel.from_pretrained(base, adapter_id)`.

---

## 8. RAG vs. fine-tuning — decision framework

**Choose RAG when:** knowledge is new/changing and not in the training set; you need reduced
hallucinations plus **traceability/citations**; you want lower cost (no labeling, no training).
*Caveat:* retrieved context can't help if the model is bad at the base task; at scale you pay for
vector-DB infra and pipeline maintenance.

**Choose fine-tuning/PEFT when:** the task needs learning complex patterns/relationships (drug
discovery, code generation); the model must absorb **domain nuance** (jargon, concepts,
structures) to be accurate on new domain examples. Costs more engineering; PEFT narrows the gap.

**Key nuance:** **fine-tuning/PEFT reduces *domain-specific* hallucinations; RAG is better for
*generic* factual hallucinations.** RAG is more interpretable. **They compose** — the book's flagship
pattern is a fine-tuned/PEFT domain SLM **+** RAG. No single strategy fits all.

---

## 9. End-to-end domain fine-tune + evaluation (the reusable template)

Worked case: fine-tune **GPT-2 small** to generate **Manim** (Python animation) code from natural
language — deliberately chosen because base GPT-2 *can't* do it, proving a small model + a small,
high-quality domain dataset can specialize. Dataset `Edoh/manim_python` (train=599, test=51).

**Preparation:** set `tokenizer.pad_token = tokenizer.eos_token`; concatenate to
`"Instruction: {instr}\nOutput: {out}"`; tokenize `truncation=True, max_length=512,
padding="max_length"`; for causal LM set **`labels = input_ids.copy()`**.

**Hyperparameter search with Optuna** (integrated into HF `Trainer`):
- `model_init()` returns a fresh model per trial; `DataCollatorForLanguageModeling(mlm=False)`;
  `EarlyStoppingCallback(patience=2)`; reserve 10% of train for validation.
- `TrainingArguments`: `load_best_model_at_end=True, metric_for_best_model="eval_loss",
  greater_is_better=False, fp16=True`.
- Search space: `learning_rate` 1e-5→5e-4 (log), `batch_size ∈ {2,4,8}`, `weight_decay` 0→0.3,
  `num_train_epochs` 3→6, `warmup_steps` 0→500, `gradient_accumulation_steps ∈ {1,2,4}`.
  **Gradient accumulation** grows the *effective* batch size without exceeding GPU memory.
- `trainer.hyperparameter_search(direction="minimize", backend="optuna", n_trials=...)`; apply best
  params, retrain, save.

**Generation params for testing:** `max_length=150, num_beams=5, temperature=0.7, top_p=0.9,
repetition_penalty=1.2, do_sample=True, no_repeat_ngram_size=2, early_stopping=True`.

**Findings worth remembering:** low hallucination rate; the model's weak spot was **setting
numeric arguments** (placing an object at the wrong coordinates). More search trials (~5 for this
set) and different sampling reduce errors. Generic loss metrics don't catch domain-correctness.

### Domain-specific evaluation pipeline (automate to spare the SME)
Statistical metrics help but domain output still needs SME review — so automate as much as
possible. For generated **code**, a four-step automated gate:
1. **Syntax check** — Python's built-in `ast`: `ast.parse(code)` in try/except catching `SyntaxError`.
2. **Static/API analysis** — subclass `ast.NodeVisitor`; override `visit_Import`/`visit_ImportFrom`,
   `visit_ClassDef` (correct base class?), `visit_Call` (count required API calls). Returns a
   structured verdict (imports present, correct subclass, required calls made).
3. **Execution test** — write to `.py`, run via `subprocess.run(..., timeout=60)`; success =
   returncode 0. (For Manim: `manim -ql <file> <Scene>`; `-ql` = low quality to save compute.)
4. **Rendering/output correctness (optional)** — when a reference exists, compare with **SSIM**
   (scikit-image) or **LPIPS** (perceptual, deep-net-based; also usable as a loss) against a threshold.

**Safety when executing generated code (non-negotiable):** **sandbox** (Docker/restricted env),
**timeouts** (kill hangs/infinite loops), and **resource limits** (cap CPU/GPU/memory). Generated
code is untrusted input — treat it like one.
