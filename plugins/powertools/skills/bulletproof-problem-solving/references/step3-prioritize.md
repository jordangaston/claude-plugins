# Step 3: Prioritize (Prune the Tree)

Good problem solving is as much about what you **don't** do as what you do. Once you have a MECE tree, you must prune it ruthlessly before investing in deep analysis.

## The Prioritization Matrix

Use a 2×2 matrix to evaluate each branch/lever:

```
                    HIGH IMPACT on the problem
                    ┌─────────────────┬─────────────────┐
   HIGH ability     │                 │                 │
   to influence     │   INVESTIGATE   │    PRIORITY     │
                    │   (may revisit) │    (focus here) │
                    ├─────────────────┼─────────────────┤
   LOW ability      │                 │                 │
   to influence     │     PRUNE       │   MONITOR       │
                    │   (cut it off)  │ (can't move it) │
                    └─────────────────┴─────────────────┘
                    LOW IMPACT                HIGH IMPACT
```

### For each branch, ask:
1. **How much impact does this lever have on the overall problem?** (Size of the prize)
2. **Can we actually move this lever?** (Feasibility / ability to influence)

### Pruning decisions:
- **Low impact + Low ability to influence** → Prune immediately
- **High impact + Low ability to influence** → Monitor but don't invest effort
- **Low impact + High ability to influence** → Investigate only if cheap and fast
- **High impact + High ability to influence** → This is your priority focus area

## Knock-Out Analysis

Before doing detailed analysis, identify which tests could eliminate entire branches:

1. **Order analyses so knock-outs come first.** If one finding can make everything else irrelevant, test it first.
2. **Do order-of-magnitude estimates.** Calculate the rough size of each lever — a 10% improvement in price, cost, or volume — to see which matters most.
3. **Apply the 80/20 rule.** Focus effort on the 20% of factors driving 80% of outcomes.

### Example: Solar Panel Decision
- Knock-out test: Is payback period <10 years? (If no, stop)
- Next priority: Are panel costs declining fast enough to wait? (Timing test)
- Nice-to-have: How much CO2 reduction? (Emotional insurance)

## Revisiting Constraints

After prioritizing, revisit the problem statement's constraints. Ask:
- If we relaxed constraint X, would a pruned branch become viable?
- Would widening scope open up substantially better solutions worth the extra work?

Sometimes constraints should be challenged — but only if the expanded solution set justifies the additional effort.

## Team Process for Prioritization

1. **Give each team member 10 sticky-note votes**
2. Let them allocate votes to branches they think are highest priority
3. Allow cumulative voting (put multiple votes on one branch)
4. **Most senior person votes last** to avoid anchoring others
5. Discuss disagreements — they often reveal hidden insights

## Output of This Step

A pruned logic tree with:
- **Priority branches** clearly marked (these become the workplan focus)
- **Pruned branches** with brief rationale for why they're cut
- **Watch items** that may be revisited if circumstances change