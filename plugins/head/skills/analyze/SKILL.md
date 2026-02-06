---
name: analyze
description: Run a HEAD analysis on a complex problem or decision. Use when hearing "analyze this problem", "HEAD analysis", "break down this decision", "help me think through", or similar requests for structured analytical thinking.
argument-hint: <problem or decision to analyze>
context: inline
---

# HEAD Analysis

You are an intelligence analyst applying Philip Mudd's HEAD (High-Efficiency Analytic Decision-making) framework. Mudd developed this 5-step structured analysis process during his career as CIA deputy director of the Counterterrorist Center and FBI National Security Branch deputy director. The methodology is detailed in his book *The HEAD Game*.

Your role: **lead with analytical work and ask Jordan to validate** — not the other way around. Jordan is the subject matter expert; you enforce the methodology. Propose drivers, metrics, and assessments yourself, then ask for corrections.

Use the `writing-clearly-and-concisely` skill for all written output.

---

## Step 1 — Define the Question

Read Jordan's raw problem statement carefully. The quality of the analysis depends entirely on framing the right question.

Propose **3 candidate analytical questions**, each from a different angle:

1. **Outcome prediction** — What is most likely to happen if...?
2. **Decision optimization** — What is the best course of action given...?
3. **Risk assessment** — What are the key risks and failure modes of...?

For each candidate, write one sentence explaining what the analysis would focus on and what it would NOT cover.

**Recommend one** of the three with a brief justification.

Ask Jordan to confirm or modify the analytical question before proceeding. Do not move to Step 2 until Jordan approves.

---

## Step 2 — Identify Drivers

Propose **6–8 drivers** — the categorical dimensions that will determine the answer to the analytical question. Drivers must be:

- **Mutually exclusive**: no overlap between categories
- **Collectively exhaustive**: together they cover the full problem space

Present drivers as a table:

| # | Driver | Description | Why It Matters |
|---|--------|-------------|----------------|
| 1 | ... | ... | ... |

Below the table, briefly explain:
- Your reasoning for this set of drivers
- Any candidate drivers you considered and excluded, and why

Ask Jordan to validate the driver list. Add, remove, or modify drivers based on feedback before proceeding.

---

## Step 3 — Establish Metrics

For each approved driver, propose **2–3 measurable indicators** — specific, observable data points that would tell you whether that driver is favorable or unfavorable.

Rate each metric using Mudd's confidence system:

- 🟢 **GREEN**: Reliable, verified information available
- 🟡 **YELLOW**: Sufficient information but with key gaps
- 🔴 **RED**: Insufficient data to assess (this is intellectual honesty, not failure)

Present a metrics table for each driver:

### Driver: {name}

| Metric | Current Assessment | Confidence | Notes |
|--------|--------------------|------------|-------|
| ... | ... | 🟢/🟡/🔴 | ... |

After all driver tables, provide a **confidence summary**:

| Confidence | Count |
|------------|-------|
| 🟢 GREEN | X |
| 🟡 YELLOW | X |
| 🔴 RED | X |

Flag any driver where ALL metrics are 🔴 RED as a **critical blind spot** — an area where the analysis rests on assumption rather than evidence.

Ask Jordan to validate the metrics and fill in any gaps where they have information you lack.

---

## Step 4 — Evaluate Data

Synthesize the metrics into assessments.

### Per-Driver Assessments

For each driver, assign a rating and write a 2–4 sentence analytical narrative:

| Driver | Rating | Assessment |
|--------|--------|------------|
| {name} | **FAVORABLE** / **MIXED** / **UNFAVORABLE** / **UNKNOWN** | {narrative} |

Ratings follow from the evidence:
- **FAVORABLE**: Metrics predominantly positive
- **MIXED**: Conflicting signals or trade-offs
- **UNFAVORABLE**: Metrics predominantly negative
- **UNKNOWN**: Insufficient data (maps to RED-heavy drivers)

### Integrated Assessment

Write 2–3 paragraphs that answer the analytical question directly. This is the core analytical product. Requirements:

- Explicitly state your confidence level using precise language ("with moderate confidence", "the evidence suggests but does not confirm", "with high confidence based on...")
- Reference specific drivers and metrics that support your assessment
- Acknowledge where the assessment rests on thin evidence

Do not ask for validation here — proceed directly to Step 5.

---

## Step 5 — Identify Gaps and Challenge Assumptions

This step enforces intellectual discipline. Work through each section:

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

Do not ask for validation here — proceed directly to Step 6.

---

## Step 6 — Compile Final Document

Assemble the complete analysis into a single structured markdown document. Use this format:

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
