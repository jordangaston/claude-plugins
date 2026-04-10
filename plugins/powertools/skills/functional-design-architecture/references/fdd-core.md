# FDD Core: Domain Modeling Reference

This reference covers the domain modeling tools available in Functional Declarative Design (FDD), drawn from *Functional Design and Architecture* by Alexander Granin.

---

## Algebraic Data Types (ADTs)

ADTs are the primary modeling tool. They define a type by specifying exactly which values it can hold. No invalid values can exist if the ADT is designed correctly.

### Sum Types (OR / variants)

Model alternatives — one of several possible cases:

```haskell
-- Haskell
data Shape
  = Circle   { radius :: Float }
  | Rectangle { width :: Float, height :: Float }
  | Triangle  { base :: Float, height :: Float }

-- TypeScript equivalent
type Shape =
  | { kind: 'circle';    radius: number }
  | { kind: 'rectangle'; width: number; height: number }
  | { kind: 'triangle';  base: number; height: number }
```

Pattern match exhaustively — every case must be handled:

```haskell
area :: Shape -> Float
area (Circle r)      = pi * r * r
area (Rectangle w h) = w * h
area (Triangle b h)  = 0.5 * b * h
```

### Product Types (AND / records)

Model values that must carry all their fields simultaneously:

```haskell
data User = User
  { userId    :: UserId
  , userName  :: UserName
  , userEmail :: Email
  }
```

### Making Illegal States Unrepresentable

Design ADTs so that invalid domain states cannot be constructed.

**Before (invalid states possible):**
```haskell
data Contact = Contact
  { email   :: Maybe Text
  , address :: Maybe Text
  }
-- BAD: Contact Nothing Nothing is valid to the type system but invalid in the domain
```

**After (illegal state eliminated):**
```haskell
data Contact
  = EmailOnly    Email
  | AddressOnly  PostalAddress
  | EmailAndAddress Email PostalAddress
-- GOOD: Every Contact value is a valid contact
```

### Smart Constructors

Use smart constructors to enforce invariants at construction time. The raw constructor is not exported; the smart constructor is:

```haskell
-- Not exported
newtype Email = Email Text

-- Exported — the only way to make an Email
mkEmail :: Text -> Either ValidationError Email
mkEmail raw
  | T.null raw        = Left EmptyEmail
  | not (hasAt raw)   = Left MissingAtSign
  | otherwise         = Right (Email raw)
```

---

## Embedded DSLs (eDSLs)

An eDSL is a domain-specific language embedded inside the host language. It lets you express domain operations in a vocabulary that matches the domain, not the implementation.

### Simple eDSL Using Functions and Primitive Types

The simplest eDSL: functions composed together describe the domain logic.

```haskell
-- Domain operations as functions
deposit  :: Amount -> Account -> Account
withdraw :: Amount -> Account -> Either InsufficientFunds Account
transfer :: Amount -> Account -> Account -> Either InsufficientFunds (Account, Account)
```

### eDSL Using ADTs

Represent domain operations as data. The operations are values that can be inspected, transformed, or interpreted:

```haskell
data BankingCommand
  = Deposit  Amount AccountId
  | Withdraw Amount AccountId
  | Transfer Amount AccountId AccountId
  | GetBalance AccountId

data BankingQuery
  = CurrentBalance AccountId
  | TransactionHistory AccountId DateRange
```

Commands and queries are now data — they can be logged, replayed, tested, or sent over a network before being executed.

---

## Free Monad eDSL

The Free monad pattern separates the *description* of a program from its *interpretation*. A Free monad program is pure data — a tree of operations. Interpreters traverse the tree and perform the actual effects.

### Why Free Monads

- **Testability:** Provide a pure test interpreter that records what would happen, without doing it
- **Multiple backends:** The same program description can be run against a database, a mock, or a file
- **Composability:** Programs are values; they can be combined, transformed, inspected
- **Separation of concerns:** Domain logic is in the Free program; I/O is in the interpreter

### Structure

```haskell
-- 1. Define the language as a functor
data HardwareLang next
  = ReadSensor  SensorId (Reading -> next)
  | Actuate     ActuatorId Command next

-- 2. The Free monad over the language
type HardwareDSL a = Free HardwareLang a

-- 3. Smart constructors (lift into Free)
readSensor :: SensorId -> HardwareDSL Reading
readSensor sid = liftF (ReadSensor sid id)

actuate :: ActuatorId -> Command -> HardwareDSL ()
actuate aid cmd = liftF (Actuate aid cmd ())

-- 4. A program (pure data — no I/O)
controlLoop :: HardwareDSL ()
controlLoop = do
  temp <- readSensor TemperatureSensor
  when (temp > Threshold) $ actuate Cooler TurnOn

-- 5. Production interpreter (impure)
runHardware :: HardwareDSL a -> IO a
runHardware (Pure x) = return x
runHardware (Free (ReadSensor sid next)) = do
  reading <- actuallyReadSensor sid
  runHardware (next reading)
runHardware (Free (Actuate aid cmd next)) = do
  actuallyActuate aid cmd
  runHardware next

-- 6. Test interpreter (pure)
runHardwareTest :: HardwareDSL a -> TestState -> (a, TestState)
-- ... pure state machine; no I/O
```

