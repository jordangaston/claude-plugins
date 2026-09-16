---
name: loops
description: Create and work with "loops" — open questions you're actively figuring out, tracked as authored markdown notes with a lifecycle. Use when the user says "open a loop", "new loop", "start a loop", "add to the loop", "log this in the loop", "close this loop", or asks how loops work or how to use them.
---

# Loops

A **loop** is an open question you're actively trying to figure out — not a note to store, a question to close. This skill covers how to create loops and how to use them.

## The core idea

A knowledge base holds two different kinds of thing:

- **Answers** — settled knowledge, filed by topic.
- **Loops** — open questions you're still chasing.

They have opposite lifecycles, so they live apart. Loops go in a single global **`loops/`** directory at the knowledge-base root (create it if it doesn't exist). Never file loops into topic subfolders: **the directory encodes lifecycle; an `area` field in the frontmatter encodes topic.** When a loop is answered, its lesson graduates into the topic taxonomy and the loop is archived.

## Creating a loop

Opening a loop requires two things, both mandatory — the friction is the point:

1. A **question**, phrased as a question ("How should we price the intro plan?", not "pricing").
2. A **why** — why answering it matters. If there is no why, it isn't a loop yet; it's a passing thought.

Create `loops/YYYY-MM-DD-short-slug.md`:

```markdown
---
type: loop
status: open              # open | closed
opened: YYYY-MM-DD
expires: YYYY-MM-DD        # opened + 60 days
author: jordan            # jordan | agent:<name>
area: personal            # where it belongs in the taxonomy (a tag, not a path)
question: Phrase it as a question.
why: Why answering this matters.
---

## YYYY-MM-DD · note · jordan
First entry — what prompted the question.
```

Do not clip, import, or paste in other people's words. **Compose** every entry — composing is the part that sticks.

## Using a loop — entries

A loop accretes dated, typed, **authored** entries, newest on top. Heading format:

`## YYYY-MM-DD · <type> · <author>`

| type | use it for |
|---|---|
| `note` | an observation that moves the question forward |
| `next step` | a concrete action to take — attach a **prediction** |
| `tried` | something done, and what actually happened |
| `blocked by` | a dependency or obstacle stopping progress |

The `next step` → `tried` pair is the engine: predict, act, compare. Wrong predictions are the most valuable entries. A `next step` carries a prediction:

```markdown
## YYYY-MM-DD · next step · jordan
The action you'll take.
> **Predicted:** what you expect to happen.
```

## Authorship

Every loop and every entry names who wrote it:

- **`jordan`** — the human.
- **`agent:<name>`** — an agent (`agent:claude`, `agent:claude-code`).

Attribute honestly, so a loop reads as a real human↔agent dialogue and an agent can find its own past contributions.

## Closing a loop

When the question is answered:

1. Add a final `note` with the answer.
2. Set `status: closed`.
3. **Graduate** the lesson — write the durable version into the topic taxonomy and link it.
4. `git mv` the loop into `loops/closed/`.

A loop that expires unanswered isn't a failure — it's evidence the question stopped mattering.

## If you are an agent

- You MAY open loops and add `note` / `tried` / `next step` (with a prediction), always attributed `agent:<name>`.
- When a loop is **cold** (untouched for many days), surface it and suggest a revival move.
- Check earlier predictions against later `tried` entries, and say when one was wrong.
- **Do NOT close a loop or graduate its answer without the human.** Closing is the human's judgment that the question is settled.
