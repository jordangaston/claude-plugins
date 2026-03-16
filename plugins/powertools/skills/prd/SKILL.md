---
name: prd
description: Generate a Product Requirements Document (PRD) for a new product or feature. Use when the user asks to create a PRD, write a product spec, define product requirements, or invokes /prd. Guides the user through a structured PRD template covering goals, personas, features, tech notes, and go-to-market strategy.
---

# PRD Generator

Create a structured Product Requirements Document by walking the user through each section interactively.

## Workflow

### Phase 1: Gather Context

Ask the user for:
1. **Product name** and **tagline** (one-line pitch)
2. **Brief description** — what it does and why it matters (2-3 sentences)

Do not proceed until these are provided.

### Phase 2: Build the PRD Section by Section

Work through each section below in order. For each section, ask 1-3 targeted questions, draft the section from the user's answers, and confirm before moving on.

**Sections:**

1. **Intro & Goal** — Ask: What problem does this solve? How does it differ from existing solutions?
2. **Who's It For?** — Ask: Who are the 2-5 target user personas? What does each need?
3. **Why Build It?** — Ask: What traction or signals exist? What's the market opportunity? How high is the technical risk?
4. **What Is It?** — This is the largest section. Break it into sub-steps:
	   - **Glossary** — Ask: What domain-specific terms need defining?
	   - **User Types** — Ask: What roles exist and what can each do?
	   - **Requirements** — Ask: What are the main user flows? For each flow, ask: What are the specific requirements? What fields/data are needed? What are the behavior rules and edge cases? Group requirements by flow (e.g., Registration, Posting, Commenting). Write every requirement in EARS (Easy Approach to Requirements Syntax) format using the appropriate pattern:
	     - **Ubiquitous:** The \<system\> shall \<action\>.
	     - **Event-driven:** When \<trigger\>, the \<system\> shall \<action\>.
	     - **State-driven:** While \<state\>, the \<system\> shall \<action\>.
	     - **Unwanted behavior:** If \<condition\>, then the \<system\> shall \<action\>.
	     - **Optional:** Where \<feature\>, the \<system\> shall \<action\>.
5. **Competitors & Product Inspiration** — Ask: Who are the competitors? What do you admire or want to avoid?
6. **Mockups** — Ask: Do mockups exist? If so, where? If not, add a placeholder.
7. **Tech Notes** — Ask: What are the core data models and their fields? Any architecture constraints?
8. **Go to Market** — Ask: What's the launch plan? Pre-launch, launch day, first week?
9. **Post-Launch Marketing** — Ask: What ongoing marketing strategies will you use?

### Phase 3: Compile and Output

1. Read the template from `references/prd-template.md`.
2. Fill in every section with the content gathered above.
3. Apply the `writing-clearly-and-concisely` skill to all prose.
4. Output the final PRD as a single markdown document.
5. Save the PRD to the `docs/` folder in the repository. Create the folder if it does not exist.

## Guidelines

- Keep questions concise — no more than 3 per section.
- Draft each section immediately after getting answers; don't wait until the end.
- If the user says "skip" for a section, insert a placeholder: *"To be determined."*
- If the user provides a dump of product information upfront, extract what you can into the template sections and only ask about gaps.
- Use active voice, short sentences, and concrete specifics throughout.
