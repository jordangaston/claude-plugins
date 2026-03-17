# Metrics Quality Checklist

Evaluate every proposed metric against these 12 criteria. A metric doesn't need to pass all 12 perfectly, but failing several is a strong signal to rethink it.

## The 12 Criteria

### 1. Defined in Normal Language
The metric should be explainable in a sentence that any stakeholder can scan and understand. "Customers are using feature X" is clear. A multi-clause technical definition involving event names and rolling windows is not. You need the precise definition too (see #2), but the plain-language version is what goes on the dashboard title.

**Test:** Can you explain this metric to a non-technical executive in one sentence without jargon?

### 2. Defined Precisely
Behind the plain-language label, document the exact technical definition: which events, which time window, which segments, what denominators. This is where you discover that your intended metric is either impossible to collect or requires engineering work. Concepts like "churn rate" or "CAC" can be defined in many different ways — be explicit about which definition you're using.

**Test:** Could two different engineers independently implement this metric and get the same number?

### 3. Matches the Intent
The precise definition must actually measure what the plain-language label claims. A common failure: intending to measure "portal usage" but actually measuring "portal logins," which only fire when sessions expire. When you can't measure the ideal thing directly, a proxy is OK — but name both the ideal metric and the proxy, and explain the gap.

**Test:** If this metric goes up, does the thing we care about actually go up too? Or could the metric improve while the real thing gets worse?

### 4. Causes Action
If this metric deviates from expectations, would the team actually do something differently? Would they re-plan the next sprint, investigate, or escalate? If the answer is "we'd note it but not change anything," it doesn't belong on the main metrics board. It might be fine as an operational deep-dive metric.

**Test:** Imagine the metric drops 30% next week. What would you do? If you can't answer that concretely, rethink the metric.

### 5. Obvious What "Good" Looks Like
Not every metric needs an explicit numerical target, but it should be obvious whether the metric is healthy. This can be directional ("increasing month-over-month"), stable ("not changing"), or threshold-based ("above 99.9%"). If nobody can tell whether the current number is good or bad without additional context, the metric isn't useful on a dashboard.

**Test:** Show someone the current value with no context. Can they tell if it's good or bad?

### 6. Measures "What Is Happening" (Not Work)
You already track work in your project management tool. Metrics should tell you what's happening in the world around you — the dials on the airplane dashboard, not the actions the pilots are taking. Exception: metrics that explicitly measure whether you're completing a volume or quality of work (e.g., deploy frequency, sprint velocity).

**Test:** Could this metric change even if the team did nothing? (If yes, it's measuring "what is happening." If it can only change when the team takes an action, it's measuring work.)

### 7. Measured Easily
The best metrics are automated — pulled from your analytics, database, or monitoring system with no manual effort. Second-best: manual but trivial (a 5-minute weekly update). If a metric lives in a spreadsheet that requires 2 hours of data wrangling each month, it will quietly stop being updated.

**Test:** How long does it take to update this metric? If more than 15 minutes, can you automate it?

### 8. Measured Frequently
Daily is ideal. "Rolling N days" lets you update daily while thinking in weekly or monthly terms. Caveat: if the underlying thing doesn't change often, frequent measurement adds noise, not signal. But infrequently changing metrics are also less valuable for decision-making.

**Test:** How often would you check this metric? If "maybe once a quarter," it probably shouldn't be a primary KPI.

### 9. Stable Definition Over Time
The definition should not change from month to month. If you keep redefining what counts, observed changes might be artifacts of the definition change rather than real shifts. Stability enables meaningful comparisons over time.

**Test:** Has the definition of this metric changed in the last 6 months? Would it need to change in the next 6?

### 10. Uses Common Definitions When Possible
Standard industry definitions make it easier for new team members to understand, allow benchmarking against peers, and prevent accidental (or intentional) obfuscation. Inventing your own metric is fine when standard definitions don't fit your business — but don't reinvent the wheel just to be clever.

**Test:** Is there an industry-standard version of this metric? If so, why are you not using it?

### 11. Signal at Least 2x Stronger Than Noise
Metrics vary for reasons unrelated to the signal you care about. Monthly revenue fluctuates because calendar months have different numbers of days and weekdays. If a 10% real change is the same magnitude as random noise, you can't tell if anything actually changed.

Clever definition adjustments can reduce noise: "rolling 28 days" eliminates day-count and weekday variation. Medians or percentiles can ignore outliers.

**Test:** How much does this metric vary month-to-month from factors you don't control? If more than half the typical variation is noise, consider a different formulation.

### 12. The Team Actually Cares About It
This is the most important criterion. When management mandates a KPI that the team doesn't believe in, doesn't respect, or doesn't find fair, the team always wins. Six months later the metric won't even be tracked, let alone acted upon. The team must want to look at it weekly and change behavior based on it.

**Test:** Ask the team: "Do you want this on your dashboard?" If the answer is reluctant or forced, find a metric they do believe in that still captures the intent.

## Scoring Guide

When evaluating a metric, score each criterion:
- ✅ **Pass** — Clearly meets the criterion
- ⚠️ **Partial** — Meets it with caveats or gaps
- ❌ **Fail** — Does not meet the criterion

Rules of thumb:
- Failing criteria 3 (matches intent), 4 (causes action), or 12 (team cares) is usually a dealbreaker — reconsider the metric
- Failing criteria 7 (measured easily) or 8 (measured frequently) means the metric is theoretically good but practically useless — invest in instrumentation or pick a proxy
- Failing criterion 11 (signal vs noise) means you need a cleverer formulation, not a different metric

## Common Metric Anti-Patterns

**Vanity metrics:** Numbers that always go up (total signups, cumulative revenue) but don't reflect current health. Prefer rates and active counts.

**Composite scores:** Metrics that combine 5 things into one number. When the number moves, nobody knows why. Prefer individual metrics you can act on.

**Measuring work as outcomes:** "Number of features shipped" feels productive but says nothing about whether those features mattered. Pair with adoption/usage.

**Unfair attribution:** Attributing all revenue to the product team or all churn to customer success. Multi-input outcomes need multi-team ownership.

**Metric theater:** Elaborate dashboards that nobody checks. If you haven't looked at a metric in 3 weeks, remove it.