---
name: binstack
description: "Run a Binstack decision-making analysis. Binstack chooses between competing options by checking each against stack-ranked priorities using binary materiality (does this option materially move the needle -- yes or no?) rather than weighted scoring. Best for: (1) Prioritizing a backlog of features, projects, or initiatives where you need one winner, (2) Choosing between alternatives that seem 'close' on paper but differ in strategic impact, (3) Decisions where defensibility matters -- explaining 'why this and not that' to stakeholders. Not ideal for: cost/effort tradeoff analysis (use ROI), exploring a problem space (use HEAD), or decisions with a single dominant criterion that needs no framework. Trigger on: 'binstack', 'prioritize these options', 'which should we build next', 'rank these features', or when the user has multiple options and needs a clear, defensible pick."
---

# Binstack

A decision framework that replaces weighted rubrics with binary materiality checks against stack-ranked priorities. 
## Core Concepts

**Binary materiality** -- either an option *materially* moves the needle on an attribute, or it doesn't. No 1-5 scales. Material means measurably significant: "10% revenue bump," not "slight improvement."

**Stack-ranked attributes** -- rank what matters most, in order. No numerical weights. Just a priority list.

## Process

### 1. Identify Options

List the options under consideration.

### 2. Build the Priority Stack

Produce a priority-ordered list of attributes relevant to the decision. Be specific -- "20% decrease in cancellations" beats "improve retention." Tailor the stack to current circumstances.

Example stacks:

- Growth-stage: revenue growth > customer growth > product experience > support cost > infra cost > profit
- Bootstrapped: cash profit > product experience > fun > customer growth > headcount minimization
- Hiring: skill fit > culture add > availability > salary fit

### 3. Define Materiality Thresholds

For each attribute, set a concrete bar for what counts as material impact. Examples: "at least 10% revenue increase," "cuts support tickets by 40%," "saves 5 hours/week." If quantification is impossible, articulate a clear qualitative bar.

### 4. Evaluate (Top-Down Elimination)

Work through the stack from the top priority down:

1. For the highest-priority attribute, mark each option as MATERIAL or NOT MATERIAL.
2. Eliminate options that are NOT MATERIAL.
3. If one option remains, it wins.
4. If multiple remain, move to the next attribute and repeat.
5. If no attribute distinguishes the survivors, they are genuinely equivalent -- pick whichever is most fun or energizing (this drives better execution).

### 5. State the Decision

Present the winner and the reasoning chain:

> **Winner: Option X**
> - Materially addresses [Priority 1]: [evidence]
> - Survived over Option Y, which failed [Priority 1]
> - Survived over Option Z, which failed [Priority 2]

Include a "why not" for each eliminated option.

## Caveats

- **Effort is excluded.** Binstack maximizes impact, not ROI. If cost matters, add it as an attribute in the stack.
- **No viable options.** If nothing meets materiality thresholds, the problem is idea generation, not prioritization.
- **Evolving priorities.** The stack should change as circumstances shift.
