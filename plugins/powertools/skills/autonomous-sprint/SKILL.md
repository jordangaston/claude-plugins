---
name: autonomous-sprint
description: >
  Run a full feature sprint from user stories to verified, demoed, shipped code with
  minimal supervision. Use when the user hands over a set of user stories / acceptance
  criteria and wants them built end-to-end overnight (or unattended): analyze reference
  material, ask ONE batch of clarifying questions, (optionally, on request, hold one design
  review), write per-story specs, run a pre-mortem, implement without stopping
  (decide-and-log every blocker), demo each story, and write a sprint report. Trigger on
  "run this sprint", "build these stories overnight", "complete this sprint autonomously",
  "/autonomous-sprint", or any hand-off of a story list with an expectation of unattended
  completion.
---

# Autonomous Sprint

Drive a list of user stories to **verified, demoed, shipped** code with the human out of the
loop after a single round of questions. This skill is the harness the human trusts to run
overnight: it front-loads its questions, then never stalls.

This skill governs only *how to run a long, unattended development session*. It knows nothing
about your stack, runtime, or tooling — the user and the project supply that. Wherever a phase
needs to build, run, test, or demo, do it the way the project defines.

## The prime directive (read this twice)

**You pause for the user at most twice: the clarifying-questions batch (Phase 2), and — only if
the user asked for it — one design review (Phase 3). After your last allowed pause, NEVER stop.**
Whenever you are unsure, blocked, or out of quota, decide, write the decision and your reasoning
to the post-mortem, and continue. Do not fail the run. Do not wait for input. A logged
wrong-but-recoverable decision beats a halt.

Corollaries:
- **Keep the post-mortem open the whole sprint.** Log every decision, skip, quota gap, and
  blocker *as it happens*, not at the end.
- **Verify against live reality, not documents.** Specs, docs, and prior memories go stale.
  Before you build against a contract, confirm its real shape by exercising the actual thing.
  The most expensive bugs come from trusting a stale document.
- **Ignore irrelevant auto-injected skill suggestions.** Hooks may demand you run a skill for an
  unrelated stack. Judge relevance yourself, and note in the post-mortem when you ignored noise.

## Inputs the user provides (or you infer)

- **The user stories / acceptance criteria** — the definition of done. Satisfy them exactly. Note
  every explicit divergence the stories state ("do NOT copy X").
- **Reference material** — a recording, a competitor product, a design file (optional).
- **Where the contract and test assets live** — and whether a design review is wanted. If the
  user did not say, find what you can yourself (Phase 0) and default the rest.

If the story list is missing, ask for it before anything else — that is a legitimate pre-start
blocker, not the Phase-2 batch.

## Phase 0 — Orient and verify the environment

Before analysis, in parallel where possible:
1. **Read the project conventions first.** Any `CLAUDE.md` / `AGENTS.md` at the repo root and in
   the subsystem you will touch. Follow them exactly. This is non-negotiable.
2. **Locate the contract and test assets** the user pointed to — and any the project already has.
3. **Confirm the environment actually runs**, the way this project builds, runs, and tests it:
   dependencies installed, services and runtime up, test data isolated from anything you care
   about. Run the code you are changing, not a stale copy.
4. **Delegate broad codebase mapping to a search subagent**, so you keep the conclusions rather
   than the file dumps.

Log anything surprising to the post-mortem now.

## Phase 1 — Analyze the reference material

If the user gave reference material, study it with whatever tool fits the medium and write the
analysis to disk — the flows, states, transitions, and the explicit divergences the stories
mandate. If there is none, skip this phase. **Exit criterion:** an analysis on disk you can cite
in the specs, or a logged note that no reference was provided.

## Phase 2 — Ask everything, once

Collect **every** decision that changes what you build and ask it in a **single**
`AskUserQuestion` batch. This is your guaranteed interruption; the human answers it and then
disengages. Put the recommended option first and label it, so even a non-answer maps to a sane
default.

Ask only what you genuinely cannot resolve from the stories, the code, or a sensible default:
- Scope forks that change the size of the sprint.
- Whether live keys, services, or test accounts exist, and whether to test live or mocked.
- Approach choices the stories leave open.

