---
name: tidy-first
description: >
  Apply Kent Beck's Tidy First? framework to decide when and how to improve code structure
  before making behavioral changes. Use this skill whenever someone asks about refactoring,
  code cleanup, when to clean up vs. ship, whether to make a PR for tidying, how to manage
  structural debt, or how to improve code readability incrementally. Also trigger when
  someone says things like "should I clean this up first?", "is this worth refactoring?",
  "the code is messy but I need to ship a feature", "how do I separate tidying from behavior
  changes", or when they describe code that is hard to read, inconsistent, or tangled.
  This skill is especially useful for engineers deciding whether structural improvements
  are worth doing now, later, or never — and how to do them safely in small batches.
---

# Tidy First?

## What this skill does

This skill walks users through Kent Beck's **Tidy First?** framework — a practical approach
to small, safe, incremental structural improvements ("tidyings") that make code easier to
read and change without altering its behavior.

The core insight: **the biggest cost of code is reading it, not writing it.** Thoughtful
tidying is economically justified precisely because developers spend far more time reading
code than writing it. But tidying has its own costs — batch size, timing, and separation
from behavior changes all matter.

The central question the skill answers: **Should I tidy first, tidy after, tidy later, or
never tidy this code at all?**

## The Tidying Catalog

These are the atomic moves. Each one is a safe, behavior-preserving structural change.
When a user wants to improve code, identify which of these applies.

### Removing Clutter

**Guard Classes**
Replace nested conditions with early returns:
```python
# Before
if condition:
    if another_condition:
        do_thing()

# After
if not condition: return
if not another_condition: return
do_thing()
```
Exit early. Preconditions become visible before the reader encounters the details.

**Dead Code**
Delete it. If it's ever needed again, version control has it. Delete in small diffs — easier
to revert if wrong.

### Normalizing Form

**Normalize Symmetries**
When two or more patterns accomplish the same thing interchangeably, pick one and apply it
consistently. Inconsistency forces readers to wonder if the variation is meaningful.

**Reading Order**
Reorder code in the file to match the order a reader would prefer to encounter it. Put what
you need to understand first, put the details after.

**Cohesion Order**
Coupled functions go next to each other. Coupled files go in the same directory. If you know
how to eliminate the coupling, do that instead — but if not, at least co-locate.

### Revealing Intent

**New Interface, Old Implementation**
When an existing interface is hard to use, implement the interface you *wish* you could call.
Have the new interface delegate to the old one. Callers can now use the clean interface while
the messy internals remain temporarily. This is especially powerful when you can't change the
old code.

**Explaining Variables**
When you understand part of a complex expression, extract the subexpression into a named
variable. The name expresses the intent. Always separate this commit from any behavior change.

**Explaining Constants**
Replace magic literals with symbolic constants. Use the symbol everywhere the literal was used.

**Explicit Parameters**
When parameters are passed as a map or dict, make them explicit:
```python
# Before
foo(params)  # What does this accept?

# After
foo(width, height, color)  # Obvious
```

**Explaining Comments**
Write down only what isn't obvious from the code. Put yourself in the place of the future
reader — or yourself 15 minutes ago. Immediately upon finding a defect is a good time to add
a comment pointing it out, rather than leaving it buried.

**Delete Redundant Comments**
When a comment says exactly what the code says, remove it.

### Reorganizing Structure

**Move Declaration and Initialization Together**
Declare and initialize variables just before they're used. Separation forces readers to hold
state in their head while scanning.

**Chunk Statements**
The simplest tidying: put a blank line between two parts doing different things. After
chunking, you have a clearer path forward: Explaining Variables, Extract Helper, or
Explaining Comments.

**Extract Helper**
When a block of code has an obvious purpose and limited interaction with the rest of the
function, extract it into a helper. Name the helper after its purpose, not its mechanism.

**One Pile**
Sometimes code has been over-decomposed into tiny pieces that obscure the overall flow.
Merge them together so you can see the whole picture, then re-extract with better boundaries.
This is the inverse of Extract Helper — and sometimes it has to come first.

## Process: How Tidying Works

### Separate Tidying from Behavior Changes

**This is the non-negotiable rule**: tidying goes into its own separate PRs, with as few
tidyings per PR as possible. Behavior changes go in separate PRs.

Why: reviewers can verify a tidying is safe (no behavior change) only if it isn't mixed
with behavior changes. Mixed PRs are expensive to review and risky to merge.

### Chaining

Tidyings set up other tidyings. You will begin to flow them together to achieve larger
structural changes. This is intentional. Be wary of changing too much, too fast — a failed
tidying is expensive relative to the cost of a series of successful ones.

