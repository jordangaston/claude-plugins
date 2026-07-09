---

name: creative-diagnosis

description: "Diagnose a brand's ad account and turn research into a prioritized creative roadmap — two-way persona analysis (who your ads target vs. who actually buys), the one-to-two-sentence diagnosis, evidence ranking, and the icebox/quarterly/monthly roadmap system. Use whenever the user is auditing an ad account, onboarding a brand or client, asking what to test next, drowning in creative ideas and unsure what to prioritize, doing quarterly or monthly creative planning, or turning customer research into ads. Also trigger on creative strategy, creative roadmaps, creative sprints, ad account audits, persona research, marketing awareness levels, market sophistication, creative diversity, Andromeda, creative pillars, doubling down on winners, or phrases like 'we're just testing randomly week to week', 'what should we make next', 'I have too many ideas', or 'my team keeps reacting instead of planning.' Trigger even when the user never says the word 'diagnosis.'"

---
# Creative Diagnosis

The messy middle: how research becomes strategy. From Dara Denney's diagnosis-and-roadmapping method.

Three skills sit adjacent. `performance-creative` runs the test loop. `static-ads` builds the artifact. **This one decides what to work on and why.**

## The claim that organizes everything

&gt; **If you don't have a diagnosis, you don't have a strategy. You just have aimless week-to-week testing.**

Most brands — including nine-figure brands — are reacting week to week. There is no secret code the big accounts are using. The thing separating teams with clarity from teams that flail is that they wrote things down and planned in advance.

And the thing that stops strategists from prioritizing well is a misunderstanding of the job:

&gt; **It is not your job to be creative. It is your job to make the business money.**

Top brands are not coming up with the most out-of-the-box ideas. They are doubling and tripling down on what already works. Most accounts are sitting on winning angles they have not exploited.

Hold both of these when a user asks "what should we make?"

---

## Phase 1 — Personas, analyzed two ways

**Why personas are now structural.** Meta's Andromeda is a persona-based algorithm. It ranks and retrieves ads by persona — by how people show up in feeds — not merely by user. An ad without an intended persona is being delivered against an audience nobody chose.

The unlock is that there are **two different persona sets**, and they are usually not the same:

**1. Who your ads are currently targeting.** Analyze the ad library. Any brand's — including competitors'.

**2. Who is actually buying.** Analyze customer reviews and interviews.

**The gap between them is your opportunity as a strategist.** Run both. Compare. Nearly every account has a mismatch, and nobody has noticed.

A real example: a brand's creative featured mostly men, because the founders were men. The audience breakdown skewed heavily female. Review data showed African-American women worried about makeup and cosmetics flaking off. That gap produced the winning creative.

**Rank the real personas twice.** This is the move most people miss. Ask for:

- a ranking by **volume** (how often this persona appears in reviews)
- a ranking by **emotional intensity** (how emotive the language is)

When a persona ranks low on volume but high on emotional intensity, that is an opportunity — a small, loud audience nobody is speaking to.

**Always demand the receipts.** Whatever LLM you use, make it cite the review signals that produced each persona. AI will give you a lot of nonsense. Verification is how you catch it.

Prompts, the segment-document template, and the new-brand workaround: `references/[persona-research.md](http://persona-research.md)`.

---

## Phase 2 — The diagnosis

**Definition:** one to two sentences explaining *the why* behind the ads you are testing. It is the connective tissue across everything in the roadmap. It is your anchor point.

**How to reach it — five steps:**

1. **Conduct research.** Manually first (see the AI note below).
2. **Analyze personas both ways.** Who your ads target; who actually buys.
3. **Understand awareness and sophistication levels.** Map current top performers onto the awareness ladder. Where do they cluster?
4. **Determine creative diversity level.** Andromeda needs diversity to find your best customers.
5. **Write the diagnosis.**

**Real diagnoses, as examples of the form:**

| What was found | Diagnosis |

|---|---|

| Everything solution-aware or below; heavy testimonials and best-seller messaging | *This business needs top-of-funnel content to engage, educate, and refill the paid social funnel — which will also lift the lower-funnel assets already working.* |

| All top performers hit one persona | *Open a brand-new audience. Split-test personas.* |

| Older segment showed best performance and retention | *Focus solely on 40+ creators. Double and triple down.* |

| Team drowning in promotional one-offs | *Stop making the Mother's Day 25% static. Build an MVP process for those requests and get back to evergreen.* |

| Great learnings, under-exploited | *More content featuring the winning messaging and angles. We're leaving low-hanging conversions on the table.* |

Notice: only one of those five is a "new idea." Three are *doubling down* or *stopping*. That ratio is roughly correct.

**Re-diagnose quarterly.** A diagnosis is a hypothesis about a moment, not a permanent identity.

**For leaders:** producing the diagnosis is your job, not your strategists'. It's how you give a team clarity.

### Creative pillars

Once a diagnosis points at doubling down, look for **creative pillars** — angles that work again and again. One brand runs a single angle in roughly **one in seven of its ads.**

Audit the ad library for pillars. Then ask the question almost nobody asks: *which of our proven angles have we not fully exploited?*

The cheapest win available: take the hook and text overlay from a top-performing video, put it on a static. This regularly produces a new top performer.

### Pushing back

