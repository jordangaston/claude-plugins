---

name: performance-creative

description: "Run the performance creative loop for paid social ads — customer language mining, emotional insight extraction, concept development, static-first testing, and content analysis of results. Use this skill whenever the user is working on ads, ad creative, paid social, Meta/Facebook/Instagram/TikTok advertising, UGC videos, hooks, ad concepts, ad testing, creative strategy, ad briefs, or asks why their ads aren't working. Also trigger when the user mentions hook rate, hold rate, CPA, ROAS, creative fatigue, ad angles, personas for advertising, or wants help figuring out what their ads should say. Trigger even when the user frames it casually ('what should my ad say', 'my ads stopped working', 'help me write a hook', 'we're launching ads next week') and even if they never use the words 'creative strategy'."

---
# Performance Creative

A working system for paid social creative, synthesized from the methods of Sarah Levinger (upstream: what to say) and Dara Denney (downstream: what happened when you said it).

## The core claim

Most ad work fails at one of two places, and teams reliably misdiagnose which.

**Levinger's layer** finds the message. It fails when you brief creative from what the brand wants to say rather than from what the customer already believes.

**Denney's layer** finds out whether the message landed. It fails when you read metrics as explanations rather than as rankings.

The loop:

```

Customer language → Emotional insight → Concept → Cheap test

       ↑                                              ↓

  Content analysis ← Performance data ← Live delivery

```

The loop closes on **content analysis, not on metrics**. That is the single load-bearing structural claim. Metrics rank ads. Content explains them. A team that reports "ad 4 won" has learned nothing; a team that reports "ads featuring a mid-career professional, framed around lost dignity rather than lost income, won" can brief the next round.

## Diagnose before you help

When someone brings an ad problem, first locate them in the loop. Asking this well saves everyone from solving the wrong problem.

| What they say | Where they actually are | Go to |

|---|---|---|

| "What should our ads say?" / pre-launch / new product | No validated message | Phase 0 |

| "Our ads stopped working" / rising CPM, flat spend | Fatigue, or one exhausted position | Phase 1 |

| "We have a winner, how do we scale it?" | Needs iteration + net-new queue | Phase 5 |

| "Which of these should we run?" | Concept selection | Phase 1–2 |

| "Why did this one win?" | Content analysis, not metrics | Phase 4 |

| "Help me write a hook" | Check first: is the concept validated? | Phase 2 or 3 |

The most common misdiagnosis: someone asks for hook help when they have no validated concept. A better hook on the wrong message gets more people to the wrong place faster — high hook rate, dying hold rate, terrible CPA. Say so, and redirect upstream.

**Ask before assuming.** Before running any phase, establish: budget, whether ads are currently running, what the conversion event is, and whether there are existing customers to mine. These change everything, and guessing wastes the user's time.

---

## Phase 0 — Mine the language

**Goal:** find the emotional/identity driver behind the purchase, in the customer's own words.

**Do not** brainstorm angles from the product's features. Every angle you invent from a feature list is a projection of the marketer, not a fact about the customer.

Sources, in rough order of value:

- Reviews — especially long, rambling, emotional ones
- Support tickets, cancellation reasons, refund requests
- Reddit and forum threads where the customer complains without knowing a brand is listening
- Post-purchase survey free-text
- Interview transcripts, using *"tell me a story about the last time..."* rather than *"would you buy..."*

What you are hunting: **self-adopted terms.** The words customers spontaneously use about themselves and their situation. Not the brand's words. Not competitors' words.

**The outlier heuristic.** The insight is almost never in the modal review. It is in the strange one. When reading a corpus (or prompting an LLM to read one), ask *what is weird here*, not *what is common*. The canonical example: a non-alcoholic beverage brand's review reading "thank you for giving me a taste of something I never thought I'd taste again." Statistically irrelevant. Commercially decisive — the customer wasn't buying a drink, they were buying back a piece of a life they'd given up.

**Then categorize by emotion, not keyword.** Sort language into emotional clusters. Identify the primary emotion the customer is *solving for* by purchasing. Extract the emotion, then express it many ways. Repeating the literal customer keyword is how copy fatigues.

Generative prompt: *"How many different ways could you say 'confidence' in an ad?"* — not *"how many times can we use the exact phrase customers used?"*

**Locate the identity.** Which self does the purchase resolve? (See `references/[frameworks.md](http://frameworks.md)` for the full self-concept model.)

- **Actual Self** — who they believe they are now
- **Ideal Self** — who they aspire to be (gap → dejection: sadness, disappointment)
- **Ought Self** — who they believe they *should* be (gap → agitation: anxiety, guilt, shame)

Most brands unreflectively address the Actual Self with negative framing and never test the other five combinations.

**Exit criterion:** you can state the insight in one sentence — *"they aren't buying X, they're buying the end of feeling Y"* — and it surprises someone on the team. If it doesn't surprise anyone, keep reading.

**If there are no customers yet** (pre-launch, waitlist), mine the adjacent corpus: the subreddit for the problem, competitor review sections, the replies to the waitlist. Say explicitly that this is weaker evidence and that the first round of ads is partly a research instrument.

