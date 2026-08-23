---
name: screaming-architecture
description: >
  Apply Robert C. Martin's "Screaming Architecture" principle at every scale — the whole
  system, and each name, function, class, schema, and API contract inside it — should
  scream what it DOES (its intent and use cases), not which framework or mechanism built it.
  Use this skill when designing or reviewing a codebase's directory/module layout, naming a
  variable/function/class/module, modeling a domain, designing a database schema or table,
  shaping an API/endpoint/event contract, deciding where code goes, or evaluating whether
  something is too framework-coupled or too generic to read. Also trigger when someone asks
  "how should I structure this project?", "where does this code go?", "what should I name
  this?", "does this name/schema/API reveal intent?", "is my architecture too tied to
  Rails/Spring/Django/Next?", "how do I keep the framework out of my business logic?", "how
  do I make my use cases testable without a database or web server?", or complains that the
  codebase, model, or API looks like a framework tutorial or generic CRUD rather than a
  product. Pairs with clean-code, ddd, naming-guidelines, and functional-design-architecture.
  Domain-agnostic.
---

# Screaming Architecture

## The core idea

Look at the top-level directory structure of a project. What does it scream?

A good architecture screams the **use cases** of the application — *Health Care System*,
*Accounting System*, *Inventory Management*. It does **not** scream *Rails*, *Spring*,
*Hibernate*, *Django*, or *Next.js*. The framework is scaffolding you happened to use; it is
not the point of the system.

Uncle Bob's analogy: blueprints for a house scream "house" — you see the foyer, the kitchen
by the dining room, the bedrooms. Blueprints for a library scream "library." Your code should
be as legible. A new developer should be able to glance at the structure and understand *what
the system does* before learning *what it was built with*.

> "Software architectures are structures that support the use cases of the system."
> — Ivar Jacobson, *Object Oriented Software Engineering*

**The principle is fractal.** Uncle Bob framed it at the top-level directory, but the same
test applies at every zoom level. A name, a function, a class, a table, an endpoint — each is
a tiny architecture, and each should scream its intent, not its mechanism. Zoom all the way in
and the rule is identical: *reveal what this does and why it exists; hide what it was built
with.* See "Screaming at every scale" below.

---

## The test: what does it scream?

Open the repo root and read the top-level names. Ask: **framework or purpose?**

| Screams the framework (bad)        | Screams the purpose (good)          |
|------------------------------------|-------------------------------------|
| `controllers/ models/ views/`      | `ordering/ billing/ shipping/`      |
| `app/ config/ db/ lib/`            | `patients/ appointments/ claims/`   |
| `pages/ api/ components/`          | `catalog/ checkout/ inventory/`     |
| `services/ repositories/ dtos/`    | `underwriting/ policies/ payouts/`  |

If someone can name your web framework faster than they can name your business, the
architecture is screaming the wrong thing.

This isn't about banning `controllers/`. It's about the **top level**. Frameworks and delivery
mechanics belong in a lower, replaceable layer — not as the primary organizing principle.

---

## The web (and every framework) is a delivery mechanism

The web is an **I/O device** — a detail. So is the database, the message queue, the CLI, the
mobile app. These are ways to *deliver* the use cases to a user; they are not the use cases.

A system organized around its use cases lets you **defer** the big technical decisions:

- Which database? Decide later — the domain doesn't care if it's Postgres or a flat file.
- Which web framework? Decide later — or swap it — without touching business rules.
- REST, GraphQL, gRPC, CLI? A delivery choice bolted onto the same core.

If those decisions are baked into the center of your system, you've coupled your business to
tools that will outlive their welcome. Push them to the edge.

**Frameworks are tools, not ways of life.** When a framework's docs say "structure your whole
app like this," ask two questions:

1. How can I preserve the use-case emphasis of my architecture?
2. How can I keep the framework from taking over?

Use the framework; do not marry it. Keep your domain able to run when the framework is gone.

---

## Screaming at every scale

The directory listing is just the widest zoom. Take the same test — **intent, or mechanism?**
— all the way down. At each level, the failure mode is the same: the code names the *how* (the
data structure, the generic operation, the framework) instead of the *what* (the business
concept, the use case, the intent).

### Names

A name should scream what a thing is *for* in the business, not its type or its plumbing.

| Screams the mechanism (bad)         | Screams the intent (good)             |
|-------------------------------------|---------------------------------------|
| `data`, `info`, `obj`, `temp`, `val`| `pendingInvoice`, `expiredSession`    |
| `list`, `arr`, `map1`, `flag`       | `overdueAccounts`, `isEligibleForRefund` |
| `handleData()`, `process()`, `doIt()`| `settleClaim()`, `reserveInventory()`|
| `UserManager`, `DataHelper`, `Utils`| `LoyaltyTier`, `ShippingQuote`        |

If the name would fit unchanged in any app in any industry, it's screaming "generic CRUD," not
your product. (For the full discipline, see `naming-guidelines`.)

### Functions