Your job is to grow the business. Promotional assets that get turned off in a week or two are not that job. **Push back adamantly** — and simultaneously build a minimum-viable process to get those requests out the door fast, because they aren't going away.

---

## Phase 3 — Rank by evidence

You will finish research with more ideas than you can execute and no obvious ordering. **Filter every idea through one lens: what has the most evidence for performance?**

**High confidence**

- Formats, messaging, and creators you have pressure-tested and already see working
- Your own review data and persona research
- Your own past performance

**Low confidence**

- "It's our competitor's longest-running ad"
- "Because our competitors did it"

Reject the second category outright. You don't know why that ad has been running. Often it's *lower funnel* — a long-lived ad buried in a retargeting campaign, which tells you nothing about cold acquisition.

If the only evidence a strategist brings to a standup is *"this ad ran for a long time"* — no personas, no research, no awareness-level filter — they aren't doing the job. Say so.

---

## Phase 4 — Roadmap

&gt; **The sheer act of writing down your ideas and prioritizing them will put you ahead of 75% of creative strategists.**

**Three golden rules:**

1. **Write every idea down in one central location.** (The icebox.)
2. **Rank by what you have the highest confidence in.**
3. **Prioritize what is quickest to get out the door.**

Then leave room for big swings with massive upside — new personas, new production. And leave room for magic. But magic is not the job.

**The four-part roadmap** — creators, icebox, quarterly plan, monthly roadmap — is specified in `references/[roadmapping.md](http://roadmapping.md)`, along with the tier system and the sprint cadence.

Two things worth stating up front:

**The icebox is ungraded.** Nobody is judged for what they put in it. Its purpose is that when a sprint ends and someone asks "what are the ideas?", the answer already exists. Leaders: enforce that strategists deposit ideas continuously. Google Sheet, Notion, whatever. The tool doesn't matter; the discipline does.

**Iterations don't wait for the roadmap.** If an iteration can ship within a week, it goes into this week's sprint. Every initial roadmap should produce quick low-hanging-fruit wins in the first week or two, straight out of the research.

---

## Positions to hold when asked

**On volume.** There is no calculator. Volume is a confluence of budget and creative operations. Don't tell a brand to run ten creative tests when they can realistically make three. Ask what they can actually produce at their quality threshold, then work backwards.

**On ABO vs. CBO.** Given a $2M/month budget, she'd still run a dedicated creative testing campaign on ABO — while cheerfully keeping CBO clients. Not romantic about it. The reasoning:

- **ABO** tells you *why* a creative did or didn't perform. You aren't left guessing. It also forces creative diversity, because everything gets pressure-tested in market.
- **CBO** gives efficiency, and leaves you permanently wondering about certain creatives.

The framing question: *do you want as many creatives as possible performing at goal (high-growth), or do you want efficiency?*

Caveat: one ad sat in market for two months before suddenly performing. ABO is what let them see it at all.

**On trends.** Don't prioritize them. "This is going viral on TikTok, we have to do it" is not evidence. With eight shots on goal at a winning creative, a TikTok trend isn't one of them. (She has been proven wrong on this — a zodiac-signs-as-sheet-colors listicle performed. Hold the rule loosely and enjoy being wrong.)

**On testing organically first.** A myth. *"Everyone's obsessed with this idea of testing for free."* You can get real learnings from organic, but sequencing paid behind organic validation is not how top brands operate.

**On conviction and taste.** Conviction is valuable — as a *learning tool*, not as an optimization target. A strategist who'd stake a month's salary on an ad and is wrong has learned something enormous. Taste is a boring conversation: *it might perform even if you hate it.* "I don't like it" is not an argument. Instinct built on the evidence-ranking system is.

**On AI.** Use it for mass data analysis, review mining, persona research, and briefing — you need it, and refusing it is arguably more dangerous to the craft than using it. But **do the first pass of research manually.** The manual reputation analysis is what lets you spot when the model is producing nonsense, and it will produce nonsense. Build a per-client project with context docs, past performance, and persona research so the briefing stays grounded.

**On testing methodology generally.** Denney has said her views here have been changing faster than anywhere else in her practice. Treat specific mechanics as live, not settled. Treat the *diagnosis discipline* as stable.

---

## How to run this with someone

Diagnose before you generate. When a user asks "what ads should we make," resist answering. Instead:

1. **Do they have a diagnosis?** If not, everything downstream is aimless. Build one.
2. **Have they run personas both ways?** Almost nobody has. The gap is usually the answer.
3. **What's already working that they haven't exploited?** Ask this before asking what's new. It's the higher-EV question and it's the one nobody asks.
4. **What's the evidence for each idea on the table?** Rank. Kill the competitor-derived ones.
5. **What ships this week?** Quick iterations first; big swings scheduled.

**Say "that's a low-confidence idea" when it's true.** Say "you're being creative when you should be doubling down" when it's true. Both are the core service.

---

## Reference files

- `references/[persona-research.md](http://persona-research.md)` — the two prompts (ad library, review CSV), the trigger-based segment document, dual ranking, and what to do when a brand has no customers yet
- `references/[roadmapping.md](http://roadmapping.md)` — the tier system, the four-part roadmap, quarterly planning, the sprint cadence, and the evidence-ranking checklist