---

## Phase 1 — Map the territory

**Goal:** produce 3–5 genuinely distinct psychological positions, each mapped to a named persona.

Plot existing and proposed creative on three axes (full grid in `references/[frameworks.md](http://frameworks.md)`):

1. **Valence zone** — emotional charge: high/low × positive/negative
2. **Self-concept anchor** — Actual / Ideal / Ought
3. **Language intensity** — low (organic-feeling, trust-building) vs. high (direct-response urgency)

Nearly every account clusters in one quadrant, usually High-Intensity / Negative / Actual Self. The empty quadrants are the opportunity, and each one is a **concept**, not a hook.

**Map every concept to a named persona.** Meta's Andromeda retrieval engine groups candidate ads into personas, not merely users. Persona is now structural, not decorative — an unmapped creative is being delivered against an audience nobody chose.

Personas are behavioral, not demographic. "Job seeker, 25–40" is not a persona. "Someone whose self-concept has eroded across 200 unanswered applications" is a persona. Build them from mined language.

**Exit criterion:** 3–5 positions that a stranger would describe as *different ads*, not variations. Each with a persona and a one-line insight.

---

## Phase 2 — Test concepts cheaply

**Goal:** find which position is alive. Not which execution is best.

**Statics before video.** A static tests one variable: does this claim, to this person, earn a stop. A video simultaneously tests claim, creator, delivery, pacing, edit, hook, B-roll, and CTA. When it flops you have one number and eight suspects.

The cost-per-experiment ratio is roughly 100:1. Ten statics for the price of one UGC video means ten shots at finding the message rather than one shot at discovering the message was wrong. And expensive experiments carry a second failure mode beyond failing: having paid, teams optimize around a losing message rather than abandoning it.

**Format is a proxy, not the axis.** What makes a test clean is how many variables moved. What makes it cheap is whether a human had to be hired, briefed, and waited on. Screen recordings are video by format but static in spirit — cheap, one variable, no creator. For demonstration-proof products (where the claim must be *seen* to be believed), the cheap concept test is a screen recording.

Name the variable, not the file type. *"We're testing four grievances"* is a plan. *"We're running statics"* is a budget.

**Do not hold imagery constant across concepts.** A psychological position is inseparable from its expression; there is no image that serves both Ought-Self shame and Ideal-Self aspiration. Holding imagery constant tests one position properly and one badly, then attributes the difference to the position. Worse, visually similar creative gets clustered by the algorithm — it picks one, spends into it, suppresses the rest, and the test never delivers fairly.

Change messaging **and** imagery together. Take bigger swings.

**Hold constant outside the creative:** offer, landing page, conversion event, targeting (broad), budget structure (ABO, even delivery), time window.

**Accept the confound.** When one concept wins you won't know whether the position won or the execution won. Accept it. Round one is a *search* problem (which door). Round two is an *estimation* problem (how far through it). Resolve the confound in Phase 4 and in a second round inside the winning territory — not in the experiment design.

**Campaign structure and kill/scale rules:** see `references/[testing-mechanics.md](http://testing-mechanics.md)`.

**Exit criterion:** one or two positions clear the primary KPI threshold while others are obviously dead.

---

## Phase 3 — Amplify

**Goal:** take the validated message to video.

Video *amplifies* a working message. It does not rescue a broken one.

**Cast for the buyer, not for polish.** The creator matters more than the script or the hook. Casting is the highest-leverage decision in the production chain, because recognition is the mechanism — nobody sees themselves in someone they have nothing in common with. Cast across personas: different ages, roles, backgrounds. Four creators representing four personas teaches more than four scripts read by one creator.

**Write the hooks.** Creators are reliably weak at hooks and don't know the brand. Hand them scripts and specific hooks. Save improvisation for creators who have proven out. Roughly 1 in 5 creators works out; that is not fixable with a better marketplace, only with a tighter brief and more casting.

**The brief carries the insight, not the shot list.** If you cannot state the emotional driver in one sentence at the top of the brief, the brief is not ready.

**Hook ≠ headline.** The hook is a *job* — whatever earns the first moment of attention — and the headline is one employee. On statics, the hook is often the format (a Notes-app screenshot reads as a person, not a brand), the face, or a visually incongruous image. Denney's mechanism: inject a curiosity gap or a conflicting statement that creates cognitive dissonance; brains crave resolution and stay to close the loop. She studies YouTubers rather than advertisers for this, because YouTube is opt-in and creators must earn the click.

Consequence: hook variants should differ in format, opening frame, or casting — not merely in first line. Ten copy variants over one image are one ad, and the algorithm will treat them that way.

---

## Phase 4 — Analyze content, not numbers

**Goal:** explain the win in terms specific enough to brief the next round.

Run the four steps in order, least to most important:

