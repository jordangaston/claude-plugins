---
name: design-system-builder
description: "A skill for systematically building and operating design systems. It designs everything end to end — from documents (requirements, brand guidelines) through Design Tokens, a component system, and governance. It integrates the application of thinking frameworks (Double Diamond, Atomic Design, the 3-layer Design Tokens model), the codification of implicit design decisions into explicit knowledge (DDR/QOC/RFC), and UI inventory collection (manual + MCP automation). Intended for building systematically from scratch. Use when the user says: 'build a design system,' 'design a design system,' 'define design tokens,' 'establish design principles,' 'create a UI inventory,' 'design design governance,' or 'record design decisions.'"
---

# Design System Builder

Systematically build and operate a design system. Proceed using the Double Diamond diverge→converge model, managing each phase's deliverables as contracts.

## Workflow Overview

```
Phase 1: Discover  → UI inventory, surfacing issues
  → Phase 2: Define → design principles, converging decision criteria
    → Phase 3: Develop (foundation design) → Design Tokens, Foundation definition
      → Phase 4: Build components (Deliver) → Atomic Design structuring
        → Phase 5: Adopt / migrate → phased release, migrating existing UI
          → Phase 6: Operate → governance, continuous improvement
```

---

## Phase 1: Discover

**Purpose**: Divergently collect current design assets and issues.

### Entry Criteria
- There is a decision to build a design system
- The target product/scope has been identified

### Step 1.1: UI Inventory (Stocktake)

Collect and classify every element of the existing UI via screenshots + CSS properties.

**Manual approach**:
1. Create a list of target screens (routes/sitemap/key user flows)
2. Record the UI elements of each screen with screenshots
3. Classify buttons, forms, navigation, modals, etc. by category
4. Mark inconsistencies (elements with the same purpose but different styles)

**Automated approach** (MCP integration):
Quantitative collection is possible with Playwright MCP + Chrome DevTools MCP.
When using automated collection, refer to → [references/ui-inventory.md](references/ui-inventory.md)

### Step 1.2: Decomposing Input Documents

Separate requirements and brand guidelines into 3 categories:

| Category | Content | Example |
|----------|---------|---------|
| Facts | Immutable constraints | Brand color #003366, font Noto Sans |
| Constraints | Technical/business limits | WCAG 2.1 AA required, both iOS/Android supported |
| Interpretations | Require team judgment | Making a "friendly" tone concrete |

### Step 1.3: Cross-Organizational Issue Collection

Collect issues from designers, engineers, PMs, marketing, etc.:
- Where design inconsistencies occur
- Which UI patterns are frequently rebuilt
- Communication misalignments between teams

### Exit Criteria / Deliverables
- `ui-inventory.json` — results of the UI element stocktake
- `design-brief.md` — summary of target, scope, constraints, and issues

---

## Phase 2: Define

**Purpose**: Converge the diverged information and establish decision criteria.

### Entry Criteria
- The UI inventory is complete
- The main issues have been identified

### Step 2.1: Creating Design Decision Cards

Codify implicit design decisions into explicit knowledge:

```
Card name:        [name of the decision]
Intent:           why this decision was made
When to apply:    when to use it
When not to use:  when not to use it
Exceptions:       cases allowed as exceptions
Rationale:        evidence (user test results, a11y standards, etc.)
```

### Step 2.2: Converging on Design Principles

Converge to 3–5 design principles. Make the priority order explicit for when they conflict.

Example:
```
1. Accessibility > beauty
2. Consistency > local optimization
3. Simplicity > feature completeness
```

### Step 2.3: Starting the Design Decision Record (DDR) Process

Establish a process for recording design decisions.
When you need how to write DDRs / QOC / RFC operations, refer to → [references/design-decision-records.md](references/design-decision-records.md)

### Exit Criteria / Deliverables
- `design-principles.md` — prioritized design principles
- `decision-log/DDR-NNN.md` — DDR files (following the DDR template)

---

## Phase 3: Develop (Foundation Design)

**Purpose**: Define Design Tokens and foundation elements.

### Entry Criteria
- Design principles are finalized
- Input documents for color and typography exist

### Step 3.1: The 3-Layer Design Tokens Architecture

```
Layer 1: Global Tokens (foundation)
  Raw color values, raw font-size values
  e.g., blue-500: #3B82F6, font-size-16: 16px

Layer 2: Semantic Tokens (meaning)
  Aliases that express intent
  e.g., color-primary: {blue-500}, text-body: {font-size-16}

Layer 3: Component Tokens
  Component-specific bindings
  e.g., button-bg-primary: {color-primary}
```

**Principle**: Components reference Layer 3 only. Direct references to Layer 1 are forbidden.

### Step 3.2: Foundation Definition

| Element | What to define | Token example |
|---------|----------------|---------------|
| Color | Primary/Secondary/Semantic + lightness scale (50–950) | `color-primary-500` |
| Typography | Font, size scale, line height, weight | `font-size-lg` |
| Spacing | 4px/8px-based scale | `space-4: 16px` |
| Elevation | Shadow, layering | `shadow-md` |
| Border radius | Corner-radius scale | `radius-md: 8px` |
| Motion | Duration, easing | `duration-fast: 150ms` |
| Breakpoints | Responsive baselines | `breakpoint-md: 768px` |

