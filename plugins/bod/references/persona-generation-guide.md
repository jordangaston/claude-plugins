# Persona Generation Guide

This document describes the process for creating an authentic, research-backed persona for a new Board of Directors member. Follow these steps when `/bod:manage-board add <name>` is invoked.

---

## Step 1 — Gather Source Material

Identify the person's most important contributions to public discourse:

- **Books and essays**: Long-form writing reveals reasoning patterns better than soundbites.
- **Interviews and podcasts**: Unscripted conversation shows natural voice, hedging patterns, and how they handle pushback.
- **Speeches and lectures**: Reveal rhetorical style and what they choose to emphasize.
- **Known frameworks**: Named mental models or decision systems they've articulated (e.g., Naval's "specific knowledge," Dalio's "principles").
- **Documented decisions**: Real choices they made and the reasoning they gave.

Prioritize depth over breadth. Five deeply analyzed sources beat twenty surface-level summaries.

## Step 2 — Analyze Voice Patterns

Before writing, analyze 5–10 real samples of the person's writing or speaking. Extract:

| Dimension | What to Look For |
|:----------|:-----------------|
| Sentence length | Average words per sentence — short and punchy or long and qualified? |
| Common openers | How do they start answers? "Look, ..." / "The way I think about it..." / "Well, ..." |
| Metaphor usage | Frequent or rare? From what domains — sports, war, science, everyday life? |
| Hedging vs. assertion | Do they qualify statements ("I think," "probably") or assert ("The answer is")? |
| Emotional register | Default tone — calm, intense, playful, urgent? |
| Recurring themes | What ideas do they return to across different conversations? |
| Characteristic phrases | Signature expressions they use repeatedly |
| Question usage | Do they answer with questions? Rhetorical or genuine? |

## Step 3 — Map the Worldview

Document the intellectual architecture:

- **Core beliefs**: The 3–5 bedrock convictions that everything else builds on.
- **Analytical framework**: How they decompose problems. First-principles? Historical analogy? Empirical data? Dialectic?
- **Values hierarchy**: When values conflict (e.g., speed vs. quality), which wins?
- **Blind spots**: What do critics say they miss? What do they dismiss too quickly?
- **Intellectual evolution**: How have their views changed? What did they believe at 25 vs. 50?
- **Influences**: Who shaped their thinking? What books or people do they cite?
- **Contrarian positions**: Where do they break from conventional wisdom in their field?

## Step 4 — Write the Five-Layer Persona

Use the template at `references/persona-template.md`. Fill in each layer with specific, concrete details:

1. **Identity Core** — who they are, core beliefs, non-negotiable positions
2. **Voice and Style** — sentence patterns, vocabulary, rhetorical devices, anti-patterns
3. **Reasoning and Frameworks** — mental models, problem-solving approach, trade-off handling
4. **Biographical Context** — formative experiences, turning points, revealing quotes
5. **Behavioral Rules** — how they act as an advisor, handle disagreement, deal with uncertainty

### Writing Guidelines

- **Use their own words** where possible. Real quotes beat paraphrases.
- **Be specific, not generic**. "Believes in hard work" is useless. "Believes the highest-leverage activity is finding work where your specific knowledge, accountability, and judgment converge" is useful.
- **Include anti-patterns**. List 5–8 things this person would NEVER say. This prevents default AI behavior from bleeding through.
- **Show contradictions**. Real people are inconsistent. Document where their stated beliefs conflict with their actions.
- **Avoid hagiography**. Include their weaknesses, blind spots, and failures alongside their strengths.

## Step 5 — Add Anti-Patterns

List 5–8 statements, phrases, or behaviors that this person would never produce:

- Generic corporate language they'd find hollow
- Emotional registers that don't match their personality
- Decision frameworks they'd reject
- Ways of speaking that are too formal, too casual, or too hedged for their style

These anti-patterns act as guardrails against the model defaulting to generic AI assistant behavior.

## Step 6 — Write Example Exchanges

Create 2–3 dialogues showing the voice in action:

1. **Topic of expertise** — demonstrates depth, frameworks, and natural voice
2. **Unexpected topic** — shows how they handle questions outside their domain
3. **Pushback** — shows how they disagree, challenge assumptions, or deliver hard truths

Each exchange should be 4–8 turns. The goal is to demonstrate the persona's *texture* — not just what they believe, but how they express it.

## Step 7 — Review and Calibrate

Target length: 200–300 lines. This balances authenticity against context window cost.

Check the persona against these criteria:

- [ ] Could someone familiar with this person tell it's them from the voice alone?
- [ ] Are the frameworks specific enough to generate novel advice (not just platitudes)?
- [ ] Do the anti-patterns effectively prevent generic AI behavior?
- [ ] Are the example exchanges distinguishable from how any other board member would respond?
- [ ] Are contradictions and blind spots included?

## Output

Save the completed persona to `members/{slug}/persona.md` and create an empty `context/` directory at `members/{slug}/context/`.
