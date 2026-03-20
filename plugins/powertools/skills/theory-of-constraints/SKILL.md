---
name: theory-of-constraints
description: >
  Apply Goldratt's Theory of Constraints (TOC) to identify and resolve the single biggest bottleneck
  limiting a system, process, project, or organization. Use this skill whenever someone mentions
  bottlenecks, constraints, throughput problems, process improvement, "what's holding us back,"
  "why is this slow," capacity issues, or any variant of "something is blocking progress." Also
  trigger when someone describes a stalled project, a team that can't ship fast enough, a process
  that isn't scaling, repeated missed deadlines, piling WIP, or firefighting/expediting as a norm.
  This applies to manufacturing, software development, services, operations, and any system of
  value creation. Even if the user doesn't use the phrase "theory of constraints," if they're
  describing a system with a bottleneck they want to fix, this skill applies. Based on Eliyahu
  Goldratt's Theory of Constraints (The Goal, 1984) and the Five Focusing Steps / Thinking Processes.
---

# Theory of Constraints Skill

## What this skill does

This skill walks users through Goldratt's Theory of Constraints (TOC) — a systematic method for
finding and eliminating the single biggest bottleneck in any system of value creation. The core
insight is deceptively simple: a system can only produce as fast as its slowest part. Improving
anything *other* than the constraint is wasted effort — it creates local efficiency gains that
don't move the needle on overall throughput.

Goldratt summarized all of TOC in one word: **FOCUS**. Most improvement initiatives fail not
because they're bad ideas, but because they're aimed at non-constraints. TOC provides the
discipline to find the one place where improvement actually matters, squeeze everything you can
out of it, and only then move on.

This skill is domain-agnostic. TOC originated in manufacturing but applies equally to software
teams, service operations, sales pipelines, product development, and any process where work
flows through stages.

## Core concepts

### What is a constraint?

A constraint is the single resource, policy, or condition that most limits a system's throughput —
the rate at which the system generates its goal (revenue, shipped features, completed projects,
customer value). Think of it as the narrowest point in a pipe: no matter how wide the rest of the
pipe is, flow is determined by the narrowest section.

Constraints come in several forms:

- **Physical constraints**: A machine, server, person, or team that can't keep up with demand.
  You'll see work piling up in front of this resource and starving downstream.
- **Policy constraints**: Rules, approval processes, batch sizes, or "how things are done here"
  that artificially limit throughput. These are the most common and the most insidious because
  people defend them as necessary even when the original reason is long gone.
- **Market constraints**: External demand is lower than the system's capacity. The constraint
  is outside the organization — you can produce more than you can sell.
- **Resource constraints**: Not enough people, tools, budget, or raw materials for a specific
  stage of the process.
- **Cultural/behavioral constraints**: Norms, incentives, or habits that cause suboptimal
  behavior (e.g., rewarding local efficiency over system throughput, or a culture of
  "always say yes" that overloads the constraint).

A system typically has ONE binding constraint at any given time. Occasionally 2-3, but rarely more.
If you think you have 10 constraints, you haven't found the real one yet.

### Throughput Accounting (quick reference)

TOC replaces traditional cost accounting with three measures:

