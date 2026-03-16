---
name: writing-use-cases
description: Write use case documents that define system behavior — goals, flows, operations, and edge cases — precisely enough for an AI agent to implement without ambiguity.
---

A spec format that defines system behavior — including edge cases — precisely enough for an AI agent to implement without ambiguity.

---

# Core Concepts

### Three Levels of Abstraction

|Level|ID Prefix|Purpose|Format|
|---|---|---|---|
|Goal|G-XX|Business objective the system contributes to|Brief — no scenario|
|Flow|F-XX|Complete bounded interaction between actor and system|Fully dressed|
|Operation|O-XX|Reusable system operation with no standalone actor value|Casual|

### The Use Case Document Structure

Every feature produces one Use Case Document:

1. **Scope diagram** — system boundary, actors, external systems
2. **Actors** — who interacts with the system and what they want
3. **Use Case Index** — the complete list of Goals, Flows, and Operations
4. **Use Cases** — the fully written use cases at each level
5. **Appendix A** — Non-functional requirements this feature introduces
6. **Appendix B** — Business rules this feature introduces
7. **Appendix C** — Data definitions this feature introduces

---

## The Use Case Index

The index is the first deliverable. Write it before any individual use case. It answers the question: _have we identified every actor goal, and do we have Flows to cover each one?_

Review the index with stakeholders before writing fully dressed use cases. Gaps are cheap to fix here; they are expensive to fix later.

| ID   | Level | Use Case             | Primary Actor | Status      |
| ---- | ----- | -------------------- | ------------- | ----------- |
| G-01 | Goal  | [Business objective] | —             | Draft       |
| G-02 | Goal  | [Business objective] | —             | Draft       |
| F-01 | Flow  | [Actor goal]         | [Actor]       | Not Started |
| F-02 | Flow  | [Actor goal]         | [Actor]       | Not Started |
| F-03 | Flow  | [Actor goal]         | [Actor]       | Not Started |
| O-01 | Op    | [Reusable operation] | —             | Not Started |
| O-02 | Op    | [Reusable operation] | —             | Not Started |

**Completeness checks before moving on:**

- Does every Goal have at least two Flows beneath it? If not, it may be just a Flow.
- Does every Flow map to at least one Goal? If not, why build it?
- Does every actor appear as primary actor in at least one Flow?
- Does any behavior repeat across Flows? If so, extract an Operation.

---

## Level 1: Goal

### What It Is

A Goal is a business objective the system serves — a container for Flows, not something you implement directly. It has no primary actor, no scenario, no extensions, and no JTBD. Goals establish _why_ a set of Flows exists, frame scope conversations at the right abstraction level, orient newcomers, and surface gaps: a Goal with no Flows beneath it signals missing work.

### When to Write One

Write a Goal when several Flows serve the same business purpose. If only one Flow serves a given purpose, that Flow probably is the goal — do not add a Goal above it for structure alone.

### How to Write It

Frame the Goal as a **business outcome statement** — what holds true for the business when all Flows beneath this Goal work correctly? Focus on the outcomes, not an actor's motivation.

1. Write one sentence describing that state
2. List the Flows that fulfill it
3. Stop

If you want to add scenarios, JTBD, or constraints, you are writing a Flow, not a Goal.

The distinction matters:

```markdown
**Goal — Business Outcome (state of the world):** No inbound contact goes unhandled, unlogged, or without a post-call action — regardless of time, volume, or agent availability.

**Flow — JTBD (actor motivation):** When a lead calls while I'm unavailable, I want the call handled professionally, so I don't lose revenue to a missed contact.
```

A Goal states what the business needs. A JTBD states why a specific actor engages with the system. Different levels of abstraction; different purposes.

### Template

```markdown
### G-XX: [Goal Name]

**Business Outcome:**
  [One sentence describing what is consistently true for the
  business when the Flows beneath this Goal are all working
  correctly. State of the world — not an actor's motivation.]

**Flows:**
  - F-XX: [Flow name]
  - F-XX: [Flow name]
  - F-XX: [Flow name]
```

### Example

```markdown
### G-01: Manage Inbound Communications

**Business Outcome:**
  No inbound contact goes unhandled, unlogged, or without a
  post-call action — regardless of time, volume, or agent
  availability.

**Flows:**
  - F-01: Route Inbound Call
  - F-02: Handle After-Hours Call
  - F-03: Handle Missed Call
  - F-04: Send Post-Call Follow-Up
```

