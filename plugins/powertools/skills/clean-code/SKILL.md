---
name: clean-code
description: >
  Apply Robert C. Martin's Clean Code principles to write and review professional-grade code.
  Use this skill whenever someone asks about code quality, readability, or maintainability —
  or when reviewing code that has long functions, unclear names, deep nesting, magic numbers,
  error codes, null returns, flag arguments, mixed abstraction levels, or tangled tests.
  Also trigger when someone asks "how do I write cleaner code?", "is this function too long?",
  "should I add a comment here?", "how should I format this?", "what's wrong with this class?",
  or "how do I structure error handling?" This skill consolidates the core principles from
  Chapters 1–13 and the complete Smells & Heuristics catalog from Chapter 17 — the master
  diagnostic reference with 60+ coded heuristics for identifying and fixing code problems.
  Domain-agnostic: applies to any language or codebase.
---

# Clean Code

## What this skill does

This skill applies Robert C. Martin's *Clean Code* framework for writing and reviewing
professional-quality code. It covers the full range of topics: naming, functions, comments,
formatting, objects vs. data structures, error handling, boundaries, tests, and classes.

The master reference is the **Smells & Heuristics catalog** at the end — a coded, searchable
index of every pattern covered in the book. When reviewing code, scan that catalog first.

The core insight: **the ratio of time spent reading code to writing it is well over 10:1.**
Making code easier to read makes it easier to write. The biggest ROI is always readability.

**The Boy Scout Rule**: Leave the campground cleaner than you found it. Each time you touch
code, leave it slightly better — one better name, one extracted function, one deleted comment.
LeBlanc's Law warns: *Later equals never.*

---

## Functions

### Size
Functions should be small — the ideal is 4–5 lines. Functions should hardly ever be 20 lines.
The test: can you read the function in its entirety without scrolling?

### Do One Thing
A function does one thing if all its steps are one level of abstraction below the function's
name. If you can meaningfully extract a section into a function whose name is *not* merely a
restatement of its contents, the function is doing more than one thing.

### One Level of Abstraction per Function
Mixing levels of abstraction in a function is always confusing. The Stepdown Rule: code reads
top to bottom. Each function is followed by the next level of abstraction. Reading a module
should feel like reading a narrative.

### Switch Statements
Switch statements by nature do N things. When you must use one:
- Bury it in an abstract factory
- Use it only once — to create polymorphic objects
- Never repeat the same switch in multiple places

### Arguments
- **Niladic** (zero) is ideal
- **Monadic** is fine
- **Dyadic** is tolerable with care
- **Triadic** and beyond: avoid with prejudice
- **Flag arguments** are always wrong — passing a boolean into a function declares that the
  function does more than one thing
- **Output arguments** are confusing: if a function must change state, have it change the
  state of the object it is called on

### Command Query Separation
A function should either change the state of an object, or return information about it — never
both. `if (set("username", "bob"))` mixes a command with a query; split them.

### Prefer Exceptions to Error Codes
Returning error codes forces callers to deal with errors immediately and leads to deeply
nested structures. Exceptions allow error handling to be separated from the happy path.
Extract try/catch bodies into their own functions. Error handling is one thing — a function
that handles errors should do nothing else.

### DRY
Duplication may be the root of all evil in software. Every time you see it, it represents a
missed opportunity for abstraction.

---

## Naming

*(This skill covers naming at a principles level; see the `naming-guidelines` skill for the
complete ruleset with violations and corrections.)*

- Use **intention-revealing names**. The name should tell you why it exists, what it does,
  and how it is used. If a name requires a comment, the name does not reveal intent.
- Avoid **disinformation**: `accountList` for a non-List container is misleading.
- Make **meaningful distinctions**: `getActiveAccount()` vs `getActiveAccounts()` vs
  `getActiveAccountInfo()` are indistinguishable to a caller.
- Use **pronounceable names**. If you can't say it, you can't discuss it.
- Use **searchable names**. Single-letter names and magic numbers appear in many places and
  cannot be grepped. The longer the scope, the longer the name.
