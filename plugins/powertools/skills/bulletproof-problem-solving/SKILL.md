---
name: bulletproof-problem-solving
description: >
  Guide users through the Bulletproof Problem Solving (BPS) seven-step framework from the book by Charles Conn and Robert McLean. Use this skill whenever the user mentions problem solving, strategic thinking, decision making, logic trees, issue trees, disaggregation, MECE, workplanning, hypothesis-driven analysis, root cause analysis, structured problem solving, McKinsey-style problem solving, or wants help thinking through a complex personal, business, or societal problem. Also trigger when the user says things like "help me think through X", "how should I approach this problem", "I need to make a decision about Y", "help me break this down", "what's the best framework for this", or asks about prioritization, synthesis, or storytelling for a recommendation. This skill is especially useful for entrepreneurs evaluating opportunities, making business strategy decisions, career choices, investment decisions, or tackling any complex problem with multiple variables.
---

# Bulletproof Problem Solving

## Overview

This skill guides users through the **seven-step Bulletproof Problem Solving (BPS)** process developed by Charles Conn and Robert McLean at McKinsey & Company. The process is iterative, not linear — at each stage you improve understanding and use those insights to refine earlier answers.

The core mantra: **"What's the one-day answer?"** — always have a coherent summary of your best understanding of the problem and solution path at any point, not just at the end.

## The Seven Steps

```
Step 1: Define the Problem
Step 2: Disaggregate the Problem (Logic Trees)
Step 3: Prioritize (Prune the Tree)
Step 4: Build a Workplan
Step 5: Conduct Analysis
Step 6: Synthesize Findings
Step 7: Tell a Compelling Story
```

> **Important**: These steps are a cycle, not a waterfall. "Porpoise" between steps — dive into data, surface to refine your hypothesis, dive again. Iterate your problem statement, logic tree, and one-day answers as understanding deepens.

## How to Use This Skill

### Determine where the user is in the process

When the user brings a problem, assess which step they need help with:

- **No clear problem statement yet** → Start at Step 1
- **Problem defined but not broken down** → Go to Step 2
- **Has a tree but overwhelmed by scope** → Go to Step 3
- **Knows what to analyze but hasn't planned** → Go to Step 4
- **Has data but unclear conclusions** → Go to Step 6
- **Has conclusions but needs to present them** → Go to Step 7
- **Wants the full process end-to-end** → Walk through all steps

### Walk the user through each step

For detailed instructions on each step, read the appropriate reference file:

| Step | Reference File | When to Read |
|------|---------------|--------------|
| Step 1: Define the Problem | `references/step1-define.md` | User needs help scoping, bounding, or writing a problem statement |
| Step 2: Disaggregate | `references/step2-disaggregate.md` | User needs help building logic trees, applying MECE, choosing tree types |
| Step 3: Prioritize | `references/step3-prioritize.md` | User needs help pruning trees, focusing effort, doing knock-out analysis |
| Step 4: Workplan | `references/step4-workplan.md` | User needs help planning analysis, assigning tasks, building one-day answers |
| Step 5: Analyze | `references/step5-analyze.md` | User needs help with heuristics, analytical techniques, or choosing big guns |
| Step 6-7: Synthesize & Story | `references/step6-7-synthesize.md` | User needs help pulling findings together or building a compelling narrative |
| Advanced: Uncertainty | `references/advanced-uncertainty.md` | Problem involves long time frames, high uncertainty, or wicked problems |
| Reference: Biases | `references/biases-and-teams.md` | User needs help with team processes, avoiding cognitive biases |

### Interaction Approach

**Be a thinking partner, not a lecturer.** The goal is to help the user build their own problem-solving muscle.

1. **Ask before you prescribe.** Start by understanding the problem context, who the decision-maker is, what constraints exist, and what the user already knows.

2. **Build artifacts as you go.** When constructing logic trees, workplans, or one-day answers, create them as visual artifacts the user can iterate on. Use markdown tables, mermaid diagrams, or structured text.

3. **Challenge constructively.** Apply the "obligation to dissent" — if you see a gap in the user's thinking, raise it. Ask "What would you have to believe?" to stress-test assumptions.

4. **Keep it iterative.** After completing any step, ask: "Does this change how we think about the problem statement? Should we refine our tree?" The accordion nature of the process means compressing or expanding steps as needed.

5. **One-day answers throughout.** At any pause point, help the user articulate their current best answer in the Situation-Observation-Resolution format:
   - **Situation**: The state of affairs at the outset
   - **Observation/Complication**: What changed or what tension exists
   - **Resolution**: Best current idea for what to do

## Quick Reference: Key Concepts

### MECE (Mutually Exclusive, Collectively Exhaustive)
Logic tree branches should not overlap (mutually exclusive) and should cover all elements of the problem (collectively exhaustive). If hypotheses aren't yielding insight, check if the tree is truly MECE.

### Types of Logic Trees
- **Component/Factor Trees**: Used early when you don't know much — just list the factors
- **Deductive Logic Trees**: Used when you know the logical/mathematical structure (e.g., profit = revenue - costs)
- **Inductive Logic Trees**: Work backward from specific cases toward general principles
- **Hypothesis Trees**: State active, testable hypotheses on each branch
- **Decision Trees**: Binary yes/no branches leading to different actions

### Cleaving Frames (Advanced)
Experienced problem solvers use theoretical frameworks to disaggregate faster:

**Business**: Price/Volume, Principal/Agent, Assets/Options, Collaborate/Compete, Return on Invested Capital (ROIC)

**Policy/Societal**: Regulate/Incent, Equality/Liberty, Mitigate/Adapt, Supply/Demand

**Personal**: Work/Play, Near-term/Long-term, Financial/Non-financial

### The Elevator Test
Can you explain your current best answer in 30 seconds? If not, your one-day answer needs sharpening.

### Knock-Out Analysis
Order analyses so that ones that could eliminate entire branches come first. Don't do nice-to-have analysis before the critical tests.

### The 80/20 Rule (Pareto Principle)
Focus analytical effort on the 20% of factors that drive 80% of outcomes.

## Common Pitfalls to Watch For

1. **Weak problem statements** — lacking specificity, time bounds, or decision-maker criteria
2. **Asserting the answer** — jumping to conclusions based on experience without testing
3. **Failure to disaggregate** — trying to solve the whole problem at once
4. **Neglecting team structure** — letting hierarchy or groupthink dominate
5. **Incomplete analytic toolkit** — using the wrong tool for the job
6. **Failing to synthesize into a story** — declaring victory when analysis is done but no compelling narrative exists
7. **Treating it as one-off** — not iterating as understanding deepens

## Ten Watchwords for Great Problem Solving

1. Take time upfront to really understand your problem
2. Get started with nothing more than a problem statement and a whiteboard
3. Try several cuts at the tree — use sticky notes, move things around
4. Use a team wherever you can — diversity fights bias and sparks creativity
5. Make the right investment in a good workplan
6. Start analysis with heuristics and rules of thumb before big guns
7. Don't be afraid to employ big analytic guns when required
8. Put as much effort into synthesis and storytelling as doing the analysis
9. Treat the seven steps like an accordion — compress or expand as needed
10. Don't be intimidated by any problem you face