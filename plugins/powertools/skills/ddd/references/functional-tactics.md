# Functional Tactical Design (Ghosh / FP Style)

This reference covers tactical building blocks for the Ghosh/FP style of DDD. The organizing principle is **imperative shell, functional core**: the domain core is pure and side-effect-free; the application shell is imperative and handles all I/O, sequencing, and orchestration.

---

## Core Principles

| Principle | Meaning |
|---|---|
| **Imperative shell, functional core** | The domain core is pure functions and immutable data; the application shell is imperative and owns all I/O |
| **Referential transparency** | A function called with the same arguments always returns the same result |
| **Separation of data and behavior** | ADTs hold values; modules hold functions; nothing holds both |
| **Effects at boundaries** | Domain functions are pure; I/O, databases, and queues live in the shell |
| **Make illegal states unrepresentable** | Use the type system to eliminate invalid domain states at compile time |

---

## Algebraic Data Types (ADTs)

ADTs are the primary modeling tool. An "algebra" has: data types, operations on those types, and laws that constrain the operations.

### Sum Types (OR / discriminated unions)

Model alternatives — "an Account is a CheckingAccount OR a SavingsAccount":

```typescript
type Account =
  | { kind: 'checking'; no: AccountNo; name: string; balance: Balance }
  | { kind: 'savings'; no: AccountNo; name: string; rateOfInterest: number; balance: Balance };
```

Use exhaustive pattern matching to handle every case:

```typescript
function describeAccount(account: Account): string {
  switch (account.kind) {
    case 'checking': return `Checking ${account.no}`;
    case 'savings': return `Savings ${account.no} @ ${account.rateOfInterest}%`;
    default: return assertNever(account);  // compile error if a case is missing
  }
}

function assertNever(x: never): never {
  throw new Error(`Unhandled: ${JSON.stringify(x)}`);
}
```

### Product Types (AND / records)

Model values that carry all their fields simultaneously:

```typescript
type Balance = { readonly amount: bigint };
type AccountNo = { readonly value: string };
```

### Why ADTs over classes

- Immutable by default
- Pattern matching replaces fragile `instanceof` chains
- The type itself documents exactly what states exist
- New operations don't require modifying the type

---

## Making Illegal States Unrepresentable

The goal: use the type system to make entire categories of runtime errors impossible.

### Branded types for domain constraints

```typescript
declare const __brand: unique symbol;
type Brand<T, B> = T & { [__brand]: B };

type OpenAccount = Brand<Account, 'Open'>;
type ClosedAccount = Brand<Account, 'Closed'>;

// The compiler prevents calling debit on a closed account
function debit(account: OpenAccount, amount: bigint): Result<OpenAccount> { ... }
function close(account: OpenAccount): ClosedAccount { ... }
```

### Union types for valid combinations

```typescript
// A contact must have email, postal, or both — never neither
type ContactInfo =
  | { kind: 'email'; email: EmailAddress }
  | { kind: 'postal'; address: PostalAddress }
  | { kind: 'both'; email: EmailAddress; address: PostalAddress };
```

### Smart constructors

Make constructors `private`. Force all creation through factory functions that validate business rules:

```typescript
class AccountNo {
  private constructor(readonly value: string) {}

  static create(raw: string): Result<AccountNo> {
    if (!raw.trim()) return err('Account number required');
    if (raw.length > 20) return err('Account number too long');
    return ok(new AccountNo(raw));
  }
}
```

---

## Pure Domain Functions

Domain logic is expressed as pure functions that take values and return values. No side effects.

```typescript
// All pure — no I/O, no database, no exceptions
function debit(account: Account, amount: bigint): Result<Account, DomainError> {
  if (account.kind === 'closed') return err(new AccountClosedError());
  if (account.balance.amount < amount) return err(new InsufficientFundsError(amount));
  return ok({ ...account, balance: { amount: account.balance.amount - amount } });
}

function credit(account: Account, amount: bigint): Result<Account, DomainError> {
  if (account.kind === 'closed') return err(new AccountClosedError());
  return ok({ ...account, balance: { amount: account.balance.amount + amount } });
}
```

**Domain modules** collect related pure functions. They are the functional equivalent of Domain Services:

```typescript
const AccountService = {
  open: (no: AccountNo, name: string, openDate: Date): Result<Account> => { ... },
  close: (account: Account, closeDate: Date): Result<Account> => { ... },
  debit: (account: Account, amount: bigint): Result<Account, DomainError> => { ... },
  credit: (account: Account, amount: bigint): Result<Account, DomainError> => { ... },
  balance: (account: Account): Balance => account.balance,
};
```

