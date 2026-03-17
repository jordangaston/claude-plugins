---
name: needs-stack
description: >
  Analyze your product's competitive strategy using the Needs Stack framework (from Jason Cohen / A Smart Bear).
  Use this skill whenever the user mentions competitive strategy, competitive positioning, needs stack,
  product positioning, disruption analysis, moving up the value chain, customer needs hierarchy, or wants to
  understand how their product fits against competitors at different levels of customer need. Also trigger when
  the user asks about positioning against disruptors, finding higher-value product opportunities, or figuring out
  what level of customer need their product actually serves. Works especially well for founders evaluating
  new product ideas, analyzing incumbents they want to disrupt, or defending against upmarket/downmarket threats.
---

# Needs Stack Competitive Strategy Analysis

This skill guides a structured competitive analysis using the **Needs Stack** framework. The core idea:
every customer has a hierarchy of needs — your product addresses one level, but the customer's *real* goal
is higher up. Products that address a higher-level need make the lower-level needs *obsolete* for that customer.

Read `references/framework.md` before running the analysis — it contains the full framework logic,
the analysis template, and worked examples you need to produce a high-quality output.

## How to run the analysis

### Step 1: Gather context

Ask the user for the following (check conversation history first — some may already be present):

1. **What is the product/business?** — Name, what it does, who it's for.
2. **Who is the target customer persona?** — Give them a name (like "Charlie" in the original framework). What's their role, situation, and motivation?
3. **What does the customer hire this product to do?** — The immediate job-to-be-done.
4. **Who are the known competitors?** — Direct and indirect.

If the user provides a URL or product description, use web search/fetch to research the product and competitive landscape before proceeding. Be proactive about filling in gaps — don't make the user do all the work.

### Step 2: Build the Needs Stack

Using the framework in `references/framework.md`, construct 4–6 levels of the customer's Needs Stack, from the lowest infrastructure-level need up to the highest aspirational/life-goal-level need. Each level should include:

- The need at that level (what the customer wants)
- Products/companies that serve that level
- Whether the user's product operates at this level

Present this as a clear visual stack (highest need on top) using the Visualizer tool. Make it clear which level the user's product currently occupies.

### Step 3: Derive strategic insights

Walk through each of these lenses (details in `references/framework.md`):

1. **Disruption risk from above** — Who targets a higher need and could make your level irrelevant?
2. **Disruption opportunity upward** — Could you move up a level? What would that require?
3. **Marketing & positioning** — Sell features at your level, benefits from one level up.
4. **Making lower levels irrelevant** — How to position competitors below you as unnecessary.
5. **Strategic metrics** — What metric one level above yours would predict long-term customer success?
6. **Higher purpose** — What's the aspirational story at the top of the stack?

### Step 4: Deliver the output

Produce a structured analysis document. For complex analyses, create a deliverable file (markdown or docx).
For quick analyses, present inline with a Visualizer diagram of the stack.

Always end with 2–3 concrete, actionable recommendations ranked by impact.