### Advantages and Disadvantages

| Advantage | Disadvantage |
|---|---|
| Full testability at program level | Performance overhead from tree structure |
| Programs are inspectable data | Boilerplate (functor, smart constructors, interpreter) |
| Multiple interpreters for free | Requires FP discipline throughout |
| Side effects made explicit and bounded | Can be hard to compose across multiple Free languages |

### Free Language Composition

Compose multiple eDSLs using coproducts:

```haskell
type AppDSL = Free (HardwareLang :+: DatabaseLang :+: LoggingLang)
```

Each interpreter handles its own language; the combined interpreter dispatches to each.

---

## Arrows for eDSLs

Arrows generalize monads for computations with multiple inputs. Use Arrows when your DSL needs:
- Multiple input channels
- Stream processing
- Transformations with feedback

```haskell
-- Arrow DSL for a data pipeline
data Pipeline a b where
  ReadInput   :: Pipeline () RawData
  Transform   :: (a -> b) -> Pipeline a b
  FilterPass  :: (a -> Bool) -> Pipeline a (Maybe a)
  WriteOutput :: Pipeline Result ()
```

Arrows are more complex than Free monads; use them only when the domain genuinely has multi-input structure.

---

## Pure/Impure Layer Separation

This is the most critical structural decision in FDD.

```
┌──────────────────────────────────────┐
│  IMPURE LAYER                        │
│  IO, databases, network, time, rand  │
│  Collects data, runs interpreters    │
├──────────────────────────────────────┤
│  PURE LAYER                          │
│  Business logic, domain model        │
│  ADTs, pure functions, Free programs │
│  No I/O. Deterministic.              │
└──────────────────────────────────────┘
```

**Pyramid rule:** Build pyramids of pure functions. A pure function calling pure functions is always pure. An impure function calling anything makes everything that calls it impure. Minimize the impure surface area.

```haskell
-- Pure calculation (sits in pure layer)
calculateAverage :: [Float] -> Float
calculateAverage values = sum values / fromIntegral (length values)

-- Impure data collection (sits in impure layer)
observeTemperatureDuring :: Seconds -> IO [Float]
observeTemperatureDuring secs = ...

-- Orchestration (impure layer, thin — just sequences effects)
getAverageTemperature :: IO Float
getAverageTemperature = do
  values <- observeTemperatureDuring 60   -- impure: collect data
  return $ calculateAverage values        -- pure: compute result
```

---

## Functional Interfaces and IoC

Functional analogues to OOP interfaces:

| OOP | Functional |
|---|---|
| Interface with methods | Record of functions (Haskell) / Module signature (ML) |
| Class implementing interface | Function returning the record with implementations |
| Dependency injection | Parameter passing / partial application / Reader monad |
| Inversion of Control | High-level code receives its dependencies as arguments |

```haskell
-- The "interface" is a record of functions
data Logger = Logger
  { logInfo  :: Text -> IO ()
  , logError :: Text -> IO ()
  , logDebug :: Text -> IO ()
  }

-- A production implementation
stdoutLogger :: Logger
stdoutLogger = Logger
  { logInfo  = \msg -> putStrLn ("[INFO]  " <> msg)
  , logError = \msg -> putStrLn ("[ERROR] " <> msg)
  , logDebug = \msg -> putStrLn ("[DEBUG] " <> msg)
  }

-- A test implementation
noopLogger :: Logger
noopLogger = Logger
  { logInfo  = \_ -> pure ()
  , logError = \_ -> pure ()
  , logDebug = \_ -> pure ()
  }
```

The calling code depends on the `Logger` type, not on any concrete implementation. Swap implementations by passing a different value.

---

## Domain Modeling Checklist

Before finalizing the domain model:

- [ ] **All illegal states are unrepresentable** — can you construct an invalid value? If yes, redesign the type
- [ ] **Smart constructors for all constrained types** — raw constructors unexported; creation returns `Either Error T`
- [ ] **ADTs use sum types for OR, product types for AND** — no booleans that could be an ADT
- [ ] **Pure functions have no side effects** — if a function returns `IO`, it belongs in the impure layer
- [ ] **Free monad programs are pure values** — no I/O in the program; only in the interpreter
- [ ] **Error types are domain-specific** — no raw strings or generic exceptions in domain functions
- [ ] **Domain model does not import infrastructure** — no database types, HTTP types, or framework types in domain ADTs
