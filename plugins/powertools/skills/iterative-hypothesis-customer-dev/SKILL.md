---
name: iterative-hypothesis
description: Guides founders through Jason Cohen's Iterative-Hypothesis customer development method — a structured system for generating and testing hypotheses about customers through interviews, used to vet what became WP Engine. Use this skill when the user mentions customer development hypotheses, iterative hypothesis testing, hypothesis spreadsheets, Jason Cohen's method, A Smart Bear customer development, vetting startup ideas through interviews, writing customer hypotheses, or building a goals → hypotheses → questions → iterate loop. Also trigger when users want open-ended interview questions from assumptions, a hypothesis tracking spreadsheet, analysis of interview notes against hypotheses, or guidance on when to stop interviewing. Complements the customer-interview skill with a hypothesis-driven iterative method.
---

# Iterative-Hypothesis Customer Development

A structured method for building genuine knowledge about potential customers through hypothesis-driven interviews. The core insight: write down your assumptions before talking to anyone, craft open-ended questions that test those assumptions without leading the witness, then iteratively refine your understanding as real data contradicts your beliefs.

This method was developed by Jason Cohen and used to vet (and reject) startup ideas before landing on WP Engine. The discipline of recording predictions, observing where reality clashes with them, and iterating is what separates useful customer development from wasted conversations.

Source: https://longform.asmartbear.com/customer-development/

## The Five-Step Process

### Step 1: Goals — What You're Trying to Learn

Goals define the categories of knowledge you need. For a new B2B product addressing a customer pain point, typical goals include:

1. What does the ideal customer look like?
2. What outcomes must they deliver regularly? (Jobs-to-be-Done)
3. What do they actually do day-to-day? (tools, workflows, loves, dreads)
4. What pain points do they experience today?
5. How do they cope with that pain today? (your real competition, including DIY)
6. How much would they pay to eliminate the pain? How do they budget and pay?
7. What triggers the buying moment? (no one randomly switches vendors)
8. What causes them to resist or fear buying? (habits, anxiety, risk)
9. Where do they discover and buy products like this? (distribution channels)
10. What exact words do they use to talk about this space? (positioning language)
11. What higher-level goal do they ultimately care about? (the outcome behind the outcome)

Notice what's NOT here: "What should we build?" or "Would you buy feature X?" Those questions don't work. Customers say "yes" and then don't buy. Instead, learn about their current life so thoroughly that the right product becomes obvious.

### Step 2: Hypotheses — Your Best Guesses, Written Down

Write down your current beliefs about the answers to each goal. At least one hypothesis per goal, but more is better. Map each hypothesis to one or more goals.

Why bother writing down what you think you already know?

**Prediction discipline.** Research on forecasting shows people are more objective when forced to record predictions as formal bets. Without written hypotheses, you'll unconsciously retcon your beliefs when new information arrives (confirmation bias). Written predictions make it obvious when you were wrong.

**Question generation.** Hypotheses directly generate great interview questions (Step 3). Each hypothesis becomes the seed for an open-ended question.

Even "obvious" assumptions deserve to be written down. Cohen found that roughly half his hypotheses about WordPress bloggers were wrong — including assumptions that seemed completely reasonable on their face.

Format: Put hypotheses in a spreadsheet, one per row. Column A = hypothesis text with goal mapping (e.g., "[G1,G4] Bloggers with >100K pageviews have trouble keeping their blog fast.").

### Step 3: Questions — Open-Ended, Non-Leading

For each hypothesis, write one open-ended question in Column B. Sometimes one question covers a cluster of related hypotheses.

Questions must satisfy four criteria:
1. **Confirm or negate the hypothesis** — that's the point
2. **Not hint at any specific answer** — seek unbiased truth
3. **Invite a specific answer** — uncover the correct answer, not just "yes/no"
4. **Invite more information** — discover things you didn't know to ask

