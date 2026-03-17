---
name: head-analysis
description: Run a HEAD (High Efficiency Analytic Decision-making) analysis on any complex problem, decision, or threat assessment. Use this skill whenever the user wants to analyze a complex problem systematically, make a high-stakes decision, evaluate threats, compare options with rigor, do strategic analysis, assess risks, or mentions HEAD analysis, analytical frameworks, driver-based analysis, red team analysis, gap analysis, or cognitive bias checking. Also trigger when the user says things like "help me think through this," "analyze this problem," "what am I missing," "evaluate these options," or "stress-test my thinking." This skill works in two modes — fully autonomous (agent runs the whole process) or interactive (step-by-step with a human). It is especially useful for founders evaluating markets, analysts assessing threats, leaders making strategic decisions, or anyone facing a complex choice with incomplete information.
---

# HEAD Analysis Skill

A structured analytical framework based on the HEAD (High Efficiency Analytic Decision-making) process. Transforms messy, complex problems into rigorous, bias-checked analyses by working backward from the decision maker's needs.

## Core Principle: Think Backward

The entire HEAD process works **right to left** — start with who needs the answer and what decision they face, then work backward to the question, the drivers, the data, and finally the analysis. Never start by looking at the data.

## Operating Modes

This skill runs in two modes. Determine which mode at the start.

### Mode 1: Interactive (Human-in-the-Loop)
Walk the user through each phase, collecting their input, challenging their thinking, and producing incremental output. Pause between phases for review. This is the default when a user is present and engaged.

**How it works:** Present each phase, ask targeted questions, capture responses, and build the analysis document incrementally. Use the `ask_user_input` tool for structured choices (selecting drivers, rating confidence). Use prose questions for open-ended inputs (defining the problem, describing the audience).

### Mode 2: Autonomous (Agent-Driven)
Run the entire HEAD process given a problem brief. The agent executes all phases, makes reasonable judgments at each decision point, and produces a complete analysis document. This mode is appropriate when given a clear problem statement and enough context to proceed, or when explicitly requested.

**How it works:** Execute all 8 phases sequentially. At each phase, document the reasoning and choices made. Flag areas where human input would improve the analysis. Produce the full output document at the end.

---

## The 8 Phases

Read `references/phases-detail.md` for deep guidance on executing each phase. What follows is the orchestration logic.

### Phase 1: Think Backward — Define the Decision Context
**Goal:** Establish who the decision maker is, what decision they face, and what context they need.

Capture:
- **Decision maker(s):** Who will act on this analysis?
- **Decision:** What specific action or choice does the analysis inform?
- **Context gap:** What does the decision maker NOT already know that they need?
- **Constraints:** Time pressure, political dynamics, resource limits?

The output of this phase reframes the entire analysis away from "what's interesting" and toward "what's useful."

*Interactive:* Ask the user to describe the decision maker and the decision. Push back if the answer is vague — "my boss needs to decide" is not specific enough. Who is the boss? What are they deciding between? What's at stake?

*Autonomous:* Infer the decision maker and decision from the problem brief. State your assumptions explicitly so they can be challenged.

### Phase 2: Craft the Key Question
**Goal:** Formulate the single question the analysis must answer.

Rules:
- Must be answerable (not rhetorical)
- Must be comparative or scalar, NOT yes/no (e.g., "How significant is X compared to Y?" not "Is X a threat?")
- Must pass the **Call Mom test**: compressible to one sentence, answerable in three lines of plain language
- Must serve the decision maker's needs (from Phase 1), not the analyst's interests

*Interactive:* Have the user draft a question, then pressure-test it. Can they state it in one sentence? Can they answer it in three lines for a non-expert? If not, iterate.

*Autonomous:* Generate the key question, then run the Call Mom test on it. Show the one-sentence version and the three-line plain-language answer skeleton.

### Phase 3: Identify Key Drivers (6–10)
**Goal:** Create the "sorting bins" that will organize all data and evidence.

Drivers are the categories or factors that any reasonable person analyzing this question would consider. They are NOT conclusions — they are lenses.

Rules:
- Minimum 6, maximum 10. Resist adding more; complexity is the enemy.
- Each driver must be distinct (no overlap)
- Drivers must be accepted by any analyst on the topic, not just one school of thought
- Include at least one driver that a newcomer (non-expert) would suggest — this combats the expertise trap

*Interactive:* Ask the user to brainstorm drivers. Help them consolidate overlapping ones and challenge missing perspectives. Use `ask_user_input` for ranking/prioritizing if they generate too many.

*Autonomous:* Generate drivers, explicitly noting which ones a non-expert might add. Flag if you're drawing too heavily from one discipline (the "hedgehog" trap).

### Phase 4: Define Metrics for Each Driver
**Goal:** For every driver, establish how you'll measure or evaluate it — before looking at any data.

This is the accountability mechanism. Metrics prevent analysts from adjusting their framework after seeing the data to protect their prior beliefs.

Rules:
- Every driver gets at least one metric
- Metrics must be agreed upon BEFORE data collection/analysis begins
- Prefer measurable metrics, but qualitative scales are fine (e.g., "low/medium/high disruption risk with criteria for each level")
- Define what "good" and "bad" look like for each metric

*Interactive:* For each driver, ask "How would we know if this driver is favorable or unfavorable? What would we measure?" Push back on vague metrics.

