# Methods for Recording Design Decisions

A set of methods for defining and documenting implicit design decisions as explicit technique.

## Table of Contents

- [Design Decision Record (DDR)](#design-decision-record-ddr)
- [QOC (Questions, Options, Criteria)](#qoc-questions-options-criteria)
- [RFC Process](#rfc-process)
- [Traceability Chain](#traceability-chain)
- [Automating Decisions with Machine Verification](#automating-decisions-with-machine-verification)
- [Deprecation Policy](#deprecation-policy)

---

## Design Decision Record (DDR)

The design version of an Architecture Decision Record (ADR). Records design decisions in a structured form.

### Template

```markdown
# DDR-001: [Decision title]

## Status
Proposed | Accepted | Rejected | Superseded by DDR-XXX

## Context
- Background that made the decision necessary
- Related design principles
- Affected components/screens

## Decision
A clear statement of the chosen approach.

## Alternatives Considered
1. [Alternative A] — reason not chosen
2. [Alternative B] — reason not chosen

## Rationale
- Technical basis
- Usability basis
- Alignment with business requirements
- Impact on accessibility

## Consequences
### Positive
- [Good effect]

### Negative
- [Bad effect / technical debt]

### Mitigation
- [How to address the negative effect]

## Review
- Re-evaluation trigger: [condition]
- Next review: [date]
```

### DDR Operating Rules

1. Always create one when adding a new Foundation element or component
2. Change existing DDRs by migrating to a new DDR via `Superseded by DDR-XXX` (do not edit directly)
3. Manage DDRs in the code repository and make them subject to PR review
4. Always run the status through the `Proposed → Accepted` flow

---

## QOC (Questions, Options, Criteria)

Proposed by MacLean et al. (1991). Structures a decision by "question, options, evaluation criteria." Lighter than a DDR; suited to the early stage of a decision.

### Template

```markdown
## Q: [Design question]
e.g., Should dark-mode color inversion be auto-computed or manually defined?

### Options
| # | Option | Description |
|---|--------|-------------|
| 1 | Auto-invert | Auto-generate by inverting HSL Lightness |
| 2 | Manual definition | Define separate dark Global Tokens |
| 3 | Hybrid | Auto by default, semantic colors manual |

### Criteria
| Criterion | Weight | Opt 1 | Opt 2 | Opt 3 |
|-----------|--------|-------|-------|-------|
| Maintenance cost | High | ◎ | △ | ○ |
| Color quality | High | △ | ◎ | ○ |
| Implementation complexity | Medium | ○ | ○ | △ |

### Decision: Option 3 (Hybrid)
Reason: best balance of maintenance cost and color quality.
```

### DDR vs. QOC

| Situation | Method |
|-----------|--------|
| Early decision exploration | Use QOC to organize options and criteria |
| Final decision record | Use DDR to formally record the decision |
| Minor decisions | QOC alone is enough |
| Major decisions (Foundation changes, etc.) | Two stages: QOC → DDR |

---

## RFC Process

Openly review change proposals on a PR basis. The Rust RFC process is a reference.

### RFC Template

```markdown
# RFC: [Proposal title]

## Summary
Summarize the change in 1–2 sentences.

## Motivation
Why this change is needed.

## Detailed Design
Concrete changes (token definitions, component specs, etc.).

## Alternatives
Other approaches considered.

## Breaking Changes
Impact on existing components and the migration plan.

## Unresolved Questions
Points that need discussion.
```

### RFC Operating Rules

1. Breaking changes must always go through an RFC
2. Adding new components is RFC-recommended (not mandatory)
3. Minimum review period of 3 business days
4. Approval requires agreement from the DS management team + a representative of the consuming teams

---

## Traceability Chain

Track the correspondence design principle → token → component → screen.

```markdown
| Principle | Semantic Token | Component Token | Applied screen |
|-----------|----------------|-----------------|----------------|
| Accessibility first | color-text-primary (7:1) | button-text-primary | All CTA buttons |
| Consistency | space-component-gap: 16px | card-gap, list-gap | Card lists, lists |
| Simplicity | font-size-body: 16px | — | All body text |
```

### Operation

1. On Foundation changes, use the traceability chain to check the scope of impact
2. When adding a new component, state the corresponding principle explicitly
3. Re-examine the justification of any token not tied to a principle

---

## Automating Decisions with Machine Verification

Automatically verify part of the decisions in CI/CD.

| Tool | What it verifies |
|------|------------------|
| stylelint / eslint | Forbid direct token references, enforce naming conventions |
| axe-core | Verify contrast ratio, ARIA attributes |
| BackstopJS / Loki | Visual Regression (detecting appearance regressions) |
| css-analyzer | Overview of the whole CSS color/typography distribution |

### Example lint config (assumes custom rules are implemented)

```json
{
  "rules": {
    "custom/no-global-token-direct-use": true,
    "custom/semantic-token-naming": "^(color|font|space|shadow|radius|duration|breakpoint)-",
    "custom/component-token-naming": "^[a-z]+-[a-z]+-"
  }
}
```

---

## Deprecation Policy

Lifecycle management of DDRs / tokens / components.

### Lifecycle

```
Active → Deprecated → Removed
```

### Deprecation Rules

1. When declaring `Deprecated`, always state the replacement
2. The deprecation period is at least 2 sprints (or 1 month)
3. Do not move to `Removed` until usage reaches zero
4. Track the decision's replacement via `Superseded by DDR-XXX` in the DDR

## References

- MADR: https://adr.github.io/madr/
- QOC: MacLean et al., 1991 https://doi.org/10.1080/07370024.1991.9667168
- Rust RFCs: https://github.com/rust-lang/rfcs
- GOV.UK Contribution Criteria: https://design-system.service.gov.uk/community/contribution-criteria/
