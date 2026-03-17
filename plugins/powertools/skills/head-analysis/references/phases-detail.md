# HEAD Analysis — Detailed Phase Guidance

This reference expands on each phase with worked examples, common mistakes, and facilitation notes for both interactive and autonomous modes.

---

## Phase 1: Think Backward — Decision Context

### The Core Shift

Most analysts start with "What do I know?" HEAD starts with "Who am I serving and what do they need to decide?" This single reframe changes everything downstream.

### What to Capture

| Element | Good Example | Bad Example |
|---------|-------------|-------------|
| Decision maker | "CTO deciding whether to invest engineering resources in Platform A vs. B for next quarter" | "Leadership needs to know about platforms" |
| Decision | "Allocate 4 engineers to one platform for 3 months" | "Choose a platform" |
| Context gap | "CTO understands current tech but not competitive landscape or customer switching costs" | "They need more info" |
| Constraints | "Decision needed by March 1; budget fixed; team has no experience with Platform B" | "Soon" |

### Common Mistakes
- **Analyst-as-advocate:** The analyst gets excited about one option and frames the context to push the decision maker toward it. Stay neutral. Your job is to illuminate, not persuade.
- **Vague decision maker:** "The board" or "management" is too vague. Who specifically will read this and act? What's their background? What do they already know?
- **Missing constraints:** Every real decision has constraints. If you haven't identified any, you haven't thought hard enough about the decision context.

### Facilitation (Interactive Mode)

Ask these questions in order:
1. "Who specifically will use this analysis to make a decision?"
2. "What exactly will they decide — what are the options on the table?"
3. "What do they already understand about this topic?"
4. "What DON'T they know that they'd need to know?"
5. "What constraints are they operating under — time, money, politics, prior commitments?"

If the user gives vague answers, don't accept them. Push: "If I put your answer on a slide for this person, would they say 'yes, that's exactly my situation'?"

---

## Phase 2: Craft the Key Question

### The Call Mom Test

Compress your question to one sentence. Then answer it using language simple enough for a non-specialist parent on the phone. Limit your answer to three written lines.

**Example:**
- Draft question: "What is the likelihood that the competitive dynamics in the enterprise AI platform market will shift in favor of open-source solutions over proprietary ones within the next 18 months, given current adoption trends, regulatory environment, and cost pressures?"
- Call Mom version: "Will companies switch from paid AI tools to free ones soon?"
- Three-line answer: "Probably not most of them, not soon. The free tools are getting better fast, but switching is expensive and risky for big companies. The paid tools still have better support and security, which matters a lot to enterprises."

If you can't compress it, your thinking is muddled. The compression itself is a thinking tool.

### The Thinking Game

Pick the question you're analyzing. Notice your immediate gut reaction. Now press yourself:
1. Why do I believe that? What's my evidence?
2. What would have to be true for the opposite to be correct?
3. Keep asking questions until you feel frustrated — that's where discovery starts.

### Why No Yes/No Questions

Yes/no questions create false certainty. They pressure experts into definitive answers when uncertainty is the honest response. Compare:
- Bad: "Is China a nuclear threat?" (Forces yes/no, hides nuance)
- Good: "How does China's nuclear capability compare to other regional actors, and what factors would change the trajectory?" (Forces comparative, nuanced answer)

### Facilitation (Interactive Mode)

1. Ask the user to state their question
2. Apply Call Mom test together — can they compress it?
3. Check: Is it comparative/scalar or yes/no? Convert if needed.
4. Check: Does it serve the decision maker from Phase 1, or the analyst's curiosity?

---

## Phase 3: Identify Key Drivers

### What Drivers Are (and Aren't)

Drivers are **categories for sorting data**, not conclusions or predictions. Think of them as laundry bins — you decide the bins before you start sorting.

**Good drivers for "Which car should I buy?":**
Cost, Reliability, Safety, Fuel Efficiency, Comfort, Resale Value, Size/Practicality

**Bad "drivers" (these are conclusions, not categories):**
"Honda is reliable," "Electric is cheaper long-term," "SUVs are safer"

### The 6–10 Rule

Fewer than 6 drivers and you're oversimplifying. More than 10 and you're overcomplicating. Most real analyses land at 7–8.

If you're over 10, ask: "Can any of these be combined?" Often two drivers are really sub-categories of one driver.

If you're under 6, ask: "What would someone from a completely different background add?" A financial analyst, a customer, a regulator, an engineer — they'd each add different lenses.

### The Expertise Trap

Experts in one field explain everything through their lens. An economist sees every problem as a market problem. A security expert sees every problem as a threat problem. This is the "hedgehog" trap.

Counter it deliberately:
- After generating your drivers, ask: "What field are most of these from?"
- Add at least one driver from an adjacent or unrelated field
- Include at least one driver a newcomer would suggest

### Facilitation (Interactive Mode)

1. Ask: "If you had to sort all the relevant information into 6–10 buckets, what would those buckets be?"
2. List what they give you. Check for overlaps. Consolidate.
3. Check the count — push toward 6–10.
4. Ask: "What would someone outside your field add to this list?"
5. Ask: "Which of these drivers would ANY analyst working on this problem include?" Remove any that are idiosyncratic.

---

## Phase 4: Define Metrics

### Why Metrics Before Data

Defining metrics after seeing the data lets you unconsciously pick metrics that confirm what you already believe. This is one of the most common and insidious analytical failures.

### Types of Metrics

| Type | Example | When to Use |
|------|---------|-------------|
| Quantitative | "Revenue growth rate over 3 years" | When data exists and is reliable |
| Qualitative scale | "Low/Medium/High with defined criteria" | When judgment is required |
| Comparative | "Better/worse than the top 3 competitors on X" | When relative position matters more than absolute |
| Threshold | "Above/below regulatory requirement Y" | When there's a clear pass/fail line |

