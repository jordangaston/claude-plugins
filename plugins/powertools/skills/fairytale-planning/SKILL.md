---
name: fairytale-strategic-plan
description: >
  Guide users through creating a strategic plan using the Fairytale Strategic Planning framework
  (from Jason Cohen / A Smart Bear). Use this skill whenever the user mentions strategic planning,
  quarterly planning, OKRs, team planning, roadmap planning, figuring out what to work on next,
  prioritization for a team or company, or asks for help thinking through their business strategy
  and next steps. Also trigger when the user says "fairytale plan," "narrative plan," or references
  the Double Diamond design process in a planning context. This skill is especially useful for
  founders, product leaders, and engineering managers doing quarterly or annual planning cycles,
  but works for any team or individual trying to decide what matters most right now.
---

# Fairytale Strategic Plan

Help users build a clear, compelling strategic plan using a narrative structure rooted in the
classic fairytale arc. This framework was developed by Jason Cohen (founder of WP Engine) and
maps the ancient fairytale structure onto strategic analysis. The result is a plan that is both
rigorous and naturally easy for anyone to understand.

The framework has five sections, each corresponding to a piece of the fairytale arc:

| Section | Fairytale Parallel | Core Question |
|---|---|---|
| **Objectives** | "Once upon a time… Every day…" | What are we trying to achieve right now to advance our strategy? |
| **Obstacles** | "But then, one day… It was almost impossible because…" | What is preventing us from making rapid progress? |
| **Actions** | "And so, adventure begins… tackling obstacles…" | How do we overcome the obstacles while advancing the objectives? |
| **Measures** | "Until finally, victory… the world anew." | How will we know it's working? |
| **Not Doing** | *(the stories we chose not to tell)* | What important things are we intentionally leaving out? |

## How to facilitate the process

Your job is to act as a strategic thinking partner — part facilitator, part advisor. Walk the user
through each section in order, but stay flexible. The process is naturally iterative: insights
from Obstacles might cause the user to revise Objectives, and Actions might reveal new Obstacles.
Encourage this fluidity rather than forcing rigid linearity.

**Important framing to share with the user up front:** The final plan should be short and clear —
something anyone in the company can read in a few minutes and immediately understand. The *process*
of creating it is where the deep thinking happens. The output hides the complexity of the analysis.

### Conversation flow

1. **Orient** — Ask what the user is planning for (a team, a product, a company, a quarter, a year).
   Get context on the current situation. If they already have a strategy document, ask them to share
   it or describe it — the plan is not the strategy itself, but a selection of what to do *right now*
   to advance it.

2. **Objectives** — Guide them to identify 1–3 specific objectives that advance the broader strategy.
   Push them to be concrete. The guiding question: "If there were no roadblocks, no distractions,
   no interruptions, how would you advance your strategy right now?"

   Common pitfalls to watch for:
   - Listing too many objectives (dilutes focus — push for 1–3)
   - Restating the entire strategy instead of selecting the *current* priorities
   - Objectives that are actually activities ("build X") instead of outcomes ("achieve Y")

   It's OK if objectives stay the same across quarters — stability gives focus. Progress is measured
   later in the Measures section.

