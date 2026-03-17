---
name: extreme-brainstorm
description: Facilitates extreme brainstorming sessions based on Jason Cohen's framework of pushing business dimensions to absurd extremes to unlock breakthrough ideas. Use this skill whenever the user wants to brainstorm, generate new ideas, rethink strategy, challenge assumptions, explore new business models, think about competitive positioning, shake up their roadmap, do a strategy exercise, or is feeling stuck in incremental thinking. Also trigger when users mention "extreme questions," "extreme brainstorming," "10x thinking," "reframe the problem," or want to break out of small/tactical thinking patterns. This works for any stage of company — from pre-idea founders to scaled businesses.
---

# Extreme Brainstorming Skill

Guides users through a structured brainstorming process based on Jason Cohen's "Extreme Brainstorming Questions" framework. The core insight: stretching a business dimension to an absurd extreme forces genuinely new thinking. An idea that's a 60% solution in an extreme hypothetical can be a 2x or 10x idea in reality.

Source: https://longform.asmartbear.com/extreme-questions/

## Why This Works

Normal brainstorming fails because we're blinded by daily work — no forest, all trees. We glom onto familiar ideas whose importance is inflated by repetition. Customer interviews and support tickets generate tactical ideas that cement tiny thinking. Extreme questions jostle you out of that by making each dimension so extreme it's nearly nonsense — but dramatically different perspectives reveal distinctly new ideas.

Unique business models emerge when at least one dimension is so extreme that critics and competitors can't even conceive of it. Zappos' 364-day free returns, Robinhood's $0 trades, Netflix's mail-order DVDs, open-source companies charging for free software — all were considered impossible until someone did it and won because of it.

## The 15 Extreme Questions

For the full text of each question with all sub-prompts, read `references/questions.md`.

1. **10x Prices** — Forced to charge 10x more, what justifies it?
2. **No Customers** — All customers vanish; how do you rebuild from scratch?
3. **No Tech Support** — Support is banned forever; what has to change?
4. **Maximize Fun** — What's the most fun thing to build that still matters?
5. **Complete Rip-Off** — Biggest competitor copies every feature; how do you still win?
6. **No Time** — Ship a complete, delightful MVP in just two weeks.
7. **Flipped Business Model** — Forced to charge in a completely different way.
8. **No Website** — Website is gone; how do you still grow?
9. **No Meetings** — Synchronous meetings are banned; what systems replace them?
10. **No Customer Contact** — Can never talk to customers again; how do you learn what to build?
11. **Cost Is No Object** — Spend 100x more, even if wildly unprofitable. What do you do?
12. **Sociopathic CEO** — Change anything regardless of feelings or politics. What changes?
13. **Mortal Wound** — What externality could kill the entire company?
14. **Philanthropist** — Only goal is maximum good for your customers. What changes?
15. **Only One Thing This Year** — Ship exactly one initiative all year. What is it?

## How to Run a Session

### Step 1: Understand the Business

Before diving into questions, get enough context to make the exercise productive. You need to understand:
- What the product/company does
- Who the customers are
- Current business model (pricing, go-to-market)
- Current stage (pre-launch, early, growth, scaled)
- What feels stuck or what prompted the brainstorm

If you already know this from memory or conversation context, don't re-ask — just confirm and move on. If the user has given partial context, fill in what you can and ask only about gaps.

### Step 2: Select Questions

There are two modes:

**Guided mode (recommended for most sessions):** Recommend 3-5 questions that are most relevant to the user's situation, explain why each is a good fit, and let them pick. Use these heuristics:

| Situation | Best questions |
|---|---|
| Pricing feels wrong / leaving money on the table | 10x Prices, Flipped Business Model |
| Stuck on roadmap / what to build next | Only One Thing, Maximize Fun, No Time |
| Competitive pressure / commoditization | Complete Rip-Off, 10x Prices |
| Growth stalled / marketing feels stale | No Website, No Customers |
| Support costs too high / scaling pain | No Tech Support, No Customer Contact |
| Team/org friction / too many meetings | No Meetings, Sociopathic CEO |
| Need to stress-test strategy | Mortal Wound, Sociopathic CEO |
| Want to reconnect with purpose | Philanthropist, Cost Is No Object |
| Early-stage / pre-product-market-fit | No Customers, Only One Thing, No Time |

**Full sweep mode:** Run through all 15 in order. Better for annual planning or deep strategy offsites. Keep answers shorter per question so the session doesn't become exhausting.

### Step 3: Facilitate Each Question

For each selected question, read the detailed sub-prompts from `references/questions.md` and:

1. **Present the extreme constraint** in one punchy sentence.
2. **Ask the sub-questions** — these are the real engine of the exercise. Don't dump all sub-questions at once. Ask 1-2 at a time, react to what the user says, then go deeper with follow-ups that are specific to their answers.
3. **Bridge to reality** — After exploring the extreme, always bring it back: "OK, that's the extreme version. What's the realistic 2x version of this idea?" or "Which piece of what you just described could you actually do in the next quarter?"
4. **Capture concrete ideas** — As the conversation surfaces ideas, note them explicitly. At the end of each question, summarize the actionable ideas that emerged.

### Step 4: Synthesize

After working through the selected questions:

1. **List all ideas** that surfaced across questions.
2. **Cluster them** by theme (pricing, product, growth, ops, strategy).
3. **Identify the top 3-5** that are both high-impact and feasible within 6 months.
4. **Flag any "extreme-but-maybe-not-crazy" ideas** — these are the potential breakthroughs that deserve serious exploration even if they feel uncomfortable.
5. **Offer to create a deliverable** — a one-page strategy brief, a prioritized idea backlog, or a decision framework for choosing between the top ideas.

## Tone and Style

- Be a thinking partner, not a lecturer. React to what the user says. Build on their ideas. Challenge weak reasoning gently.
- The extreme framing should feel energizing and slightly playful, not like a homework assignment. The point is to break mental patterns.
- Don't let the user off the hook with surface-level answers. If they say "we'd just do X," push with "OK, but what specifically? Who? How? What would have to be true?"
- Balance provocation with practicality. Every extreme exploration should land on at least one concrete, realistic takeaway.
- If the user's business context is already known from memory, weave it in naturally. Reference their specific product, customers, and competitive dynamics rather than staying abstract.

## Output Formats

Depending on what the user needs, produce:
- **In-conversation brainstorm** — The default. Walk through questions interactively.
- **Strategy brief** — A document summarizing the session's top ideas with rationale (use docx skill if requested as a file).
- **Idea backlog** — A prioritized list of ideas scored on impact and feasibility.
- **Single-question deep dive** — Spend an entire session on just one extreme question, going very deep.