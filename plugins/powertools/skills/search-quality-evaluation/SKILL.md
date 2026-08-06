---
name: search-quality-evaluation
description: >
  Evaluate the quality of a search or information-retrieval system: choose the right ranking
  metrics, build a relevance-judgment (qrels) set, and turn the scores into ship / no-ship
  decisions. Use when measuring search, retrieval, or RAG-retrieval quality; comparing retrieval
  variants (embeddings, rerankers, filters, chunking); choosing between Precision@K, Recall@K,
  MRR, MAP, and NDCG; building a golden / labeled query set; or diagnosing why offline scores and
  online behavior disagree. Trigger on "evaluate search quality", "which IR metric", "measure
  retrieval relevance", "build qrels / a golden set", "NDCG / MRR / MAP", "is my RAG retrieval
  good", or any review of a search-evaluation harness.
---

# Evaluating Search Quality

An information-retrieval (IR) system takes a query and returns a **ranked list**. Evaluating it
means measuring whether it returns the right items in the right order for real queries — document
search, product search, ticket or code search, and retrieval for RAG.

"Correct" here is ranking quality, not a single value, and live systems shift under you. So you
score against a fixed, labeled test set offline, then confirm the wins hold in production. This
skill covers the metrics, the labeling workflow, and how to read the scores.

## The two evaluation modes

- **Offline** — score a retrieval pipeline against a fixed, labeled test set, before you ship.
  Repeatable and cheap, so it is where you iterate. It misleads only when the test set drifts from
  production (stale labels, different documents, different chunking or filters).
- **Online** — measure production behavior: reformulations, clicks, dwell, task completion.
  It catches the gap between "relevant" and "useful."

They often disagree. Treat **offline as the gate for correctness** and **online as the gate for
product impact**. (Diagnosing a disagreement is a signal, not noise — see the last section.)

## Offline ranking metrics

Build a **relevance-judgment set (qrels)**: for each query, a human label on each candidate item.
Labels are **binary** (relevant / not) or **graded** (e.g. exact / substitute / irrelevant). Then
run the system and compute:

| Metric | Plain question it answers | Relevance |
|---|---|---|
| **Precision@K** | Of the top K results, how many are relevant? (How much noise?) | binary |
| **Recall@K** | Of all relevant items, how many appear in the top K? (What are we missing?) | binary |
| **MRR@K** | How high is the *first* relevant result, on average? | binary |
| **MAP@K** | Are *all* the relevant items ranked early, across the list? | binary |
| **NDCG@K** | Did we rank *better* items higher, counting "highly relevant" above "somewhat"? | graded |

Notes that change how you read them:
- **Precision and recall trade off.** More candidates raises recall and lowers precision; tighter
  filtering does the reverse. Pick which error hurts your product more.
- **MRR** rewards finding one right thing fast (navigational intent), but hides missing supporting
  context — a system can score well on MRR while burying everything after the first hit.
- **MAP** rewards "relevant early" across the whole list (informational intent), but turns brittle
  when judgments are incomplete: unlabeled-but-retrieved items are counted as misses.
- **NDCG** discounts lower positions (top ranks matter more) and normalizes against the ideal
  ordering, so scores compare across queries with different numbers of relevant items. It is the
  default whenever relevance is not binary.

## Choose the metric that matches the job

The metric encodes what "failure" means, so choose it from user intent, not habit.

| Goal in production | Optimize | What it tells you |
|---|---|---|
| First correct result, fast | **MRR@K** | Rank of the first relevant item |
| Clean top results | **Precision@K** | Noise level in the top K |
| Don't miss key documents | **Recall@K** | Coverage in the top K |
| Strong ranking across many results | **MAP@K** | Early placement of all relevant items |
| Graded / "almost right" has value | **NDCG@K** | Value-weighted ordering |

Report a small set, name the one you optimized for, and defend a change against *that* number.

## The evaluation workflow

1. **Fix the retrieval unit.** Decide whether you retrieve documents, sections, or chunks — labels
   must be at the same unit.
2. **Build a query set.** Curate common queries, hard queries, and queries that stand in for
   important business workflows. Derive them from real logs where you can.
3. **Build a candidate set by pooling.** For each query, union the top results from several systems
   or variants, then label that pool — so labeling doesn't bias toward one approach and unlabeled
   good results don't silently become "misses."
4. **Write the relevance rules first, then label.** Define what "relevant" means up front so
   different raters agree. Store the query–item labels as qrels.
5. **Run and score.** Run each variant through one harness and compute the metrics. Now you can
   compare embedding models, rerankers, filters, and chunking under identical conditions.
6. **Confirm online.** Ship the offline winner behind a measurement and watch the behavior signals.

**For RAG**, retrieval quality caps generation quality, so evaluate retrieval first, then whether
the generator grounded itself in the retrieved context. Label more strictly: "**supports the
answer**," not "related to the topic" — weak-but-topical context still raises hallucination risk.

## Preprocessing is part of retrieval

What you can retrieve is only what made it into the index. Preprocessing failures show up as metric
regressions even when the retriever is sound — so **re-run the same harness whenever you change
extraction, structure handling, chunking, or metadata**.

| Preprocessing failure | Symptom |
|---|---|
| Missed / dropped text (bad extraction, OCR) | **Recall** drops — relevant items aren't searchable |
| Flattened tables | **NDCG** drops — high-value facts lose structure and rank poorly |
| Merged sections (mixed-topic chunks) | **Precision** drops — one chunk matches several intents |
| Missing metadata (source, date, type, author) | **MAP** drops — ranking can't separate near-duplicates or apply domain boosts |

## From scores to decisions

A metric is useful only when it points to a next action:

- **Inspect per-query, not just the average.** Find which query classes improved, regressed, or
  stayed brittle. Production readiness is stability across classes, not one aggregate number.
- **Separate retrieval gaps from ranking gaps.** Were relevant items *missing* (retrieval gap) or
  *present but buried* (ranking gap)? The fixes differ.
- **Make trade-offs explicit.** State when higher recall is worth lower precision, or a better first
  result is worth worse tail coverage.
- **Anchor to a baseline** the team agrees is "known behavior" — a keyword system, the current
  production version, or a frozen config — so improvements are honest.
- **Read a disagreement as a diagnosis:**
  - Offline up, online down → **label or intent mismatch**: your qrels captured topical relevance,
    but users want task relevance and authority.
  - Online up, offline down → **incomplete judgments**: you're retrieving useful items no one
    labeled. Fix the dataset, not the system.

## No labeled data yet?

Bootstrap. Pull a query set from behavior logs, label a **small** pooled candidate set with
consistent rules, and grow coverage as repeated query patterns appear. Binary or dense/sparse/hybrid
retrieval doesn't change the method — the work is defining relevance to match how your product uses
similarity.

## Source

Adapted from *Evaluating Search Quality in Information Retrieval Systems*, Unstructured (Apr 2026):
<https://unstructured.io/insights/evaluating-search-quality-in-ir-systems>. The original frames
preprocessing around Unstructured's product; this skill keeps the vendor-neutral IR-evaluation
substance.
