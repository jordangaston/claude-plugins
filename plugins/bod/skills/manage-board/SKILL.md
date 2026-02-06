---
name: manage-board
description: Add, remove, or list members on your Board of Directors. Use when hearing "add X to my board", "remove X from my board", "who is on my board", or "show my board".
argument-hint: "add <name> | remove <name> | list"
---

# Manage Board

You are managing Jordan's Board of Directors roster. Parse the user's input to determine the action.

## Action: List

**Triggers**: "list", "who is on my board", "show my board", or no argument

Read `${CLAUDE_PLUGIN_ROOT}/roster.json` and display the members in a table:

| # | Name | Expertise |
|:--|:-----|:----------|
| 1 | Naval Ravikant | startups, wealth creation, philosophy, leverage |
| ... | ... | ... |

## Action: Add

**Triggers**: "add <name>", "Add Charlie Munger to my board"

### Step 1 — Check for Duplicates

Read `${CLAUDE_PLUGIN_ROOT}/roster.json`. If the person is already on the roster (case-insensitive match), inform Jordan.

### Step 2 — Generate the Slug

Convert the name to a slug: lowercase, spaces replaced with hyphens, special characters removed.
Example: "Charlie Munger" → "charlie-munger"

### Step 3 — Create the Member Directory

Create:
- `${CLAUDE_PLUGIN_ROOT}/members/{slug}/persona.md`
- `${CLAUDE_PLUGIN_ROOT}/members/{slug}/context/` (empty directory — create a `.gitkeep` inside it)

### Step 4 — Generate the Persona

Read the persona generation guide at `${CLAUDE_PLUGIN_ROOT}/references/persona-generation-guide.md` and the template at `${CLAUDE_PLUGIN_ROOT}/references/persona-template.md`.

Research the person using `WebSearch` and `WebFetch` to gather source material about their:
- Core beliefs and values
- Communication style and characteristic phrases
- Mental models and decision frameworks
- Key biographical events
- Known quotes that reveal reasoning patterns

Write a complete five-layer persona (200–300 lines) and save it to `${CLAUDE_PLUGIN_ROOT}/members/{slug}/persona.md`.

### Step 5 — Update the Roster

Read the current `${CLAUDE_PLUGIN_ROOT}/roster.json`, add the new member entry with their name, slug, and a comma-separated expertise string, then write the updated file.

### Step 6 — Confirm

Tell Jordan the member has been added, show their expertise summary, and note that they can add custom context files to `members/{slug}/context/`.

## Action: Remove

**Triggers**: "remove <name>", "Remove Elon Musk from my board"

### Step 1 — Match the Member

Read `${CLAUDE_PLUGIN_ROOT}/roster.json`. Match the name case-insensitively (partial match allowed). If ambiguous, ask Jordan to clarify.

### Step 2 — Confirm

Before removing, confirm with Jordan: "Remove {name} from your board? This will delete their persona and context files."

### Step 3 — Delete Member Files

Delete the `${CLAUDE_PLUGIN_ROOT}/members/{slug}/` directory and all its contents.

### Step 4 — Update the Roster

Read `${CLAUDE_PLUGIN_ROOT}/roster.json`, remove the member entry, and write the updated file.

### Step 5 — Confirm Removal

Tell Jordan the member has been removed.
