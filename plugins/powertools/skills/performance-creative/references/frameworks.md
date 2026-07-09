# Frameworks

The conceptual apparatus. Read this during Phase 0 and Phase 1.

## Contents

- [The self-concept model](#the-self-concept-model)

- [The valence + intensity grid](#the-valence--intensity-grid)

- [Messaging strategy buckets](#messaging-strategy-buckets)

- [The awareness ladder](#the-awareness-ladder)

- [Imagery dimensions](#imagery-dimensions)

- [Building behavioral personas](#building-behavioral-personas)

- [Mining prompts](#mining-prompts)

---

## The self-concept model

Drawn from Higgins's self-discrepancy theory (1987) — the most empirically grounded piece of the Levinger apparatus.

Three selves, and the *gaps between them* generate distinct emotions:

| Self | Definition | Gap produces | Emotional register |

|---|---|---|---|

| **Actual** | Who they believe they are now | — | Recognition, validation |

| **Ideal** | Who they aspire to be | Dejection | Sadness, disappointment, unfulfillment |

| **Ought** | Who they believe they *should* be | Agitation | Anxiety, guilt, shame, dread |

**Why this matters operationally.** Ought-Self ads and Ideal-Self ads *feel* similar in a brief and perform completely differently. "The career you meant to have" (Ideal) and "you should have a job by now" (Ought) address the same person about the same product and activate different emotional systems.

Ought-Self shame is stickier and hooks harder. Ideal-Self aspiration scales further and burns out slower. Negative-Ought is where most DTC lives because it converts; it is also where most brands get trapped.

**A worked example.** A deodorant ad showing a yellowed pit stain is Ought-Self, negative valence, high intensity. The stain isn't persuasion — it's *evidence*. Recognition precedes evaluation: you have seen yourself before the skeptical apparatus boots up. That's why it works, and why a beautifully lit, color-graded pit stain would fail. Polish reads as advertising and gets filtered.

---

## The valence + intensity grid

Three independent axes. Plot every existing ad; find the empty cells.

**Axis 1 — Valence zone** (emotional charge)

|  | Positive | Negative |

|---|---|---|

| **High intensity** | Triumph, joy, relief | Shame, fear, disgust, anger |

| **Low intensity** | Calm, ease, belonging | Mild irritation, fatigue, resignation |

**Axis 2 — Self-concept anchor:** Actual / Ideal / Ought

**Axis 3 — Language intensity:**

- **Low** — organic-feeling, trust-building, reads like a person. Builds "trust equity."

- **High** — direct response, urgency, explicit ask.

24 cells. Most accounts occupy one or two. The diagnostic question is not "are our ads good?" but **"how many cells do we occupy?"**

**Why the algorithm cares.** Meta's retrieval layer clusters psychologically and visually similar creative, picks one, spends into it, and suppresses the rest. Occupying one cell with forty ads means buying one ad forty times. Genuine variance is what makes forty ads into forty ads.

---

## Messaging strategy buckets

Denney's taxonomy for the *Messaging* dimension of content analysis. Use it to generate concepts and to classify winners.

**Human desires** — romance, social connection, tranquility, power

**Demographics** — age, role, hobbies, job

**Strategy angles** — celebrity, negative marketing, taboo, personal history

**User journey** — see the awareness ladder below

When analyzing a winner, name which bucket it drew from. When generating concepts, deliberately draw from buckets you haven't used.

---

## The awareness ladder

Where the customer sits when the ad finds them:

**Unaware → Problem Aware → Solution Aware → Product Aware → Most Aware**

The tradeoff to memorize:

- **Unaware is the most scalable.** Largest audience, hardest conversion, longest payback.

- **Most Aware is the most likely to convert.** Smallest audience, cheapest conversion, fastest ceiling.

Where you fish determines both your ceiling and your close rate. A brand that only runs Most-Aware creative has a great ROAS and no growth. A brand that only runs Unaware creative has beautiful CPMs and no revenue.

Concepts should span the ladder deliberately, not accidentally.

---

## Imagery dimensions

The *Imagery* axis of content analysis:

- **Production quality** — polished vs. ugly/native. Ugly slips the "this is an ad" filter.

- **Setting** — where it happens; whether it looks like the customer's life

- **Color and movement play** — visual differentiation; what makes it distinct in-feed

- **POV and shot angle** — first-person vs. observed. These are *different psychological events*: private experience vs. social exposure.

That last one is the subtle one. "You see the stain" and "someone else sees the stain" are not two images for one angle. They are two angles.

---

## Building behavioral personas

A persona is not a demographic. "Job seeker, 25–40, urban" describes a census tract. It cannot generate creative.

A behavioral persona names:

1. **The belief** they hold about themselves

2. **The emotion** that belief produces

3. **The behavior** the emotion drives

4. **The language** they use, verbatim, from your corpus

Chain: **belief → emotion → behavior.** Behavioral data alone (clicks, purchases) tells you *what* happened, never *why*. The why lives in language.

**Test:** can a creator read this persona and know how to *be* that person on camera? If not, it's a segment, not a persona.

**Persona is now structural.** Meta's Andromeda groups ads into personas. Every creative must be mapped to an intended audience before launch — an unmapped ad is delivering against an audience nobody chose. When tooling is absent, build persona ecosystems directly from customer reviews.

---

## Mining prompts

For working through a language corpus (reviews, tickets, Reddit threads) with an LLM:

**Surfacing outliers — the highest-value prompt:**

&gt; "Read these reviews. Tell me what's *weird* — the phrases that don't sound like the others, the emotional notes that seem out of proportion to the product. Don't summarize. Don't tell me what's common. Tell me what you see, not what you think."

The "what you see, not what you think" clause counters projection bias — the model's tendency to reflect the marketer's framing back rather than report the corpus.

**Extracting self-adopted terms:**

&gt; "List every phrase where a customer describes *themselves* or their situation, in their own words. Verbatim. Don't paraphrase and don't clean up the grammar."

**Finding the objection:**

&gt; "What are the top three reasons someone in this thread gives for *not* buying, or for regretting the purchase?"

**The skeptic-to-superfan pattern:**

&gt; "Find reviews that describe initial skepticism followed by conversion. What specifically changed their mind?"

These become your objection-handling ads, which are often the best-performing concepts, because they lead with the reader's own resistance.

**Interviews, if you can get them:** ask *"tell me a story about the last time..."* not *"would you buy..."* Stated preference is worthless; recalled behavior is data.