- **No encodings**: Hungarian notation, member prefixes (`m_`), interface prefixes (`I`) —
  all are noise. Your IDE already knows the type.
- **Classes**: noun or noun phrase (`Customer`, `WikiPage`, `Account`)
- **Methods**: verb or verb phrase (`postPayment`, `deletePage`, `save`)
- **One word per concept**: pick `fetch`, `retrieve`, or `get` — not all three
- **No puns**: clarity is king; humour sacrifices it

---

## Comments

**Comments are a failure to express in code.** The proper use of comments is to compensate
for our failure to express ourselves in code. Every comment represents a failure — but some
failures are unavoidable.

### Good Comments
- **Legal**: copyright, license headers
- **Explanation of intent**: why a decision was made, not what the code does
- **Clarification**: when you cannot refactor the code itself (e.g., third-party library)
- **Warning of consequences**: why something is dangerous or surprising
- **TODO**: notes for future work (but review and remove them regularly)
- **Amplification**: marking something that might otherwise seem unimportant as critical
- **Javadocs/docstrings in public APIs**: when the API is public-facing

### Bad Comments (delete these)
- **Mumbling**: comments written hastily that make no sense without author context
- **Redundant**: says what the code already says; takes longer to read than the code
- **Misleading**: not quite wrong, but wrong enough to lead the reader astray
- **Mandated**: "every function must have Javadoc" produces noise, not signal
- **Journal comments**: change history belongs in source control
- **Noise**: restating the obvious; adds no information
- **Position markers**: `// --- Actions ---` banners are clutter
- **Closing brace comments**: `} // end while` — extract instead
- **Commented-out code**: **delete it**. Source control remembers. Everyone leaves it
  because they think someone else put it there on purpose. It rots.
- **HTML in comments**: makes comments unreadable in source; let the IDE render it
- **Nonlocal information**: comments about something far away from where the comment lives
- **Inobvious connection**: the comment should describe the code next to it, not some other
  code elsewhere

---

## Formatting

**Code formatting is about communication.** The developer's first professional obligation.

### Vertical Formatting
- **Newspaper metaphor**: the top of a file is the headline — name alone tells you whether
  you're in the right module. As you move down, detail increases.
- **Vertical openness**: blank lines between concepts. Each blank line is a visual cue that
  a new and separate concept follows.
- **Vertical density**: lines that are tightly related belong together, with no blank lines
  between them.
- **Vertical distance**: concepts that are closely related should be close together in the
  file. Variable declarations near use; instance variables at the top of classes; dependent
  functions close (callers above callees); conceptually similar functions near each other.
- Target ~200 lines per file; 500 lines is a reasonable upper limit.

### Horizontal Formatting
- Target ~80–120 characters per line
- Use horizontal whitespace to associate/disassociate concepts: `a*a + b*b` reads the
  multiplication as tighter than the addition
- Indentation reveals the hierarchy of scope — never collapse it for "short" blocks
- The team's formatting rules supersede individual preference; automate with a formatter

---

## Objects and Data Structures

### Hide Implementation
Objects hide data behind abstractions and expose functions that operate on that data. Adding
getters and setters to every field is not encapsulation — it exposes implementation. Choose
abstractions that let you manipulate the *essence* of data without knowing its implementation.

### The Data/Object Anti-Symmetry
- **OO code**: easy to add new types without changing existing functions (polymorphism)
- **Procedural code**: easy to add new functions without changing existing data structures

Both are useful. The choice depends on what you expect to change. Don't try to do both —
hybrids (half object, half data structure) are the worst of both worlds.

### Law of Demeter
A method `f` of class `C` should only call methods of:
1. `C` itself
2. Objects created by `f`
3. Objects passed as arguments to `f`
4. Objects held in instance variables of `C`

**Train wrecks**: `ctxt.getOptions().getScratchDir().getAbsolutePath()` — each call gets
an object returned by the previous call. Split into temporary variables, or restructure.

