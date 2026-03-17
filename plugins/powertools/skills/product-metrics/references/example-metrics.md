# Example Metrics by Product Type

Use these as starting points when helping users populate their value-chain grid. These are not prescriptive — adapt to the user's specific product and stage.

## B2B SaaS

| | Leading | Work (Immediate) | Lagging |
|---|---|---|---|
| **Hidden** | Error rate trends, dependency vulnerabilities | Deploy frequency, incident MTTR, test coverage | Platform reliability (uptime), engineering velocity |
| **External** | Trial signups, demo requests, support ticket themes | Feature releases, UX improvements, onboarding completion rate | DAU/MAU, feature adoption, CSAT, time-to-value |
| **Strategic** | Competitive feature gaps, market expansion signals | Integration launches, API adoption, partner enablement | Net revenue retention (NRR), NPS, logo retention, expansion revenue |

Typical maximizers: NRR, feature adoption, time-to-value, trial→paid conversion
Typical satisficers: Uptime (SLO-based), P1 bug count, page load time, deploy frequency

## Consumer / PLG App

| | Leading | Work (Immediate) | Lagging |
|---|---|---|---|
| **Hidden** | App store ranking trends, organic search volume | Performance optimization, crash rate reduction | App stability score, infrastructure cost per user |
| **External** | App downloads, signup rate, referral link clicks | Onboarding completion, first-value-moment rate | D1/D7/D30 retention, WAU/MAU, session frequency |
| **Strategic** | Competitor app store reviews, market sentiment | Viral features, sharing mechanics, community features | Organic growth rate, LTV/CAC ratio, word-of-mouth referrals |

Typical maximizers: D7 retention, activation rate, organic growth
Typical satisficers: Crash rate, app load time, customer support response time

## Marketplace / Platform

| | Leading | Work (Immediate) | Lagging |
|---|---|---|---|
| **Hidden** | Fraud signal volume, trust & safety queue depth | Search relevance improvements, matching algorithm updates | Platform match rate, time-to-match |
| **External** | Supply-side signups, demand-side queries | Listing quality score, transaction completion rate | GMV, take rate, repeat transaction rate, NPS (both sides) |
| **Strategic** | Category expansion opportunities, supply concentration risk | New category launches, cross-side features | Network effects strength, supplier/buyer retention, market share |

Typical maximizers: Liquidity (match rate), repeat rate, GMV growth
Typical satisficers: Fraud rate, dispute resolution time, platform latency

## AI / API Product

| | Leading | Work (Immediate) | Lagging |
|---|---|---|---|
| **Hidden** | Model drift detection, infrastructure cost trends | Model retraining frequency, latency optimization | Accuracy/F1 over time, cost per inference |
| **External** | API signups, documentation page views, sandbox usage | API call success rate, median response time, SDK releases | API call volume growth, developer activation, integration count |
| **Strategic** | Competitive model benchmarks, regulation signals | Enterprise features, compliance certifications | Revenue per customer, usage expansion rate, platform lock-in |

Typical maximizers: Developer activation, usage expansion, API call volume growth
Typical satisficers: Latency p99, error rate, model accuracy

## E-Commerce / DTC

| | Leading | Work (Immediate) | Lagging |
|---|---|---|---|
| **Hidden** | Inventory forecasting signals, fulfillment capacity | Site speed, checkout flow optimization, search relevance | Cart abandonment rate, fulfillment error rate |
| **External** | Site traffic, email open rates, ad click-through | Add-to-cart rate, checkout conversion, AOV | Revenue, repeat purchase rate, customer lifetime value |
| **Strategic** | Brand sentiment, competitor pricing, market trends | Loyalty program engagement, personalization improvements | Brand NPS, organic traffic share, customer acquisition cost |

Typical maximizers: Conversion rate, repeat purchase rate, LTV
Typical satisficers: Site uptime, fulfillment speed, return rate

## Stage-Specific Guidance

**Pre-launch / MVP:**
Focus almost entirely on leading indicators and immediate work metrics. You don't have enough lagging data yet. Key question: "Are people signing up and completing onboarding?" Track activation and early engagement signals.

**Early traction (0-100 customers):**
Shift toward external lagging indicators, especially retention. Revenue matters but sample size is too small for reliable trends. Key question: "Are people coming back?" Track cohort retention curves.

**Growth (100-1000+ customers):**
Full framework applies. Balance all cells. Revenue and retention trends become statistically meaningful. Key question: "Is growth efficient and sustainable?" Track unit economics (LTV/CAC) alongside growth rate.

**Scale / Mature:**
Strategic metrics become most important. Efficiency and expansion dominate. Key question: "Are customers succeeding and expanding?" Track NRR, advocacy, and customer success outcomes.