*Autonomous:* Propose metrics for each driver. For qualitative metrics, define the scale explicitly.

### Phase 5: Sort Data and Assess Confidence (Green/Yellow/Red)
**Goal:** Map evidence to drivers and honestly rate your confidence in each.

For each driver, sort available information and assign a confidence color:
- 🟢 **Green:** You have solid evidence and high confidence in your assessment of this driver.
- 🟡 **Yellow:** You think you know, but the evidence is incomplete or mixed. **Most drivers should be yellow.** If you're coding many drivers green, you're probably overconfident.
- 🔴 **Red:** You don't have enough data to meaningfully assess this driver.

Critical distinction: Separate **capability** (what can be observed/measured) from **intent** (what someone plans to do). Capability is usually assessable; intent almost never is. Never code intent green.

*Interactive:* Walk through each driver. Present the evidence, then ask the user to assign a color. Challenge green ratings — "What would change your mind? How recent is this data?"

*Autonomous:* Assign colors with explicit reasoning. Default to yellow unless evidence is overwhelming. Flag any capability/intent confusion.

### Phase 6: Gap Analysis — What's Missing?
**Goal:** Systematically identify what you don't know and what doesn't fit.

Three questions:
1. **What data doesn't fit any driver?** Does it deserve its own driver, or is it noise?
2. **What drivers have red or weak-yellow ratings?** What would you need to move them to stronger ratings?
3. **What anomalies are you explaining away rather than explaining?** Anomalies that don't fit your framework are the most important signals.

*Interactive:* Ask "What are you most uncertain about?" and "What data did you want to ignore?" People's instinct to dismiss data is often the most informative signal.

*Autonomous:* Review each driver for gaps. Generate a list of "if we could get one more piece of information for this driver, what would it be?" Create an anomaly register.

### Phase 7: Red Team Analysis
**Goal:** Generate genuine alternative perspectives, not token devil's advocacy.

Assemble a fresh analytical lens — either a real second team or a structured alternative analysis. The red team follows the same HEAD process (same question, same drivers, same constraints) but approaches the data differently.

Rules:
- The red team's job is NOT to play devil's advocate. That's too easy and not useful.
- The goal is to generate perspectives that genuinely challenge the primary analysis
- Listen for ownership language in the primary analysis ("my position," "my argument") — this signals attachment that clouds judgment
- Blend experts with newcomers on the red team. Newcomers ask questions experts have stopped asking.
- Separate current-state analysis from future forecasting — they require different skills

*Interactive:* Ask the user to argue the opposite of their conclusion. If they can't do it convincingly, the analysis isn't rigorous enough. Help them construct the strongest possible counter-argument.

*Autonomous:* Generate a complete alternative analysis. Don't strawman it — make it genuinely strong. Identify where the primary and alternative analyses agree (high confidence) and disagree (uncertainty).

### Phase 8: Trap Scan
**Goal:** Systematically check for cognitive biases that could be distorting the analysis.

Read `references/cognitive-traps.md` for the full trap catalog. At minimum, scan for:
- Narrative coherence bias (are you hiding gaps behind a clean story?)
- Availability bias (are you overweighting recent information?)
- Confirmation bias (did you seek disconfirming evidence?)
- Anchoring (is your conclusion driven by the first data point you encountered?)
- Sampling bias (is your evidence base large and diverse enough?)
- Capability/intent confusion (are you treating intent as knowable?)

*Interactive:* Walk through each trap with concrete examples from the analysis. Ask "Where in this analysis might we have fallen into this trap?"

*Autonomous:* Run each trap as a checklist against the analysis. Flag any that apply and describe how they might be distorting conclusions.

---

## Output

After all 8 phases, produce a structured analysis document. Read `references/output-template.md` for the full template.

The document should include:
1. **Decision context** (Phase 1)
2. **Key question** with Call Mom version (Phase 2)
3. **Driver matrix** — each driver with its metric, evidence summary, and confidence color (Phases 3–5)
4. **Gap register** — what's missing, what's anomalous (Phase 6)
5. **Red team perspective** — the strongest alternative view (Phase 7)
6. **Trap audit** — which biases were detected and how they were mitigated (Phase 8)
7. **Conclusion** — answering the key question with appropriate hedging based on confidence levels

For Interactive mode: produce this as a document (markdown or docx depending on user preference).
For Autonomous mode: produce the full document, then summarize the top 3 findings and top 3 uncertainties.

---

## Fox vs. Hedgehog Check

At any point in the process, check: Am I being a hedgehog (applying one framework to everything) or a fox (drawing from multiple disciplines)? If all your drivers come from one field, you're being a hedgehog. Deliberately add a driver from an adjacent or unrelated field.

---

## Quick Reference: Phase Sequence

```
Phase 1: Think Backward    → WHO needs WHAT?
Phase 2: Key Question       → WHAT exactly are we answering?
Phase 3: Drivers (6-10)     → HOW do we sort the data?
Phase 4: Metrics            → HOW do we measure each driver?
Phase 5: Data + Confidence  → WHAT do we know (🟢🟡🔴)?
Phase 6: Gap Analysis       → WHAT are we missing?
Phase 7: Red Team           → WHAT's the strongest counter-view?
Phase 8: Trap Scan          → WHERE are we fooling ourselves?
```