**DTOs and Active Records**: pure data structures with public fields are fine for database
rows, socket messages, etc. Treat Active Records as data structures — don't add business
logic to them; put that in separate objects.

---

## Error Handling

- **Use exceptions, not return codes**: error handling obscures logic when mixed with the
  happy path. Exceptions allow them to be separated.
- **Write the try/catch/finally first**: this defines the transaction scope — the scope
  within which the caller can depend on consistent state.
- **Use unchecked exceptions**: checked exceptions violate the Open/Closed Principle. They
  cascade through every signature between the thrower and the catcher, creating coupling.
- **Provide context**: every exception should carry enough context to determine the source
  and location of an error (message, operation being attempted, type of failure).
- **Define exception classes by caller needs**: wrap third-party APIs in a single exception
  type. The caller usually cares about one question: did it fail?
- **Special Case Pattern**: return a special case object rather than throwing. The caller
  never has to deal with exceptional behavior.
- **Don't return null**: return empty collections, null objects, or special cases instead.
  Every null return is a future NullPointerException waiting to happen.
- **Don't pass null**: calling a method with null is even worse. Forbid it by convention.

---

## Boundaries (Third-Party Code)

- **Don't pass boundary interfaces around**: `Map` (and similar generic containers) expose
  far more than you need. Wrap them in a type that exposes only what your code needs.
- **Learning tests**: before integrating a third-party library, write tests against its API
  to learn how it works. These tests also serve as regression tests when the library changes.
- **Define the interface you wish you had**: when integrating something unknown, write the
  code that calls the interface you want. Then write adapters that bridge the gap.
- **Depend on something you control**: code at the boundary of your system should live in
  few places and have clear separation. Depend on abstractions you own, not third-party
  interfaces you don't.

---

## Unit Tests

### Three Laws of TDD
1. You may not write production code until you have a failing unit test
2. You may not write more of a unit test than is sufficient to fail
3. You may not write more production code than is sufficient to make the failing test pass

### Test Code Is Production Code
Dirty tests are worse than no tests. Tests enable change — without them, every change is a
possible bug. If your tests are messy, your production code becomes rigid. Readability is
even more important in tests than in production code.

### Clean Tests: Build-Operate-Check
Each test follows a clear pattern: build the test data, operate on it, check the results.
Evolve a domain-specific testing language from the helpers you find yourself extracting.

### One Concept per Test
Minimize asserts per test. One concept per test. When a test fails, you should know
immediately what broke.

### F.I.R.S.T.
- **Fast**: slow tests don't get run
- **Independent**: tests should not depend on each other; they should run in any order
- **Repeatable**: in any environment (CI, local, offline)
- **Self-validating**: binary result — either they pass or they fail; no manual checking
- **Timely**: write tests just before the production code they test

---

## Classes

### Organization
Public static constants → private static variables → private instance variables → public
functions → private utilities called by the public functions above them.

### Small — Measured by Responsibilities
Classes should be small — but measured in responsibilities, not lines. If you can't describe
a class in ~25 words without using "if," "and," "or," or "but," it has too many
responsibilities.

### Single Responsibility Principle (SRP)
A class should have one, and only one, reason to change. Many small, focused classes are
easier to understand than a few large ones. A system with many small classes has no more
moving parts than a system with a few large classes; it just has different organization.

### Cohesion
Classes should have a small number of instance variables. Each method should use as many
of those variables as possible. When cohesion drops — methods use only a subset of variables
— it's a signal to split the class.

### Open/Closed Principle (OCP)
Classes should be open for extension but closed for modification. Isolate behavior behind
interfaces; add new behavior by adding new types, not by modifying existing code.

### Dependency Inversion Principle (DIP)
Classes should depend on abstractions, not on concrete implementations. This makes classes
testable (you can inject test doubles) and loosely coupled.

---

## Smells and Heuristics — Quick Reference

This is the coded catalog from Chapter 17. When reviewing code, scan this list and note
which codes apply. Each code can be cited in review comments.

### Comments

