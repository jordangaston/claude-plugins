---
name: startup-idea-eval
description: "Evaluates startup and business ideas using Jason Cohen's 'Problem to Viable Business Model' framework from A Smart Bear. Guides founders through a rigorous multi-step analysis of whether a problem can become a real business by scoring it across six dimensions: Plausible, Self-Aware, Lucrative, Liquid, Eager, and Enduring. Use this skill whenever the user wants to evaluate a startup idea, assess whether a business concept is viable, stress-test a problem-solution fit, score a business model, run a startup viability analysis, or think through whether their idea can make money. Also trigger when users say things like 'is this a good idea', 'will this work as a business', 'should I build this', 'is this market big enough', 'evaluate my startup', or 'help me think through this idea'. Works for both indie/bootstrapped businesses and venture-scale ambitions."
---

# Startup Idea Evaluator

A structured, multi-step process for evaluating whether a startup idea can become a viable business. Based on Jason Cohen's "Problem to Viable Business Model" framework.

The core insight: many startups fail despite identifying a real problem and building a product that solves it. Solving a problem is necessary but nowhere near sufficient. This skill walks the user through the chain of conditions that must ALL hold for a business to work.

## Why Written Artifacts Matter

This evaluation takes real thinking. Each dimension requires the user to articulate assumptions, gather evidence, and make judgment calls. The skill produces markdown documents at each stage so the user can:
- Pause and resume the evaluation across sessions
- Share the analysis with co-founders, advisors, or investors
- Compare multiple ideas side by side
- Revisit and update scores as they learn more

## Process Overview

The evaluation has three phases:

1. **Setup** — Define the specific idea being evaluated (target customer, problem, product, price point)
2. **Deep Dive** — Work through each of the six dimensions with probing questions, producing a written analysis for each
3. **Scoring & Synthesis** — Compute the viability score, identify weak links, and explore pivots

Read `references/framework.md` for the detailed scoring rubric, deep-dive questions for each dimension, and worked examples.

## How to Run This Skill

### Phase 1: Setup

Before scoring anything, nail down the specifics. The framework evaluates a *specific* combination of target market, buyer, problem, product trade-offs, and price. Vague ideas produce vague scores.

Ask the user to define (help them think through each one):

1. **Target customer** — Who specifically? (e.g., "mid-size dental practices with 3-10 dentists" not "dentists")
2. **The problem** — What specific pain are they solving? In the customer's words, not the founder's.
3. **The product** — What does the solution look like? What trade-offs has it made?
4. **The price point** — What will they charge? (order of magnitude is fine)
5. **Business model** — Recurring SaaS? One-time? Marketplace? Ad-supported?

Once these are clear, create a **Progress Tracker** document. This is a markdown file that will be updated throughout the evaluation:

```markdown
# Startup Idea Evaluation: [Idea Name]
**Date started:** [date]
**Status:** In Progress

## Idea Definition
- **Target customer:** [filled in]
- **Problem:** [filled in]
- **Product:** [filled in]
- **Price point:** [filled in]
- **Business model:** [filled in]

## Dimension Scores
| Dimension | Score | Confidence | Key Risk |
|-----------|-------|------------|----------|
| Plausible | — | — | — |
| Self-Aware | — | — | — |
| Lucrative | — | — | — |
| Liquid | — | — | — |
| Eager (Identity) | — | — | — |
| Eager (Comparative) | — | — | — |
| Enduring | — | — | — |

## Viability Score
**Raw score:** —
**Normalized (÷ 625,000):** —
**Verdict:** —

## Key Risks & Mitigations
[To be filled after deep dive]

## Pivot Ideas
[To be filled if score is low]
```

Save this file and present it to the user. This is their home base.

### Phase 2: Deep Dive

Work through each dimension one at a time. For each dimension:

1. **Explain** what this dimension measures and why it matters (brief — 2-3 sentences)
2. **Ask probing questions** from the framework reference (see `references/framework.md`)
3. **Discuss** the user's answers, push back on optimistic assumptions, surface risks
4. **Agree on a score** together — use the rubric from the reference file
5. **Record** the analysis in a dimension-specific section of the progress tracker
6. **Update** the score table in the progress tracker

