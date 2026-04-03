---
name: naming-guidelines
description: >
  Apply professional naming guidelines to code identifiers — variables, constants, classes,
  methods, parameters, and collections. Use this skill whenever someone asks how to name
  something in code, whether a name is good, how to improve a name, what's wrong with an
  existing name, or how to make code more readable through better naming. Also trigger when
  someone shares code with names like `foo`, `data`, `temp`, `flag`, `i`, `j`, `manager`,
  `handler`, `doIt`, `getX`, or names that use abbreviations, numeric suffixes, or type
  prefixes. This skill consolidates guidelines from multiple sources — Ottenstein, Relf,
  Lawrie et al., Benlarbi, and others — as presented by Peter Hilton's naming guidelines
  for professional programmers. Domain-agnostic: applies to any language or codebase.
---

# Naming Guidelines for Professional Programmers

## Why naming matters

Identifier names comprise 33% of tokens and 72% of characters in large codebases. Studies
confirm that full-word identifiers aid understanding better than abbreviations or single
letters. The biggest ROI in code readability is naming — not comments, not documentation.

Most teams acknowledge naming is important but have no written guidelines. This skill
provides that foundation.

## How to use this skill

When reviewing or improving names, work through the applicable category below. Each guideline
states the rule, what violation looks like, and how to fix it.

A name must pass **all applicable guidelines**. Start with Syntax, then Vocabulary, then the
type-specific guidelines for the kind of identifier being named.

---

## Syntax Guidelines

These govern the structure and format of names, independent of meaning.

### Follow language conventions
Apply standard casing with rigorous consistency. Use language-specific inspection tools to
enforce it.

Violations: `appleCOUNT`, `apple_count` in a camelCase language.

### Replace numeric suffixes
Never add numbers to distinguish identifiers with the same base name. Replace the number
with words that describe the actual difference.

Violations: `employee2`, `result1`, `config3`.

### Use dictionary words only
Only use correctly-spelled dictionary words and abbreviations that appear in a dictionary.
Exceptions: `id`, and documented domain-specific abbreviations.

Spelling mistakes create ambiguity. Abbreviations introduce a different kind of ambiguity —
the original author knows which word it stands for, but readers don't.

Violations: `acc`, `pos`, `char`, `mod`, `auth`, `appCnt`, `usr`, `pwd`.

Refactoring: Write words out in full. Define abbreviations explicitly for the bounded context.

### Expand single-letter names
No exceptions for single-letter names — use dictionary words. Single-letter names introduce
maximum ambiguity and are not searchable.

Research finding: "Full-word identifiers lead to the best comprehension; however, in many
cases there is no statistical difference between using full words and abbreviations." (The
implication: abbreviations are never better, only sometimes equivalent — so default to full
words.)

Violations: `i`, `j`, `k`, `l`, `m`, `n`, `t`, `x`, `y`, `z`.

### Don't use symbolic names
Don't use ASCII art symbols as identifiers in languages that permit it. Very limited
exceptions for documented domain-specific symbols (e.g. arithmetic operators).

Violations: `>=>`, `<*>` (Scala function names colloquially called "fish" and "space ship").

### Name constants by concept, not value
Name what the constant represents — not its value.

Violations: `3.14159`, `ONE_HUNDRED`, `SEVEN`.
Corrections: `pi`, `boiling_point`, `max_retries`.

### Only one underscore at a time
Multiple consecutive underscores look like a single line and are impossible to count reliably.

Violations: `APPLE__COUNT`.

### Underscores only between words
Don't use underscores as prefixes or suffixes.

Violations: `_APPLE_COUNT`, `APPLE_COUNT_`.

### Keep names under 20 characters
A name longer than 20 characters is a signal to either simplify or extract an intermediate
declaration.

Violations: `ForeignDomesticAppleCount`.

### Keep names to 4 words maximum
Limit to words a reader can parse at a glance. Avoid gratuitous context — don't prefix every
name with the system or module name.

Violations: `NewRedAppleSizeType`, `MyAppSizeType`, `OrderServiceManagerHelperUtil`.