| Code | Name | Diagnosis |
|------|------|-----------|
| C1 | Inappropriate Information | Metadata, change history, SPR numbers in comments — belongs in source control |
| C2 | Obsolete Comment | Comment that has grown old, irrelevant, or incorrect — update or delete |
| C3 | Redundant Comment | Comment says what the code already says — delete it |
| C4 | Poorly Written Comment | Unclear grammar, rambling, obvious — if worth writing, write it well |
| C5 | Commented-Out Code | Delete it. Source control has it. It rots. |

### Environment

| Code | Name | Diagnosis |
|------|------|-----------|
| E1 | Build Requires More Than One Step | Should be one command to check out and build |
| E2 | Tests Require More Than One Step | Should be one command (or one button) to run all tests |

### Functions

| Code | Name | Diagnosis |
|------|------|-----------|
| F1 | Too Many Arguments | More than three is very questionable; avoid with prejudice |
| F2 | Output Arguments | Counterintuitive; mutate the object the method is called on instead |
| F3 | Flag Arguments | Boolean params declare the function does more than one thing |
| F4 | Dead Function | Never called; delete it — source control remembers |

### General

| Code | Name | Diagnosis |
|------|------|-----------|
| G1 | Multiple Languages in One Source File | Minimize extra languages in a source file |
| G2 | Obvious Behavior Is Unimplemented | Principle of Least Surprise; readers lose trust when expectations fail |
| G3 | Incorrect Behavior at Boundaries | Test every boundary condition — don't rely on intuition |
| G4 | Overridden Safeties | Turning off failing tests, suppressing compiler warnings — don't |
| G5 | Duplication | DRY; every duplicate is a missed abstraction; replace with polymorphism or Template Method |
| G6 | Code at Wrong Level of Abstraction | Lower-level concepts belong in derivatives, not in base classes |
| G7 | Base Classes Depending on Their Derivatives | Base classes should know nothing about their subclasses |
| G8 | Too Much Information | Small interfaces; fewer methods, fewer variables, fewer exposed internals |
| G9 | Dead Code | Code that is never executed; delete it |
| G10 | Vertical Separation | Variables and functions defined far from where they are used |
| G11 | Inconsistency | If you do something a certain way, do all similar things the same way |
| G12 | Clutter | Unused variables, never-called functions, meaningless comments — remove |
| G13 | Artificial Coupling | Don't place a function, constant, or variable in an inconvenient but lazy location |
| G14 | Feature Envy | Method more interested in another class's data than its own — move it |
| G15 | Selector Arguments | Flag/Boolean/enum params that select behavior — split into separate functions |
| G16 | Obscured Intent | Hungarian notation, magic numbers, run-on expressions — make intent visible |
| G17 | Misplaced Responsibility | Put code where the reader expects to find it (follow function names) |
| G18 | Inappropriate Static | If there's any chance the function should be polymorphic, don't make it static |
| G19 | Use Explanatory Variables | Break calculations into intermediate variables with meaningful names |
| G20 | Function Names Should Say What They Do | If you must read the implementation to know what it does, rename it |
| G21 | Understand the Algorithm | Don't leave it "working" with if-statements and flags — refactor until it's obvious |
| G22 | Make Logical Dependencies Physical | Don't assume — ask; dependent module should request what it needs |
| G23 | Prefer Polymorphism to If/Else or Switch/Case | ONE SWITCH rule: at most one switch per type selection |
| G24 | Follow Standard Conventions | Every team; code provides the examples; no separate document needed |
| G25 | Replace Magic Numbers with Named Constants | Any token whose value is not self-describing needs a name |
| G26 | Be Precise | Ambiguities and imprecision are laziness; lock down decisions precisely |
| G27 | Structure over Convention | Enforce decisions with structure (abstract methods) not naming conventions |
| G28 | Encapsulate Conditionals | `if (shouldBeDeleted(timer))` not `if (timer.hasExpired() && !timer.isRecurrent())` |
| G29 | Avoid Negative Conditionals | `if (buffer.shouldCompact())` not `if (!buffer.shouldNotCompact())` |
| G30 | Functions Should Do One Thing | Functions with multiple sections doing a series of operations violate this |
| G31 | Hidden Temporal Couplings | Use bucket brigade: each function returns a result the next needs |
| G32 | Don't Be Arbitrary | Have a reason for every structural decision; communicate it in the structure |
| G33 | Encapsulate Boundary Conditions | `int nextLevel = level + 1;` — don't let `+1` and `-1` scatter through code |
| G34 | Functions Should Descend Only One Level of Abstraction | Mixing abstraction levels in a function is always confusing |
| G35 | Keep Configurable Data at High Levels | Constants and defaults at the top; pass down rather than bury in low-level functions |
| G36 | Avoid Transitive Navigation | `a.doSomething()` not `a.getB().getC().doSomething()` (Law of Demeter / "Shy Code") |

