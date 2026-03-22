---
name: jtbd
description: Apply Jobs-to-be-Done Theory and Outcome-Driven Innovation (ODI) to define markets, uncover customer needs, find growth opportunities, and formulate winning strategies. Use whenever the user mentions JTBD, ODI, outcome-driven innovation, desired outcomes, job maps, needs-first innovation, outcome-based segmentation, the opportunity algorithm, or wants to understand what job customers hire a product to do. Also trigger when users want to define a market around jobs, uncover unmet needs, write desired outcome statements, create a job map, segment by outcomes, formulate value propositions tied to unmet needs, analyze competitors through the JTBD lens, or choose between differentiated/dominant/disruptive/discrete/sustaining growth strategies. Works in interactive mode (step-by-step with a human) or non-interactive mode (autonomous analysis from a problem brief).
---

# Jobs-to-be-Done & Outcome-Driven Innovation Skill

Guides users through Anthony Ulwick's Jobs-to-be-Done Theory and the Outcome-Driven Innovation (ODI) process — the framework behind an 86% innovation success rate (5x the industry average of 17%).

Source: "Jobs to be Done: Theory to Practice" by Anthony Ulwick (2016), Strategyn.

## Core Insight

People buy products and services to get a **job** done. New products win when they help customers get that job done **better and/or more cheaply**. Innovation becomes predictable when you know: (1) what job the customer is trying to get done, (2) what metrics (desired outcomes) they use to measure success, and (3) which of those outcomes are underserved.

The "ideas-first" approach (brainstorm → filter → test) is inherently flawed because the probability of randomly conceiving a solution that addresses all unmet needs approaches zero. The "needs-first" approach works, but only if you know what a "need" actually is, can capture a complete set of needs, and can quantitatively determine which are unmet.

## Reference Files

Read these for deep detail on each component:
- `references/needs-framework.md` — The 6 types of customer needs, rules for defining jobs and outcomes, the 3 customer types
- `references/growth-strategy-matrix.md` — The 5 growth strategies, opportunity algorithm, outcome-based segmentation, how to choose a strategy
- `references/odi-process.md` — The Universal Job Map (8 steps), the 10-step ODI process, the 84 practitioner steps

## Operating Modes

### Mode 1: Interactive (Human-in-the-Loop)
Walk the user through the ODI process step by step, collecting their input, challenging vague or product-centric thinking, and building the analysis incrementally. Pause between phases for review. This is the default when a user is engaged in conversation.

### Mode 2: Non-Interactive (Autonomous)
Given a product, company, or market context, run the entire JTBD/ODI analysis and produce a complete deliverable. Make reasonable judgments at each step and flag where real customer research would improve the analysis. Useful when the user says "run a JTBD analysis on X" or provides a problem brief.

---

## The Process

### Phase 1: Define the Customer

Before anything else, establish who the customer is. There are three key customer types — read `references/needs-framework.md` for full detail:

1. **Core Job Executor** — the end user who performs the job
2. **Product Lifecycle Support Team** — people who install, maintain, repair, etc.
3. **Purchase Decision Maker** — the buyer who makes the financial decision

*Interactive:* Ask who uses the product to get the job done. Push back on vague answers ("we have many customers"). Get specifics. Then determine if the buyer is a different person from the user. Ask about lifecycle support people if relevant.

*Non-Interactive:* Infer from context. State assumptions explicitly. Identify all three customer types where applicable.

### Phase 2: Define the Core Functional Job

This is the cornerstone. Read `references/needs-framework.md` for all the rules. The format is:

```
verb + object of the verb (noun) + contextual clarifier
```

**Challenge common mistakes:**
- **Too narrow:** "Boil water" → Should be "Prepare a hot beverage for consumption"
- **Too broad:** Impossible for the company to tackle end-to-end
- **Product-centric:** "Use our software to..." → Strip the solution out
- **Mixed with emotions:** "Safely and quickly cut wood" → Strip to "Cut a piece of wood in a straight line"
- **Situation, not a job:** "Overcome boredom" → "Stay informed on topics of interest"

