# Board of Directors

A Claude Code plugin that gives you a personal Board of Directors — digital personas of great leaders, scientists, and entrepreneurs you can consult individually or convene as a deliberating team.

## Skills

### `/bod:consult <member> [question]`

One-on-one conversation with a board member. The member stays in character for the duration of the session.

```
/bod:consult Naval
/bod:consult Socrates -- What is the good life?
"What would Feynman think about this?"
```

### `/bod:board [members --] <question>`

Convene the full board (or a subset) for a structured deliberation. A moderator facilitates debate and produces a synthesized recommendation.

```
/bod:board Should I raise venture funding?
/bod:board Naval, Socrates, Ray Dalio -- How should I think about risk?
```

### `/bod:manage-board <action>`

Add, remove, or list board members.

```
/bod:manage-board list
/bod:manage-board add Charlie Munger
/bod:manage-board remove Elon Musk
"Add Warren Buffett to my board"
```

## Current Board Members

| Name | Expertise |
|:-----|:----------|
| Naval Ravikant | Startups, wealth creation, philosophy, leverage |
| Ed Thorp | Quantitative analysis, risk management, probability, investing |
| Toby Lutke | Product engineering, company building, systems thinking |
| Elon Musk | First-principles engineering, scaling, manufacturing |
| Barack Obama | Leadership, communication, coalition building, policy |
| Richard Feynman | Physics, scientific method, curiosity-driven problem solving |
| Socrates | Critical questioning, ethics, dialectic method |
| Marcus Aurelius | Stoic philosophy, leadership under pressure, self-discipline |
| Mark Zuckerberg | Platform building, move-fast culture, long-term vision |
| Ray Dalio | Radical transparency, principles-based decisions, macro investing |
| Bill Walsh | Organizational culture, coaching, The Standard of Performance |
| Tim Grover | Mental toughness, elite performance, relentless mindset |

## Custom Context

Add context files to any member's `members/{slug}/context/` folder. Use YAML frontmatter for discovery:

```yaml
---
name: Wealth Creation Philosophy
description: Naval's framework for creating wealth through specific knowledge, accountability, and leverage.
---

[Your content here]
```

The agent reads frontmatter descriptions first and loads full content only when relevant to the question.

## Installation

```bash
claude --plugin-dir ~/workspace/bod
```
