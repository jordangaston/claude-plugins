# PRD Template

```markdown
---
tags: prd, {{product-tag}}
summary: "Product Requirements Document for {{Product Name}}"
locked: false
---

# {{Product Name}}

*"{{tagline}}"*

## Intro & Goal

{{1-2 paragraphs: what the product is, what problem it solves, how it differs from alternatives.}}

## Who's It For?

{{List 2-5 user personas. Each gets a bold name and 1-2 sentences describing their needs.}}

- **Persona Name** — description of who they are and why they use the product.

## Why Build It?

{{Bulleted list of reasons: personal motivation, traction signals, market trends, monetization opportunities, technical risk assessment.}}

## What Is It?

### Glossary

| Term | Definition |
|------|-----------|
| {{Term}} | {{Definition}} |

### User Types

{{List each user role with permissions and capabilities.}}

- **Role Name** — what they can do.

### Requirements

{{Group requirements by user flow. Each flow gets its own subsection with specific requirements listed.}}

#### {{Flow Name}}

{{Brief description of the flow.}}

Write each requirement using EARS syntax:
- **Ubiquitous:** The \<system\> shall \<action\>.
- **Event-driven:** When \<trigger\>, the \<system\> shall \<action\>.
- **State-driven:** While \<state\>, the \<system\> shall \<action\>.
- **Unwanted behavior:** If \<condition\>, then the \<system\> shall \<action\>.
- **Optional:** Where \<feature\>, the \<system\> shall \<action\>.

Example requirements:
- The system shall require a name, tagline, and URL for every post.
- When a user submits a post, the system shall prompt them to add the first comment.
- While a user is not signed in, the system shall display a signup CTA on the index view.
- If a post URL is unreachable, then the system shall display a warning to the submitter.

## Competitors & Product Inspiration

{{List competitors and inspirations with 1-line descriptions of what they do and how this product differs.}}

## Mockups

{{Link or embed mockups. Use placeholder text if mockups don't exist yet.}}

*Mockups pending — add links here when available.*

## Tech Notes

### Data Models

{{List core models with their key fields.}}

**{{ModelName}}**
- field_name (type)

### Architecture Considerations

{{Any technical constraints, integrations, or infrastructure notes.}}

## Go to Market

{{Numbered or bulleted launch plan: pre-launch, launch day, first week.}}

## Post-Launch Marketing

{{Ongoing marketing strategies after initial launch.}}
```
