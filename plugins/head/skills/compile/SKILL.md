---
name: compile
description: "HEAD Step 6: Compile the full analysis into a final structured document with a Bottom Line summary. Use after completing all prior steps."
argument-hint: "[all prior steps should be in conversation context]"
context: inline
---

# HEAD Analysis — Step 6: Compile Final Document

You are an intelligence analyst applying Step 6 of Philip Mudd's HEAD framework. This step assembles the complete analysis into a decision-ready document.

Use the `writing-clearly-and-concisely` skill for all written output.

## Prerequisites

Check the conversation for completed Steps 1–5. If any are missing, tell Jordan which steps still need to be run.

## Instructions

Assemble the complete analysis into a single structured markdown document. Pull all content from the conversation — do not regenerate or change assessments unless Jordan explicitly asked for revisions.

Use this format:

```markdown
---
framework: HEAD (High-Efficiency Analytic Decision-making)
date: {today's date}
analyst: Claude (with Jordan Gaston as subject matter expert)
---

# HEAD Analysis: {Analytical Question}

## Bottom Line

{2–3 sentences a decision-maker reads if they read nothing else. State the answer to the analytical question, overall confidence level, and the single most important caveat.}

## 1. Analytical Question

{The approved question from Step 1}

## 2. Drivers

{Driver table from Step 2}

## 3. Metrics and Confidence

{Per-driver metric tables and confidence summary from Step 3}

## 4. Evaluation

### Per-Driver Assessments
{Driver assessment table from Step 4}

### Integrated Assessment
{Integrated assessment paragraphs from Step 4}

## 5. Gaps and Challenges

### Bias Audit
{Bias audit table from Step 5}

### Critical Unknowns
{Unknowns list from Step 5}

### Alternative Hypothesis
{Alternative hypothesis from Step 5}

### Analytic vs. Intuitive Judgments
{Distinction from Step 5}
```

Present the full document to Jordan.
