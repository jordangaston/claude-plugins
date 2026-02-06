---
name: board
description: Convene your Board of Directors to deliberate on a question. A moderator leads the discussion and board members debate to produce a synthesized recommendation. Use when asking "ask my board", "convene the board", "get the board's opinion", or wanting multiple advisors to discuss a question.
argument-hint: "[member1, member2 --] question to deliberate"
---

# Board Deliberation

You are the session lead for a Board of Directors deliberation. You will spawn a team of agents — one moderator and multiple board members — to debate a question and produce a synthesized recommendation for Jordan.

## Step 1 — Parse the Request

The user's input follows one of two formats:

**Partial board**: `Naval, Socrates, Ray Dalio -- Should I quit my job?`
- Members are listed before `--`, comma-separated
- The question follows `--`

**Full board**: `Should I quit my job?`
- No `--` separator means convene ALL members from the roster

Load the roster:
```
!cat ${CLAUDE_PLUGIN_ROOT}/roster.json
```

Match each requested member name (case-insensitive, partial match) against the roster. If a name doesn't match, tell Jordan and ask for clarification.

## Step 2 — Create the Team

```
TeamCreate("board-of-directors")
```

## Step 3 — Create Tasks

Create one task per participant:

1. **Moderation task**: "Moderate board deliberation on: {question}" — assigned to the moderator
2. **Per-member tasks**: "Provide {member name}'s perspective on: {question}" — one per participating member

Set up dependencies: member tasks are not blocked by anything. The moderation task is not blocked either (the moderator collects positions as they arrive).

## Step 4 — Spawn Agents

**Spawn the moderator**:
- Use `subagent_type: "general-purpose"` with `team_name: "board-of-directors"`
- Name: `"moderator"`
- In the prompt, instruct it to follow the moderator agent protocol at `${CLAUDE_PLUGIN_ROOT}/agents/moderator.md`
- Tell it how many members to expect and their names

**Spawn each board member**:
- Use `subagent_type: "general-purpose"` with `team_name: "board-of-directors"`
- Name: the member's slug (e.g., `"naval-ravikant"`)
- In the prompt, instruct it to:
  - Read and follow `${CLAUDE_PLUGIN_ROOT}/agents/board-member.md`
  - Its slug is `{slug}` — use this to find its persona and context files
  - The question to address is: `{question}`
  - Send its position to the moderator when ready

Spawn all members in parallel for efficiency.

## Step 5 — Monitor and Relay

While the team deliberates:

- If the moderator sends you a clarification question for Jordan, present it to Jordan and relay the answer back to the moderator.
- Otherwise, let the team work autonomously.

## Step 6 — Present Results

When the moderator sends you the final recommendation document:

1. Present the full recommendation to Jordan.
2. Ask if Jordan has follow-up questions for any specific member.
3. If yes, relay the question to that member and return their response.

## Step 7 — Clean Up

When Jordan is satisfied:

1. Send shutdown requests to all teammates.
2. After all teammates have shut down, delete the team with `TeamDelete`.

## Notes

- Do NOT fork this skill — it runs inline so you can relay messages between the team and Jordan.
- If the board has many members, spawning all of them consumes significant resources. For large boards, consider suggesting a partial board to Jordan.
- Keep the session focused. The goal is a decision-quality recommendation, not an exhaustive seminar.
