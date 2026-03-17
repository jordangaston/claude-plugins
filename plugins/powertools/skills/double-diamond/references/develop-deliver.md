# Diamond 2: Develop & Deliver — Methods and Tools

## Table of Contents
1. Develop Phase Methods
2. Deliver Phase Methods
3. Facilitating the Transition
4. Deliverable Templates
5. After Delivery: Measure and Iterate

---

## 1. Develop Phase Methods

The Develop phase is divergent thinking applied to solutions. The goal is to generate many ideas — including bold, unlikely ones — before narrowing. Use low-fidelity artifacts so ideas are cheap to create and easy to discard.

### Structured Brainstorming
Free-form brainstorming often produces mediocre results because of groupthink and anchoring. Use structured methods instead:

**Crazy 8s**: Each participant folds a sheet into 8 panels and sketches 8 ideas in 8 minutes (1 minute per idea). Forces rapid generation and prevents over-investing in any single concept. After individual sketching, share and discuss as a group.

**How Might We Brainstorm**: Take the HMW statement from the Define phase. Set a timer for 10 minutes. Each person writes as many solutions as they can on individual sticky notes. No discussion during generation — quantity over quality. Then share, cluster, and discuss.

**SCAMPER**: A prompt framework for generating variations. Take an existing concept and ask: Substitute? Combine? Adapt? Modify? Put to another use? Eliminate? Reverse?

**Worst Possible Idea**: Brainstorm the worst solutions you can think of. Then flip them — what's the opposite of each bad idea? This loosens up teams that are stuck in "realistic" thinking.

### Concept Sketching
Move from words to visuals. Sketching forces specificity and surfaces assumptions that verbal descriptions hide. Even rough hand-drawn sketches reveal the structure of an idea in a way that bullet points can't.

Approach:
- Each team member sketches their top 2-3 concepts (10-15 min each)
- Present sketches to the group (2 min per person, no interruptions)
- Group provides feedback using structured prompts ("I like...", "I wish...", "What if...")
- Identify common patterns and strongest elements across sketches

### Storyboarding
Map out how a user would interact with a proposed solution, step by step. Storyboards make the user journey through a solution concrete and expose gaps in the concept.

Each frame should show:
- What the user is doing
- What they see (the interface, the environment)
- What they're thinking or feeling
- Any decision points or branching paths

### Low-Fidelity Prototyping
Build quick, disposable versions of ideas to make them tangible and testable. The rule: build at the lowest fidelity that lets you answer your current question.

Prototype types by fidelity:
- **Paper prototypes**: Hand-drawn screens. Test flow and structure. Minutes to create.
- **Wireframes**: Digital but unstyled layout. Test information architecture and interaction patterns. Hours to create.
- **Clickable mockups**: Linked screens with basic interactivity (Figma, InVision). Test task flows. A day to create.
- **Code prototypes**: Functional but rough. Test feasibility and technical assumptions. Days to create.

### Concept Selection
After generating multiple concepts, narrow to the strongest 1-3 for further development:

**Impact/Feasibility Matrix**: Plot each concept on a 2x2 grid. X-axis: feasibility (technical, resource, timeline). Y-axis: user impact. Prioritize the upper-right quadrant.

**Dot Voting**: Give each team member 3-5 votes. Silently place votes on favorite concepts. Discuss the results — votes surface the group's intuition, and discussion catches what the votes might miss.

**Decision Matrix**: Score each concept against criteria derived from the design brief (user impact, feasibility, alignment with strategy, novelty). Weighted scoring keeps decisions grounded.

---

## 2. Deliver Phase Methods

The Deliver phase is convergent — refine the selected solution through testing, iteration, and increasing fidelity until it's ready to ship.

### Usability Testing
The core validation method. Put the prototype in front of real users and watch them try to use it.

Planning:
- Define 3-5 core tasks the user should be able to complete
- Recruit 5-8 participants from the target user segment
- Prepare a test script with task descriptions and follow-up questions
- Decide on metrics: task completion rate, time on task, error rate, satisfaction

During testing:
- Ask users to think aloud as they navigate
- Observe without guiding — note where they hesitate, get confused, or express frustration
- After tasks, ask open-ended follow-ups: "What was that experience like?" "What would you expect to happen here?"

After testing:
- Debrief immediately after each session
- Synthesize findings: what worked, what didn't, severity of issues
- Prioritize fixes and iterate

### A/B Testing
When you have competing solutions or variations, test them head-to-head with real users. Requires sufficient traffic/sample size for statistical significance. Most useful for optimizing specific elements (copy, layout, flow) rather than validating entire concepts.

### Pilot Programs
For service design or complex products, run a small-scale pilot with a limited user group before full launch. Pilots surface operational issues, edge cases, and real-world conditions that lab testing can miss.