A function's signature should read like a sentence about the domain. `applyLateFee(account)`
tells you the use case; `update(account, field, value)` tells you it touches a database.
Name for the business operation, not the mechanical one. A function that screams its intent
needs no comment explaining what it does — only, occasionally, why.

### Classes and types

A type is a claim about the domain. `Money`, `EmailAddress`, `PolicyNumber` scream intent and
carry their own rules; `String`, `int`, `Map<String,Object>` scream "I didn't model this yet."
Make illegal states unrepresentable so the *type itself* screams the invariant — a
`VerifiedEmail` that can't be constructed from an unverified string says more than any doc.
(See `ddd` for value objects and `functional-design-architecture` for type-driven modeling.)

### Business model

The domain model should read like the business talks. Its entities, events, and operations
should be words a domain expert recognizes — `Subscription`, `renewed`, `cancelPolicy` — not
technical stand-ins (`Record`, `statusChanged`, `setFlag`). If you can't map a model element to
a sentence a stakeholder would say, it's screaming the implementation, not the domain. This is
the Ubiquitous Language: the same words in the conversation, the model, and the code.

### Database schema

A schema screams intent when its tables and columns name business facts, not a framework's
conventions or a bag of generic slots.

| Screams the mechanism (bad)              | Screams the intent (good)               |
|------------------------------------------|-----------------------------------------|
| `data` table with a JSON `payload` column| `orders`, `line_items`, `shipments`     |
| `type`, `status` as opaque ints          | `subscription_state`, `refund_reason`   |
| `field1`, `meta`, `extra`                | `billed_at`, `canceled_at`, `net_cents` |
| everything nullable "just in case"        | NOT NULL / constraints that state rules |

Constraints and column names are documentation the database *enforces*. A schema that lets any
row hold anything screams "we deferred every decision"; one whose constraints encode the rules
screams what the business actually permits.

### API and event contracts

The contract is the loudest scream to the outside world — treat it as domain-first, not a thin
skin over your tables or a CRUD reflex.

- Resources and events named for business concepts and actions: `POST /policies/{id}/renew`,
  `PaymentSettled`, `ClaimApproved` — not `POST /update`, `RowChanged`, `genericEvent`.
- Fields that a consumer understands without reading your source: `estimatedDeliveryDate`,
  not `ts2`. Enumerated states with meaning, not magic numbers.
- Don't leak the mechanism: no ORM entity shapes, framework wrappers, or table column names
  bleeding into the public contract. The contract should survive a rewrite of the internals.

The same litmus everywhere: **could a newcomer read this — the name, the signature, the table,
the endpoint — and tell you what the business does, before knowing what built it?** If not,
it's screaming the wrong thing.

---

## Testability is the proof

The reliable check that your architecture actually screams the right thing:

> **You can unit-test all your use cases without the framework, without a database, and
> without a web server running.**

If your business rules can only be exercised through an HTTP request that hits a live
database, they are entangled with the delivery mechanism. If you can instantiate a use case,
hand it plain input, and assert on plain output — in a fast test, no I/O — the domain is
properly independent.

This is the litmus test. It's also *why* the discipline pays off: independence from
frameworks buys you fast tests, swappable infrastructure, and a domain a human can read.

---

## How to apply it

**When starting a project:**
- Name top-level modules after the business (the use cases / capabilities), not the layers.
- Put the framework at the boundary — a thin adapter that calls into the domain, never the
  other way around. Dependencies point *inward*, toward the use cases.
- Don't let `main` / the framework entry point contain business rules. It should wire things
  up and get out of the way.

**When reviewing an existing project:**
- Read the top-level directory listing aloud. Does it name the product or the toolchain?
- Grep the core domain for framework imports (`import rails`, `from django`, `@nestjs/...`,
  `next/...`). Framework symbols deep in business logic = leakage. Push them to adapters.
- Try to write one use-case test with no database and no server. If you can't, that's the
  first thing to fix.

**When a framework fights you:**
- Keep the framework's objects (controllers, request handlers, ORM entities) at the edge.
  Translate them into your own domain types at the boundary; don't let them flow inward.
- A `ponytail`-sized version of this: even one folder named for a capability, with the
  business rule callable without booting the server, beats a textbook layer cake.

---

## What this is NOT

- **Not** "never use frameworks" — use them, at the boundary, deliberately.
- **Not** "no `controllers/` folder ever" — it's about what the *top level* organizes around.
- **Not** premature abstraction — you don't need ports/adapters everywhere on day one. The
  minimum that earns the win: name modules for the business, and keep use cases testable
  without I/O.

## One-line summary

**At every scale — the system, the module, the name, the function, the class, the schema, the
API — it should scream what it does, not what it was built with. The proof at the top is that
you can test the use cases without the framework, database, or web; the proof lower down is
that a newcomer can read one name or contract and tell you the business behind it.**

---

*Based on Robert C. Martin (Uncle Bob), "Screaming Architecture" (2011), taken from the
top-level directory down to every identifier and contract.
See also: `clean-code`, `naming-guidelines`, `ddd`, `functional-design-architecture`.*
