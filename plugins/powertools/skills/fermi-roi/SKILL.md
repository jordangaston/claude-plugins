---
name: fermi-roi
description: "Run a Fermi ROI analysis to prioritize initiatives by estimated return on investment. Uses orders-of-magnitude estimation (powers of ten) instead of false-precision scoring. Best for: (1) Ranking a backlog where cost/effort tradeoffs matter, (2) Choosing between investments with different scales of impact and effort, (3) Quick prioritization that resists estimation error. Not ideal for: choosing between options that differ on strategic fit rather than ROI (use Binstack), exploring a problem space (use HEAD), or decisions where effort is irrelevant. Trigger on: 'fermi roi', 'estimate ROI', 'prioritize by ROI', 'which is the best investment', 'rank these by return', or when the user needs to compare initiatives by impact-per-effort. Based on: https://longform.asmartbear.com/roi-rubric/"
---

# Fermi ROI

A prioritization framework that replaces spreadsheet ROI with orders-of-magnitude estimation. Use only powers-of-ten values where the two adjacent choices are obviously wrong.

## Why

Traditional rubrics produce noise, not signal. A feature scored at 60 impact / 4 effort (ROI = 15) that actually delivers 48 impact / 6 effort (ROI = 8) shows 50% ROI variance from minor estimation errors. Fermi estimation eliminates this noise. Rankings stay stable even when individual estimates shift by 50%.

## Process

### 1. List the Candidates

Name every initiative, feature, or investment under consideration.

### 2. Define One Impact Metric

Pick a single measure of impact. Constrain it to powers of ten where intermediate values are absurd.

**Quantitative options:**

| Metric | Fermi Scale |
|---|---|
| Monthly revenue increase | $1K, $10K, $100K, $1M |
| New customers per month | 1, 10, 100, 1,000, 10,000 |
| Adoption rate | 1%, 10%, 50% |
| Active user penetration | 0.1%, 1%, 10%, 50% |

Choose the metric most relevant to the decision. Do not combine metrics — pick one.

**Qualitative option (multi-factor):**

When no single metric captures impact, break it into factors where ALL must succeed together. Multiply the scores.

Define each factor with concrete descriptions at each level — never use generic 1-5 scales.

Example factors:

| Factor | Question | Scale |
|---|---|---|
| Reach | How many customers care? | 0, 30, 70, 100 |
| Intensity | How much do they care? | 0, 1, 10, 100, 1000 |
| Insight | How novel is our perspective? | 0, 1, 10, 100, 1000 |
| Relevance | How well does the solution address the insight? | 0, 1, 10, 100, 1000 |

Each level needs a specific definition. Examples for Intensity:

- **1000** — Mission-critical to project success
- **100** — Serious internal concern we've discussed
- **10** — I'm curious, tell me more
- **1** — Meh
- **0** — Don't waste my time

### 3. Estimate Effort

Use only three brackets:

| Bracket | Duration |
|---|---|
| **2d** | Two days |
| **2w** | Two weeks |
| **2m** | Two months |

Round up. Whatever you think the real estimate is, choose the next bracket. This forces scope clarity and accounts for underestimation bias.

For multi-part projects, group related items into epics and accept or reject them as complete sets.

### 4. Calculate ROI

**Single metric:**

```
ROI = Impact / Effort
```

Example:

| Initiative | Revenue | Effort | ROI |
|---|---|---|---|
| A | $100K/mo | 2m (45d) | 2,200 |
| B | $10K/mo | 2w (10d) | 1,000 |
| C | $1K/mo | 2d | 500 |

**Multi-factor:**

```
Combined Score = Factor1 × Factor2 × Factor3 × Factor4
```

Multiply when all factors must succeed together. Add when factors represent independent alternatives. Rank by combined score.

### 5. Break Ties

Most items cluster into 5-10 unique ROI values. When candidates tie, use one of these methods:

**Add precision (sparingly).** Shift the scale from powers of 10 to powers of 3 (1, 3, 9, 27) or add custom gaps (800 vs. 1000) to signal slight preference.

**Run-off.** Among tied items, score on a single new dimension:

| Dimension | Scale | Definitions |
|---|---|---|
| Team excitement | 0, 1, 10, 100 | 0 = no one interested; 1 = one person; 10 = half the team; 100 = everyone |
| Confidence | 0, 1, 10, 100 | 0 = no chance; 1 = can try, don't expect success; 10 = probably succeed; 100 = within expertise, done it before |
| Strategic alignment | 0, 1, 10, 100 | Define levels specific to your strategy |

**Filter.** Drop all factors except one and rank on that alone.

### 6. State the Decision

Present the ranked list with a narrative, not just numbers.

> **Priority 1: Initiative A** — $100K/mo impact justifies the 2-month investment. ROI: 2,200.
> **Priority 2: Initiative B** — Lower impact but ships in two weeks. Strong fallback if A proves harder than expected.
> **Deprioritized: Initiative C** — Lowest ROI. Worth revisiting only if scope shrinks to under a day.

Explain rankings in terms of impact magnitude, not decimal differences. "A has dramatically larger impact; worth the extra time" beats "A scored 15.3 vs. B's 12.1."

## Output Template

```markdown
## Fermi ROI Analysis: [Decision Context]

### Impact Metric

[Metric name and Fermi scale used]

### Scoring

| Initiative | Impact | Effort | ROI | Notes |
|---|---|---|---|---|
| [Name] | [Value] | [2d/2w/2m] | [Score] | [Key assumption] |

### Ranking

1. **[Winner]** — [Why it ranks first]
2. **[Runner-up]** — [Why it ranks second; fallback narrative]
3. ...

### Ties Broken By

[Method used and result, if applicable]

### Key Assumptions

- [Assumption 1]
- [Assumption 2]
```

## Caveats

- **Impact only, no strategic fit.** Fermi ROI maximizes return per effort. It does not account for strategic alignment, team morale, or market positioning. If those matter more than ROI, use Binstack.
- **One metric at a time.** Combining multiple metrics compounds estimation error. Pick one or use the multi-factor multiplication approach where all factors are required for success.
- **Round up effort.** Effort is almost always underestimated. The three-bracket system compensates for this bias.
- **Estimation errors don't cancel out.** They compound. Fermi estimation works because it keeps estimates coarse enough that rankings remain stable despite individual errors.
