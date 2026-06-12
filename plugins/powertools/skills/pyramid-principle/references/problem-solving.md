# Problem Solving & Structured Analysis

The writing half of the Pyramid Principle assumes you already know your answer. This file covers the analytical half — how to *find* the answer so the pyramid has something true at its apex. Use it when the task is figuring out what to recommend, not just writing up a recommendation you already have.

## Defining the problem

Before analyzing anything, pin down the problem precisely. A problem is a gap between what you have and what you want. Define it with a short sequential frame that maps directly onto SCQA:

- **Starting Point / Opening Scene** — the structure or situation as it stands (≈ Situation).
- **Disturbing Event** — what happened that created trouble or opportunity (≈ Complication).
- **R1 (current undesired result)** — where you are now as a result.
- **R2 (desired result)** — where you want to be.

The **Question** is then almost always one of: *How do we get from R1 to R2?* / *Why aren't we at R2?* / *Is the path we've chosen to R2 the right one?* Writing R1 and R2 explicitly is the discipline — most muddled analysis comes from a fuzzy R2 (you don't actually know what "fixed" looks like).

## Don't start by listing "issues"

The instinct under pressure is to brainstorm a flat list of issues or "things to look at." Resist it. A flat list has no logic, hides gaps and overlaps, and produces a report that reads as "here are some things we noticed." Instead, build a **structure** of the problem first, then analyze within it.

## Two ways to structure the analysis

### 1. Diagnostic structure (model the system, then find the deviation)

Build a picture of how the thing *should* work — the elements and the flows between them — then look for where reality deviates.

- **Structure of the system:** lay out the components and how they connect (a customer journey, a P&L, a supply chain, a request lifecycle). This is your map.
- **Look for the deviation:** walk the map and find where the actual behavior departs from the expected. The cause of the problem lives at the deviation.
- **Diagnostic frameworks / "drill-down" trees:** start from the symptom and repeatedly ask "what could produce this?", branching MECE-ly, until you hit testable root causes. (E.g., "margin fell" → price down OR cost up → cost up → COGS OR opex → COGS → which line → inference cost.)

### 2. Logic tree / issue tree (decompose the question MECE-ly)

Take the central Question and break it into sub-questions that are mutually exclusive and collectively exhaustive, then break each of those down, until each leaf is something you can actually answer with data or judgment.

```
How do we restore gross margin?
├── Raise revenue per unit of cost?
│   ├── Reprice the high-cost features?
│   └── Move heavy users to a paid tier?
└── Lower cost per unit served?
    ├── Reduce inference cost (model, caching, batching)?
    └── Cut serving overhead?
```

A good issue tree has the property that answering all the leaves answers the root — nothing else is needed, and no leaf is redundant.

## From analysis back to pyramid

The analysis produces findings. To write them up, **invert the tree**: the answer you reached becomes the apex, and the branches of the issue tree (now resolved) become the supporting groupings. The structure you used to *find* the answer is usually close to the structure you use to *present* it — but re-check that each presented grouping still passes the "So what?" test, because an analytical breakdown ("things we examined") is not automatically an insightful summary ("what we found").

## Pitfalls

- **R2 left vague.** If you can't state the desired result concretely, you can't tell when the problem is solved.
- **Issue tree that isn't MECE.** Overlapping branches double-count; gaps mean you'll miss the real cause.
- **Confusing the analysis structure with the message.** The order in which you investigated is rarely the order in which the reader wants to hear the conclusion. Lead with the answer regardless of how you got there.