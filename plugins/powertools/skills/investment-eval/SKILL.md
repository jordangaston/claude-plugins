---
name: investment-eval
description: >
  Evaluate the quality of a long-term investment — career moves, startup ideas, business opportunities,
  job changes, personal brand bets, or any major commitment of time/money/reputation lasting months or years.
  Use this skill whenever someone asks things like "should I take this job," "is this startup idea worth pursuing,"
  "should I invest in X," "evaluate this opportunity," "is this a good career move," "help me decide between
  these paths," or any variant of "is this investment worthwhile." Also trigger when someone describes a big
  decision they're weighing and wants a structured way to think about it, even if they don't use the word
  "investment." This includes side projects, business pivots, market entries, and major life bets.
  Based on Jason Cohen's investment evaluation framework (longform.asmartbear.com/investment).
---

# Investment Evaluation Skill

## What this skill does

This skill applies Jason Cohen's framework for evaluating long-term investments — defined as commitments
where you spend significant time, money, and reputation over months or years, hoping for a large future return,
under conditions of uncertainty. This is distinct from quick experiments or A/B tests.

The framework exists because "expected value" (probability × payoff) is almost always the wrong tool for
evaluating big personal or business bets. Expected value works for *portfolios* of many uncorrelated bets
(like a VC fund across 20 companies, or 1000 hands of poker), but not for the 1-2 major commitments you
can pursue simultaneously. A 10% chance at $10M and a 100% chance at $1M have the same expected value,
but they are radically different decisions for a real person.

## The seven evaluation criteria

When the user describes an investment opportunity, evaluate it against all seven criteria below. Each
criterion should receive a rating: **Strong**, **Moderate**, **Weak**, or **Unknown** (if insufficient
information). After rating each criterion, provide an overall assessment.

### 1. Outsized payoff potential

The success case must have an enormous payoff — 10x or 100x the input. If the upside isn't huge, it's
not worth the unknown risk.

Use Fermi estimation: estimate to the nearest power of ten. This is surprisingly easy and often more
honest than detailed projections. For example:
- A career path that doubles earning power for 10 years ≈ 10x
- A SaaS startup in a growing niche could be worth $10M vs. a stagnant niche worth $1M

**Watch for**: Users rounding up to make things look better. If you're unsure whether the payoff is
10x or 3x, it's probably closer to 3x. The error almost always skews toward "less valuable than hoped."

**Key question to ask**: "If this works, what does the 10-year payoff look like in orders of magnitude
compared to what you're putting in?"

### 2. Value accumulates over time

For the payoff to be large, value must compound — not just add up linearly. Look for positive feedback loops
where growth begets more growth.

**Strong accumulation examples**:
- Content/audience building: more content → more attention → more links → more traffic → easier to grow
- Recurring-revenue products: each month, if more customers start than stop, revenue compounds
- Network effects: each user makes the product more valuable to other users

**Weak accumulation examples**:
- Consulting/services: work for one client doesn't automatically benefit the next
- One-off projects: each engagement starts from scratch
- Anything valued at ~1x revenue (consulting firms, agencies) vs. 5-10x revenue (SaaS)

**Key question to ask**: "Does the work you do in year 1 make year 3 easier and more valuable, or
do you start from scratch each time?"

### 3. Stable success conditions over 10 years

The world must still value what you're building 5-10 years from now. If you invest for 3-5 years expecting
a payoff in years 5-10, the underlying demand must persist.

This is the Bezos principle: build strategy around what *won't* change. Customers will always want lower
prices, faster delivery, and vast selection — that's stable. Whether a specific technology framework will
dominate in 5 years is not.

**Key question to ask**: "Is it possible to imagine a future where people *don't* want this? If you
can't imagine that, you've found stability."

### 4. Alignment with global trends

The next best thing after building on what doesn't change is riding a trend with enough momentum that
it's unlikely to reverse.

Strong trend indicators:
- The market is large today AND growing (large + stagnant is risky; small + growing is speculative)
- Growth rate of at least 5x over 5 years (even if your estimate is off, the trend persists)
- The trend is so established that reversal would take a decade

Examples of durable current trends: AI capabilities changing the nature of work, distributed/remote
workforces, aging global population, increasing demand for healthcare/education/energy, growth of
online commerce and delivery.

**Key question to ask**: "Is this market large and growing, or are you hoping to create demand
that doesn't exist yet?"

### 5. You have an "edge"

