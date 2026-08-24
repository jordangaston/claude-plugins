# Design System Governance

Governance design for the continuous maintenance and improvement of a design system.

## Table of Contents

- [Governance Models](#governance-models)
- [Contribution Flow](#contribution-flow)
- [Versioning](#versioning)
- [Auditing](#auditing)
- [KPIs and Measurement](#kpis-and-measurement)
- [Governance Lessons from Real Examples](#governance-lessons-from-real-examples)

---

## Governance Models

### The Three Models

| Model | Decision-making | Contribution | Suited organization |
|-------|-----------------|--------------|---------------------|
| Centralized | Dedicated DS team | DS team only | Small–medium, startup phase |
| Federated | DS team + team representatives | All teams (within guidelines) | Medium–large |
| Community-driven | Community vote | Anyone | Large / OSS |

### Selection Criteria

```
Teams ≤ 3 → Centralized (prioritize speed)
Teams 4–10 → Federated (balance)
Teams > 10 or OSS → Community-driven (scalability)
```

### Structure of the Federated Model (recommended)

```
DS Core Team (2–3 people)
  ├── Set policy and principles
  ├── Manage Foundation/Tokens
  ├── Review contributions
  └── Maintain quality standards

DS Champions (1 per team)
  ├── Drive the DS within the team
  ├── Aggregate feedback and requests
  └── Make contributions
```

---

## Contribution Flow

### Adding a New Component

```
1. Proposal
   ├── Articulate the need (which screen lacks what)
   ├── Confirm no existing component can substitute
   └── Create an RFC/Issue

2. Design
   ├── Record the design decision in a DDR
   ├── Define the spec across each axis of the Doneness Matrix
   └── Design review

3. Implementation
   ├── Code implementation + unit tests
   ├── Add Storybook/documentation
   └── Accessibility testing

4. Review
   ├── Quality check by the DS Core Team
   ├── Feedback from consuming teams
   └── Approval or change request

5. Release
   ├── Version bump
   ├── Record the changelog
   └── Announce the usage guide
```

### Quality Standards (GOV.UK reference)

Approval criteria for a contribution:

| Criterion | Description |
|-----------|-------------|
| Usefulness | Reused across multiple teams/screens |
| Consistency | In line with existing design principles/patterns |
| Accessibility | WCAG 2.1 AA compliant |
| Tested | Passes unit tests + Visual Regression tests |
| Documented | Usage guide, Props spec, and Do/Don't are described |

---

## Versioning

### Semantic Versioning

```
MAJOR.MINOR.PATCH

MAJOR: Breaking changes (token renames, component API changes)
MINOR: Backward-compatible feature additions (new components, new variants)
PATCH: Bug fixes, documentation updates
```

### Managing Breaking Changes

1. **Advance notice**: propose the change in an RFC and allow a review period (minimum 3 business days)
2. **Deprecation period**: keep the old API with `@deprecated` for at least 2 sprints
3. **Migration guide**: provide Before/After corresponding code
4. **Codemods**: provide automatic migration scripts wherever possible

### Changelog

```markdown
## [2.0.0] - YYYY-MM-DD

### Breaking Changes
- Renamed `color-primary` → `color-brand-primary`
  - Migration: `npx ds-codemod rename-token color-primary color-brand-primary`

### Added
- Added `Badge` component
- Added `color-surface-*` semantic tokens

### Fixed
- Fixed an issue where `Button`'s focus ring was below 3:1
```

---

## Auditing

### Periodic Audit (quarterly recommended)

| Check item | Method |
|------------|--------|
| Token usage rate | Detect unused tokens via codebase search |
| Component adoption rate | Measure usage sites of non-DS components |
| Accessibility | Scan all screens with axe-core |
| Visual Regression | Detect diffs against the baseline |
| Documentation freshness | Flag docs older than 90 days since last update |

### Audit Scoring

Evaluate each area on a 0–2 scale:

| Score | Meaning |
|-------|---------|
| 0 | Not addressed or has a serious problem |
| 1 | Partially addressed, needs improvement |
| 2 | Sufficiently addressed, meets the bar |

---

## KPIs and Measurement

### Core KPIs

| KPI | Measurement | Target |
|-----|-------------|--------|
| Adoption rate | DS components / all components | >80% |
| Consistency violations | Number of UI elements deviating from the DS | Decreasing month over month |
| Exception requests | Number of formal exceptions for non-DS components | <5 per month |
| Fix lead time | Average days from bug report to fix merge | <5 business days |
| Contributions | Number of contribution PRs from external teams | Increasing month over month |

### Automating Measurement

- Auto-aggregate component usage rate in CI/CD
- Track documentation reference frequency via Storybook access logs
- Dashboard the trend in the number of lint violations

---

## Governance Lessons from Real Examples

### GOV.UK Design System

- Evidence-based contribution criteria
- "Sufficiently tested" and "useful across multiple services" are approval conditions
- Reference: https://design-system.service.gov.uk/community/contribution-criteria/

### Carbon Design System (IBM)

- Open-source federated model
- GitHub Issue-based proposal/discussion process
- Governance covers not just components but up to the UI-pattern level

### Polaris (Shopify)

- Documentation centered on visual examples
- Makes explicit not only "what to do" but also "what not to do" (Don't)
- Reference: https://polaris.shopify.com
