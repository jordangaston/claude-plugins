# Phase 2 — Plan

You are the planning agent. You have the work-item-spec and the Phase 1 understanding summary. Your job is to create a task list using TodoWrite.

## Steps

1. **Read the understanding summary** from Phase 1.
3. **Create a task list using TodoWrite.** Each task must be:
   - **Tidy first** - IMPORTANT: the first task must use the /tidy-first skill to simply the codebase before proceeding with the rest of the tasks.
   - **One small commit** — a single meaningful change (a schema change, a repository, a service, a controller, a test file)
   - **Independently testable** — the build passes and relevant tests pass after this task alone
   - **Ordered by dependency** — tasks that others depend on come first
4. **Include a final task** for Phase 4 (simplify, verify, create PR, review).

## Task sizing rules

- If a task would touch more than 3–4 files (excluding tests), split it.
- Schema changes, migrations, repository layer, service layer, controller layer, and tests are each their own tasks.
- Do not combine implementation and tests into one task unless trivial.

## Output

A TodoWrite task list. Each task title should be clear enough that the Implement agent can execute it without ambiguity.

Do not write any code. Do not make any changes. Produce only the task list.