---

## Level 2: Flow

### What It Is

A Flow is one complete, bounded interaction between a primary actor and the system — something the actor accomplishes in a single sitting, with a clear success state and meaningful failure paths.

Flows are the core of the use case document.

### The Test for a Good Flow

Ask three questions:

1. **Does a primary actor initiate it?** If no human or external system kicks it off, it is likely an Operation.
2. **Can it complete in a single sitting?** If it spans multiple sessions, it is too broad — probably a Goal.
3. **Does the actor care whether it succeeds or fails?** If failure is invisible to the actor, it is likely an Operation.

### How to Write One

Work through the sections in this order:

**1. JTBD first.** Write the Jobs to Be Done for each stakeholder before the scenario. This forces you to understand _why_ each actor participates before you describe _what_ happens. If you cannot articulate the JTBD, you do not understand the use case well enough to write it.

**2. Preconditions.** What must be true for this Flow to begin? State system and business conditions — not UI state. "User is logged in" is UI state. "User has an active account" is system state.

**3. Main Success Scenario.** The happy path only. One step per meaningful actor action or system response. Keep steps at the same level of abstraction — do not mix "actor submits form" with "system validates each field individually." If a step grows complex, extract an Operation.

**4. Success Guarantee.** What is true once the main scenario completes? Include side effects: events fired, records written, downstream systems notified.

**5. Extensions — the most important section.** Each extension is a named deviation from the main scenario. At every step, ask: "What could go wrong, and what should the system do?" Extensions separate a specification from a happy-path description. An agent implements exactly what you specify — unspecified extensions become hallucinated behavior.

Extension notation:

- `2a.` — condition that occurs at step 2
- `2b.` — second condition at step 2
- `*a.` — condition that can occur at any step

**6. Constraints.** Reference NFRs and business rules by ID only — one line each. Full definitions live in the appendix.

**7. Open Questions.** Anything unresolved that affects implementation. Resolve all open questions before handing the Flow to a developer or agent.

### Rules for Extensions

- Consider at least one extension for every step in the main scenario, even if you decide none apply
- Every extension must state where the flow resumes or that it ends in failure
- Every extension must include a concrete example: a real input and the expected output
- Always consider `*a` extensions (any step): what happens if the actor disconnects, times out, or loses connectivity?
- Do not guess how a dependency will behave in certain failure modes.  Shoot tracer bullets in the form of spike tickets, source code research, and  
### Template

```markdown
### F-XX: [Flow Name]



Level: Flow Primary Actor: [Actor name]



**Jobs to Be Done**

[Primary Actor]:
  When [situation],
  I want to [motivation],
  so I can [expected outcome].

[Secondary Stakeholder]:
  When [situation],
  I want to [motivation],
  so I can [expected outcome].

System:
  [What the system must ensure is true throughout this interaction —
  stated as an invariant, not a job.]

**Preconditions**
- [System/business state condition]
- [System/business state condition]

**Success Guarantee**
- [What is true after the main scenario completes]
- [Side effects: events fired, records written, systems notified]

**Main Success Scenario**

| Step | Actor/System | Action |
|------|--------------|--------|
| 1    | [Actor]      | [Action taken by actor] |
| 2    | System       | [System response] |
| 3    | System       | [Next system action] |
| 4    | [Actor]      | [Actor response] |
| 5    | System       | [Final action — triggers success guarantee] |

**Extensions**


2a. [Condition that deviates at step 2]: 1. System [first response] 2. System [second response] → [Where flow resumes, or "Flow ends in failure"]


Example: [Concrete input] → [Concrete expected output]


3a. [Condition at step 3]: 1. [Action] → [Resolution]


Example: [Concrete input] → [Concrete expected output]


3b. [Second possible condition at step 3]: 1. [Action] → [Resolution]


Example: [Concrete input] → [Concrete expected output]


*a. [Condition that can occur at any step]: 1. System [immediate response] 2. System [cleanup / logging action]


Example: [Concrete input] → [Concrete expected output]




**Constraints**
- [NFR-XX]: [One line — what must hold]
- [BR-XX]: [One line — which business rule applies]

**Open Questions**
- [ ] [Unresolved question that affects implementation]
```

### Example

