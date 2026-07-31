---
name: vertical-agent-design
description: >-
  Design principles for building accurate, domain-specific (vertical) AI agents that
  customers pick because they are more accurate. Use when designing or reviewing an
  agent's tools, system prompt, context layout, or tool architecture — deciding how
  many tools to expose, what belongs in the system prompt vs. loaded on demand, how to
  shape tool inputs/outputs, or why an agent is inaccurate or context-bloated. Core
  idea: structure the agent's context like a CPU memory hierarchy (L1/L2/L3). Adapted
  from Peter Wang's essay "Building a Good Vertical Agent."
---

# Building a Good Vertical Agent

## The thesis

A good agent is a **faithful compression of its task distribution.**

The mechanics are commodity: an agent is a while-loop around a model that calls tools
until the task is done. Anyone can build one. What separates a good agent from a toy is
not cleverness — it is understanding your domain's task distribution and doing tedious,
careful work in the few places that matter.

With the model fixed, **accuracy is a function of context quality.** Bloated context
buries the signal; missing context forces guessing. Both cost accuracy, and accuracy is
what you sell — the payoff is non-linear (a task that scores 99% is worth far more than
one that scores 95%).

Users do not bring a uniform distribution of problems. They bring a long tail:

- **Bread-and-butter** — the bulk of every session.
- **Crucial-but-occasional** — a handful of times per session.
- **The long tail** — each request rare, but there are many, and each still must work.

Your job is to place each capability at the tier that minimizes total cost across that
distribution. That is the whole craft.

## The memory hierarchy: L1 / L2 / L3

Model context is like a CPU's memory: the fast store next to the processor is tiny, so
you tier it. Keep the hot set in the fast tier; reach into slow tiers only for rare
stuff. A "cache miss" is the cost you pay to fetch what wasn't resident.

Build the agent's context the same way. Every capability trades **compression** (cheap
to keep resident, but costs prompt tokens on every task) against **discovery** (free
until needed, but costs tool calls to find). Place each capability where total cost is
lowest.

### L1 — always resident (the ~80%)

Lives in the system prompt on every call. The bread-and-butter operations on the steep
part of the frequency curve.

- Make them **brutally token-efficient and fast.**
- Make them **report consequences** of what they did.
- Spend disproportionate, "absurd" effort here — the agent pays this cost on every task.

Because L1 is resident forever, fight hardest to keep it tight. Expect a few hundred
lines: core operations, the tool contract, the key types, and the execution/safety
guidelines.

### L2 — curated specs, on demand (the ~15%)

Important-but-occasional capabilities. Documenting them in L1 would bloat every task
that never uses them, so fetch them in **one discovery step** (one cache miss).

- Write **curated, gotcha-aware specs in plain English**, fetched on demand.
- Encode the **canonical recipe and the constraints** — the correct sequence and the
  footguns someone already paid to learn — not just the signatures.
- Costs zero tokens until a task needs it.

Resident cost is thin: an allowlist (~50 lines) of the blessed capabilities and pointers
saying the specs exist and when to reach for them. The spec contents stay out of the
prompt until pulled in.

### L3 — the raw substrate + a skill that maps it (the long tail)

The one obscure thing you never wrapped and never wrote a spec for. You cannot
anticipate it, but the agent must still reach it or it hits a wall.

- Keep the **complete raw reference on disk** (it can be huge — machine-generated,
  unusable as prompt context).
- Ship a **short skill (~100 lines)** that teaches the agent to mine it: the structure,
  and the exact search/`grep` recipes for each kind of question.
- It does not have to be ergonomic. It must be **reachable, complete, and findable in a
  bounded number of steps.**

Resident cost is ~5 lines: the skill's name and description, plus a pointer. The raw
reference never touches the prompt.

The escape-hatch rule: the agent should never be stuck. Miss in L1, drop to L2, and if
the curated spec is silent, descend into the raw tome and still return an answer in a
sane number of calls. If the wrapped API can't do it, use the raw API — don't compromise.

## Supporting principle: one tool, not thirty

Model accuracy degrades as you add tools — more schema in the prompt, more surface to
confuse, more ways to pick wrong, especially when tools overlap. Popular agents disagree
4x on tool count, which is a tell that no principle is agreed on.

Prefer a **single `execute_code` tool**: the model writes code, the code calls your
functions, the functions touch the domain. This collapses every decision into one ("write
code") and lets the model compose capabilities with a full programming language instead of
stitching rigid tool calls. It also makes all three tiers reachable from one place — L1/L2/L3
are just which functions the model knows it can call, and how much work it did to find them.

## Two L1 techniques worth stealing

**Reading is an act of compression.** A read wrapper should shrink the payload without
losing information:

- *Formula/value aliasing* — normalize repeated formulas to a canonical form, count
  patterns, and collapse frequent ones to a short alias plus one legend line.
- *Free context* — attach nearby row labels and header rows so bare numbers have meaning
  the model never has to guess.
- *Style compression* — fold uniform formatting into a line or two instead of per-cell.

**Writing should report what changed and what looks wrong.** After a batch write, hand
back a structured diff that is:

- *Grouped and sampled, not dumped* — group changes, print a deterministic sample with
  "… and N more" tallies, so hundreds of writes become a handful while totals stay exact.
- *Categorized and triaged* — clean changes in one bucket; anything suspicious (invalid
  results, hardcoded values, implausible magnitudes) pulled into a "needs review" section,
  with the worst flagged MUST FIX so errors don't hide in a wall of green.

## The recipe, ported to any domain

The compression in your prompts and specs is an encoding of your users' task
distribution — which you understand better than anyone. Answer three questions:

1. **What do you wrap into L1?** The bread-and-butter operations on the steep part of the
   curve. Make them token-efficient, fast, and consequence-reporting. Spend the most
   effort here.
2. **What do you defer to L2?** The important-but-occasional capabilities. Write curated,
   gotcha-aware English specs reachable in one step. Encode the canonical recipe and the
   constraints, not just the signatures.
3. **What is your L3 escape hatch?** The raw, complete substrate plus a skill that teaches
   the agent to mine it. It must be reachable, complete, and findable in bounded steps.

Get the three placements right and the agent is fast on the common case, capable on the
occasional one, and never truly stuck on the rare one — while context stays small enough
that the model stays sharp.

## The hierarchy drifts with model strength

What counts as L1 is not fixed. Stronger models absorb larger L2 specs in one shot and
reason over more raw L3 detail. As models improve, yesterday's L3 becomes tomorrow's L2,
and yesterday's L2 collapses into L1 — the tiers slide down a level.

But the hierarchy never disappears. Context will always be smaller than everything you
could put in it, and noise always costs accuracy. Bigger context windows tempt you to
paste in more; the better instinct is the one CPUs settled on decades ago: **summaries in
cache, details on demand, the raw substrate as the last resort.** Build the agent's
context like a memory hierarchy, and accuracy follows.

---

*Source: Peter Wang (@BrainsAndTennis), "Building a Good Vertical Agent," Jun 2026.*