### Step 3.3: Outputting the Token File

Generate `tokens.json` compliant with the W3C Design Tokens Format (2025.10 stable version).

When you need the relationships between frameworks or details of the W3C DTCG spec, refer to → [references/thinking-frameworks.md](references/thinking-frameworks.md)

### Exit Criteria / Deliverables
- `tokens.json` — a W3C DTCG-compliant Design Tokens file
- `foundation-spec.md` — the Foundation definition document

---

## Phase 4: Build Components (Deliver)

**Purpose**: Build the component system using the Atomic Design hierarchy.

### Entry Criteria
- Design Tokens are defined
- The Foundation spec is finalized

### Step 4.1: Designing the Component Hierarchy

| Level | Definition | Examples |
|-------|------------|----------|
| Atoms | Smallest UI elements | Button, Input, Icon, Badge |
| Molecules | Combinations of Atoms | SearchBar, FormField, NavItem |
| Organisms | Composites of Molecules | Header, Sidebar, DataTable |
| Templates | Page structure | DashboardLayout, AuthLayout |
| Pages | Finished forms with real content | DashboardPage, LoginPage |

### Step 4.2: Component Specifications

Define the following for each component:
- Name (PascalCase), description (one sentence)
- Props (type, default value, required/optional)
- States (Idle/Hover/Active/Focused/Disabled/Loading/Error)
- Variants (size, variant)
- Accessibility requirements (ARIA attributes, keyboard operation)
- Design Tokens used

### Step 4.3: Doneness Matrix

Manage each component's completeness by axis:

| Axis | Check items |
|------|-------------|
| Design | Figma component created, variants defined |
| Code | Implementation complete, unit tests passing |
| Documentation | Usage guidelines, Do/Don't |
| Accessibility | WAI-ARIA compliant, keyboard operation supported |
| Review | Design review and code review complete |

### Exit Criteria / Deliverables
- `component-spec.md` — the component specification
- The Doneness Matrix score meets the bar on every axis

---

## Phase 5: Adopt / Migrate

**Purpose**: Roll the design system out to the organization in stages.

### Entry Criteria
- A minimal Foundation + key components are complete

### Step 5.1: Phased Release

| Stage | Criteria | Audience |
|-------|----------|----------|
| Alpha | Prove the direction, collect feedback | One team only |
| Beta | Production-usable quality | Early-adopter teams |
| GA | All features stable | All teams |

### Step 5.2: Migration Plan for Existing UI

1. Prioritize: start with high-frequency screens and high-inconsistency screens
2. Design a compatibility layer: define the coexistence period with old styles
3. Set a deprecation deadline: state the retirement date for old components explicitly
4. Provide a migration guide: a Before/After mapping table

### Step 5.3: Education / Onboarding

- Workshops for teams
- A quick reference for "when and which component to use"
- Communicating the exception-request process

### Exit Criteria / Deliverables
- `migration-plan.md` — migration plan (priorities, compatibility layer, deprecation deadlines)
- `adoption-metrics.json` — adoption KPIs (including adoption rate, consistency violations, number of exception requests, and fix lead time)

---

## Phase 6: Operate

**Purpose**: Continuously maintain and improve the design system.

### Entry Criteria
- GA has been released

### Step 6.1: Choosing a Governance Model

| Model | Characteristics | Suited organization |
|-------|-----------------|---------------------|
| Centralized | A dedicated team manages everything | Small to medium |
| Federated | Dedicated team + contributions from each team | Medium to large |
| Community-driven | Open collaborative management | Large / OSS |

### Step 6.2: KPIs

| KPI | Description | Example target |
|-----|-------------|----------------|
| Adoption rate | Usage rate of DS components | >80% |
| Consistency violations | Number of UIs deviating from the DS | Decreasing month over month |
| Exception requests | Exception requests for non-DS components | <5 per month |
| Fix lead time | Average time from bug report to fix | <5 business days |

When you need to design the contribution flow, versioning, or audits, refer to → [references/governance.md](references/governance.md)

### Exit Criteria
- The governance process is operational
- A KPI monitoring system is established

---

## Related Skills

| Skill | When to coordinate |
|-------|--------------------|
| practical-ui | Design individual screens using the DS deliverables (principles, tokens, component specs) as input |
| refactoring-ui | Apply visual polish and depth once tokens and components exist |
| double-diamond | Deepen the diverge→converge facilitation used across Phases 1–4 |
| system-design | After the DS is built, generate implementation specifications |

## Notes

- Treat the DS as a "continuous process," not a "project"
- Don't try to complete all phases at once. Reach sufficient agreement in Phases 1–2 before moving on to Phase 3 and beyond
- Concrete per-screen design work (specific layout, color, and typography design) is out of scope for this skill. This skill focuses on "designing the design"
- If a DS already exists, start from the Phase 1 UI inventory as a DS audit
