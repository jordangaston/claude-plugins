# Imperative Tactical Design (Evans / OOP Style)

This reference covers tactical building blocks for the Evans/OOP style of DDD.

---

## Entity

An object whose identity persists through state changes. Two Entities with the same data but different identities are not equal.

**Design rules:**
- Assign a unique, stable identity at creation (UUID or domain-meaningful key). Never use mutable attributes as identifiers.
- Equality is determined by identity, not attributes.
- Model lifecycle continuity explicitly: what does it mean for this Entity to come into existence, change, and cease to exist?
- Minimize associations. For each association, ask: is this traversal direction needed? Can multiplicity be reduced with a qualified association?
- Focus the class design on what maintains identity — not on describing attributes.

**Signals this is an Entity:**
- "The same customer placed two orders" — the customer has identity across orders
- "Track this shipment as it moves" — state changes but identity is continuous
- Business users talk about "the same one" across time

**TypeScript pattern:**
```typescript
class Order {
  private constructor(
    readonly id: OrderId,
    private status: OrderStatus,
    private lineItems: LineItem[],
  ) {}

  static create(id: OrderId, items: LineItem[]): Order {
    if (items.length === 0) throw new DomainError('Order must have at least one item');
    return new Order(id, OrderStatus.Pending, items);
  }

  place(): void {
    if (this.status !== OrderStatus.Pending) throw new DomainError('Order already placed');
    this.status = OrderStatus.Placed;
    // raise domain event: OrderPlaced
  }
}
```

---

## Value Object

An object that describes a characteristic of the domain. Has no identity. Equality is structural.

**Design rules:**
- **Immutable.** Never mutate a Value Object — return a new instance.
- Equality compares all attributes.
- Free to share, copy, and pass around without defensive copying.
- Replace primitives with domain-specific Value Objects to enforce validation and prevent substitution errors.
- Operations on Value Objects should exhibit Closure of Operations: `Money.add(Money): Money`.
- Store inline in parent tables, not in separate tables with foreign keys.

**Signals this is a Value Object:**
- "A price of $10" — two prices of $10 are interchangeable
- "A US postal address" — the address is a descriptor, not an identity
- You can fully describe the concept without asking "which one?"

**TypeScript pattern:**
```typescript
class Money {
  private constructor(
    readonly amount: bigint,
    readonly currency: Currency,
  ) {}

  static of(amount: bigint, currency: Currency): Money {
    if (amount < 0n) throw new DomainError('Money amount cannot be negative');
    return new Money(amount, currency);
  }

  add(other: Money): Money {
    if (this.currency !== other.currency) throw new DomainError('Currency mismatch');
    return new Money(this.amount + other.amount, this.currency);
  }

  equals(other: Money): boolean {
    return this.amount === other.amount && this.currency === other.currency;
  }
}
```

---

## Aggregate

A cluster of Entities and Value Objects treated as a single unit for data changes. One Entity is the **Aggregate Root** — the only external entry point.

**Design rules:**
1. One Aggregate per transaction. Each command modifies exactly one Aggregate.
2. External objects hold references only to the Aggregate Root — never to internal members.
3. Reference other Aggregates by identity only (store the ID, not the object).
4. All business invariants that must be immediately consistent live inside one Aggregate.
5. Start with the smallest possible Aggregate (single Entity as root). Expand only when an invariant cannot be enforced otherwise.
6. Use eventual consistency (Domain Events) across Aggregate boundaries.

**Three boundaries an Aggregate defines:**
- **Transaction boundary** — a single database transaction changes one Aggregate
- **Concurrency boundary** — optimistic locking is per-Aggregate
- **Distribution boundary** — microservices can own one or more Aggregates

**Signals an Aggregate boundary is wrong:**
- Multiple Aggregates modified in one transaction
- Long Aggregates that cause lock contention
- Aggregates that fetch other Aggregates from repositories in their own methods

**TypeScript pattern:**
```typescript
class Cart {
  private constructor(
    readonly id: CartId,
    readonly customerId: CustomerId,  // reference by ID, not by object
    private items: CartItem[],
  ) {}

  addItem(productId: ProductId, quantity: number, price: Money): void {
    const existing = this.items.find(i => i.productId.equals(productId));
    if (existing) {
      existing.increaseQuantity(quantity);
    } else {
      this.items.push(CartItem.create(productId, quantity, price));
    }
  }

  checkout(): CartCheckedOut {
    if (this.items.length === 0) throw new DomainError('Cart is empty');
    return new CartCheckedOut(this.id, this.customerId, this.items, new Date());
  }
}
```

---

## Domain Service

An operation that is significant in the domain but does not naturally belong to any single Entity or Value Object. Stateless.