### Use suffixes for qualifiers
Suffixes like `minimum`, `count`, `average`, and `total` link a derived value back to its
source concept naturally. Prefixes break the visual grouping.

Violations: `MINIMUM_APPLE_COUNT`.
Correction: `APPLE_COUNT_MINIMUM`.

### Make names unique in scope
Don't let a local variable shadow a field with the same name. Add words to clarify the
difference between contexts.

---

## Vocabulary Guidelines

These govern word choice — precision, clarity, and consistency.

### Describe meaning
The name must describe a recognisable concept with enough context. Never use placeholder names.

Violations: `foo`, `blah`, `flag`, `temp`, `data2`, `stuff`.

### Be precise
Identify a specific kind of information and its purpose. Imprecise words apply equally to
multiple identifiers and fail to distinguish them.

Violations: `data`, `object`, `info`, `value` used without qualification.

### Choose concrete words
Use words with a single clear meaning. Abstract words apply to everything and describe nothing.

Violations: `Manager` suffix, `get` as a general-purpose prefix, `doIt`, `process`, `handle`.

### Use standard language
Avoid cute or funny names that require shared culture or extra effort to decode. Humour relies
on indirection and ambiguity — the exact opposite of what a name should do.

Violations: `whack` instead of `kill`, `nuke` instead of `delete`.

### Use a richer single word over multiple descriptive words
When a precise word exists for the concept, use it instead of a multi-word description.

Violation: `CompanyPerson`.
Correction: `Employee`.

### Use problem domain terms
Use the correct term from the domain's ubiquitous language. Use only one term per concept
within a bounded context. Consistently apply the terminology subject-matter experts use.

Violation: `Order` when the domain means `Shipment` (supply-chain context, where they differ).

### Make names differ by more than one or two characters
Don't use names that differ only by a single character or letter. Readers will mix them up.

Violation: `appleCount` vs `appleCounts`.

### Make names differ by more than word order
Don't use two names that combine the same words in different order.

Violation: `appleCount` vs `countApple`.

### Make names differ in meaning
Don't use names that are synonyms of each other. The names should reflect genuinely different
concepts.

Violations: `input`/`inputValue`, `recordCount`/`numberOfRecords`.

### Make names differ phonetically
Names should sound different when spoken aloud. Aim for code that another programmer could
write down correctly if you read it to them.

Violation: `wrap`/`rap`.

---

## Data Type Guidelines

### Omit type information from names
Don't encode the data type in the name — no Hungarian notation, no type suffixes.

Violations: `isValid`, `dateCreated`, `iAppleCount`, `strName`, `intCount`.
Corrections: `valid`, `created`, `appleCount`, `name`, `count`.

Note on `is` prefix: this guideline says omit it. See the method guidelines for when `is`
is appropriate as a method prefix (only for Boolean accessor methods).

### Singular for single values
Don't pluralise names for individual values.

Violation: `appleCounts` (single integer).
Correction: `appleCount`.

### Plural for collections
Pluralise names for collections (lists, sets, arrays).

Violation: `remainingApple` for a set of apples.
Correction: `remainingApples`.

### Prefer collective nouns for collections
When the collection's type has a natural collective noun in context, prefer it over a plural.

Violations: `appointments` → prefer `calendar`; `pickedApples` → prefer `harvest`.

### Use opposites in standard pairs
Use the established pair and apply it consistently. Don't mix terminology from different pairs.

Standard pairs: add/remove, begin/end, create/destroy, first/last, get/release,
increment/decrement, insert/delete, lock/unlock, minimum/maximum, next/previous, old/new,
open/close, push/pop, show/hide, source/destination, start/stop, up/down.

Violation: `first`/`end` (mixing different pairs — should be `first`/`last` or `begin`/`end`).

### Boolean names must imply true/false
Boolean variables need names that are inherently true or false in meaning.

Violation: `status` (ambiguous — what kind of status?).
Correction: `started`, `enabled`, `found`, `done`, `valid`.

### Use positive Boolean names
Don't build negation into the name.

Violation: `notSuccessful`.
Correction: `successful`.

---

## Class Name Guidelines

### Use a noun phrase
A class name should complete the sentence: *"This class' constructor returns a new ___."*

