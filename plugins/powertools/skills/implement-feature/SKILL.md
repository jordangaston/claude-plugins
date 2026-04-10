---
name: implement-feature
description: Implement a single work-item-spec. Orchestrates five phases (understand, plan, implement, review, finalize), each in a separate sub-agent to keep context clean. Use when the user asks to implement a work item or invokes /implement-feature.
---

# Implement Feature

Implement a single work-item-spec by orchestrating five phases, each in a separate sub-agent with clean context.

## Input

**Required:** A work-item-spec (from `/work-item-spec`).

- Do **not** use this skill for design documents or use case documents — those describe entire features across many work items.
- If no work-item-spec is provided, stop and ask the user to provide one or run `/work-item-spec` first.
- If the input is ambiguous, ask one clarifying question before proceeding.

## Orchestration

Run each phase as a separate sub-agent using the Agent tool. Pass the work-item-spec and prior phase outputs to each agent. Do not start a phase until the previous phase completes successfully.

### Phase 1 — Understand

Spawn a sub-agent with:
- The full work-item-spec
- The contents of `phases/understand.md` as instructions

**Expected output:** An understanding summary — what is being built, which files and patterns are relevant, and any risks or ambiguities flagged.

Confirm the understanding summary with the user before proceeding.

### Phase 2 — Plan

Spawn a sub-agent with:
- The full work-item-spec
- The Phase 1 understanding summary
- The contents of `phases/plan.md` as instructions

**Expected output:** A task list created with TodoWrite. Each task maps to one small commit, is independently testable, and is ordered by dependency.

### Phase 3 — Implement

Spawn a sub-agent with:
- The full work-item-spec
- The Phase 1 understanding summary
- The Phase 2 task list
- The contents of `phases/implement.md` as instructions

**Expected output:** All tasks completed, all tests passing, all changes committed.

### Phase 4 — Review

Spawn a sub-agent with:
- The full work-item-spec
- A summary of what was implemented (files changed, commits made)
- The contents of `phases/review.md` as instructions

**Expected output:** All code simplified, verified, review issues addressed, changes pushed.

### Phase 5 — Finalize

Spawn a sub-agent with:
- A summary of what was implemented (files changed, commits made)
- The contents of `phases/finalize.md` as instructions

**Expected output:** PR created, user notified with the PR URL.
