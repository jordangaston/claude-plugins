# Testing Mechanics

Campaign structure, decision rules, and how to read numbers. Read during Phase 2 and Phase 4.

## Contents

- [Campaign structure](#campaign-structure)

- [Kill and scale rules](#kill-and-scale-rules)

- [The two metric tiers](#the-two-metric-tiers)

- [The diagnostic sequence](#the-diagnostic-sequence)

- [Reading statics](#reading-statics)

- [Fatigue signatures](#fatigue-signatures)

- [Metric definitions](#metric-definitions)

---

## Campaign structure

The modern account is **two campaigns**:

1. A dedicated **creative testing** campaign

2. An **Advantage+ / scaling** campaign

Additional campaigns usually exist only for legacy reasons, separate partners, DPAs, or genuinely distinct products.

**Targeting:** broad. Lookalikes are essentially dead. Few brands rely on interests. Many have dropped standalone retargeting because Advantage+ over-indexes on retargeting audiences early anyway.

**Budget allocation:**

- **ABO for testing** — forces even delivery across concepts, gives clean reads, produces faster results

- **CBO for scaling** — or cost caps at large spend

- **Don't test inside Advantage+ Shopping**

**Per test:** a new ad set, 2–4 variations, broad.

**Testing budget:** roughly 20–30% of total spend.

**Cadence by budget** (from a writeup of a mastermind Denney participated in — directional, not verbatim):

- ~$30K–$100K/month: at least 2 concepts, ~6–12 ads per week

- ~$100K–$250K/month: 3–4 tests per week

- Concurrently: Denney reportedly caps her teams at two concepts

---

## Kill and scale rules

**Kill** at roughly **2× account-average CPA.**

**Decide** at roughly **20–30 conversions** at an acceptable CPA. Do *not* wait for 50.

Denney's position on the learning phase is contrarian and correct: the 50-conversion threshold is "Meta's way of making you spend more." You do not need it to identify a winner.

**Scale:** when 2–3 creatives prove out, raise that ad set's budget within the testing campaign by 50–100% to confirm it holds. Graduate winners to the main campaign roughly two weeks later.

**The arithmetic that governs how many concepts you can run:**

```

concepts = testing_budget ÷ (decision_threshold_conversions × target_CPA × ~2)

```

The 2× multiplier exists because most concepts die well above target CPA before producing any conversions at all. Round down. If the answer is one, you are launching, not testing — say so.

**Statistical honesty.** At small budgets most metric differences are noise. Founders routinely kill winners and scale losers off forty impressions. When a user proposes a test their budget cannot resolve, say so before they spend.

---

## The two metric tiers

Conflating these is the most common analytical error in the field.

### Primary KPIs — these decide money

- Spend

- Results (conversions of the chosen event)

- Cost per result (CPA)

- ROAS

Nothing else determines whether an ad lives or dies.

### Storytelling KPIs — these locate the failure

- CPM

- Hook rate

- Hold rate

- CTR (link, not all-clicks)

- Shares and comments

**Storytelling KPIs are meaningful only relative to your own account.** Never against industry benchmarks. A $50K top spender at a small brand and a six-figure spender at a giant are both winners in context.

**Denney's hard line:** CTR is not a reliable indication that a creative is working.

---

## The diagnostic sequence

Storytelling metrics earn their keep by localizing failure. Read them as a chain, never in isolation.

| Symptom | Diagnosis |

|---|---|

| High hook rate, low hold rate | The opener wrote a check the body couldn't cash. You bought attention you couldn't convert. |

| Good hold rate, low CTR | They watched and didn't care. Offer or CTA problem, not creative. |

| Good CTR, bad CPA | The leak is post-click. Landing page, not the ad. |

| Rising CPM + decaying hold + rising frequency | Fatigue. The ad didn't get worse; the audience saw it. |

| Good everything, bad business | Your conversion event is too shallow. |

**A high hook rate is cheap to game.** A shocking visual or a loud noise buys three seconds and leaks everyone at second five. Prefer the reverse — mediocre hook, excellent hold — because that ad has an audience, it just needs a better door.

---

## Reading statics

The video ladder collapses. No hook rate, no hold rate — there is no three seconds, because a static is parsed in one glance or not at all.

What replaces them:

- **Link CTR** now carries the diagnostic weight that hook + hold carried for video. It is the only real read on whether the creative earned attention.

- **CPM** — same role, same fatigue signal

- **Outbound CPC** — CTR and CPM combined; a useful single-number sanity check

- **Saves and shares** — statics get saved more than video; strong intent signal for considered purchases

Rough Meta anchors: ~1% link CTR is unremarkable, ~2%+ is working. Your account's baseline beats any published benchmark.

**Three things differ from video:**

1. **The CTR→CPA gap is where statics lie.** High CTR with bad CPA usually means curiosity clicks or fat-finger taps, not interest. Video's hold rate pre-qualifies people before they click; a static has no such filter. Read CTR and CPA together or you will scale a thumb-slip.

2. **Fatigue arrives faster.** A static has no second viewing. Once parsed, re-exposure adds nothing. CPM climbs and CTR decays sooner than video at equivalent frequency. Watch frequency alongside CPM.

3. **Diagnosis moves from attention to comprehension.** When a static underperforms, the failure is almost never "not eye-catching enough." It is that the offer wasn't legible in a glance — too many words, headline competing with image, benefit buried. Test at thumbnail size on an actual phone. If the promise doesn't land in one second, no metric will save it.

---

## Fatigue signatures

Watch the *trend*, not the level.

**Classic fatigue:** CPM climbing + hold rate decaying + frequency rising, on an ad that was previously fine.

**Not fatigue:** CPM climbing across the whole account (seasonal auction pressure — Q4, elections, a competitor flooding in).

**Under Andromeda, fatigue arrives faster,** which is the argument for keeping a queue of validated concepts rather than scrambling when the winner dies.

**Refresh plays for a fatigued winner** (iteration, not concept):

- New hooks over the same body

- New thumbnails

- Stills extracted from the video, run as statics

- Ad stacking / compilations

- Recuts with a different opening frame

When tweaks stop working, the position itself is exhausted. Go back to Phase 0 or pull the next concept from the queue.

---

## Metric definitions

**Hook rate** = 3-second video plays ÷ impressions. The percentage who don't scroll past the first three seconds. ~30% is a reasonable Meta ballpark, but establish your own baseline.

**Hold rate** = ThruPlays (or 15s views) ÷ impressions. Did they stay.

**CPM** = (spend ÷ impressions) × 1,000. *Mille* is Latin for thousand. The price of attention, not the price of results. Its diagnostic value: CPM is set by auction competition and by how much the platform likes your ad. Rising CPM on stable creative means either the market got more expensive or the audience is tired.

**CPA** = spend ÷ results. "Acquisition" is whatever *you* define it as, which is where the real decision lives. The same campaign yields wildly different CPAs depending on whether you count email signups, demos booked, or closed customers. Distinguish from **CAC**, which includes sales salaries and everything else — CPA is a media metric, CAC is a business metric.

**CTR (link)** = link clicks ÷ impressions. Use link clicks, not all-clicks, which counts profile taps and image expansions.

**Frequency** = impressions ÷ reach. How many times the average person has seen it.

---

## The conversion event problem

This deserves its own section because it silently invalidates everything above.

Optimize on a **shallow event** (email signup) and the algorithm learns fast, delivers plenty of data, and hands you a pile of low-intent leads at a flattering CPA.

Optimize on a **deep event** (closed customer) and the signal is honest but so sparse the algorithm can't learn — and with a long sales cycle, feedback arrives long after the ad is dead.

**The resolution:** optimize on the deepest event that fires within roughly a week and produces enough volume for the algorithm to work with. Then track the ratio from that event to actual revenue separately, so you know what a booked demo is really worth.

**Consider adding friction deliberately.** A $1 charge, a required résumé upload, a qualifying question. Friction that filters is worth more than volume that flatters. A waitlist email is the shallowest possible signal and will train the algorithm to find people who enjoy signing up for things.