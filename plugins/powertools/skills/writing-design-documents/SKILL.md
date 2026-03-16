---
name: writing-design-documents
description: Write technical design documents that bridge use cases and code — specifying use case implementations, data models, APIs, and architectural decisions.
---
A template for technical design documents that bridge use cases (what the system does) and code (how it's built). A design document specifies the internal structure — components, data models, APIs, and their interactions — needed to implement one or more use cases.

---

# Relationship to Use Cases

Use cases describe system behavior from the outside. The system is a black box: actors act, the system responds. Use cases answer *what does the system do?*

Design documents answer *how does the system do it?* They open the box and specify the components, data models, APIs, and interactions that deliver the behavior use cases define.

Every design document should trace back to one or more use cases. If no use case justifies a design element, that element is speculative.


# Document Structure

Every design document contains these sections in order:

1. **Reviews** — tracker for reviewer status and feedback
2. **Use Case Implementations** — sequence diagrams showing how components collaborate to fulfill each use case
3. **Tables** — data model definitions for persistent storage
4. **APIs** — HTTP endpoint contracts
5. **Testing** — strategy for unit, integration, and end-to-end tests, including any test infrastructure needed
6. **Deployment** — how to ship safely: migrations, data migrations, feature flags, rollback plans
7. **Monitoring** — how to verify the feature works in production: metrics, alerts, dashboards
8. **Decisions** — significant technical choices and their reasoning
9. **Open Questions** — unresolved questions that block or could change the design
10. **Appendix A — Changelog** — dated record of revisions to the document

## Use Case Implementations

A Use Case Implementation is a sequence diagram showing how internal components collaborate to fulfill a use case. It is the central artifact of a design document — the bridge between a black-box Flow and the code that delivers it.

Each Use Case Implementation:

- **References a use case by ID** (e.g., "Implements F-01: Route Inbound Call")
- **Names the internal participants** — servers, databases, external services, queues
- **Shows the interaction sequence** — requests, responses, side effects, loops, and conditional branches
- **Uses Mermaid sequence diagram syntax** for consistency and renderability

### Levels of Detail

Use Case Implementations mirror the use case hierarchy:

| Use Case Level | Implementation Type | Purpose |
|---|---|---|
| Flow (F-XX) | End-to-end implementation | Shows the full interaction across all components for a complete actor goal |
| Operation (O-XX) | Focused implementation | Shows the internal mechanics of a single reusable operation |

An end-to-end implementation for a Flow may reference Operations inline (as labeled steps) or point to their separate focused implementations for detail.

### When to Write One

Write a Use Case Implementation for every Flow. Write a separate focused implementation for an Operation when its internals involve multiple components or non-obvious interactions. Simple Operations — single service call, transform, return — need no diagram.

### How to Write One

1. **Start from the use case.** Read the Flow's main success scenario and extensions. Every scenario step should map to one or more interactions in the diagram.
2. **Name participants precisely.** Use actual component names — not generic labels like "Backend" or "Service." If the use case says "System classifies intent," the implementation shows which component classifies and what it calls.
3. **Show the happy path first.** Use `rect` blocks to group logical phases. Add `note` annotations for side effects (storing tokens, logging events) that produce no response arrow.
4. **Cover extensions.** Each extension from the use case should appear as an `alt` or `opt` block, or as a separate diagram if it would clutter the main one.
5. **Never assume dependency behavior.** Do not guess how dependencies — including the runtime — behave in normal operation or failure modes. If the behavior is not well understood, resolve the ambiguity before writing the diagram:
   1. **Read the code** — check the dependency's source for error handling, return values, and exception types.
   2. **Read the documentation** — look for documented failure modes, error codes, and guarantees.
   3. **Run an experiment** — Use a REPL or sandbox environment and observe the actual behavior.
   4. **If none of these resolve the ambiguity, create an open question.** Reference the question ID (e.g., "See Q-03") in the diagram where the unknown behavior affects the extension. Do not invent behavior.

## Tables

Tables define the data model — the persistent structures that support the use case implementations. This section covers new tables, changes to existing tables, and indices.

### New Tables

Define a new table when a Use Case Implementation reads from or writes to persistent storage that does not yet exist. Do not duplicate table definitions from another design document; reference them instead.

Use a standard column definition format:

| Column Name | Type | Constraints | Notes |
|---|---|---|---|
| id | int | pk | |
| name | string | not null | |
| foreign_id | int | not null, fk | References other_table |

Document constraints and relationships inline. Add a note below the table for compound constraints (unique pairs, check constraints) that do not fit in a single cell.

### Changes to Existing Tables

When a Use Case Implementation requires modifications to a table defined elsewhere, list only the new or changed columns. Reference the original design document so readers can find the full definition.

### Indices

Define indices for each table when query patterns in the Use Case Implementations demand them. Document the index name, columns, and whether it is unique.

## APIs

APIs define the HTTP contracts that Use Case Implementations depend on. Each API entry documents one endpoint — its purpose, request format, and every response the caller may receive.

### When to Define an API

Define an API when a Use Case Implementation shows an HTTP request between components. The implementation diagram shows *that* a call happens; the API section specifies *exactly what* that call looks like.

### How to Write One

Each API entry follows this structure:

1. **Heading** — HTTP method and path (e.g., `POST v1/otps`)
2. **One-line description** — what the endpoint does
3. **Request** — headers, query parameters, and body schema
4. **Responses** — one subsection per status code, each with headers and body schema

List responses in this order: success first, then client errors (4xx), then server errors (5xx). Name each response subsection descriptively (e.g., "Rate Limit Exceeded Response `429`," not "`429`").

## Testing

Testing is the most important section of a design document. A feature without a clear test strategy ships with unknown risk. This section answers three questions:

1. **What do we test?** Map each use case Flow and Operation to the test types that cover it. Every Flow needs at least integration coverage. Every Operation needs at least unit coverage.
2. **How do we test it?** Describe the approach at each level:
   - **Unit tests** — which functions or modules run in isolation? What do you mock, and what stays real?
   - **Integration tests** — which component boundaries do the tests cross? What infrastructure do they need (database, external service stubs)?
   - **End-to-end tests** — which user-facing flows get full-stack coverage? What does the test environment look like?
3. **Do we need to build anything to make testing easy?** Identify test infrastructure gaps. If writing tests for this feature demands painful setup, repetitive boilerplate, or fragile mocks, design the tooling to fix it. Examples: factories, fixtures, test helpers, stub servers, seed scripts. Test infrastructure is first-class work, not an afterthought.

### How to Write One

For each use case in this design document:

1. List the Flow or Operation ID.
2. State which test types cover it (unit, integration, e2e).
3. Describe the approach: what you test, what you mock, what infrastructure you need.
4. Call out any test tooling you must build.

## Deployment

This section describes how to ship the feature safely. A deployment plan prevents production surprises and gives the team a clear rollback path.

Address each that applies:

- **Schema migrations** — new tables, column additions, index changes. State whether migrations are backwards-compatible and whether they can run before the code deploys.
- **Data migrations** — backfills, transformations, or cleanup of existing data. State whether they run online or offline, and estimate their duration at current data volume.
- **Deploy sequence** — if multiple services or components must deploy in a specific order, state the order and the reason.
- **Rollback plan** — what happens if the deploy fails? Can you roll back the code without rolling back the migration? State what you would do.

### How to Write One

1. List every migration (schema and data) in execution order.
2. State compatibility: can old code run against the new schema, and vice versa?
3. Describe the deploy sequence if order matters.
4. Describe the rollback plan.

## Monitoring

This section describes how you will know the feature works after it ships. Without monitoring, you learn about failures from users, not dashboards.

Metrics and logs cost money to ingest. Every metric must tie to a specific Flow or Goal — it should measure the success or failure of that use case. Do not add metrics for internal implementation details, speculative debugging, or "nice to have" visibility. If a metric does not help you answer "is this Flow working?" remove it.

Address each that applies:

- **Metrics** — what new metrics does this feature emit? Each metric must reference the Flow or Goal it monitors (e.g., "F-01 completion rate," "G-01 error rate"). Justify every metric against its use case.
- **Alerts** — what conditions should page someone? State the threshold and severity.
- **Dashboards** — does this feature need a new dashboard or new panels on an existing one? Describe what it shows.
- **Logging** — what structured log fields does this feature add? State the log level and the reason for it. Prefer low-cardinality fields. Avoid verbose logging in hot paths.

### How to Write One

1. List each new metric with its name, type (counter, histogram, gauge), the Flow or Goal it monitors, and what it measures.
2. Define alert conditions with thresholds.
3. Describe dashboard additions.
4. Note any new structured log fields.

## Decisions

Decisions record significant technical choices made during design — choices where alternatives existed and the reasoning matters. They prevent future developers from relitigating settled questions or unknowingly reversing deliberate tradeoffs.

### When to Record a Decision

Record a decision when:

- You chose between two or more viable alternatives
- The choice affects system architecture, dependencies, or operational behavior
- Someone unfamiliar with the project would reasonably ask "why did you do it this way?"

Do not record obvious choices or choices with only one viable option.

### How to Make a Decision

Use a structured framework to choose between alternatives. Pick the framework that fits the nature of the decision:

- **Binstack** — when the decision hinges on strategic fit, priorities, or qualitative attributes. Binstack checks each option against stack-ranked priorities using binary materiality (does this option materially move the needle — yes or no?). Use the `binstack` skill.
- **Fermi ROI** — when the decision hinges on cost, effort, or return on investment. Fermi ROI estimates impact and effort at orders of magnitude, then ranks by ROI. Use the `fermi-roi` skill.

If neither framework fits — the decision has a single dominant criterion or is too simple to warrant analysis — state the criterion and the choice directly.

### How to Write One

1. **State the decision** as a heading
2. **State the framework used** — Binstack, Fermi ROI, or direct criterion
3. **Show the analysis** — include the key artifacts from the framework (priority stack and materiality checks for Binstack; impact metric, effort brackets, and ROI ranking for Fermi ROI). Keep it brief — summarize rather than reproduce the full analysis
4. **State why the winner won** — in terms the framework provides (materiality on the top priority, highest ROI, etc.)
5. **List alternatives considered** — name each and state why you rejected it, in one line
6. **Link documentation** — if the chosen tool or technology has relevant docs, link them

## Open Questions

Open questions track unresolved issues that block or could change the design. They make unknowns visible so reviewers can address them and so the team does not ship a design with hidden gaps.

### When to Add a Question

Add a question when:

- You do not know how a dependency or external system behaves in a specific case
- A decision depends on information you do not yet have (stakeholder input, benchmark results, API behavior)
- Two reasonable approaches exist and you lack the data to choose between them

### How to Write One

Each question is a row in a status table:

- **ID** — sequential identifier (Q-01, Q-02, …) for reference in other sections
- **Question** — the specific thing you need answered, stated as a question
- **Status** — one of: `open`, `resolved`, `won't resolve`
- **Resolution** — blank while open; the answer and any resulting design changes once resolved

Reference open questions from other sections when they affect the design. For example, a Use Case Implementation might note "See Q-03" where behavior depends on an unanswered question.


---

# Full Document Template

```markdown
---
tags: [project], tdd
summary: "[Feature] technical design document"
locked: false
---

# Reviews

| Reviewer | Status | Feedback |
|---|---|---|
| [Name] | Status (not_started,       
  in_progress, approved, changes_requested) | |

---

# Use Case Implementations

## [Implementation Name] — Implements [F-XX]: [Flow Name]

~~~mermaid
sequenceDiagram
    participant A as [Component A]
    participant B as [Component B]
    participant C as [External Service]

    rect rgb(240, 248, 255)
    note over A,B: [Phase Name]
    A->>B: [Request]
    B-->>A: [Response]
    end

    rect rgb(255, 248, 240)
    note over B,C: [Phase Name]
    B->>C: [Request]
    C-->>B: [Response]
    note over B: [Side effect]
    end
~~~

## [Operation Implementation Name] — Implements [O-XX]: [Operation Name]

~~~mermaid
sequenceDiagram
    participant S as [Component]
    participant E as [External Service]
    participant L as [Another Service]

    S->>E: [Request]
    E-->>S: [Response]
    S->>L: [Request]
    L-->>S: [Response]
    note over S: [Processing step]
~~~

---

# Tables

## [table_name]

| Column Name | Type | Constraints | Notes |
|---|---|---|---|
| id | int | pk | |
| [column] | [type] | [constraints] | [notes] |

---

# APIs

## [Endpoint Name] `[METHOD] [path]`

[One-line description.]

### Request

- Headers
    - content-type: `application/json`
    - authorization: `Bearer <jwt>`
- Body
    - [resource]: object
        - [field]: [type]

### Success Response `[status code]`

- Headers
    - content-type: `application/json`
- Body
    - [resource]: object
        - [field]: [type]

### [Error Name] Response `[status code]`

- Headers
    - content-type: `application/json`
- Body
    - error: object
        - code: int
        - message: string

---

# Testing

## Test Coverage

| Use Case | Type | Unit | Integration | E2E |
|---|---|---|---|---|
| [F-XX]: [Name] | Flow | | x | |
| [O-XX]: [Name] | Op | x | | |

## Test Approach

### Unit Tests

[What functions or modules run in isolation. What you mock, what stays real.]

### Integration Tests

[Which component boundaries the tests cross. What infrastructure they need.]

### End-to-End Tests

[Which user-facing flows get full-stack coverage. What the test environment looks like.]

## Test Infrastructure

[Any factories, fixtures, helpers, stub servers, or seed scripts this feature requires. Omit if none.]

---

# Deployment

## Migrations

| Order | Type | Description | Backwards-Compatible |
|---|---|---|---|
| 1 | schema | [Description] | yes/no |
| 2 | data | [Description] | yes/no |

## Deploy Sequence

[Order of operations if multiple services must deploy in sequence. Omit if single deploy.]

## Rollback Plan

[What to do if the deploy fails. Whether code can roll back independently of migrations.]

---

# Monitoring

## Metrics

| Name | Type | Use Case | Description |
|---|---|---|---|
| [metric_name] | counter/histogram/gauge | [F-XX or G-XX] | [What it measures] |

## Alerts

| Condition | Threshold | Severity |
|---|---|---|
| [What triggers it] | [Value] | [page/warn] |

## Dashboards

[New dashboards or panels needed. What they show. Omit if none.]

## Logging

[New structured log fields. Log level and reason. Omit if none.]

---

# Decisions

## [Decision statement]

**Framework:** [Binstack / Fermi ROI / Direct criterion]

[Brief analysis summary. For Binstack: priority stack and materiality results. For Fermi ROI: impact metric, effort brackets, and ROI ranking. For direct criterion: the criterion and why it decided the matter.]

**Choice:** [Winner and why it won, stated in the framework's terms.]

### Alternatives Considered
- **[Alternative]:** [why rejected]

### Documentation
- [Relevant links]

---

# Open Questions

| ID | Question | Status | Resolution |
|---|---|---|---|
| Q-01 | [Specific question] | open | |

---

# Appendix A — Changelog

| Date | Author | Change |
|---|---|---|
| [YYYY-MM-DD] | [Name] | Initial draft |
```
