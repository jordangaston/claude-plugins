# Persona Research

Running the two-way analysis. Read during Phase 1.

## Contents

- [Why two analyses](#why-two-analyses)

- [Analysis A: who your ads target](#analysis-a-who-your-ads-target)

- [Analysis B: who actually buys](#analysis-b-who-actually-buys)

- [The dual ranking](#the-dual-ranking)

- [The trigger-based segment document](#the-trigger-based-segment-document)

- [Reading an ad library](#reading-an-ad-library)

- [When the brand has no customers yet](#when-the-brand-has-no-customers-yet)

- [Verifying the AI](#verifying-the-ai)

---

## Why two analyses

Meta's Andromeda ranks and retrieves ads by persona. So the personas your creative *implies* are functionally your targeting, whether or not you chose them.

Meanwhile, the personas actually buying are a fact about the business.

**These are usually different, and the gap is the strategy.** Run both before writing a single brief.

---

## Analysis A: who your ads target

Works on any brand with a public ad library — yours, a prospect's, a competitor's.

**Prompt:**

&gt; Analyze this brand's ad library: [link]

&gt;

&gt; Give me:

&gt; 1. An overview snapshot — how many video ads, static ads, and partnership ads are currently live

&gt; 2. A format breakdown

&gt; 3. **Who do they appear to be targeting as personas, from the POV of their ads only?** Break this into primary personas and secondary personas.

&gt; 4. A deep dive on the top ads by impressions, including the creative hook strategies they use

&gt; 5. Creator profile patterns — who are the creators they work with, and what do they have in common?

**What you get:** a high-level anchor before you've even touched the ad account. Useful in audits, useful in pitch meetings, useful when you're just nosy.

**The tool-agnostic point:** the analysis matters, not the tool. Faster tools exist (Motion's Intended Audience tagging gives a quick gut check on delivery). The strategist's job is to go deeper than the tag.

---

## Analysis B: who actually buys

**Input:** a CSV of customer reviews. (If the client can't produce one, scrape it from the site.)

**Prompt:**

&gt; Here are our customer reviews. Extract **five core personas.** Give each a name that fits the trigger or their main problem.

&gt;

&gt; For each persona, give me:

&gt; - The trigger — the problem or event that put them in their current state

&gt; - Their core story

&gt; - Demographic data (gender, age)

&gt; - Their core desires and what they actually care about

&gt; - **The specific review signals that led you to this persona** — quote them verbatim

&gt;

&gt; Then rank the personas twice:

&gt; 1. By **volume** — which show up most often in the reviews

&gt; 2. By **emotional intensity** — which show the most emotion in their language

Naming personas by **trigger**, not demographic, is the whole trick. "The Comfort Craver" and "The Fullness Chaser" tell a creator how to be that person. "Women 25–40" does not.

---

## The dual ranking

The single highest-value instruction in the prompt above, and the one people skip.

**Volume ranking** tells you who is buying most.

**Emotional intensity ranking** tells you who cares most.

**When a persona ranks low on volume but high on emotional intensity, that is an opportunity.** A small audience speaking with heat is an audience nobody has addressed. The heat is unmet demand.

**A practical implication:** when you're pressure-testing a high-emotional-intensity insight, spend the money on a creator. Statics are cheaper, but a creator is meaningfully better at carrying emotion across the finish line. The intensity is the thing being tested; don't test it with the medium least able to transmit it.

---

## The trigger-based segment document

The shareable artifact. Deeper than an AI-generated slide, built for a team to work from.

```markdown

# Audience Segment: [Trigger-based name]

## Trigger

[The problem or life event that put them in their current state.]

## Core story

[One or two sentences. "Body odor suddenly started happening after a

life event or hormonal shift."]

## Demographics

- Gender:

- Age range:

- Anything else the reviews actually support

## Core desires

[What they care about. Not what the product does.]

## Objections

[What they're waiting for you to answer.]

## Their vocabulary

[Verbatim phrases. Do not clean up the grammar.]

## Review signals

[The specific reviews that produced this segment. Quoted. This is how

you and everyone else verifies the segment is real.]

```

That last section is not optional. It is the audit trail.

---

## Reading an ad library

Two mechanics worth knowing, because they let you infer performance from public data.

**Impression ranking.** Sort ad creatives by impressions, highest to lowest. The top two rows are, in practice, what's actually performing — they're getting the most spend and the most eyeballs. (Some brands run reach campaigns to poison this signal. Most don't.)

**Partnership ad share.** Count partnership ads as a percentage of total, and check where the highest-ranking partnership ad sits in the impression ranking. A large brand with 15% partnership ads and its best partner ad sitting at #24 has an obvious, unexploited lane.

**What to look for:**

- Which hook strategies appear in the top ads by impressions?

- Are those strategies being used in partnership ads, or only in brand-owned creative?

- Are all the creators the same type? (All fitness creators, all one age bracket.)

- EGC — is there a single employee-generated-content face carrying everything? Sometimes one individual is better. Sometimes it's a ceiling.

---

## When the brand has no customers yet

You can't analyze reviews you don't have, and you can't analyze creative you haven't made.

**The workaround:** identify a few competitors or similar brands in the market, and run the persona SOP through *their* reviews — but **filter through the lens of where they are failing.**

Concentrate on the **three-, two-, and one-star reviews.** Not the five-star cheerleaders. The gap in the market is described in detail by people who are disappointed in the incumbent.

Build from there: competitor failure modes → hypothesized personas → real feedback once you're live → performance data.

**Say this plainly to the user:** there is no SOP that produces winners every time. You form a hypothesis, you pressure-test it, and a lot of it is testing. Accept that as part of the process rather than looking for a system that removes it.

---

## Verifying the AI

Two habits, both non-negotiable.

**Demand review signals.** Whatever model you use, make it prove why it created each persona by quoting the reviews. Then check them. This is how you catch fabrication.

**Do the first pass manually.** The single best defense against AI nonsense is having done a reputation analysis yourself — actually watching how people interact with this market in real time. Without that baseline, you cannot tell when the output is garbage, and it frequently is.

Use AI for what it's genuinely good at: mass data sets, review mining, persona extraction, briefing throughput. Build a per-client project loaded with context documents, past performance, and persona research, and localize briefing and hook-building inside it.

Refusing AI entirely is arguably worse than over-relying on it, because it denies you the skills the next era requires. But the manual pass is the cheat code.