```markdown
### F-01: Route Inbound Call



Level: Flow Primary Actor: Caller



**Jobs to Be Done**

Caller:
  When I need help from a business outside of a conversation,
  I want my question handled immediately without waiting,
  so I can get what I need and move on.

Business Owner:
  When a lead or customer calls my business,
  I want every call handled professionally and logged,
  so I never lose a contact to a missed or mishandled call.

System:
  Capture caller intent accurately and log all outcomes
  so post-call workflows have reliable data to act on.

**Preconditions**
- Business has an active account (see BR-01)
- Receptionist agent is configured with a valid greeting
- A LiveKit room is available

**Success Guarantee**
- Caller's intent has been captured and acted on
- Call transcript is written to the call log
- Post-call workflow has been triggered
- CRM webhook has been dispatched

**Main Success Scenario**

| Step | Actor/System | Action |
|------|--------------|--------|
| 1    | Caller       | Dials the business number |
| 2    | System       | Answers and plays opening greeting |
| 3    | System       | Classifies caller intent (see O-01) |
| 4    | System       | Handles request based on classified intent |
| 5    | Caller       | Confirms outcome and ends call |
| 6    | System       | Logs transcript and triggers post-call workflow |

**Extensions**



2a. No LiveKit room is available at time of call: 1. System plays fallback unavailability message 2. System logs event type NO_ROOM_AVAILABLE 3. System sends missed call alert to business owner → Flow ends in failure


Example: All rooms at capacity → Caller hears fallback,
owner receives SMS alert within 10 seconds


2b. Greeting audio fails to load: 1. System falls back to text-to-speech greeting → Flow continues from step 3


Example: Audio file 404 → TTS greeting plays within 2 seconds


3a. Caller intent classification returns UNKNOWN: 1. System asks one clarifying question 2. If still UNKNOWN after second attempt → offer voicemail → Flow continues from step 4 with intent = VOICEMAIL


Example: Caller says "uh, yeah hi" → System asks
"How can I help you today?" → if still unclear → voicemail


4a. Caller requests to speak to a human: 1. System acknowledges request 2. System offers callback or voicemail 3. System logs escalation type HUMAN_REQUESTED → Flow ends — no post-call workflow triggered


Example: "Can I speak to someone?" → "I can arrange a callback
or take a voicemail — which would you prefer?"


*a. Caller disconnects before step 6: 1. System logs partial transcript with status INCOMPLETE 2. System triggers missed call follow-up if configured → Flow ends in partial failure


Example: Caller hangs up mid-intent-classification →
Partial transcript logged, follow-up SMS sent if enabled




**Constraints**
- NFR-01: System must answer within 6 seconds of call arrival
- NFR-02: First token response must be delivered within 800ms p95
- NFR-05: Raw audio must not be retained beyond 24 hours for medical businesses
- BR-01: Business must be active before call is accepted

**Open Questions**
- [ ] Do we support mid-call agent handoff to a different agent?
- [ ] How do we handle calls from numbers that are already in the CRM?
```

---

## Level 3: Operation

### What It Is

An Operation is a reusable system-level function with no standalone value to an actor. It serves one or more Flows. Write it in casual format — no scenario table, no JTBD, no extensions table.

### When to Extract an Operation

Extract an Operation when either condition holds:

1. **More than one Flow calls the behavior** — always extract. Behavior defined in two places diverges over time.
2. **The behavior has its own failure cases that would clutter the Flow's extensions** — extract even if only one Flow calls it.

Simple inline logic is not an Operation. "Format a date for display" stays inline. "Classify caller intent across a multi-turn exchange with confidence scoring and fallback handling" becomes an Operation.

### How to Write One

Write in plain prose. Cover:

1. Input
2. Processing
3. Output
4. Failure cases — inline, not in an extensions table
5. Which Flows call it and at which step

Nothing more. No JTBD, no scenario table, no constraints. If you need those, you are writing a Flow.

### Template

```markdown
### O-XX: [Operation Name]

[What this operation receives as input.]

[What it does — one or two sentences describing the processing.]

[What it returns on success.]

Failure cases:
- If [condition], returns [result or error]
- If [condition], returns [result or error]

Called by:
- F-XX at step [N]
- F-XX at step [N]
```

### Example

```markdown
### O-01: Classify Caller Intent

Receives a partial transcript of the caller's opening statement
as a string.

Classifies the transcript into one of: BOOKING, INQUIRY,
COMPLAINT, TRANSFER, UNKNOWN. Returns the classification and
a confidence score between 0 and 1.

Returns { intent: IntentType, confidence: float }.

Failure cases:
- If transcript is fewer than 3 words, returns { intent: UNKNOWN, confidence: 0 }
- If confidence score < 0.7, returns { intent: UNKNOWN, confidence: [score] }
- If classification service is unavailable, returns { intent: UNKNOWN, confidence: 0 }
  and logs event type CLASSIFICATION_UNAVAILABLE

Called by:
- F-01 at step 3
- F-02 at step 2
```

