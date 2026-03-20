---
name: work-item-spec
description: Write a detailed work item spec (user story / task ticket) specific enough for a junior engineer or AI agent to pick up and execute without ambiguity. Use when the user asks to write a ticket, task spec, work item, user story, or invokes /work-item-spec. Supports interactive mode (human in the loop) and non-interactive mode (agent-driven).
---

# Work Item Spec Writer

Write work item specs the way a senior tech lead writes tickets for junior engineers: precise, unambiguous, and testable.

## Modes

This skill operates in two modes:

### Interactive Mode (default)
Use when a human is in the conversation. Ask questions, draft sections incrementally, and confirm each section before moving on.

### Non-Interactive Mode
Use when invoked by an agent or when the caller passes `--non-interactive` or provides all context upfront with no human to prompt. In this mode:
- Do NOT ask questions or wait for confirmation.
- Infer all answers from the provided context, the codebase, and your best judgment.
- Where context is insufficient, make a reasonable assumption and flag it with `[ASSUMPTION: ...]` inline so a reviewer can verify.
- Produce the complete spec in a single pass.

**How to detect mode:** If the caller explicitly says "non-interactive", passes `--non-interactive`, or is an agent/subagent, use non-interactive mode. Otherwise, use interactive mode.

## Workflow

### Phase 1: Gather Context

**Interactive:** Ask the user for:
1. **What needs to happen** — the feature, fix, or change in one sentence.
2. **Why it matters** — the business or user problem this solves.
3. **Any constraints** — deadlines, tech stack limitations, dependencies, or existing decisions.

Do not proceed until you have at least items 1 and 2.

**Non-interactive:** Extract items 1-3 from the provided context. If "why it matters" is missing, infer it from the codebase or flag as `[ASSUMPTION]`. Proceed immediately.

### Phase 2: Build the Spec Section by Section

Read the template from `templates/work-item-spec-template.md`. Work through each section in order.

**Interactive:** For each section, ask 1-2 targeted questions, draft the section, and confirm before moving on.

**Non-interactive:** Draft all sections using available context. Flag gaps with `[ASSUMPTION: ...]`.

**Sections:**

1. **Background** — Why we're doing this. Add relevant system context from the codebase.
   - *Interactive:* Ask: Is there anything else a developer needs to know about why we're doing this?

2. **Objective** — State the goal in one or two sentences. Be specific about the deliverable.
   - *Interactive:* Ask: Does this capture the scope correctly, or should I narrow/widen it?

3. **Acceptance Criteria** — Write each criterion as a concrete, verifiable statement. Use the format: "Given [context], when [action], then [result]." Every criterion must be testable.
   - *Interactive:* Ask: Are there edge cases or error scenarios I should include?

4. **Test Cases** — Write one or more test cases per acceptance criterion. Each test case must have Preconditions, Steps, and Expected Outcomes. Steps must be specific enough that someone unfamiliar with the system can follow them.
   - *Interactive:* Ask: Are there specific data setups or environment configurations to account for?

5. **Deployment Strategy** — Propose a deployment approach (feature flag, staged rollout, direct deploy, etc.) based on the risk level.
   - *Interactive:* Ask: Any deployment constraints I should know about?

6. **Production Verification** — Write verification cases that confirm the feature works in production. Use the same Preconditions/Steps/Expected Outcomes format.
   - *Interactive:* Ask: What signals would tell us this is broken in prod?

Leave **Test Run** and **Production Verification Run** sections as placeholders — these get filled in during execution.

### Phase 3: Compile and Output

1. Assemble the full spec from the template.
2. Apply the `writing-clearly-and-concisely` skill to all prose.
3. **Interactive:** Present the final spec to the user for review.
   **Non-interactive:** Output the final spec directly.
4. Save the spec where the caller directs, or to `docs/specs/` by default.

## Guidelines

- **Write like a tech lead.** Be direct. Assume the reader is competent but has no context about this task.
- **Be specific, not vague.** "The API returns a 200 with the updated record" beats "The API works correctly."
- **Every acceptance criterion must map to a test case.** If you can't write a test case for it, the criterion is too vague.
- **No jargon without definition.** If a term is domain-specific, define it in the Background section.
- **Keep questions concise.** No more than 2 per section (interactive mode only).
- If the user says "skip" for a section, insert: *"To be determined."*
- If the caller provides a dump of context upfront, extract what you can into the template sections and only ask about gaps (interactive) or flag assumptions (non-interactive).