Violation: `Calculate`.
Correction: `DiscountRule`, `InvoiceProcessor`.

### Use a name that allows all possible states
Don't name a class after a specific state if instances can change state. The name must remain
accurate across the full object lifecycle.

Violation: A class called `ControlEnableState` with a `disable()` method.
Correction: `ControlState`.

### Choose a name consistent with all possible values
Some types aggregate multiple values of the same type (e.g. a line with `start` and `end`).
Use a name that applies equally to all values — not just one of them.

Violation: `start` field has type `MAssociationEnd` (implies only one direction).
Correction: `MAssociationExtremity`.

---

## Method Name Guidelines

### Use a verb phrase
Method names should be active verb phrases, except accessor methods.

Common accessor shorthand styles (pick one and apply consistently):
- `Parcel.getWeight()` — classic JavaBeans
- `Parcel.weight()` — omit verb for accessors
- `Discount.asPercentage()` — omit verb for conversion methods

Violation: `calculation()`.
Correction: `calculateDiscount()`.

### Don't use `get`, `is`, or `has` for methods with side-effects
These prefixes imply idempotence — reading without changing state. If a method has a
side-effect, use a verb that suggests it: `create`, `convert`, `build`, `fetch`.

Violation: `getImageData()` that constructs a new object.
Correction: `buildImageData()` or `createImageData()`.

### Only use `get` for direct field access that returns a value
`get` is only appropriate for a method that literally returns a field value with no computation
or external access.

Violations:
- `getScore()` that performs calculation → `calculateScore()`
- `getMethodBodies()` that populates but doesn't return → `loadMethodBodies()`

### Only use `is` and `has` for Boolean field accessors
Don't use these prefixes on methods that don't return a Boolean.

Violation: `isValid()` returns an `int`.
Correction: `validationCode()` or `validate()`.

### Only use `set` for void mutators
Don't use `set` on methods that return a value.

Violation: `setBreadth()` that creates and returns a new object.
Correction: `withBreadth()` (fluent API) or `resizeTo()`.

### Only use validation verbs for methods that return or throw
Methods named `validate`, `check`, or `ensure` must either return a result or throw an
exception on failure — never return `void`.

Violations: `validateSnaps()` returning `void`, `checkCurrentState()` returning `void`.

### Only use transformation verbs for methods that return the result
Methods named with verbs like `convert`, `transform`, or `parse` must return the result.

Violation: `javaToNative()` with return type `void`.
Correction: Either return the result, or rename to reflect what the method actually does.

---

## Rejected Guidelines (don't apply these)

These guidelines appear in the literature but are rejected:

**Use short names for short scopes** — Rejected. It contradicts the guidance to avoid
encodings, is hard to apply consistently, and creates maintenance burden when scope changes.

**Encode scope length in name length** — Rejected for the same reasons.

**Add `Class` suffix to class names** — Rejected. It is redundant. Language conventions and
tooling already communicate that a type is a class.

**Qualify enumeration constants with the type name** — Rejected. Adding an enum type's name
to its constants' names makes as little sense as adding a class name to its instances' names.

---

## Quick diagnosis checklist

When reviewing any name, check:

1. Does it follow the language's casing convention?
2. Is it a real dictionary word, fully spelled out?
3. Is it under 20 characters, 4 words max?
4. Does it describe meaning — not type, scope, or implementation?
5. Could the word apply to something else in the same codebase? (If yes, be more specific.)
6. Is it a noun phrase (for types) or verb phrase (for methods)?
7. If Boolean: does the name imply true/false, without negation?
8. If a collection: is it plural or a collective noun?
9. If an accessor: does the prefix match what the method actually does?
10. Does it use domain terminology consistently with the rest of the codebase?

---

## Attribution

Based on Peter Hilton's *Naming Guidelines for Professional Programmers* presentation,
which consolidates guidelines from: Ottenstein (1977), Relf (2007), Lawrie, Feuer, Hendrix &
Host (2007), Benlarbi et al. (2000), and McConnell's *Code Complete*. Hilton and
Felienne Hermans also cover naming extensively in *Software Design: Tidy First?* adjacent work.
