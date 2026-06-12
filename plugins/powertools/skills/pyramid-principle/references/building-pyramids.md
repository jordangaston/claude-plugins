# Building the Pyramid: Procedures + Worked Example

Two procedures, depending on whether you already know your answer.

## Top-down (use when you know the answer)

Work from the apex outward. This is faster and produces cleaner structure.

1. **Name the subject.** What is this document about?
2. **Identify the Question** the reader has about that subject. (What decision, what worry, what "what do I do?")
3. **State the Answer.** One sentence. This is your apex.
4. **Set up the introduction.** Find the Situation (agreed context) and Complication (what changed) that make the Question live for the reader. The Answer you wrote must answer *this* Question.
5. **Find the new question your Answer raises.** An answer like "restructure the team" immediately makes the reader ask "how?" or "why?" That question's answer is your next level.
6. **Build the supporting grouping** that answers it — same-kind ideas, logically ordered, each passing the "So what?" test.
7. **Recurse** down each branch until you reach points the reader will accept without further support.

## Bottom-up (use when you don't yet know the answer)

When the structure isn't obvious, discover it from the raw material.

1. **List every point** you want to make — brain-dump, no structure, no editing.
2. **Group the points** that are the same kind of idea. Watch for items that don't fit any group (often they're at a different level, or they're noise).
3. **Order each group** by time, structure, or degree.
4. **Draw the summary** each group forces — the single statement those points add up to (the "So what?"). Write it out; don't leave it implicit.
5. **Treat those summary statements as a new, higher group** and repeat: what do *they* add up to? That top summary is your answer.
6. **Sanity-check the apex** against the reader's actual Question. If the answer you derived doesn't answer the question they're asking, you grouped around the wrong axis — regroup.

The bottom-up pass is also the best cure for "I have twelve things to say and no idea what order" — it converts a list into an argument.

## Worked example: rambling memo → pyramid

**Before (bottom-up brain-dump, as it might first spill out):**

> Our onboarding takes 6 weeks. Competitors onboard in days. New customers churn at 40% in the first quarter. Support tickets spike in week one. The setup wizard breaks on non-standard configs. Customers say they don't understand the product's value early on. We lose most churned customers before they ever reach the "aha" moment. Sales over-promises on customization. The docs are out of date.

**Step 1 — group the same-kind ideas.** These points sort into two clean groups:
- *Symptoms of the problem:* 40% Q1 churn; churn happens before the "aha" moment; competitors onboard in days vs. our 6 weeks.
- *Causes:* setup wizard breaks on non-standard configs; sales over-promises customization; docs are out of date; value isn't communicated early.

**Step 2 — order each group.** Symptoms by degree (lead with the costliest: churn). Causes by degree too (lead with the one driving the most churn: the broken wizard).

**Step 3 — draw each summary (the "So what?").**
- Symptoms summary: *"We lose 40% of new customers in their first quarter, almost all before they reach first value."*
- Causes summary: *"They churn because onboarding is slow and broken, so they never see the product work."*

**Step 4 — derive the apex.** What do those two add up to, and what does the reader (the exec deciding where to put eng resources) actually want? *"Fixing onboarding is the highest-leverage retention investment we can make this quarter."*

**After (top-down pyramid):**

> **Situation:** We've spent the year acquiring new customers efficiently.
> **Complication:** But 40% of them churn in their first quarter — nearly all before they ever reach first value.
> **[Question: where do we intervene?]**
> **Answer:** Fix onboarding; it's the highest-leverage retention investment available this quarter.
>
> — because new customers are leaving fast and early *(symptoms group)*
> — because the leaving traces to three fixable onboarding failures *(causes group, ranked)*
> — therefore one focused onboarding sprint addresses the largest share of churn *(the action)*

The same raw points, but now the reader meets the answer first and can stop reading at any depth and still have the gist.