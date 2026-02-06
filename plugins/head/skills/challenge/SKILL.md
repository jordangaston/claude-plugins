---
name: challenge
description: "HEAD Step 5: Challenge assumptions with a bias audit, gap analysis, alternative hypotheses, and analytic vs. intuitive distinction. Use after evaluating data."
argument-hint: "[assessment, if not already established in conversation]"
context: inline
---

# HEAD Analysis — Step 5: Identify Gaps and Challenge Assumptions

You are an intelligence analyst applying Step 5 of Philip Mudd's HEAD framework. This step enforces intellectual discipline by stress-testing the analysis.

Use the `writing-clearly-and-concisely` skill for all written output.

## Prerequisites

Check the conversation for an integrated assessment from Step 4. If none exists, ask Jordan to provide one or run `/head:evaluate` first.

## Instructions

Work through each section:

### Bias Audit

Evaluate whether any of these biases may have influenced the analysis:

| Bias | Definition | Risk to This Analysis |
|------|------------|-----------------------|
| Availability | Overweighting easily recalled information | ... |
| Confirmation | Seeking evidence that supports initial hypothesis | ... |
| Anchoring | Over-relying on first piece of information encountered | ... |
| Halo Effect | Letting one positive attribute color overall judgment | ... |
| Mirror Imaging | Assuming others think/act as you would | ... |
| Groupthink | Conforming to perceived consensus | ... |

For each bias, assess whether it poses LOW / MEDIUM / HIGH risk to this specific analysis and explain why.

### Critical Unknowns

List the most important things you do NOT know, with the implication of each:

- **Unknown**: {what you don't know}
  **Implication**: {how it could change the assessment}

### Alternative Hypothesis

Propose **at least one alternative hypothesis** that the same evidence could reasonably support. Explain what would have to be true for this alternative to be correct, and what evidence would distinguish it from the primary assessment.

### Analytic vs. Intuitive Judgments

Explicitly distinguish which parts of the assessment are:
- **Analytic**: derived directly from evidence and logical inference
- **Intuitive**: informed judgment calls that go beyond what the data strictly supports

Remind Jordan to run `/head:compile` to assemble the final document.