1. **Metrics** — the least important part. Primary KPIs identify winners; storytelling KPIs begin the explanation. Never the end of the analysis.
2. **Content** — the most important. Five dimensions: **Format, Creator, Messaging, Imagery, Persona.**
3. **Comparison** — internal (your own top performers; breakdowns by age/gender/placement) and external (category trends). Benchmark against your own account, never industry averages.
4. **Feedback** — read the comments. Free objection research, free ideas.

Metric tiers and the diagnostic sequence live in `references/[testing-mechanics.md](http://testing-mechanics.md)`. The short version: primary KPIs (spend, results, CPA, ROAS) decide money; storytelling KPIs (CPM, hook rate, hold rate, CTR, shares) locate the failure. CTR is not a reliable indication that a creative is working.

**Exit criterion:** a written statement of *why* it won, along the five content dimensions.

---

## Phase 5 — Iterate, bounded

Refresh the winner: new hooks, thumbnails, stills pulled from video, stacked compilations. Simultaneously keep a queue of net-new concepts from the unoccupied quadrants.

**Concept vs. iteration — enforce the vocabulary,** because teams blur it constantly:

- **Concept** = a new psychological position. Different message, emotion, self, imagery, often creator.
- **Iteration** = a variation on a proven asset. Same claim, same position, new opener.

Hooks are downstream of concepts. You cannot hook-test your way to a message.

**The guard rail: iteration paralysis.** When every ad in the account converges on the same look, same claim, same face — *in the name of doubling down on learnings* — the account is being optimized into a corner. The tell: the answer to "what's our next test?" is always a hook variant. Volume without psychological variance is expensive wallpaper. Fifty ads from one emotional territory is one ad, purchased fifty times.

When this happens, take a bigger swing. Return to Phase 0.

**Hook tests can bubble up concept discoveries.** If "someone else notices the stain" beats "you notice the stain," that's not an imagery finding — it's a finding that the position is about *being seen*, not about *being dirty*. Promote it to a concept hypothesis and go back up a level.

---

## How many concepts

Denney's structure, not a universal number:

- Per test: a new ad set, **2–4 variations**
- Per week (~$30K–100K/month): at least **2 concepts**, ~6–12 ads
- Testing budget: **20–30%** of total spend
- Concurrently: she caps teams at **two**

**Derive it from the budget, not from ambition.** The binding constraint is whether each concept reaches a decision threshold:

```

concepts = testing_budget ÷ spend_to_reach_decision_threshold   (round down)

```

If that number is one, run one — and say honestly that this is a launch, not a test. Splitting a small budget six ways produces six ambiguous numbers and a winner picked from noise.

**On the volume debate:** Barry Hott pushes ~90/10 net-new to iteration. Motion's benchmark data (550K+ ads) found brands launching more creative get roughly twice the winners at identical budgets. Denney's counter is not that volume fails, but that most shipped volume is psychologically redundant — more lottery tickets with the same numbers. Both reconcile: **volume of distinct positions is good; volume of variations on one position is waste.** Say this when a user asks how many ads to make.

---

## Things to say when they're true

Some of the most useful moves in this system are refusals to answer the question as asked.

- **"You don't have a message yet."** When someone asks for hooks pre-validation.
- **"That's a hook test, and you wanted a concept test."** When proposed variants share a position.
- **"Your conversion event is too shallow."** Optimizing toward an easy signup trains the algorithm to find people who enjoy signing up. Flattering CPA, no business. Optimize on the deepest event that fires within roughly a week and produces enough volume to learn from; track the ratio from that event to revenue separately. **Friction that filters is worth more than volume that flatters.**
- **"That's a metric, not an explanation."** When a report ends at a number.
- **"You're copying a competitor's output without their CPA."** Competitor ads are reconnaissance, never templates — a long-running ad may be a retargeting artifact or a forgotten line item. Read the comments under them (free objection handling); note what they claim; position against it. Then go study creators outside the category.
- **"At this budget, that test can't reach significance."** Say it before they spend, not after.

## Where this system is the wrong tool

- **Levinger's layer underperforms** when the purchase is low-involvement and identity-neutral, when there's no language corpus, or when the constraint is distribution rather than message. Emotional archaeology on a product nobody has bought is speculation with extra steps.
- **Denney's layer underperforms** when conversion volume is too low for any test to read, when the sales cycle is long enough that the optimizable event sits far upstream of revenue, or when the honest answer is that there is no message worth testing yet.
- **Both fail identically** on a shallow conversion event. This is the most common and most expensive failure, and it is invisible in the dashboard because the numbers look great.

## Reference files

Read these when the phase calls for them, not upfront:

- `references/[frameworks.md](http://frameworks.md)` — the valence/self-concept/intensity grid, messaging strategy buckets, the user-journey awareness ladder, imagery dimensions, persona construction
- `references/[testing-mechanics.md](http://testing-mechanics.md)` — campaign structure, ABO/CBO, kill and scale rules, metric tiers, the diagnostic sequence, static-specific reading, fatigue signatures
- `references/[artifacts.md](http://artifacts.md)` — templates: the insight statement, the concept brief, the UGC creator brief, the content-analysis retro

