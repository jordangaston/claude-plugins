---
name: product-metrics
description: Helps founders and product teams select the right KPIs and product metrics using Jason Cohen's value-chain framework. Use this skill whenever the user mentions KPIs, product metrics, OKRs, north star metrics, measuring product success, leading/lagging indicators, choosing what to measure, product dashboards, metric selection, or asks "what should I track/measure?" — even if they don't explicitly say "KPI." Also trigger when users are setting up analytics, building a metrics board, preparing for a board meeting or investor update, or trying to align stakeholders around what matters. If someone is debating which metrics to use for their product, startup, or feature launch, this skill applies.
---

# Product Metrics Selection Skill

Help the user select the right KPIs for their product using Jason Cohen's value-chain framework. This skill turns an abstract "what should we measure?" into a concrete, structured set of metrics that satisfies product teams, executives, and stakeholders alike.

## Core Framework: Metrics as a Value-Chain

The framework organizes metrics along two axes:

### Axis 1: Time, Immediacy, and Control (horizontal)

Metrics are placed on a timeline from left to right:

1. **Leading Indicators** — Signals that precede product team activity. Market trends, pipeline health, inbound demand, customer signals that predict future needs. The team doesn't control these but must monitor them.

2. **Work (Immediate, In-Control)** — What the team directly produces and controls sprint-by-sprint. Feature delivery, bug fixes, infrastructure improvements. These are measurable immediately and the team is fully accountable.

3. **Lagging Indicators** — Downstream outcomes that take weeks or months to materialize. Revenue, retention, NPS, market share. Multi-input and multi-actor — the product team contributes but doesn't solely determine these.

This resolves the classic tension: executives want revenue impact now, while teams insist they're doing important work. Both are right. Work metrics prove execution; lagging metrics prove impact. When work succeeds but outcomes don't follow, the conversation becomes diagnostic rather than blame-oriented.

### Axis 2: Visibility and Scope (vertical)

1. **Hidden/Internal** — Infrastructure, security patches, tech debt reduction, performance improvements. Invisible to customers but essential. If ALL work is here, customers perceive stagnation. Metrics: deploy frequency, incident count, tech debt ratio, test coverage.

2. **External/Customer-Facing** — Features customers see and use. Usage, adoption, satisfaction. Metrics: feature adoption rate, active usage, support tickets, customer satisfaction.

3. **Strategic/Second-Order** — The customer achieving their own ultimate goal through your product. Self-motivated advocacy, organic referrals, expansion revenue. These are the most valuable but furthest from direct control.

### Maximizing vs. Satisficing

Color-code or tag each metric:
- **Maximizers** — Critical for product success. Actively try to improve these. (e.g., feature adoption, customer activation)
- **Satisficers** — Operational indicators that must stay healthy. Act only when they breach a threshold. Don't let them distract from maximizers. (e.g., uptime SLOs, P1 bug count, page load time)

This distinction prevents the team from spreading attention too thin. Use a threshold-based system for satisficers: pre-agree with stakeholders on when a satisficer becomes urgent enough to interrupt high-value work.

## How to Use This Skill

When a user asks for help with product metrics, walk them through this process:

### Step 1: Understand the Product Context

Ask the user about:
- What their product does and who uses it
- Current stage (pre-launch, early traction, scaling, mature)
- Who needs to see these metrics (just the team? executives? investors? board?)
- What metrics they currently track (if any) and what's frustrating about them

### Step 2: Map the Value Chain

Help the user fill in each cell of the framework grid. For each combination of (time axis × visibility axis), ask: "What happens here in your product?" Guide them to identify:

| | Leading | Work (Immediate) | Lagging |
|---|---|---|---|
| **Hidden/Internal** | Tech debt signals, system alerts | Infra improvements, security patches, refactors | System reliability, engineering velocity trends |
| **External/Customer-Facing** | Customer requests, market signals, pipeline | Feature launches, UX improvements, bug fixes | Adoption, usage, satisfaction, support load |
| **Strategic** | Competitive landscape, market trends | Partnerships, platform plays, integrations | Revenue, retention, NPS, advocacy, customer success |

For each cell, help them identify 1-3 concrete metrics. Don't force metrics into cells where they don't naturally fit.

### Step 3: Tag Each Metric as Maximizer or Satisficer

For each metric identified, ask: "Is this something you're actively trying to improve (maximizer), or something that just needs to stay healthy (satisficer)?"

Typically:
- Most leading indicators → satisficers (monitor, act on threshold)
- Work metrics → mix (delivery velocity might be a satisficer; feature adoption might be a maximizer)
- Lagging outcomes → maximizers (revenue, retention)
- Hidden/internal → mostly satisficers (uptime, security)
- Strategic → maximizers (these are your definition of success)

### Step 4: Apply the Quality Checklist

Read the detailed checklist from `references/metrics-checklist.md` and evaluate each proposed metric against it. The checklist covers 12 criteria that separate useful metrics from vanity metrics. Run through the checklist for at least the top 5-7 metrics.

### Step 5: Assemble the Final Metrics Board

Organize the final set into a clear output:

**Format the output as a structured metrics board:**

```
## [Product Name] — Product Metrics Board

### 🎯 Maximizers (actively improve these)
- [Metric]: [plain-language definition] | [precise definition] | [cadence]

### ✅ Satisficers (maintain above threshold)
- [Metric]: [plain-language definition] | [threshold] | [cadence]

### Value Chain Placement
[Show which cell each metric belongs to in the framework]
```

## Key Principles to Emphasize

- **Revenue is critical but lagging.** Don't let anyone dismiss it, but don't let it be the only measure of progress either. Blackberry's revenue grew for two years after the iPhone launched.
- **Celebrate honest measurement, not just good numbers.** If work succeeds but outcomes lag, that's a diagnostic conversation, not a failure.
- **The team must care about the metrics.** If management mandates KPIs the team doesn't believe in, the team always wins — the metric quietly dies. Adoption requires buy-in.
- **Proxy metrics are OK, but be explicit.** When you can't measure P directly and use proxy Q instead, name both and explain the gap.
- **Signal must exceed noise by 2x.** If monthly revenue varies ±10% from calendar effects alone, a real 10% change is invisible. Use rolling windows (e.g., 28-day rolling) to reduce noise.