The six dimensions, in order:

#### 1. Plausible
*Do 10M consumers or 100k businesses actually have this problem?*

Power-of-ten scoring: `1k`, `10k`, `100k`, `1M`, `10M`, `100M`, `1B`

Why these thresholds: ~10,000 impressions yield 1 paying customer (1% click-through × 1% conversion). You need ~1,000 paying customers for a sustainable small company. That requires ~10M potential eyeballs.

Push the user to justify their number with real data or solid Fermi estimates. Optimism bias is strongest here.

#### 2. Self-Aware
*Do they know and care they have the problem?*

Scoring: `0.01` (few agree or care) → `0.1` (thought-leaders care) → `0.5` (industry standard) → `1.0` (nearly universal awareness)

This is where many ideas die quietly. The problem can be real but invisible to those who have it. Key tests: Are people already searching for solutions? Is there an existing market? Or would you need to *educate* the market first?

#### 3. Lucrative
*Do they have substantial budget allocated to solve this?*

Power-of-ten of annual net-revenue per customer: `$1`, `$10`, `$100`, `$1k`, `$10k`, `$100k`, `$1M`

Budget must be *allocated*, not theoretical. College students have no money. Consumers resist paying for productivity tools. Large companies have budgets but only for their top priorities. Internal teams may fight external solutions.

#### 4. Liquid
*Are they willing and able to buy right now?*

Scoring: `0.01` (every few years) → `0.1` (annual decision) → `1.0` (always in the market, easy to switch)

Locked into contracts? Invested in integrations? Just implemented a competitor? Only need it at a specific moment? All of these reduce liquidity even when the customer agrees they'd prefer your product.

#### 5. Eager (two sub-scores)

**Identity** — Do they trust and want to buy from *you*?

`0` (cannot buy) → `0.1` (structural challenges) → `0.5` (indifferent, no red flags) → `1.0` (mission-level desire to select you)

**Comparative** — Are you meaningfully differentiated from alternatives?

`0.1` (no material differentiation) → `0.5` (some features are so good people buy for them) → `1.0` (one-of-a-kind, no viable alternative)

#### 6. Enduring
*Will they still be paying a year from now?*

`0.01` (one-off, no loyalty) → `0.1` (one-off, but happy customers return/refer) → `0.5` (recurring revenue from recurring problem) → `1.0` (strong lock-in from integrations, system-of-record, or fiat)

5%/mo churn means only half your customers survive a year. Growth is linear/quadratic; churn is exponential. Churn always wins eventually.

### Phase 3: Scoring & Synthesis

Once all dimensions are scored:

1. **Multiply all scores together** (this is a chain of ANDs — every weak link compounds)
2. **Divide by 625,000** to normalize
3. **Interpret the result:**
   - **< 1** — Not viable as currently defined. Needs a pivot or this isn't the idea.
   - **1–2** — Viable for a sustainable indie/bootstrapped business
   - **2+** — Potential for significant scale-up
   - **4+** — Strong unit economics for a large company

4. **Identify the weakest links** — Which dimensions scored lowest? These are existential risks.
5. **Explore pivots** — For each weak dimension, ask: "What change to the target customer, product, or pricing would improve this score by 10x?" Changing the target niche often improves multiple dimensions simultaneously.
6. **Update the progress tracker** with final scores, verdict, key risks, and pivot ideas.
7. **Save the final document** and present it to the user.

### If the Score Is Low

Don't just deliver bad news. The most valuable part of this exercise is exploring what *would* work:

- **Niche down** — Targeting a specific segment often reduces Plausible but increases Self-Aware, Lucrative, Liquid, and Eager scores by orders of magnitude
- **Change the buyer** — Same problem, different customer (B2B instead of B2C, enterprise instead of SMB)
- **Change the price** — Higher price with fewer customers, or lower price with more?
- **Change the timing** — Is the market not ready yet, or is it too late?

Run the scoring again for each promising pivot to compare viability.

## Output

The final deliverable is the completed progress tracker markdown file with:
- Clear idea definition
- Scored rubric with justifications
- Computed viability score
- Identified risks and mitigations
- Pivot ideas (if applicable)

Save this to `/mnt/user-data/outputs/` and present it to the user.