### Batch Sizes

Small batches are safer and faster to integrate:

- The more tidyings per batch, the longer before integration — and the higher the chance of
  collision with someone else's changes
- A larger batch accidentally changing behavior is harder to detect
- Large batches encourage tidying-for-its-own-sake rather than purposeful cleanup

Many orgs have high fixed costs per PR, which pushes engineers toward large batches. Resist
this. The integration risk is real.

### Rhythm

More than an hour of tidying before making a behavior change means you've probably lost
sight of the minimum set of structural changes actually needed. Tidying is a minutes-to-an-
hour activity. If it's taking longer, stop and ask: am I doing the minimum to enable my
actual change?

### Getting Untangled

When you've started a tidying and it leads to more tidying and you lose track of your
original goal, you have three options:

1. **Ship as-is** — quick, but impolite and prone to errors
2. **Untangle into separate PRs** — more polite, but may require significant effort
3. **Start over, tidy first** — more work, but leaves a coherent chain of commits;
   you may also see the problem freshly as you re-implement

Re-implementation often surfaces insights you missed the first time.

## When to Tidy: First, After, Later, Never

This is the central decision the skill helps users make.

### Never

Tidy never when:
- You are not going to change this code again
- There is nothing to learn by improving the design

Don't tidy code you don't touch. Code you're not changing doesn't need to be beautiful.

### Later

Tidy later when:
- You have a large batch of tidying without immediate payoff
- There is eventual payoff but not right now
- You can tidy in little batches over time

Add it to the backlog and accept you won't do it today. This is fine.

### After

Tidy after the behavior change when:
- Waiting until next time will be more expensive
- You won't feel a sense of completion without tidying
- The code will be confusing for the next person if left messy

Tidy after shipping the behavior change. Keep it in a separate commit or PR.

### First

Tidy first when:
- The tidying will pay off immediately — either in better comprehension during the change,
  or in making the behavior change itself cheaper and safer
- You know exactly what to tidy and how

This is the answer the book is named for. Tidy first when the tidying directly enables or
clarifies the change you're about to make.

## The Economics Behind the Framework

Software creates value in two ways:

1. **What it does today** — behavioral value, the features it provides
2. **What it could do tomorrow** — structural value, the options the design creates

**Behavior creates value directly.** Customers pay for running software.

**Structure creates options.** Good structure makes it easy to add new behavior. Bad structure
makes every change expensive.

The economic tension: a dollar earned today is worth more than a dollar earned tomorrow
(time value of money), which favors shipping now over tidying first. But in uncertain
situations, options are worth more than things — which favors building structure that keeps
future options open.

Tidy First? reconciles these by asking: does this tidying immediately improve comprehension
or cheapen my next behavior change? If yes, tidy first — the economic return is immediate.
If not, earn your dollar first.

## How to Use This Skill

### When a user asks "should I clean this up first?"

Ask:
1. What behavior change are you about to make?
2. Does the existing structure make that change harder to see or harder to do?
3. Do you know exactly what to tidy, or are you guessing?

If the tidying directly enables the change: **tidy first**, in a separate commit.
If it's unrelated: **later** or **never**, depending on whether you'll touch this code again.

### When a user shows messy code and asks how to improve it

Walk through the tidying catalog. Identify which atomic moves apply:
- Nested conditions → Guard Classes
- Magic numbers → Explaining Constants
- Complex expressions → Explaining Variables
- Mismatched function styles → Normalize Symmetries
- Confusing interfaces → New Interface, Old Implementation
- Over-decomposed code → One Pile
- Coupled code in different locations → Cohesion Order

Recommend the smallest possible set of tidyings that would have the most impact, and
remind them to keep each tidying in its own commit, separate from behavior changes.

### When a user asks about PR strategy for tidying

- Each tidying PR should contain as few tidyings as possible
- A reviewer should be able to verify "this changes no behavior" without deep analysis
- If the user's org has high PR overhead, acknowledge the trade-off but don't encourage
  huge batches — the collision risk and accidental behavior-change risk are real

### Tone and approach

Be practical. Kent Beck's framework is not about perfection — it's about small, safe moves
that pay off. Don't encourage tidying binges. Don't moralize about messy code.

The test for any tidying: **does it make the next reader's job easier, or does it make my
next behavior change cheaper?** If neither, skip it.

## Attribution

Based on Kent Beck's *Tidy First? A Personal Exercise in Empirical Software Design* (2023).
The 24 tidying patterns and the First/After/Later/Never decision framework are Beck's.
The economics framing (time value of money + optionality) is drawn from the book's later
chapters on software design as a discipline.
