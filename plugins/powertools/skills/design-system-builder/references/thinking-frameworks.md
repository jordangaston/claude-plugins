# Thinking Frameworks — Detailed Reference

Details of, and relationships between, the thinking frameworks applied when building a design system.

## Table of Contents

- [Combining the Frameworks](#combining-the-frameworks)
- [Double Diamond](#double-diamond)
- [Atomic Design](#atomic-design)
- [The 3-Layer Design Tokens Model](#the-3-layer-design-tokens-model)
- [Supporting Frameworks](#supporting-frameworks)

---

## Combining the Frameworks

A single framework is not enough. Layering the following 4 axes is most effective:

```
Problem definition: Double Diamond — find the right problem, build the right solution
Structuring:        Atomic Design  — a shared language to decompose/recompose UI
Implementation contract: Design Tokens — connect design decisions directly to code
Decision recording: DDR/QOC/RFC    — ensure decisions are reproducible and hand-offable
```

### Mapping to DS Build Phases

| DS phase | Double Diamond | Atomic Design | Design Tokens |
|----------|----------------|---------------|---------------|
| Phase 1: Discover | Discover (diverge) | — | — |
| Phase 2: Define | Define (converge) | — | — |
| Phase 3: Foundation design | Develop (diverge) | Sub-atomic particles | Layer 1–2 definition |
| Phase 4: Components | Deliver (converge) | Atoms→Pages | Layer 3 definition |
| Phase 5: Adopt | — | — | Token distribution |
| Phase 6: Operate | — | Hierarchy maintenance | Token updates |

---

## Double Diamond

A model that repeats diverge→converge twice (Diamond 1 finds the right problem; Diamond 2 builds the right solution).

### Applying It to DS Building

**Diamond 1 (problem side)**: decide the "what" of the DS build
- Discover: UI inventory, issue collection, stakeholder interviews
- Define: converging design principles, finalizing priorities, initial DDR records

**Diamond 2 (solution side)**: decide the "how" of the DS build
- Develop: consider multiple token-design options, select Foundation elements
- Deliver: finalize the token system, lock down component specs

### Practical Notes

- Don't let it end as a "good discussion." Decide the Deliver deliverable spec in advance
- Keep the flexibility to move between diamonds. If a new problem surfaces in Phase 3, return to Phase 2

---

## Atomic Design

### Positioning in a DS Build

Use Atomic Design **as a thinking model, not a strict taxonomy** (Brad Frost himself says this). Adjust labels and rules to fit your team. In a DS build, the Sub-atomic layer below Atoms corresponds to the Design Tokens Foundation definition.

### Criteria for Deciding a Level

Decision flow when unsure:

```
Can it be decomposed further?
├── NO → Atom
└── YES → Can it be reused independently?
    ├── NO → Molecule
    └── YES → Does it define page structure?
        ├── YES → Template
        └── NO → Organism
```

---

## The 3-Layer Design Tokens Model

### Layer Definitions and Reference Rules

```
Layer 1: Global Tokens (foundation tokens)
  Platform-independent raw values. Name them by "appearance."
  e.g., blue-500, font-size-16, spacing-4

     ↓ alias reference

Layer 2: Semantic Tokens (meaning tokens)
  Express intent/role. Name them by "purpose."
  e.g., color-primary, color-error, text-body, space-component-gap

     ↓ alias reference

Layer 3: Component Tokens
  Bindings specific to a particular component.
  e.g., button-bg-primary, card-padding, input-border-color
```

**Iron rule**: Components reference Layer 3 only. Forbidding direct references to Layer 1 makes theme switching (dark/light, brand variants) safe.

### W3C Design Tokens Format (2025.10 stable version)

```json
{
  "color": {
    "blue": {
      "500": {
        "$type": "color",
        "$value": "#3B82F6"
      }
    },
    "primary": {
      "$type": "color",
      "$value": "{color.blue.500}"
    }
  },
  "button": {
    "bg": {
      "primary": {
        "$type": "color",
        "$value": "{color.primary}"
      }
    }
  }
}
```

- `{token.name}` syntax for alias references
- `$extends` property for theme management (light/dark)
- Vendor-neutral format (tool support depends on the version; design assuming a conversion layer)

### Naming Conventions

| Layer | Pattern | Example |
|-------|---------|---------|
| Global | `{category}-{variant}-{scale}` | `blue-500`, `font-size-16` |
| Semantic | `{category}-{role}` | `color-primary`, `color-error` |
| Component | `{component}-{property}-{variant}` | `button-bg-primary` |

### Traceability Chain

Tracking from design principle down to component:

```
Principle: Accessibility > beauty
  → Semantic Token: color-text-primary (contrast 7:1)
    → Component Token: button-text-primary
      → Screen: dashboard CTA button
```

---

## Supporting Frameworks

### Nathan Curtis's "Doneness Matrix"

A framework for evaluating component completeness across multiple axes. Used in Phase 4.

### The 60-30-10 Rule (Color Ratio)

Color-balance guidance when defining the Foundation:
- 60%: dominant (background)
- 30%: secondary (supporting)
- 10%: accent (emphasis)

### Type Scale Ratios

| Ratio | Use |
|-------|-----|
| Minor Third (1.2) | Information-dense UI |
| Major Third (1.25) | General web apps (recommended) |
| Perfect Fourth (1.333) | Heading-focused UI |

## References

- W3C Design Tokens Format 2025.10: https://www.w3.org/community/reports/design-tokens/CG-FINAL-format-20251028/
- Atomic Design: https://atomicdesign.bradfrost.com/chapter-2/
- Design Council Double Diamond: https://www.designcouncil.org.uk/our-resources/framework-for-innovation/