### Names

| Code | Name | Diagnosis |
|------|------|-----------|
| N1 | Choose Descriptive Names | Names are 90% of readability; take the time; re-evaluate as code evolves |
| N2 | Names at Appropriate Abstraction Level | Don't encode implementation details in names; reflect the abstraction |
| N3 | Use Standard Nomenclature | Pattern names (Decorator, Factory), idioms, ubiquitous language |
| N4 | Unambiguous Names | Name should make the function's or variable's purpose unambiguous |
| N5 | Use Long Names for Long Scopes | Short names for tiny scopes; long precise names for long scopes |
| N6 | Avoid Encodings | No Hungarian notation, no `m_` prefixes, no `vis_` subsystem prefixes |
| N7 | Names Should Describe Side-Effects | Don't hide what a function does more than what its simple name implies |

### Tests

| Code | Name | Diagnosis |
|------|------|-----------|
| T1 | Insufficient Tests | Test everything that could possibly break |
| T2 | Use a Coverage Tool | Find untested `if` and `catch` branches; coverage tools make gaps visible |
| T3 | Don't Skip Trivial Tests | Their documentary value exceeds the cost to write them |
| T4 | Ignored Test Is a Question about Ambiguity | Comment out or `@Ignore` with a note explaining the unresolved question |
| T5 | Test Boundary Conditions | We often get the middle of an algorithm right but misjudge the edges |
| T6 | Exhaustively Test Near Bugs | Bugs congregate; when you find one, test the whole function exhaustively |
| T7 | Patterns of Failure Are Revealing | Ordered, complete test cases expose patterns that point to root causes |
| T8 | Test Coverage Patterns Can Be Revealing | Uncovered code gives clues to why failing tests fail |
| T9 | Tests Should Be Fast | Slow tests don't get run; do what you must to keep them fast |

---

## Quick Diagnosis Checklist

When reviewing any function or class, ask:

1. Can you name exactly one thing this function does?
2. Can you read the function without scrolling?
3. Does every name tell you why it exists, what it does, how it is used?
4. Are there any comments that exist because the code isn't clear enough? (Clarify the code instead)
5. Is there any commented-out code? (Delete it)
6. Does the function return null or an error code? (Return a special case or throw)
7. Are there flag arguments or output arguments? (Split the function or mutate `this`)
8. Does the function mix levels of abstraction? (Stepdown Rule)
9. Are there magic numbers or strings? (Name them)
10. Is there duplication? (Extract a shared abstraction)
11. Does the class have one reason to change?
12. Are all tests fast, independent, and self-validating?

---

## Attribution

Based on Robert C. Martin's *Clean Code: A Handbook of Agile Software Craftsmanship* (2008).
The Smells and Heuristics catalog (Chapter 17) consolidates patterns from Martin Fowler's
*Refactoring* (1999), *The Pragmatic Programmer* (Hunt & Thomas, 2000), *Design Patterns*
(Gamma et al., 1996), and Kent Beck's *Smalltalk Best Practice Patterns* (1997).
The SOLID principles referenced here are from Martin's *Agile Software Development:
Principles, Patterns, and Practices* (2002). Domain-driven design terms draw from
Eric Evans' *Domain-Driven Design* (2003).