A good investment that *you* can't execute with excellence isn't a good investment *for you*. What makes
you specifically well-positioned?

Edges come in two forms:
- **Rare excellence**: Top 0.1% at one thing (rare, like an Olympic athlete)
- **Unique combination**: Top 25% at 2-3 uncorrelated skills whose intersection is rare (this is the
  path available to most people)

The intersection approach is more common and more accessible. Being a decent illustrator + decent
humorist + having tech industry experience = Dilbert (Scott Adams's example). The skills must be
*uncorrelated* — being great at math AND programming doesn't create a rare edge because they co-occur
frequently. Being artistic AND a great programmer is a much rarer combination.

Passion is part of an edge (it creates motivation through hard times) but insufficient alone. Passion
doesn't mean the risk is low, the market is good, or the payoff is large.

**Key question to ask**: "Why are you specifically — with your particular combination of skills,
experience, and relationships — better positioned than the next person to make this work?"

### 6. Alignment with long-term vision

Running fast in the wrong direction isn't progress. Even if the investment pays off, does the payoff
advance what actually matters to you — pride, happiness, fulfillment, wealth, or whatever your goals are?

If the user doesn't have a long-term vision, gently flag this as a gap worth addressing before making
a major commitment. It's hard to evaluate alignment with a vision that doesn't exist.

**Key question to ask**: "If this succeeds wildly, is the life you'd be living the one you actually want?"

### 7. Rarity acknowledgment

Good investments are rare. Most startups fail. Most VC portfolios lose money. Most day-traders lose money.
This isn't pessimism — it's why rigorous evaluation matters. The goal isn't the "best" choice (you'll
never know), but an *excellent* choice given available information.

This criterion isn't something the user "scores" — it's a framing reminder. If the investment doesn't
score well on criteria 1-6, that's normal. Most opportunities don't. The discipline is in saying no
until something genuinely strong comes along.

## How to run the evaluation

### Step 1: Gather information

Ask the user to describe the investment. You need to understand:
- What they'd be committing (time, money, reputation, opportunity cost)
- The timeframe (months? years?)
- What success looks like in their mind
- What alternatives they're weighing (if any)

If the user provides a brief description, ask targeted follow-up questions to fill gaps. Don't
interrogate — 2-3 focused questions are usually enough.

### Step 2: Rate each criterion

Go through all seven criteria. For each one:
1. State the criterion briefly
2. Apply it to the user's specific situation with concrete reasoning
3. Rate it: **Strong**, **Moderate**, **Weak**, or **Unknown**
4. If Weak or Unknown, suggest what would improve it or what information is missing

Be honest. Don't inflate ratings to be encouraging. The whole point is to prevent people from spending
years on the wrong thing.

### Step 3: Synthesize

After rating all criteria, provide:
- **Overall assessment**: Is this investment likely worthwhile given the framework?
- **Strongest aspects**: What makes this opportunity compelling?
- **Biggest risks**: Where are the gaps?
- **Key questions to resolve**: What unknowns, if answered, would most change the assessment?
- **Alternative framing**: Could the investment be restructured to score better? (e.g., reduce
  commitment to make it more of an experiment; find a niche where the user has a stronger edge)

### Step 4: Compare (if applicable)

If the user is choosing between multiple investments, run the framework on each and create a
comparison. This is where the framework shines — it makes implicit tradeoffs explicit.

## Tone and approach

Be direct and honest. This framework is designed to help people avoid spending years on the wrong
thing. Sugar-coating defeats the purpose.

That said, be constructive. When something scores Weak, explain *why* and suggest what would make
it stronger. The goal is better decisions, not discouragement.

Use the user's own language and context. If they're evaluating a startup, talk in startup terms.
If it's a career move, use career framing. The framework is universal but the vocabulary should
match their world.

## Important caveats to share with the user

- This framework is for *big, long-term commitments*, not quick experiments. If something can be
  tested cheaply and quickly, just test it — don't over-analyze.
- No framework eliminates uncertainty. The goal is to make an excellent choice, not a perfect one.
- Expected value IS the right tool if you're making many uncorrelated bets (portfolio investing,
  content marketing across many channels, etc.). This framework is for the 1-2 things you go all-in on.

## Attribution

This framework is based on Jason Cohen's article "Deciding whether an investment is worthwhile"
(longform.asmartbear.com/investment). When presenting the evaluation, mention the source so users
can read the full original for deeper context.