Structure:
- Define pilot scope (which users, which features, how long)
- Set success criteria before launching
- Collect both quantitative metrics and qualitative feedback
- Plan a decision point: scale, iterate, or stop

### High-Fidelity Prototyping
As confidence in the solution grows, increase prototype fidelity to match what users will actually experience. High-fi prototypes should be close enough to the real thing that user reactions are representative.

Use high-fi prototypes when:
- You need to test visual design, branding, and tone
- You're validating micro-interactions and animations
- Stakeholders need to see a polished version before approving development
- You're preparing handoff specifications for engineering

### Developer Handoff
Prepare the solution for implementation. This isn't just throwing designs over a wall — it's a collaborative process.

Include:
- Annotated designs with specifications (spacing, typography, color, states)
- Interaction documentation (transitions, error states, edge cases)
- User flow diagrams showing the complete journey
- Acceptance criteria: what "done" looks like for each feature or component
- Meet with developers early and often to resolve questions and adjust for technical constraints

### Launch Planning
Coordinate the release of the solution:
- Define launch scope (full release, staged rollout, feature flags)
- Prepare support documentation (FAQs, help articles, training materials)
- Plan communication to users and stakeholders
- Set up monitoring and feedback channels for post-launch learning

---

## 3. Facilitating the Transition

Moving from Develop to Deliver requires a clear decision about which solution to take forward. Here's a practical sequence:

1. **Review all concepts** generated in Develop. Present each briefly.
2. **Apply selection criteria** from the design brief (impact, feasibility, alignment).
3. **Select 1-2 concepts** for prototyping and testing.
4. **Define test hypotheses**: "We believe [this solution] will [achieve this outcome] for [this user segment] because [this reason]."
5. **Plan the first round of testing**: who, when, what fidelity, what questions.

The hypothesis is the bridge. It turns an idea into something testable and keeps the team focused on validation rather than opinion.

---

## 4. Deliverable Templates

### Ideation Workshop Plan Template
```
# Ideation Workshop: [Project Name]

## Setup
- Duration: [e.g., 2 hours]
- Participants: [who, 4-8 people ideal]
- Materials: [sticky notes, markers, timer, whiteboard/Miro]
- Pre-read: [design brief, key research findings]

## Agenda
1. Warm-up (10 min)
   - Quick recap of the problem statement and key insights
   - Any new constraints or context since Define

2. Diverge: Idea Generation (40 min)
   - Method: [Crazy 8s / HMW brainstorm / SCAMPER]
   - Rules: quantity over quality, no criticism, build on others' ideas
   - Individual then group sharing

3. Cluster and Discuss (20 min)
   - Affinity map the ideas
   - Identify themes and strongest directions

4. Converge: Selection (20 min)
   - Method: [dot voting / impact-feasibility matrix]
   - Select top 2-3 concepts

5. Next Steps (10 min)
   - Assign prototyping owners
   - Schedule testing
```

### Test Plan Template
```
# Usability Test Plan: [Project Name]

## Objective
What are we trying to learn?

## Hypotheses
1. [We believe... because...]
2. [We believe... because...]

## Participants
- Segment: [who]
- Sample size: [how many, typically 5-8]
- Recruitment: [how]

## Prototype
- Fidelity: [paper / wireframe / clickable / code]
- Scope: [which flows/features are testable]

## Tasks
| # | Task Description | Success Criteria |
|---|-----------------|-----------------|
| 1 | [e.g., Find and book an appointment] | [Completes without help in < 2 min] |
| 2 | | |

## Metrics
- Task completion rate
- Time on task
- Error rate
- User satisfaction (post-task rating)
- Qualitative: confusion points, workarounds, verbal feedback

## Logistics
- Sessions: [dates, duration per session]
- Location: [remote/in-person]
- Facilitator: [who]
- Note-taker: [who]
- Recording: [how, with consent]

## Analysis Plan
- Debrief after each session (15 min)
- Full synthesis after all sessions
- Prioritize findings by severity and frequency
- Present to team with recommendations
```

---

## 5. After Delivery: Measure and Iterate

Shipping is not the end. After launch, close the loop:

1. **Track success metrics** defined in the design brief. Give enough time for meaningful data (typically 2-4 weeks minimum).
2. **Collect user feedback** through support channels, surveys, analytics, and direct observation.
3. **Run a retrospective** on the process itself. What worked? What would the team do differently?
4. **Decide next steps**: iterate on the current solution, expand to new user segments, or start a new Double Diamond cycle for the next problem.

The best teams treat delivery as the beginning of learning, not the end of a project. The data from a launched product is the richest discovery input you'll ever get — it feeds right back into the next Discover phase.