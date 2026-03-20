---
name: one-thing
description: >
  Apply the principle of The ONE Thing (Gary Keller & Jay Papasan) to help someone find clarity, set priorities,
  and take action. Use this skill whenever someone is overwhelmed, has too many priorities, needs to decide
  what to focus on, is setting goals, feels stuck or scattered, wants to narrow down options, asks "what should
  I work on," "what's most important," "how do I prioritize," or mentions anything related to focus, productivity,
  goal-setting, time blocking, or figuring out what matters most. Also trigger when someone says they have too
  much on their plate, can't decide between projects, wants to simplify, mentions "the one thing," "focusing
  question," "domino effect," or wants help with quarterly/annual planning. This skill works in both interactive
  mode (conversational, for humans) and non-interactive mode (structured output, for agents/automation).
---

# The ONE Thing Skill

## Core philosophy

The ONE Thing is a framework for extraordinary results built on one insight: **success is sequential, not
simultaneous.** Not everything matters equally. The most successful people narrow their focus to the single
most important thing — and let everything else follow from that clarity.

The central tool is the **Focusing Question**:

> "What's the ONE Thing I can do such that by doing it everything else will be easier or unnecessary?"

This question is fractal — it works at every time scale (right now, today, this week, this year, someday) and
in every domain (work, health, relationships, finances, learning). The skill's job is to help the user wield
it effectively.

## Detecting mode

Before running the framework, determine which mode to operate in:

**Interactive mode** (default for humans): The user is a person thinking through their priorities in
conversation. Ask questions. Guide them through the framework step by step. Use the Socratic approach —
help them discover their ONE Thing rather than telling them what it is. Be patient; the process of narrowing
is where the insight happens.

**Non-interactive mode** (for agents/automation): The user (or a calling agent) provides context upfront and
wants structured output. Skip the back-and-forth. Apply the framework to the provided context and return
the complete analysis in one pass. Look for signals like: the prompt contains all needed context already,
the caller explicitly requests non-interactive mode, or the message comes from an automated system or
includes structured input (JSON, lists of goals, etc.).

If unsure, default to interactive mode and ask one clarifying question.

---

## Interactive mode: The guided process

### Phase 1 — Establish the domain

Ask the user what area of life they want to focus on. Common domains include:

- Work / career / business
- Health / fitness / energy
- Key relationships (family, partner, friendships)
- Personal growth / learning
- Finances / wealth building
- Spiritual life / inner work

If they say "everything" or seem overwhelmed across multiple areas, gently redirect: the whole point is to
pick ONE area first. Suggest starting with whichever domain is causing the most pain or has the highest
leverage right now. They can repeat the process for other domains later.

### Phase 2 — Surface the Someday Goal

Help them articulate their big, extraordinary aspiration in the chosen domain. This is the "Someday Goal" —
what they'd want to be true if they could fast-forward to a future where everything went right.

Useful prompts:
- "If you could wave a wand and have any outcome in [domain], what would it look like?"
- "What would extraordinary look like for you here — not just good, but remarkable?"
- "What's the big dream you might be afraid to say out loud?"

Push them to think bigger. The book warns that "Big Is Bad" is one of the six lies — people habitually
shrink their ambitions. If their someday goal sounds like a reasonable 1-year plan, challenge them to
10x it.

### Phase 3 — Goal Setting to the Now (GSTTN)

This is the heart of the skill. Walk them backward from the Someday Goal to this very moment, using the
Focusing Question at each level. Each step should produce ONE answer, not a list.

The cascade:
1. **Someday Goal** → already established
2. **5-Year Goal** → "Based on your Someday Goal, what's the ONE Thing you can do in the next five years to be on track?"
3. **1-Year Goal** → "Based on your 5-Year Goal, what's the ONE Thing you can do this year?"
4. **Monthly Goal** → "Based on your 1-Year Goal, what's the ONE Thing you can do this month?"
5. **Weekly Goal** → "Based on your Monthly Goal, what's the ONE Thing you can do this week?"
6. **Daily Goal** → "Based on your Weekly Goal, what's the ONE Thing you can do today?"
7. **Right Now** → "Based on your Daily Goal, what's the ONE Thing you can do right now?"

At each level, if the user gives a vague answer, apply **Extreme Pareto**: help them narrow by asking
"Of the things you just mentioned, which ONE would make the biggest difference?" Keep going until they
can't split it further. The 80/20 rule applied recursively always converges to one thing.

As you get closer to "right now," the answers should get progressively more concrete and actionable. If
their "right now" task is still abstract ("think about my strategy"), push for something tangible they can
start in the next 30 minutes.

### Phase 4 — Set up the time block

Once they know their ONE Thing, help them protect time for it:

