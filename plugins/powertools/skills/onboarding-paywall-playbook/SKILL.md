---
name: onboarding-paywall-playbook
description: Design, audit or diagnose a consumer subscription app's onboarding flow, paywall, pricing and funnel metrics using the Cal AI paywall-first playbook.
---

# Onboarding & Paywall Playbook

Source: Jake Castillo's "Ultimate Paywall & Onboarding Playbook" (Cal AI, 100+ paywall A/B tests). Use this skill when designing a new app's onboarding/paywall, auditing an existing flow, diagnosing a weak funnel, or setting pricing and trial strategy for a consumer subscription app.

## Core thesis

- Influencers/ads get people to the store; onboarding + paywall are the machine that actually collects the money.
- Two kinds of PMF: people download it vs. people PAY for it. Only the second is a business. Growing a free app at $20 CAC and $5 LTV is a money pit.
- RevenueCat data cited: hard-paywall apps convert trial→paid ~10.7% vs ~2.1% for freemium.

## 1. Build order (paywall-first)

Most founders build: fancy UI → features → free trials → onboarding → paywall. Reverse it:

1. Paywall
2. Onboarding
3. Product features
4. In-app experience

The paywall is the lie detector for whether anyone will pay; validate it before polishing product.

## 2. Friction is context-dependent

- Friction is bad when someone is trying to USE the product.
- Friction is an asset when someone is deciding whether to BUY it.

Every onboarding step should do at least one of:
- Learn something used to personalize their plan
- Make the user invest effort (leaving now feels like losing something)
- Re-surface their pain and connect it to the product as the fix

## 3. Match onboarding length to pain

Onboarding length is a function of how much pain the app solves, not a design preference.

**Low-pain apps** (productivity, utilities, nice-to-haves): run a SHORT onboarding. User is curious, not desperate; each extra screen taxes thin motivation. Jobs: get them through fast, show value to THEM immediately, give one clear reason to stay.

**High-pain apps** (weight, money, addiction, dating — anything they've failed at before): run a LONGER onboarding that agitates and connects:
- Remind them why they're here
- Make the pain specific again
- Ask specific questions that prove you understand their situation
- Show their numbers, timeline and projected result
- Tie your mechanism so directly to their problem that by the paywall the app is the obvious answer

Cal AI example: calorie tracking is tedious and most people have quit it before → onboarding made that pain vivid, then framed "snap a photo" as the escape. Emotional target: the body you want, as easy as taking a picture. Pain agitated → solution connected → paywall friction removed.

Warning: copying a 30-screen flow onto a low-pain app is a fast route to the graveyard.

## 4. Onboarding anatomy (the sequence)

1. **Promise screen** — one dream outcome in the user's words, not features.
2. **Demo** — magic moment within ~10 seconds (Cal AI: point camera at food → calories). If they don't get it instantly, nothing after matters.
3. **Questions** — goals, current state, habits, constraints. Every answer either personalizes the plan or deepens investment. No filler.
4. **Felt progress** — step indicators, small confirmations; feels finite and building toward something.
5. **Mid-flow review ask** — rating prompt BEFORE the paywall, right after a moment of delight, to build store social proof. Timing is critical; wrong moment kills momentum. (Check current App Store rules — see §9.)
6. **Personalized plan reveal** — the aha: their numbers, timeline, plan. Leaving now means abandoning THEIR plan.
7. **Paywall** — restate their goal in the offer; 2–3 pricing options max, anchored on annual. Make the value of paying obvious and the cost of leaving concrete.

Rule across all screens: each one either teaches you about the user or teaches the user about their problem. Cut everything else.

## 5. Free trials

If you can't get someone to pay right away, a trial won't save you. The real problem is one of:
- No "wow" moment within ~10 seconds of learning about the app
- No unique mechanism (it's like the others)
- Wrong audience

Data points: ~84% of 3-day trial cancellations happen by end of day one — people decide almost immediately. Trials mostly produce false viability signals. With paid ads, 7-day trials make attribution hard: you pay Meta today and learn cohort quality a week later. Longer trial = noisier data.

Rule: no free trial until you've proven people pay out of the gate. Trials are an optimization you earn, not a crutch.

## 6. Benchmarks (diagnose weekly)

| Metric | Target | If below → problem is |
|---|---|---|
| View-to-download | 5 per 1,000 views | Content / positioning (or nobody wants it) |
| Paywall rate (openers who reach paywall) | 75%+ | Onboarding |
| Paywall conversion (viewers who pay) | 10% | Offer |

Hit all three consistently = on track. Miss one = you know exactly which part to fix. Always name which of the three is broken before proposing changes.

## 7. Pricing

- **Price for mindshare, not margin.** Cheap enough → impulse buy → habit → default choice. Margins can be fixed later; being the app nobody chose can't.
- **Skip lifetime deals.** Legal headaches, complicate acquisition, rarely beat a well-priced annual.
- **Mind the cashflow gap.** Meta CAC under ~$30 is hard, and $30 is often the whole annual price. "Breaking even" usually means paying Meta today and collecting over months — cash flow is king; model it explicitly.

## 8. Test relentlessly

Test ~10x more than feels reasonable. Treat the paywall like the product: ship, measure, improve tomorrow. Weeks spent debating paywall design = already lost. The first paywall will be wrong; winners test, fail fast and fix faster.

## 9. Platform risk (don't rent your revenue)

Apple takes a cut of every App Store transaction and keeps tightening rules. Already enforced against: free-trial toggles on paywalls, discount offers after the onboarding paywall, and rating requests during onboarding. When you don't own the distribution channel, plan around rule changes (e.g., evaluate web checkout / web-to-app funnels where permitted). Before recommending any tactic in this playbook, check current App Store / Play guidelines.

## How to apply this skill

**Designing a new flow:**
1. Classify the app as low-pain or high-pain; state why.
2. Write the promise in the user's language and identify the ≤10-second magic moment.
3. Draft the screen sequence (§4), justifying each screen as "learns about user" or "teaches user about problem."
4. Draft the paywall: goal restated, 2–3 plans, annual anchor, no trial unless already earned.
5. Propose a first test plan and the three benchmarks to track.

**Auditing an existing flow (screenshots, Figma, or description):**
- Go screen by screen; flag filler, missing personalization, late magic moment, weak plan reveal, too many price options, compliance risks.
- Check length against pain level.

**Diagnosing a funnel (numbers given):**
- Compute the three benchmark ratios, identify the broken stage, and propose 3–5 testable hypotheses for that stage only.
- Run the cashflow math: CAC vs. first-payment revenue vs. payback period.

Output should be concrete (actual screen copy, actual price points, actual test variants), not generic advice.