---

## Effect Types

Model side effects as typed return values, never as exceptions or null:

| Effect | TypeScript Type | Use For |
|---|---|---|
| **Optionality** | `T \| undefined` or `Option<T>` | May or may not have a value |
| **Failure** | `Result<T, E>` | May fail with a typed error |
| **Latency** | `Promise<T>` | Will eventually produce a value |
| **Validation** | `ValidationResult<T>` | Accumulates multiple errors |

### Result type (fail-fast)

```typescript
type Result<T, E = DomainError> =
  | { ok: true; value: T }
  | { ok: false; error: E };

const ok = <T>(value: T): Result<T, never> => ({ ok: true, value });
const err = <E>(error: E): Result<never, E> => ({ ok: false, error });
```

### Monadic chaining (stop on first failure)

```typescript
function transfer(
  from: Account,
  to: Account,
  amount: bigint,
): Result<[Account, Account], DomainError> {
  const debitResult = debit(from, amount);
  if (!debitResult.ok) return debitResult;

  const creditResult = credit(to, amount);
  if (!creditResult.ok) return creditResult;

  return ok([debitResult.value, creditResult.value]);
}
```

### Applicative validation (collect all errors)

```typescript
type ValidationResult<T> =
  | { valid: true; value: T }
  | { valid: false; errors: string[] };

function validateAccount(no: string, name: string): ValidationResult<{ no: string; name: string }> {
  const errors: string[] = [];
  if (!no.trim()) errors.push('Account number required');
  if (!name.trim()) errors.push('Name required');
  return errors.length > 0
    ? { valid: false, errors }
    : { valid: true, value: { no, name } };
}
```

**Rule:** Use monadic chaining (fail-fast) when steps are sequentially dependent. Use applicative validation when checks are independent and you want to show users all errors at once.

---

## Repository as a Pure Interface

Repositories are the boundary between the pure domain and impure infrastructure. The interface is expressed entirely in domain terms:

```typescript
interface AccountRepository {
  findByNo(no: AccountNo): Promise<Account | undefined>;
  save(account: Account): Promise<void>;
}
```

Implementations live in the infrastructure layer and inject real I/O. Domain functions never call repositories — they receive and return values; the Application layer wires them together.

---

## Event Sourcing (Functional Persistence)

Event sourcing is the natural consequence of immutability applied to persistence. State is a left fold over the event log.

### Event types

```typescript
type AccountEvent =
  | { kind: 'AccountOpened'; no: AccountNo; name: string; openedAt: Date }
  | { kind: 'MoneyDeposited'; no: AccountNo; amount: bigint; at: Date }
  | { kind: 'MoneyWithdrawn'; no: AccountNo; amount: bigint; at: Date }
  | { kind: 'AccountClosed'; no: AccountNo; closedAt: Date };
```

### The Decider pattern

```typescript
interface Decider<Command, State, Event> {
  decide: (command: Command, state: State) => readonly Event[];
  evolve: (state: State, event: Event) => State;
  initialState: State;
}
```

- `decide` is pure — given a command and current state, produce events
- `evolve` is pure — given current state and an event, produce new state
- Infrastructure (loading events, appending events) lives entirely outside these functions

```typescript
const accountDecider: Decider<AccountCommand, AccountState, AccountEvent> = {
  initialState: { kind: 'nonexistent' },

  decide(command, state): readonly AccountEvent[] {
    switch (command.kind) {
      case 'OpenAccount':
        if (state.kind !== 'nonexistent') return [];  // idempotent
        return [{ kind: 'AccountOpened', no: command.no, name: command.name, openedAt: new Date() }];
      case 'Debit':
        if (state.kind !== 'open') throw new DomainError('Account not open');
        if (state.balance.amount < command.amount) throw new InsufficientFundsError(command.amount);
        return [{ kind: 'MoneyWithdrawn', no: state.no, amount: command.amount, at: new Date() }];
      // ...
    }
  },

  evolve(state, event): AccountState {
    switch (event.kind) {
      case 'AccountOpened': return { kind: 'open', no: event.no, name: event.name, balance: { amount: 0n } };
      case 'MoneyDeposited': return { ...state, balance: { amount: state.balance.amount + event.amount } };
      case 'MoneyWithdrawn': return { ...state, balance: { amount: state.balance.amount - event.amount } };
      case 'AccountClosed': return { kind: 'closed', no: event.no, closedAt: event.closedAt };
    }
  },
};

// Reconstruct state from event history
function reconstruct(events: AccountEvent[]): AccountState {
  return events.reduce(accountDecider.evolve, accountDecider.initialState);
}
```