The cardinal sin is "leading the witness." If your hypothesis is about security concerns, don't ask: "Blogs get hacked all the time and it's devastating, right?" Everyone will agree because disagreeing sounds dumb. Instead ask: "Do you ever think about website security? If so, how do you think about that? Do you do anything about it today?"

Read `references/question-craft.md` for detailed examples of transforming hypotheses into good questions, plus the table of bad vs. good question patterns.

### Step 4: Iterate the Hypotheses

During each interview, take notes in a new column next to each question. After the interview:

- **Check each hypothesis** — did this conversation support it, contradict it, or add nuance?
- **Modify hypotheses** — not necessarily after one interview, but definitely when patterns emerge
- **Add new hypotheses** — based on surprises and new learnings
- **Add new questions** — for the new hypotheses
- **Watch for surprise** — surprise means you're learning; when surprised, dig in with "Tell me more about that"

The spreadsheet grows rightward (one column per interview) and downward (new hypotheses added as you learn).

### Step 5: Stop When It's Boring

When interviews stop producing surprises, learning has stopped. Time for a different method: proof-of-concept, high-fidelity demo, or an SLC (Simple, Lovable, Complete).

Caution: Stopping after only 3 interviews and claiming "nothing new" is premature. That's like A/B testing two ad variants and giving up. If there's genuinely nothing to learn, you might be fishing in the wrong spot — maybe there's no real pain point here.

## Advanced Techniques

Read `references/advanced-techniques.md` for detailed guidance on:
- **Emergent segmentation** — noticing that different customer types give systematically different answers
- **Discussing price** — why and how to float specific prices during interviews
- **Expecting contradictions** — treating noisy data as normal, not failure
- **Step-by-step usage walkthrough** — asking customers to describe exactly how they'd use the product
- **Capturing exact customer language** — for positioning and messaging
- **Handling "market guru" mode** — when customers start speaking for "everyone else"
- **STFU principle** — if you're talking, you're not learning

---

## How to Use This Skill

Determine where the user is in the process and help accordingly:

### If they need help getting started:
1. Ask about their product idea or business concept
2. Help them draft their goal list (adapt the 11 goals above to their context)
3. Generate hypotheses for each goal — collaborate, don't just output a list. The user should recognize these as things they actually believe (or suspect).
4. Transform hypotheses into open-ended questions following the four criteria
5. Produce the tracking spreadsheet

### If they have an idea but no hypotheses yet:
1. Understand the product concept and target customer
2. Walk through each goal category and ask what they believe
3. Write those beliefs as formal hypotheses
4. Generate the questions and spreadsheet

### If they have hypotheses and need questions:
1. Review the hypotheses — check for goal coverage, specificity, and whether they include "obvious" assumptions
2. Transform each into a proper open-ended question
3. Flag any questions that are leading or closed-ended

### If they have interview notes and need analysis:
1. Compare notes against existing hypotheses
2. Identify which hypotheses are supported, contradicted, or need refinement
3. Surface surprises and suggest new hypotheses
4. Identify emergent segments if patterns suggest different customer types
5. Recommend whether to continue interviewing or move to building

### If they want the full workflow:
Walk them through all five steps, producing a spreadsheet with Goals, Hypotheses, Questions, and room for interview notes.

## Output Formats

- **Hypothesis tracking spreadsheet** (.xlsx or .csv) — Columns: Goal Mapping, Hypothesis, Interview Question, then one column per interview for notes
- **Interview guide** — A clean list of questions organized by topic, with reminders about open-ended questioning and the STFU principle
- **Post-interview analysis** — A structured comparison of interview data against hypotheses, with recommendations for iteration
- **Readiness assessment** — Whether the user has enough signal to stop interviewing

## Key Principles to Weave Into Every Deliverable

- The goal is to uncover truth, not to sell or validate
- Written predictions combat confirmation bias
- Questions must be open-ended and never lead the witness
- Surprise = learning; boring = time to stop
- Half your "obvious" assumptions are probably wrong
- Use the customer's exact words for positioning
- Discuss price — it's inextricably linked to how customers think about your product
- When customers speak for "everyone else," redirect to their own experience