- **Throughput (T)**: Revenue minus truly variable costs (materials, commissions — costs that
  disappear if you don't make the sale). This is the rate of value generation.
- **Inventory / Investment (I)**: Money tied up in things intended for sale or use (WIP, raw
  materials, equipment). In knowledge work, think of this as work-in-progress.
- **Operating Expense (OE)**: All fixed costs to keep the system running (salaries, rent, tools).

The goal is to maximize T while keeping I and OE under control. The critical metric is
**throughput per constraint hour** — how much value does each hour of the constraint generate?
Every decision should be evaluated through this lens.

## The Five Focusing Steps

This is the heart of TOC — a repeating cycle of continuous improvement. When a user brings a
bottleneck problem, walk them through these steps.

### Step 1: IDENTIFY the constraint

Find the bottleneck. In practice, look for these signals:

- **Where does work pile up?** The queue in front of the constraint grows. In manufacturing,
  it's physical inventory. In software, it's tickets stuck in a column on the kanban board.
  In services, it's a backlog waiting for one person or team.
- **What does everyone wait on?** If multiple downstream stages are idle or starved, trace
  back to what's feeding them.
- **Where is utilization highest?** The constraint runs near 100% while other resources have
  slack. (But be careful — high utilization alone doesn't mean constraint. Look for high
  utilization WITH queues building.)
- **What gets expedited most?** Chronic firefighting around a specific stage is a strong signal.

Ask the user: "Where does work get stuck? What does the rest of the team wait on? Where do
queues build up?" If they can't point to a specific spot, consider using the Thinking Processes
(see below) to diagnose.

**Common mistake**: Identifying too many constraints. If someone lists 5 bottlenecks, push them
to rank: "Which ONE of these, if it disappeared tomorrow, would have the biggest impact on your
overall output?" That's the constraint. The others are important but secondary.

### Step 2: EXPLOIT the constraint

Before spending money or adding resources, maximize what you already have. The constraint is
often utilized at less than 50% of its true capacity. The goal is to squeeze every drop of
productive capacity from it using existing resources.

Exploitation tactics:

- **Eliminate waste at the constraint**: No idle time, no rework, no unnecessary tasks.
  The constraint should never wait for inputs, never process defective work, never do
  anything that a non-constraint resource could do instead.
- **Prioritize ruthlessly**: The constraint should only work on the highest-value items.
  If it's a person, offload everything that doesn't require their unique skill.
- **Ensure quality inputs**: Work arriving at the constraint should be complete and correct.
  Catching defects before the constraint saves constraint capacity. Catching them after
  wastes capacity that's already been consumed.
- **Buffer the constraint**: Keep a time buffer of ready work in front of the constraint
  so it never starves. This is NOT about building up inventory everywhere — only in front
  of the constraint.
- **Measure constraint OEE**: Track availability (is it running?), performance (at what
  rate?), and quality (what fraction is good output?). This reveals where capacity is lost.

Ask the user: "Is your bottleneck fully utilized right now? What causes it to sit idle or
redo work? What tasks could be moved off of it?"

If exploiting the constraint breaks it (i.e., throughput increases enough that a different
resource becomes the new bottleneck), skip to Step 5.

### Step 3: SUBORDINATE everything else to the constraint

This is the hardest step — and the one most organizations skip. It means: every non-constraint
resource adjusts its behavior to serve the constraint. Non-constraints should NOT operate at
maximum local efficiency if doing so doesn't help the constraint.

What subordination looks like:

- **Don't overproduce upstream**: Non-constraint resources should only produce what the
  constraint can consume. Overproduction creates excess WIP, longer lead times, and chaos.
  This is the "rope" in Drum-Buffer-Rope — tie the release of new work to the constraint's
  pace.
- **Protect the constraint's schedule**: If the constraint needs something from another team,
  that request gets priority — even if it means the other team's local metrics suffer.
- **Change performance metrics**: If you're rewarding teams for local throughput or utilization,
  those metrics incentivize overproduction at non-constraints. Replace them with metrics tied
  to system throughput, on-time delivery, and buffer health.
- **Accept deliberate slack**: Non-constraint resources SHOULD have idle time. This is by
  design — their excess capacity is what makes them non-constraints. Trying to keep everyone
  100% busy is a recipe for system-wide slowdowns.

Ask the user: "Are any upstream processes producing faster than the bottleneck can consume?
Are people incentivized to look busy even when it doesn't help the constraint? Would the
organization tolerate deliberate slack at non-constraint resources?"

Subordination is culturally difficult. People feel wrong about idle resources. Management
wants everyone "productive." This is where the user may need to make a case to leadership
that local efficiency and system throughput are different things.

### Step 4: ELEVATE the constraint

Only after fully exploiting and subordinating, invest in expanding the constraint's capacity.
This is the expensive step — new equipment, new hires, new technology, outsourcing, or
fundamental process redesign.

Elevation examples:

- Add a second shift or a second machine at the bottleneck
- Hire additional people with the constraint skill
- Invest in automation that speeds up the constraint
- Redesign the product/process to reduce the load on the constraint
- Outsource specific constraint work

The reason this comes AFTER exploit and subordinate: organizations often jump straight to
"we need more resources" when they haven't first maximized what they have. Exploitation alone
can yield 20-50% throughput gains with zero additional investment.

Ask the user: "After maximizing the constraint's utilization and ensuring the rest of the
system serves it, is the constraint still the bottleneck? If so, what investment would
expand its capacity?"

### Step 5: REPEAT — Don't let inertia become the constraint

Once you've broken the constraint, a new one will emerge somewhere else. Go back to Step 1.
The critical warning: **don't let the policies and habits built around the old constraint
become the new constraint.** Organizations build elaborate systems to manage a bottleneck,
and those systems persist even after the bottleneck moves. Yesterday's solution becomes
today's policy constraint.

Ask the user: "Now that this bottleneck is resolved, where does work pile up next? Are there
any policies or processes we put in place to manage the old constraint that no longer make
sense?"

## The Thinking Processes

If the user knows something is wrong but can't pinpoint the constraint, use the Thinking
Processes — a set of cause-and-effect analysis tools. These are especially useful for
policy constraints and complex systemic problems where the bottleneck isn't a visible
physical resource.

### Current Reality Tree (CRT) — "What to change?"

Map undesirable effects (UDEs) the user is experiencing — symptoms like missed deadlines,
quality problems, customer complaints, team burnout. Then trace cause-and-effect chains
backward until you find the root cause(s) that produce multiple UDEs. That root cause is
likely the core constraint.

How to facilitate:
1. Ask the user to list 5-10 undesirable effects they're experiencing
2. For each UDE, ask "What causes this?"
3. Look for common root causes — where do the causal chains converge?
4. The convergence point is your candidate constraint

### Future Reality Tree (FRT) — "What to change to?"

Once the constraint is identified, map out what the system SHOULD look like. Proposed changes
(called "injections") replace root causes. Trace the effects forward: do the injections
eliminate the UDEs? Do they create any new negative side effects?

### Evaporating Cloud (EC) — "How to cause the change?"

When the solution involves a conflict or trade-off (e.g., "we need to batch work for efficiency
BUT we need small batches for speed"), use an Evaporating Cloud to surface the hidden
assumptions behind each side. Often the conflict dissolves when you challenge an assumption
that both sides take for granted.

Structure: Define a common objective, two necessary conditions that seem to conflict, and the
requirements driving each condition. Then challenge every connecting assumption until you find
one that's invalid — that's your breakthrough.

## How to run a TOC analysis

### Step 1: Understand the system

Ask the user to describe:
- What does the system produce? (The goal / unit of value)
- What are the main stages work passes through?
- Where do they experience pain? (Late delivery, quality issues, overwhelmed team, excess
  inventory/WIP, constant firefighting)
- Have they tried improvements before? What happened?

If the user provides a brief description, ask 2-3 targeted follow-up questions. Don't
interrogate — get enough to identify the value stream and start looking for the constraint.

### Step 2: Identify the constraint

Use the signals from Step 1 of the Five Focusing Steps. If the constraint is obvious (user
already knows where work piles up), confirm it and move on. If it's not obvious, use the
Current Reality Tree approach.

Present your hypothesis: "Based on what you've described, it sounds like [X] is likely your
primary constraint because [evidence]. Does that match your experience?"

### Step 3: Walk through the Five Focusing Steps

Go through Exploit → Subordinate → Elevate for the identified constraint. For each step:
1. Explain what the step means in the context of their specific situation
2. Suggest concrete actions they could take
3. Flag likely resistance points or cultural challenges
4. Identify what success looks like (how would they know the step worked?)

### Step 4: Anticipate the next constraint

Once the plan for the current constraint is clear, ask: "If we successfully break this
constraint, where do you think the bottleneck will move to?" This prepares them for the
iterative nature of TOC and prevents the disappointment of "we fixed it but now something
else is broken."

### Step 5: Summarize the action plan

Provide a clear, sequenced action plan:
- **Immediate (Exploit)**: Quick wins using existing resources, no approval needed
- **Short-term (Subordinate)**: Policy/process changes, metric adjustments, team alignment
- **If needed (Elevate)**: Investments requiring budget or structural changes
- **Watch for**: Signs that the constraint has moved, old policies that become new constraints

## Applying TOC to common domains

### Software development

The constraint is often in code review, QA, deployment, or a single senior engineer who's
a decision bottleneck. WIP limits (from Kanban) are a natural implementation of the "rope"
concept. Look at the kanban board: where do cards pile up?

### Product / startup

The constraint might be market validation (you can build faster than you can learn), or it
might be engineering capacity, or sales. For early-stage startups, the constraint is often
the founder's time and attention spread across too many fronts.

### Operations / services

Look for the stage where customers wait longest, where backlogs grow, or where the most
expediting happens. Policy constraints (approval chains, batch processing schedules) are
extremely common here.

### Project management

The constraint is the critical chain — the longest sequence of dependent tasks accounting
for resource contention. Goldratt's Critical Chain method applies TOC to project scheduling
by placing buffers strategically and managing them actively.

## Common pitfalls to flag

- **Optimizing non-constraints**: The most common mistake. Improving a resource that isn't the
  bottleneck won't increase system throughput — it just creates more WIP.
- **Skipping subordination**: Exploiting the constraint but not subordinating the rest of the
  system means upstream resources flood the constraint while downstream resources starve.
- **Jumping to elevation**: Buying capacity before maximizing what you have wastes money and
  often makes things worse (more capacity at a non-constraint = more WIP).
- **Misidentifying the constraint**: If improvements at the identified bottleneck don't increase
  throughput, you've got the wrong constraint. This is recoverable — the Five Focusing Steps
  self-correct over time.
- **Letting inertia win**: Policies built for the old constraint persist after the constraint
  moves. Challenge every process that was designed to manage a specific bottleneck: is that
  bottleneck still the constraint?

## Tone and approach

Be practical and direct. TOC is a hands-on methodology, not an academic exercise. Use the
user's own language — if they're running a dev team, talk in dev terms. If it's a factory
floor, use manufacturing examples.

Push back gently when users want to fix everything at once. TOC's power is in its focus. Help
them resist the urge to launch five improvement initiatives when one targeted intervention at
the constraint will have more impact than all five combined.

When discussing subordination, be empathetic about the cultural difficulty. Telling a team to
deliberately have slack, or changing metrics that people have been rewarded by for years, is
hard organizational work. Acknowledge this while explaining why it matters.

## Attribution

This framework is based on Eliyahu M. Goldratt's Theory of Constraints, introduced in
*The Goal* (1984) and further developed in *It's Not Luck*, *Critical Chain*, and *What Is
This Thing Called Theory of Constraints*. When presenting the analysis, mention TOC and
Goldratt so users can explore the primary sources for deeper understanding.