**Design rules:**
- Named after an activity (verb phrase), not a thing.
- Stateless — holds no domain state between calls.
- Interface defined entirely in domain terms (no HTTP, no SQL).
- Three hallmarks: (1) the operation is conceptually a domain activity, (2) the interface uses domain model elements, (3) it is stateless.
- Do not reach into infrastructure. Receive Aggregates; return Aggregates or Domain Events.

**Signals this is a Domain Service:**
- The operation spans multiple Aggregates (e.g., transferring money between accounts)
- The operation involves a domain rule that belongs to no single object
- Putting the logic on an Entity would give it too many responsibilities

**TypeScript pattern:**
```typescript
interface TransferService {
  transfer(from: Account, to: Account, amount: Money): [Account, Account, MoneyTransferred];
}
```

---

## Repository

An abstraction providing collection-like access to Aggregate Roots, hiding all persistence mechanics.

**Design rules:**
- One Repository per Aggregate Root.
- The **interface** lives in the Domain layer.
- The **implementation** lives in the Infrastructure layer.
- Inject the interface; never the implementation.
- Expose only the retrieval and persistence operations actually needed — no arbitrary query surfaces.
- Methods return Aggregates or `undefined`, never raw rows or DTOs.

**TypeScript pattern:**
```typescript
// Domain layer — interface only
interface OrderRepository {
  findById(id: OrderId): Promise<Order | undefined>;
  findByCustomer(customerId: CustomerId): Promise<Order[]>;
  save(order: Order): Promise<void>;
}

// Infrastructure layer — implementation
class PostgresOrderRepository implements OrderRepository {
  // ... Drizzle/Prisma/raw SQL implementation
}
```

---

## Factory

Encapsulates complex object creation and reconstitution logic.

**Design rules:**
- Use when creation logic enforces invariants that cannot live in a constructor.
- Private constructors + static `create()` methods are the simplest factory pattern.
- Reconstitution (loading from storage) may differ from initial creation — it skips identity generation and validation already enforced at save time.
- A factory method on the Aggregate Root is the most common pattern; a standalone Factory class is used when families of objects are created together.

---

## Domain Event

An immutable record that something significant happened in the domain.

**Design rules:**
- Named in past tense: `OrderPlaced`, `PaymentFailed`, `AccountClosed`.
- Immutable — events are facts, not instructions.
- **Separate creation from dispatch.** Aggregates create events; the Application layer dispatches them after persistence succeeds.
- Carry enough data for consumers to act without re-querying the producer.
- **Domain Events** stay within a context. **Integration Events** cross context boundaries (richer payload, always async).

**TypeScript pattern:**
```typescript
class OrderPlaced {
  readonly occurredAt = new Date();
  constructor(
    readonly orderId: OrderId,
    readonly customerId: CustomerId,
    readonly totalAmount: Money,
  ) {}
}
```

---

## Specification Pattern

Encapsulates a business rule as a first-class, composable object.

**When to use:**
- Validation: "Is this order eligible for express shipping?"
- Selection: "Find all orders that are overdue"
- Construction: "Build an order that meets these criteria"

**TypeScript pattern:**
```typescript
interface Specification<T> {
  isSatisfiedBy(candidate: T): boolean;
  and(other: Specification<T>): Specification<T>;
  or(other: Specification<T>): Specification<T>;
  not(): Specification<T>;
}

class EligibleForExpressShipping implements Specification<Order> {
  isSatisfiedBy(order: Order): boolean {
    return order.totalAmount.amount >= 5000n && order.destination.country === 'US';
  }
  // ... compose via and/or/not
}
```

---

## Layered Architecture

```
┌─────────────────────────────────────┐
│  Presentation / API                 │  HTTP handlers, GraphQL resolvers, CLI
├─────────────────────────────────────┤
│  Application                        │  Use case orchestration, no business logic
│  (Application Services)             │  Calls Domain layer; dispatches Domain Events
├─────────────────────────────────────┤
│  Domain                             │  Entities, Value Objects, Aggregates,
│  (the model lives here)             │  Domain Services, Repository interfaces,
│                                     │  Domain Events, Factories, Specifications
├─────────────────────────────────────┤
│  Infrastructure                     │  Repository implementations, ORM, queues,
│                                     │  external API clients, email, storage
└─────────────────────────────────────┘
```

**Critical constraint:** Domain layer has zero dependencies on Infrastructure. Dependencies always point inward. Inject infrastructure via interfaces.

---

## Supple Design Checklist

Before finalizing the tactical model, check:

- [ ] **Intention-Revealing Interfaces** — can a caller understand a method's purpose from its name alone?
- [ ] **Side-Effect-Free Functions** — are queries separated from commands? Does each method do one thing?
- [ ] **Closure of Operations** — do Value Object operations return the same type?
- [ ] **Standalone Classes** — are domain classes testable without external dependencies?
- [ ] **Minimize Associations** — is every association directional and necessary?
- [ ] **Avoid Anemic Model** — do domain classes have behavior, not just data?