*Interactive:* Ask the user what job their customers are trying to get done. If they describe it in product terms, reframe: "That's what your product does. What is the customer ultimately trying to accomplish?" Iterate until the statement is purely functional, solution-agnostic, and at the right level of abstraction.

*Non-Interactive:* Define the job, explain why you chose this level of abstraction, and note what a narrower or broader definition would look like.

### Phase 3: Create the Job Map

Deconstruct the core functional job into the 8 Universal Job Map steps. Read `references/odi-process.md` for the full framework.

| Step | Question to Answer |
|---|---|
| **Define** | What must the customer plan, determine, or select before starting? |
| **Locate** | What inputs, materials, or information must they gather? |
| **Prepare** | What must be set up, organized, or examined before execution? |
| **Confirm** | What must be validated or verified before proceeding? |
| **Execute** | What is the core activity being performed? |
| **Monitor** | What must be tracked, verified, or checked during execution? |
| **Modify** | What adjustments might need to be made? |
| **Conclude** | What must be stored, finished, or closed out? |

*Interactive:* Walk through each step, asking the user to describe what the customer is trying to accomplish (NOT what they're doing — needs view, not solution view). Challenge any step that describes using a specific product.

*Non-Interactive:* Generate the complete job map. Note which steps are likely most complex and where unmet needs are most likely to cluster.

### Phase 4: Uncover Desired Outcomes

For each step in the job map, generate desired outcome statements. Read `references/needs-framework.md` for the precise format and rules.

Format: `direction of improvement + performance metric + object of control + contextual clarifier`

**Performance metrics are almost always one of:**
- "the time it takes to..." (speed)
- "the likelihood that..." (reliability/predictability)
- "the number of..." (output/efficiency)

Generate 5-15 outcomes per job step, aiming for 50-150 total. Every outcome must be measurable, controllable, actionable, devoid of solutions, and stable over time.

*Interactive:* Work through the job map step by step. For each step, ask: "When doing [this step], what could go wrong? What takes too long? What's unpredictable? What wastes resources?" Convert their answers into properly formatted desired outcome statements. Show them the formatted versions for validation.

*Non-Interactive:* Generate the full set of desired outcomes organized by job step. Flag outcomes that seem most likely to be underserved based on market knowledge.

### Phase 5: Capture Additional Needs

Beyond the core desired outcomes, also capture:

- **Related Jobs** (5-20): What other jobs does the customer want to get done at the same time? More jobs on one platform = more value.
- **Emotional Jobs** (5-25): How do they want to feel? What feelings do they want to avoid? Format: "Feel [emotion]" or "Avoid feeling [emotion]"
- **Social Jobs**: How do they want to be perceived? Format: "Be perceived as [descriptor]"
- **Consumption Chain Jobs**: For each relevant lifecycle stage (purchase, install, maintain, repair, dispose), what outcomes matter?
- **Financial Desired Outcomes** (buyer): What financial metrics does the buyer use? (cost, ROI, risk reduction, etc.)

### Phase 6: Assess Opportunities

Without real quantitative survey data, use qualitative judgment to estimate which outcomes are likely underserved.

**The Opportunity Algorithm (for reference):**
```
Opportunity Score = Importance + max(Importance - Satisfaction, 0)
```
Score ≥ 10 = underserved. Read `references/growth-strategy-matrix.md` for full detail.

**Without survey data, use proxies:**
- Outcomes that multiple customers complain about → likely underserved
- Outcomes where no competitor has a clear solution → likely underserved
- Outcomes where all competitors have strong solutions → likely appropriately served or overserved
- Outcomes that customers describe as "not a big deal" → likely overserved

*Interactive:* Walk through the top outcomes with the user. For each, ask: "How important is this to your customers? How well do current solutions satisfy it?" Build a rough opportunity landscape.

*Non-Interactive:* Score each outcome qualitatively (high/medium/low importance and satisfaction). Identify the likely underserved outcomes and group them into themes.

### Phase 7: Choose a Growth Strategy

Using the Growth Strategy Matrix (read `references/growth-strategy-matrix.md`), determine which strategy fits:

| Strategy | When to Use | Target |
|---|---|---|
| **Differentiated** | Underserved segment exists, willing to pay more | Premium offering that gets job done significantly better |
| **Dominant** | Can get job done ≥20% better AND ≥20% cheaper | All customers |
| **Disruptive** | Overserved segment or nonconsumers exist | Cheaper but "good enough" offering |
| **Discrete** | Customers have restricted access to alternatives | Higher-priced offering in constrained situations |
| **Sustaining** | Incumbent protecting market share | Incremental improvements |

**Critical rule:** New entrants should avoid sustaining strategies — customers only switch for ≥20% improvement.

*Interactive:* Present the matrix, discuss what segments exist, and guide the user to the right strategy. Challenge if they default to "sustaining" as a new entrant or pursue differentiation in an overserved market.

*Non-Interactive:* Recommend a strategy with rationale. Note what would need to be true for each alternative strategy to work.

### Phase 8: Formulate Value Proposition & Strategy

Tie the strategy to specific unmet outcomes:

1. **Value proposition:** "We help [customers] get [job] done better by [addressing these specific unmet outcomes]"
2. **Competitive positioning:** Show how the product satisfies outcomes that competitors don't
3. **Product strategy:** What features address the highest-priority unmet outcomes?
4. **Market strategy:** How to communicate the value proposition, which segments to target first, messaging aligned with unmet outcomes

Example: Arm & Hammer Animal Nutrition — discovered 165 desired outcomes for dairy producers. Changed messaging from product features to customer outcomes → 30%+ revenue growth, all products with double-digit growth. No product changes needed.

---

## Output Formats

Depending on user needs, produce:
- **In-conversation analysis** — Walk through the process interactively (default)
- **JTBD Analysis Document** — Complete deliverable with job definition, job map, desired outcomes, opportunity assessment, and strategy recommendation
- **Job Map only** — Just the 8-step job map for a specific job
- **Desired Outcomes List** — A complete set of outcome statements organized by job step
- **Strategy Brief** — Growth strategy recommendation based on the analysis
- **Competitive Analysis** — Evaluate competitors against desired outcomes

## Quality Checks

Before finalizing any output, verify:
- [ ] Job statement is purely functional, solution-agnostic, at the right abstraction level
- [ ] Job map describes what the customer is trying to get done, not what they're doing with a product
- [ ] Desired outcomes follow the exact format (direction + metric + object + clarifier)
- [ ] No outcome statements contain solution references
- [ ] Emotional/social jobs are separated from the functional job
- [ ] Strategy choice is consistent with the identified segments (no differentiated strategy for overserved markets)
- [ ] Value proposition ties to specific unmet outcomes, not generic benefits

## Common Anti-Patterns to Challenge

| What the user says | What's wrong | How to redirect |
|---|---|---|
| "Our customers need a faster dashboard" | Solution-embedded need | "What are they trying to accomplish with the dashboard? What job are they getting done?" |
| "The job is to use our product" | Product-centric thinking | "What would the customer be trying to do even if your product didn't exist?" |
| "We need to add more features" | Ideas-first mentality | "Which specific unmet outcomes would those features address? How do you know those are underserved?" |
| "Our target is small businesses" | Demographic segmentation | "Do all small businesses have the same unmet needs? What makes some struggle more than others?" |
| "We should just iterate fast" | Fail-fast fallacy | "Iterating without knowing the target is just doing something bad faster. What are the specific outcomes you're trying to satisfy?" |