### Defining Qualitative Scales

Vague scales are useless. Define what each level means:
- **Low disruption risk:** Fewer than 5% of customers affected, recovery in under 1 week, no regulatory consequences
- **Medium disruption risk:** 5–20% of customers affected, recovery in 1–4 weeks, potential regulatory inquiry
- **High disruption risk:** More than 20% of customers affected, recovery over 1 month, likely regulatory action

### Facilitation (Interactive Mode)

For each driver, ask:
1. "How would we know if this driver looks good or bad?"
2. "What specifically would we measure?"
3. "If I showed you the number/rating, at what point would you say 'that's concerning'?"

---

## Phase 5: Sort Data and Assess Confidence

### The Green/Yellow/Red System

This is an honesty mechanism. Your impulse will be to mark more drivers green than warranted. Resist it.

**Calibration guidance:**
- In a typical analysis, 1–2 drivers should be green, 4–6 should be yellow, and 1–3 should be red. If your distribution doesn't look like this, scrutinize your green ratings.
- Green means you'd bet your professional reputation on this assessment. Are you really that sure?
- Yellow is not a failure. Yellow is honest. Yellow means "I have a reasonable read on this but could be wrong."
- Red is also not a failure. Red means "I need more information before I can assess this meaningfully." That's valuable knowledge.

### Capability vs. Intent

This is the single most important distinction in intelligence analysis, and it applies broadly:
- **Capability** (what someone CAN do): Observable, measurable. You can count nuclear scientists, measure factory output, read patent filings. Usually assessable.
- **Intent** (what someone PLANS to do): Internal, changeable, often deliberately hidden. Almost never reliably assessable.

Never code intent green. Ever. Even if a leader has publicly stated their intent, they can change their mind tomorrow. Intent is yellow at best.

### Facilitation (Interactive Mode)

Walk through each driver:
1. "What evidence do we have for this driver?"
2. "How confident are you — green, yellow, or red?"
3. If they say green: "What would change your mind? How recent is this evidence? Is there a plausible scenario where this assessment is wrong?"
4. If they say green again after pushback, accept it. But note the pushback in the analysis.

---

## Phase 6: Gap Analysis

### Three Types of Gaps

1. **Data that doesn't fit any driver:** This is either noise or a signal that you need a new driver. Don't ignore it — categorize it explicitly as noise (with reasoning) or create a new driver.

2. **Weak drivers:** Red and weak-yellow drivers represent known unknowns. For each, ask: "What single piece of information would most improve our confidence here?"

3. **Explained-away anomalies:** This is the most dangerous gap. When data contradicts your framework, the temptation is to explain why the data is wrong or irrelevant. Instead, create an explanation that accounts for the anomaly. If your framework can't accommodate it, the framework may be wrong.

### The "What Would Make Me Wrong?" Test

For your overall conclusion (or emerging conclusion), ask: "What would have to be true for the opposite conclusion to be correct?" If you can't answer this, your analysis isn't rigorous enough.

### Facilitation (Interactive Mode)

1. "What piece of data nagged at you but didn't fit neatly into our analysis?"
2. "Which drivers are you least confident about? What would you need to feel better?"
3. "If your conclusion is wrong, what's the most likely reason?"

---

## Phase 7: Red Team Analysis

### What Red Teaming Is NOT

It's NOT devil's advocacy. Devil's advocacy is easy — anyone can argue the opposite. It's also not useful because it doesn't produce genuine alternative perspectives.

### What Red Teaming IS

A fresh analytical pass using the **same HEAD process** (same question, same drivers, same constraints) but with different assumptions or weightings. The red team should produce an analysis that is genuinely defensible, not a strawman.

### How to Red Team Solo

If you don't have a literal second team, you can still red team by:
1. Taking the 2-3 drivers you weighted most heavily and asking "What if these drivers are less important than I think?"
2. Taking your red-coded drivers and asking "What if these are actually the most important factors?"
3. Identifying the assumption your conclusion most depends on and asking "What if this assumption is wrong?"
4. Imagining an expert from a different field analyzing the same problem — what would they emphasize?

### Verbal Cue Detection

Listen for (or notice in yourself) language that signals over-attachment:
- "My position" / "my argument" — positions and arguments belong to the analysis, not the analyst
- "I've already shown that..." — implies the analysis is settled, not open
- Defending against the alternative as "wrong" rather than engaging with it as "possible"
- Emotional language about the conclusion

### Facilitation (Interactive Mode)

1. "Argue the strongest case for the opposite of your conclusion."
2. If they struggle: help them construct it. "What if Driver X is actually the most important one? What if the data on Driver Y is misleading?"
3. "Where do the primary analysis and this alternative agree?" (Agreement zones = higher confidence)
4. "Where do they disagree?" (Disagreement zones = genuine uncertainty, flag explicitly)

---

## Phase 8: Trap Scan

Read `references/cognitive-traps.md` for the full catalog of traps with detection patterns and mitigations.

### Minimum Scan (Always Do These)

1. **Narrative coherence:** Is the analysis suspiciously clean? Real situations are messy. A perfectly coherent story probably hides gaps.
2. **Confirmation bias:** Did you actively seek evidence that contradicts your conclusion?
3. **Anchoring:** Was your conclusion significantly influenced by the first piece of data or the most prominent data point?
4. **Availability bias:** Are you overweighting information you encountered recently?
5. **Capability/intent confusion:** Did you treat anyone's stated intentions as reliable fact?

### Facilitation (Interactive Mode)

For each trap, give a concrete example from the analysis: "In our analysis, the anchoring trap might apply because we started with [X data point] and our conclusion tracks closely with it. Is it possible that early data point is disproportionately shaping our conclusion?"