1. **Time block their ONE Thing**: At least 4 hours of uninterrupted focus per day (the book's recommendation).
   If 4 hours is unrealistic given their current situation, negotiate the biggest block they can commit to
   and protect. Even 1-2 hours of time-blocked deep work is transformational compared to zero.

2. **Time block their planning time**: One hour per week to review the GSTTN cascade and recalibrate.
   Goals at the weekly/daily level shift frequently — that's expected.

3. **Time block their time off**: Rest goes on the calendar first, not last. The book is explicit that
   successful people see their work as the time between vacations, not the other way around.

### Phase 5 — Anticipate the Four Thieves

Before wrapping up, briefly warn them about the four things most likely to steal their focus. Read
`references/deep-concepts.md` for the full framework, but in conversation, surface whichever thieves
seem most relevant to the user's situation:

1. **Inability to say no** — Every yes to your ONE Thing requires many nos to other things.
2. **Fear of chaos** — When you focus deeply on one thing, other things *will* pile up. That's normal, not failure.
3. **Poor health habits** — Physical energy is the fuel for focus. Sleep, nutrition, and exercise aren't optional.
4. **Environment doesn't support your goals** — The people and places around you either accelerate or sabotage your focus.

Ask: "Which of these four is most likely to trip you up?" Then brainstorm one concrete countermeasure.

### Phase 6 — Recap and commit

Summarize everything in a clean format:

```
Domain: [their chosen area]
Someday Goal: [their big aspiration]
5-Year Goal: [one thing]
1-Year Goal: [one thing]
Monthly Goal: [one thing]
Weekly Goal: [one thing]
Daily Goal: [one thing]
Right Now: [one thing]
Time Block: [their commitment]
Biggest Thief to Watch: [which one + countermeasure]
```

End by reinforcing the domino effect: each of these is a domino, and knocking down the smallest one
(Right Now) is what sets the chain in motion. They don't need to solve the big goal today — they just
need to flick the first domino.

---

## Non-interactive mode: Structured analysis

When operating non-interactively, process the provided context and return a complete ONE Thing analysis.

### Expected input

The caller should provide:
- **Domain** (or multiple domains to analyze separately)
- **Current situation** — what they're working on, what's overwhelming them, what options they're weighing
- **Existing goals** (if any) — the raw material to refine
- **Constraints** — time available, resources, dependencies
- **Time horizon** (optional) — if they only need part of the GSTTN cascade

### Output structure

Return a structured analysis with these sections:

**1. Domain Assessment**
Briefly restate the domain and current situation to confirm understanding.

**2. Six Lies Audit**
Scan the provided context for signs of the Six Lies operating (see `references/deep-concepts.md`).
Flag any that appear to be active — this is diagnostic, not judgmental. Common patterns:
- Multiple "top priorities" listed → Lie #1 (Everything Matters Equally)
- Mentions of doing things simultaneously → Lie #2 (Multitasking)
- "I just need more discipline" → Lie #3 (A Disciplined Life)
- Scheduling willpower-intensive tasks late in the day → Lie #4 (Willpower Always on Will-Call)
- Trying to give equal time to everything → Lie #5 (A Balanced Life)
- Goals that sound reasonable rather than extraordinary → Lie #6 (Big Is Bad)

**3. ONE Thing Identification**
Apply Extreme Pareto to whatever options, goals, or tasks were provided. Show the narrowing process:
start with everything listed, apply 80/20, then apply it again, and again, until one thing remains.
Explain *why* this is the lead domino — what makes it the thing that makes everything else easier or
unnecessary.

**4. Goal Setting to the Now**
Produce the full GSTTN cascade (or as much as the provided context supports). Each level should have
exactly ONE entry with a brief rationale.

**5. Time Blocking Recommendation**
Based on the user's constraints, recommend a specific time-blocking plan.

**6. Thieves Risk Assessment**
Based on context clues, identify which of the Four Thieves poses the biggest risk and suggest
a countermeasure.

**7. First Domino**
State the single most important action to take right now, in one sentence.

---

## Key principles to maintain in both modes

- **One, not many.** Resist the temptation to give the user a prioritized list of three things. The
  framework is explicitly about ONE thing. If you find yourself suggesting multiple priorities, you've
  drifted from the principle. Apply Pareto one more time.

- **Big, not safe.** Push toward extraordinary goals, not comfortable ones. The Domino Effect means
  that small actions compound geometrically — a single domino can topple one 50% larger. So the Someday
  Goal should feel almost unreasonably ambitious.

- **Sequential, not simultaneous.** Success builds one domino at a time. The GSTTN cascade embodies
  this — you don't need to solve the five-year problem today. You just need to knock down today's domino.

- **Habit, not discipline.** The book argues that discipline is only needed long enough to establish a
  habit (roughly 66 days on average). Frame time blocking as building a habit, not as a permanent test
  of willpower.

- **For deeper concept details**, read `references/deep-concepts.md` which contains the Six Lies
  framework, Four Thieves details, Three Commitments, and the Domino Effect math.

## Attribution

This skill is based on *The ONE Thing: The Surprisingly Simple Truth Behind Extraordinary Results*
by Gary Keller and Jay Papasan (Bard Press, 2013).