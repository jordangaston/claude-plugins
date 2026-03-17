# Step 5: Conduct Analysis

Good problem solvers have a toolkit that starts with heuristics and rules of thumb, letting them understand direction and magnitudes before deploying complex tools. Don't jump into giant models until you know where they're needed.

## Start with Heuristics and Rules of Thumb

### Occam's Razor
Favor the simplest solution that fits the facts. Select the hypothesis with the fewest assumptions. Four independent assumptions each 80% likely → only 41% chance all are correct. Two assumptions at 80% → 64% chance. Fewer assumptions = higher probability of being right.

### Order of Magnitude Analysis
Estimate the rough size of each lever to prioritize effort. Calculate what a 10% improvement in price, cost, or volume would be worth. Get minimum, most likely, and maximum estimates — not just the max.

### The 80/20 Rule (Pareto Principle)
80% of outcomes come from 20% of causes. Plot the relationship for your problem to find where to focus. In most markets, 20% of customers drive 80% of revenue.

### Expected Value
For uncertain outcomes, calculate: Expected Value = Probability × Payoff. This simple calculation resolves many investment and strategy questions. Build a payoff table with probabilities and outcomes for different scenarios.

### Bayesian Thinking
Update your prior beliefs when new evidence arrives. Start with a base rate (how common is this in general?), then adjust for specific evidence. Avoids the trap of overweighting dramatic new information.

### Reasoning by Analogy
Use comparable situations to estimate outcomes, but beware: analogies break down when the current situation is structurally different. Past success in one context doesn't guarantee it applies to a new one. "Halo effects" from a few successful attributes can blind you to weaknesses in others.

### Marginal Analysis
Always think in terms of the next unit — the marginal cost and marginal revenue. Sunk costs are irrelevant to future decisions. Only incremental cash flows matter.

### Back-of-the-Envelope Calculations
Quick arithmetic to size a problem. How big is the market? What's the rough economics of one unit? These calculations often resolve issues before any sophisticated modeling is needed.

## When to Use "Big Guns" Analysis

Escalate to more sophisticated tools when:
- Heuristics leave too much uncertainty for the decision at hand
- The problem involves complex multivariate relationships
- Prediction is needed at scale
- Multiple actors' behavior must be modeled

### Sequence of Analytical Firepower

```
Level 1: Heuristics, rules of thumb, back-of-envelope
Level 2: Structured data analysis, regression, correlation
Level 3: Experiments (A/B tests, natural experiments, RCTs)
Level 4: Machine learning, Monte Carlo simulation
Level 5: Game theory, scenario modeling, real options
```

### Selecting the Right Tool

| If you need to... | Consider... |
|---|---|
| Understand relationships between variables | Regression analysis, correlation |
| Predict outcomes | Machine learning, Monte Carlo simulation |
| Test causation (not just correlation) | Controlled experiments, natural experiments, RCTs |
| Model competitor/actor behavior | Game theory, decision trees |
| Value investments under uncertainty | Scenario analysis, real options, NPV with sensitivity |
| Understand complex systems | System dynamics, agent-based models |

## Question-Based Problem Solving

An alternative to hypothesis-driven analysis: systematically ask "why?" to drill down to root causes.

### 5 Whys (Toyota Method)
Ask "Why?" five times to get from symptoms to root causes:
- Why did sales decline? → Key account left
- Why did key account leave? → Delivery delays
- Why were there delivery delays? → Supplier issues
- Why supplier issues? → Single-source dependency
- Why single-source? → No procurement diversification strategy

### Root Cause Analysis
Use fishbone (Ishikawa) diagrams to map all possible causes in categories (people, process, technology, environment, etc.), then test which are the real drivers.

## Tips for Helping Users with Analysis

- Start with "What would change your mind?" — this identifies the key analytical test
- Help the user size the opportunity/risk before diving into detail
- Encourage expected value calculations for decision-under-uncertainty problems
- Watch for sunk cost fallacy — only future incremental costs and benefits matter
- When the user has data, help them visualize it before modeling it
- Remind them: sophisticated analysis on a bad tree is worse than simple analysis on a good tree