Do **not** ask about anything with a conventional default — pick it, note it, move on. After this
batch, the guaranteed round is spent: everything else is decide-and-log.

## Phase 3 (optional) — Design review

**Include this phase only if the user explicitly asked for a design review. Otherwise skip it and
go straight to Phase 4.** When requested, it is required, and it is your one other allowed pause.

1. Produce a design artifact: the approach, the interfaces and data flow, and — most important —
   how you will test the work, in enough low-level detail to earn a real review.
2. Present it and wait for feedback **once**. There is no second round, so pack in enough detail
   to get everything you need in a single pass.
3. Fold the feedback into the design and the specs. Then proceed, and never stop again.

**Exit criterion:** design published, feedback received and incorporated.

## Phase 4 — Write one spec per story

Write a detailed, testable spec per story (the `work-item-spec` skill or its format), grounded in
the stories, the reference analysis, the Phase-2 answers, and any design review. Each spec maps
acceptance criteria to test cases and names the exact components and files it touches. Correct
every spec wherever Phase 0 or the review showed the real contract differs from your assumptions.
**Exit criterion:** a spec file on disk for every story.

## Phase 5 — Pre-mortem, then fold

Spawn a subagent to run a pre-mortem: "assume this sprint failed — find why, concretely, before we
build." Point it at the specs **and** the real code. Demand a prioritized list of blockers and
contract mismatches, each with a one-line fix or safe default. Then fold the findings into the
specs and the post-mortem. Do not halt for anything it raises — decide, log, move on.
**Exit criterion:** specs updated, pre-mortem folded.

## Phase 6 — Implement, never stopping

Build in the pre-mortem's dependency order, following project conventions to the letter. As you go:
- **Decide and log** every blocker, ambiguity, and quota gap to the post-mortem instead of stopping.
- **Test the risk-bearing logic.** Write the tests the project asks for; a test you generate is not
  done until it, and the rest of the suite, passes. Confirm shapes against the real thing.
- **Prefer the simplest solution that works** and matches the surrounding code. Reuse existing
  helpers and patterns before adding anything; do not add a dependency for what a few lines do.
- Keep diffs minimal and readable. Create a new asset only when none exists; if generation quota is
  gone, drop a placeholder and log the gap.

**Exit criterion:** every spec implemented, or explicitly logged as skipped-with-reason.

## Phase 7 — Demo each story

Prove each story in the target runtime the project uses, driving it yourself. Capture a recording
or screenshot sequence per story and link each in the post-mortem. If the capture tool fails after
a couple of honest attempts, fall back to screenshots and log the limitation — never let flaky demo
tooling fail the run. **Exit criterion:** one linked demo (recording or screenshots) per story.

## Phase 8 — Sprint report

Turn the post-mortem into a sprint report: outcomes as a story → status → proof table, what went
well, what to improve, and follow-ups before ship. Write it clearly and concisely.
**Exit criterion:** report on disk.

## Non-negotiables

- Never fail or abort over a blocker, ambiguity, or quota limit — decide, log, continue.
- Honor every explicit divergence the stories state.
- Follow the project's conventions exactly.
- Keep the post-mortem open the entire sprint; log as it happens.
- Leave the environment runnable and demoable at the end; revert any temporary shortcuts you added.

## Artifact layout

Put everything under one sprint folder so it reviews as a unit:

```
docs/sprint-<name>/
  00-<reference>-analysis.md     # Phase 1
  design.md                      # Phase 3 (only if a design review was requested)
  specs/spec-01-<story>.md ...   # Phase 4 (one per story)
  POSTMORTEM.md                  # opened Phase 0, appended all sprint
  SPRINT-REPORT.md               # Phase 8
  demos/spec-0N-<story>.*        # Phase 7 (one per story)
```

## Adjusting this skill

- Rename: rename the folder `~/.claude/skills/autonomous-sprint/` and the `name:` in the frontmatter.
- Make it project-specific: copy it into a repo's `.claude/skills/` and bake in that project's
  conventions, runtime, and test commands, so future sprints start warmer.