---

## Value Objects as Monoids

Value objects that can be combined form a monoid: an associative binary operation plus an identity element.

```typescript
interface Monoid<T> {
  empty: T;
  concat: (a: T, b: T) => T;
}

const balanceMonoid: Monoid<Balance> = {
  empty: { amount: 0n },
  concat: (a, b) => ({ amount: a.amount + b.amount }),
};

// Aggregate a list of balances without any loops
const total = balances.reduce(balanceMonoid.concat, balanceMonoid.empty);
```

This pattern applies wherever a domain concept is "addable" or "combinable": Money, Inventory quantities, durations, vote counts.

---

## Dependency Injection via Partial Application

Instead of constructor injection or DI containers, functional DDD uses higher-order functions:

```typescript
// Inject the repository as a function parameter
function makeTransferService(repo: AccountRepository) {
  return {
    async transfer(fromNo: AccountNo, toNo: AccountNo, amount: bigint): Promise<Result<void>> {
      const from = await repo.findByNo(fromNo);
      if (!from) return err(new AccountNotFoundError(fromNo));

      const to = await repo.findByNo(toNo);
      if (!to) return err(new AccountNotFoundError(toNo));

      const result = transfer(from, to, amount);  // pure domain function
      if (!result.ok) return result;

      await repo.save(result.value[0]);
      await repo.save(result.value[1]);
      return ok(undefined);
    },
  };
}
```

---

## Architecture: Imperative Shell, Functional Core

```
┌──────────────────────────────────────────────┐
│  IMPERATIVE SHELL                            │
│                                              │
│  Adapters: HTTP handlers, DB, queues         │
│  Orchestrates I/O, sequences effects,        │
│  calls repositories, dispatches events       │
│                                              │
│  ┌────────────────────────────────────────┐  │
│  │  FUNCTIONAL CORE (pure)               │  │
│  │                                       │  │
│  │  ADTs, pure functions, Deciders       │  │
│  │  No I/O. No exceptions. No state.     │  │
│  │  Input in → output out. Always.       │  │
│  └────────────────────────────────────────┘  │
└──────────────────────────────────────────────┘
```

**Functional core:** Domain types, pure functions, Decider `decide`/`evolve`, validation logic. No imports from infrastructure. Trivially testable — pass data in, assert on data out.

**Imperative shell:** Loads aggregates (or event streams) from the database, calls core functions, persists results, publishes events. All I/O lives here. Thin — it sequences effects; it does not contain business logic.

**Ports** are the interfaces that separate them (Repository, EventStore, MessageBus).
**Adapters** are the shell-side implementations (PostgresRepository, KafkaMessageBus).

---

## Functional Tactical Design Checklist

Before finalizing the model, verify:

- [ ] **No mutable state in domain types** — all domain types are `readonly`
- [ ] **No exceptions in domain functions** — errors returned as `Result<T, E>`
- [ ] **Illegal states impossible** — can you construct an invalid domain value? If yes, fix the types
- [ ] **Smart constructors everywhere** — private constructors, public `create()` functions that return `Result`
- [ ] **Pure `decide` and `evolve`** — if using event sourcing, neither function performs I/O
- [ ] **Effects only at boundaries** — domain functions receive values; application shell performs I/O
- [ ] **Exhaustive pattern matching** — every `switch` on a discriminated union has an `assertNever` default
- [ ] **Value objects are monoids where appropriate** — combinable values implement `empty` + `concat`

---

## Translating Scala/Haskell Patterns to TypeScript

| Scala/Haskell | TypeScript equivalent |
|---|---|
| `sealed trait` / `case class` | Discriminated union types (`type T = A \| B`) |
| `Option[T]` | `T \| undefined` or branded `Option<T>` |
| `Either[E, A]` | `Result<A, E>` |
| `for`-comprehension | `async/await` (for Promise) or flatMap chains |
| Typeclass | Structural interface + standalone module |
| Monoid typeclass | `{ empty: T; concat: (a: T, b: T) => T }` |
| Reader monad | Higher-order functions / partial application |
| Phantom types | Branded types with `unique symbol` |
| Lenses | Spread operator or `immer` / `optics-ts` |
| Property-based tests | `fast-check` library |
| Pattern matching | `switch` on discriminant + `satisfies never` exhaustion |
