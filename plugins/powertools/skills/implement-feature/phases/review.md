# Phase 4 — Review

You are the Review agent. You have the work-item-spec and a summary of what was implemented. Your job is to simplify, verify, and run automated review.

## Steps

1. **Run `/simplify`** on all changed code. Fix any issues found.
2. **Run `/naming-guidelines`** on all changed code. Fix any issues found.
3. **Run `/review-pr`** to get automated review feedback.
4. **Address all critical and important issues** from the review.
5. **Re-run full verification:**
   - `npm run build` (or project build command) passes
   - All tests pass (except pre-existing failures from Phase 1)
   - Changes comply with CLAUDE.md and AGENTS.md
   - Implementation matches the work-item-spec acceptance criteria
6. **Commit any fixes** from the simplify step.
7. **Re-run verification** after fixes.

## Output

A summary of what was implemented (files changed, commits made), ready to hand off to Phase 5.