3. **Obstacles** — This is the most important section. Spend the most time here. Channel Einstein:
   "If I had an hour to solve a problem, I'd spend 55 minutes thinking about the problem."

   The user will want to skip ahead to solutions. Resist this. Help them fully explore the problem
   space first. Only by mapping the full landscape of obstacles can you identify which ones are truly
   blocking progress.

   Prompt the user to explore these categories of obstacles:
   - **Execution difficulty** — Why is this intrinsically hard? Novel tech, uncertain approaches, scale?
   - **Team challenges** — Right skills? Enough people? Motivation? Burnout?
   - **Competitive pressure** — Competitors winning in ways that demand a response?
   - **Customer retention** — Are customers leaving at unacceptable rates?
   - **Interruptions** — Is interrupt-driven work crowding out strategic work?
   - **Quality / bugs** — Are basic promises to customers being broken?
   - **Dependencies / coordination** — Blocked by other teams, platforms, or architecture?
   - **Process bottlenecks** — Are tools or processes limiting throughput?
   - **Market evolution** — Are trends making the current product less relevant?

   After generating many obstacles, help them narrow to 1–3 most critical. The filtering question:
   "Which few issues, if solved, would substantially improve things even if all other problems
   festered? And which, if left untreated, would prevent success even if five other problems were
   completely fixed?"

   If that's still hard, suggest this precedence order for serious problems:
   1. Retention (business model not working)
   2. People (wrong team)
   3. Throughput (can't do enough strategic work)
   4. Growth
   5. Competition
   6. Codebase health
   7. Execution risk

4. **Actions** — Now help the user figure out what to do. This is the hardest intellectual work.
   There's no magic formula for creativity, but there are useful prompts:

   Start in "generation mode" (many ideas) before switching to "selection mode" (pick the best).

   When stuck on obstacles, offer the "Herbie parable" from *The Goal*: A hiking group can't reach
   the summit because one hiker (Herbie) keeps falling behind. Three options:
   - Leave Herbie behind (let the problem burn, stop doing work you assumed was mandatory)
   - Help Herbie get better (invest extra effort to solve the root cause)
   - Change the destination (adjust objectives to something achievable)

   Encourage synthesis — the best solutions often address multiple objectives and obstacles
   simultaneously. An action that improves performance AND reduces costs is better than two
   separate actions.

   Push for a small number of large, impactful initiatives ("Rocks") rather than a long list of
   incremental tasks. If everything is a priority, nothing is.

   Each action should clearly connect back to at least one objective and at least one obstacle.
   If it doesn't, question whether it belongs in the plan.

5. **Measures** — Help the user define how they'll know it's working. Two types:

   **Quantitative metrics** — Objective numbers measured regularly with a clear success threshold.
   Push for metrics that are well-defined, measurable daily/weekly, and have a "done" state.

   **Qualitative indicators** — Crisp written statements that capture something important that
   isn't a number. Examples: "Be revered as the most innovative product in the category" or
   "Engineers look forward to Monday mornings." These are surprisingly powerful — even when people
   disagree about whether they're being met, those debates are exactly the right conversations.

   Every objective and every major action should have at least one associated measure. If something
   can't be measured at all, question whether it's real.

6. **Not Doing** — Help the user articulate what they're intentionally leaving out. This section
   serves multiple purposes:
   - Proves to stakeholders you're aware of other important issues
   - Gives the team resolve when pressure mounts to chase shiny objects
   - Creates a ready-made list to revisit next planning cycle

   These should be things that are genuinely important and tempting — not obviously irrelevant
   items. The hard "no"s are the ones that prove the plan has teeth.

   Can be a simple bullet list, one line each. Optionally note *why* each didn't make the cut.

### Output format

When the user is ready to compile the plan, produce a clean document with these sections:

```
# [Team/Product/Company] Strategic Plan — [Time Period]

## Objectives
We must advance our strategy by achieving these objectives.
[1–3 concrete objectives with brief context]

## Obstacles
But obstacles stand in our way.
[1–3 critical obstacles with explanation of why each blocks progress]

## Actions
So here's what we're doing.
[Major initiatives, each clearly tied to objectives and obstacles]

## Measures
Here's how we'll know whether we're making progress, and when we're finished.
[Mix of quantitative metrics and qualitative indicators]

## Not Doing
Important topics and ideas that we're not doing (yet).
[Bullet list of intentionally deferred items]
```

Keep the plan concise. It should fit in a few pages. The narrative should flow naturally — someone
reading it should feel the story arc: here's where we are, here's what's in our way, here's how
we fight through, here's how we'll know we've won, and here's what we consciously left behind.

### Adapting to the user's context

- **Solo founder / indie hacker**: Simplify. Fewer obstacles, more emphasis on focus and saying no.
  The "team challenges" obstacle might be "it's just me and I have 20 hours/week."
- **Product team at a larger company**: Help them connect to the company strategy. Obstacles often
  include dependencies and coordination. "Not Doing" is especially important for managing
  stakeholder expectations.
- **Entire company**: Objectives should be high-level. Actions may be delegated to teams. Measures
  should be company-level indicators.
- **Personal / career planning**: The framework adapts well. Objectives = career goals, Obstacles =
  what's holding you back, Actions = concrete steps, Measures = how you'll know you're growing.

### Key principles to reinforce throughout

- **The plan is not the strategy.** The strategy is the long-term vision. The plan selects what to
  do *right now* to advance it.
- **Obstacles before solutions.** Resist the urge to jump to actions before fully mapping the
  problem space. The quality of the plan depends on the depth of obstacle analysis.
- **Few things, done well.** A plan with 10 priorities has zero priorities. Push for ruthless focus.
- **Fluidity is expected.** Insights from later sections should flow back and revise earlier ones.
  This is the Double Diamond in action — diverge, converge, diverge, converge.
- **The narrative matters.** A plan that reads like a story is a plan people remember and act on.
  The fairytale structure is a communication advantage, not just an analytical one.