---

## Full Document Template

```markdown
# Use Case Document: [Feature Name]

---

## Reviews

| Reviewer | Status | Feedback |
|---|---|---|
| [Name] | Status (not_started, in_progress, approved, changes_requested) | |

---

## 1. Scope

[Mermaid context diagram]

~~~mermaid
graph TD
    ActorA([Actor A])
    ActorB([Actor B])

    subgraph System Boundary: [System Name]
        ComponentA[Component A]
        ComponentB[Component B]
        ComponentC[Component C]
    end

    ExternalA([External System A])
    ExternalB([External System B])

    ActorA -->|[interaction]| ComponentA
    ActorB -->|[interaction]| ComponentB
    ExternalA -->|[data / event]| ComponentA
    ComponentC -->|[data / event]| ExternalB
    ComponentC -->|[notification]| ActorB
~~~

> Anything inside the boundary is in scope.
> Anything outside is a dependency — not owned by this system.

---

## 2. Actors

| Actor | Type | Description |
|---|---|---|
| [Actor] | Human / System | [What they want from this system] |
| [Actor] | Human / System | [What they want from this system] |

---

## 3. Use Case Index

| ID   | Level | Use Case         | Primary Actor | Status      |
|------|-------|------------------|---------------|-------------|
| G-01 | Goal  | [Name]           | —             | Draft       |
| F-01 | Flow  | [Name]           | [Actor]       | Not Started |
| F-02 | Flow  | [Name]           | [Actor]       | Not Started |
| O-01 | Op    | [Name]           | —             | Not Started |

---

## 4. Use Cases

### G-01: [Goal Name]

Business Outcome:
  [What is consistently true for the business when the Flows
  beneath this Goal are all working correctly.]

Flows:
  - F-01: [Name]
  - F-02: [Name]

---

### F-01: [Flow Name]

~~~
Level:          Flow
Primary Actor:  [Actor]
~~~

**Jobs to Be Done**

[Primary Actor]:
  When [situation],
  I want to [motivation],
  so I can [expected outcome].

System:
  [Invariant the system must maintain throughout.]

**Preconditions**
- [State condition]

**Success Guarantee**
- [Postcondition]
- [Side effects]

**Main Success Scenario**

| Step | Actor/System | Action |
|------|--------------|--------|
| 1    | [Actor]      | [Action] |
| 2    | System       | [Response] |

**Extensions**

~~~
2a. [Condition at step 2]:
    1. [Response]
    → [Resolution]

    Example: [Input] → [Output]

*a. [Condition at any step]:
    1. [Response]

    Example: [Input] → [Output]
~~~

**Constraints**
- [NFR-XX]: [What must hold]
- [BR-XX]: [Which rule applies]

**Open Questions**
- [ ] [Unresolved question]

---

### O-01: [Operation Name]

[Input.]

[Processing.]

[Output on success.]

Failure cases:
- If [condition], returns [result]
- If [condition], returns [result]

Called by:
- F-01 at step [N]

---

## 5. Appendix A — Non-Functional Requirements

| ID     | Category     | Constraint |
|--------|--------------|------------|
| NFR-01 | Latency      | When [trigger], the system shall [action] within [threshold]. |
| NFR-02 | Availability | The system shall maintain [uptime] measured [period]. |
| NFR-03 | Compliance   | Where [condition], the system shall [requirement]. |
| NFR-04 | Capacity     | While [state], the system shall support [load]. |

---

## 6. Appendix B — Business Rules

| ID    | Rule |
|-------|------|
| BR-01 | [Precise, testable rule statement] |
| BR-02 | [Precise, testable rule statement] |

---

## 7. Appendix C — Data Dictionary

| Field       | Type   | Constraints              | Notes |
|-------------|--------|--------------------------|-------|
| [field]     | [type] | [not null / enum / etc]  | [Context or derivation] |
| [field]     | [type] | [constraints]            | [Notes] |

---

## Appendix D — Changelog

| Date | Author | Change |
|---|---|---|
| [YYYY-MM-DD] | [Name] | Initial draft |
```