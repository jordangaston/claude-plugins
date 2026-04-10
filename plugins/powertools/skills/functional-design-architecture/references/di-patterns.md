# FDD Dependency Injection Patterns

This reference covers the four primary DI patterns from *Functional Design and Architecture* by Alexander Granin. Choose the pattern that matches your application's complexity.

---

## Decision Matrix

| Pattern | Complexity | Testability | Performance | Best For |
|---|---|---|---|---|
| **Service Handle** | Low | Good (swap records) | Excellent | Small apps, getting started |
| **ReaderT** | Medium | Good (swap env) | Excellent | Multi-subsystem apps, standard idiom |
| **Free Monad** | High | Excellent (pure interpreter) | Moderate (overhead) | Need program-level testability |
| **Tagless Final (mtl)** | High | Excellent (typeclass dispatch) | Good (no overhead) | Large apps, compile-time polymorphism |

**Default recommendation:** Start with Service Handle. Graduate to ReaderT when you have 3+ subsystems. Use Free Monad only when you need to test the *sequence of operations*, not just the results. Use Tagless Final when you need typeclass-level abstraction across effects.

---

## Pattern 1: Service Handle

The simplest functional DI pattern. A "handle" is a record of functions — the functional equivalent of an interface with an implementation baked in.

### Structure

```haskell
-- Define the handle type (the "interface")
data AppHandle = AppHandle
  { _db      :: DbHandle
  , _logger  :: LoggerHandle
  , _mailer  :: MailerHandle
  }

data DbHandle = DbHandle
  { _getUser    :: UserId -> IO (Maybe User)
  , _saveUser   :: User -> IO ()
  }

data LoggerHandle = LoggerHandle
  { _logInfo  :: Text -> IO ()
  , _logError :: Text -> IO ()
  }

-- Application functions take the handle explicitly
processUser :: AppHandle -> UserId -> IO (Either AppError ())
processUser h uid = do
  maybeUser <- _getUser (_db h) uid
  case maybeUser of
    Nothing   -> return (Left UserNotFound)
    Just user -> do
      _logInfo (_logger h) ("Processing user: " <> show uid)
      -- ... domain logic
      _saveUser (_db h) updatedUser
      return (Right ())

-- Wire up production handles
productionHandle :: Config -> IO AppHandle
productionHandle cfg = do
  db     <- createDbHandle (dbConfig cfg)
  logger <- createStdoutLogger
  mailer <- createSmtpMailer (smtpConfig cfg)
  return AppHandle { _db = db, _logger = logger, _mailer = mailer }

-- Wire up test handles
testHandle :: IO AppHandle
testHandle = do
  db     <- createInMemoryDb
  logger <- createNoopLogger
  mailer <- createFakeMailer
  return AppHandle { _db = db, _logger = logger, _mailer = mailer }
```

### When to Use

- Simple applications with a small number of subsystems
- Teams new to functional DI
- When explicit parameter passing is preferred over implicit environments

### Limitations

- Handle must be passed explicitly to every function that needs it
- As the number of subsystems grows, the handle type grows
- No typeclass dispatch — every function needs explicit handle access

---

## Pattern 2: ReaderT Pattern

The ReaderT pattern threads a shared environment implicitly through a computation. Functions read from the environment with `ask`/`asks` instead of taking it as a parameter.

### Structure

```haskell
-- Define the environment (equivalent to AppHandle, but for ReaderT)
data Env = Env
  { envDb     :: DbHandle
  , envLogger :: LoggerHandle
  , envMailer :: MailerHandle
  , envConfig :: Config
  }

-- The application monad
type App a = ReaderT Env IO a

-- Helper to run the app
runApp :: Env -> App a -> IO a
runApp env app = runReaderT app env

-- Access subsystems with asks
getDb :: App DbHandle
getDb = asks envDb

-- Application functions no longer take handles explicitly
processUser :: UserId -> App (Either AppError ())
processUser uid = do
  db      <- getDb
  logger  <- asks envLogger
  maybeUser <- liftIO $ _getUser db uid
  case maybeUser of
    Nothing   -> return (Left UserNotFound)
    Just user -> do
      liftIO $ _logInfo logger ("Processing user: " <> show uid)
      -- ... domain logic
      liftIO $ _saveUser db updatedUser
      return (Right ())

-- Combining with error handling
type AppM a = ReaderT Env (ExceptT AppError IO) a
```

### Layered Monad Stack

```haskell
-- Richer stack for real applications
type AppM a = ReaderT Env (ExceptT AppError IO) a

runAppM :: Env -> AppM a -> IO (Either AppError a)
runAppM env app = runExceptT (runReaderT app env)

-- Throw a domain error
throwAppError :: AppError -> AppM a
throwAppError = lift . throwE

-- Catch and recover
catchAppError :: AppM a -> (AppError -> AppM a) -> AppM a
catchAppError action handler = do
  env <- ask
  result <- liftIO $ runAppM env action
  case result of
    Right x  -> return x
    Left err -> handler err
```

### When to Use

- Applications with 3+ subsystems that many functions need
- When you want implicit environment passing without threading handles everywhere
- The most common pattern in production Haskell applications
- Works well with existing `mtl` conventions

### Limitations

- Slightly harder to understand for developers new to monad transformers
- Requires liftIO discipline
- The full environment is always available — no fine-grained capability restriction

---

## Pattern 3: Free Monad Language

Dependency injection via an embedded DSL. Program descriptions are pure data structures; interpreters perform actual I/O. This gives the most powerful testability: you can run a program through a pure interpreter and verify the exact sequence of operations it would perform.

### Structure

```haskell
-- 1. Define the language
data AppLang next
  = GetUser    UserId (Maybe User -> next)
  | SaveUser   User next
  | LogInfo    Text next
  | SendEmail  Email Text next

-- Derive the Functor instance (or use template haskell)
instance Functor AppLang where
  fmap f (GetUser uid next)     = GetUser uid (f . next)
  fmap f (SaveUser u next)      = SaveUser u (f next)
  fmap f (LogInfo msg next)     = LogInfo msg (f next)
  fmap f (SendEmail e msg next) = SendEmail e msg (f next)

-- 2. Free monad over the language
type App a = Free AppLang a

-- 3. Smart constructors
getUser :: UserId -> App (Maybe User)
getUser uid = liftF (GetUser uid id)

saveUser :: User -> App ()
saveUser u = liftF (SaveUser u ())

logInfo :: Text -> App ()
logInfo msg = liftF (LogInfo msg ())

sendEmail :: Email -> Text -> App ()
sendEmail e msg = liftF (SendEmail e msg ())

-- 4. A program (pure data — no I/O happens here)
processUser :: UserId -> App (Either AppError ())
processUser uid = do
  maybeUser <- getUser uid
  case maybeUser of
    Nothing   -> return (Left UserNotFound)
    Just user -> do
      logInfo ("Processing: " <> show uid)
      saveUser updatedUser
      return (Right ())

-- 5. Production interpreter
runApp :: App a -> IO a
runApp (Pure x) = return x
runApp (Free (GetUser uid next))      = realGetUser uid >>= runApp . next
runApp (Free (SaveUser u next))       = realSaveUser u >> runApp next
runApp (Free (LogInfo msg next))      = putStrLn msg >> runApp next
runApp (Free (SendEmail e msg next))  = realSendEmail e msg >> runApp next

-- 6. Test interpreter (pure — records operations)
data TestState = TestState
  { testUsers    :: Map UserId User
  , testLog      :: [Text]
  , testEmails   :: [(Email, Text)]
  }

runAppTest :: App a -> TestState -> (a, TestState)
runAppTest (Pure x) s = (x, s)
runAppTest (Free (GetUser uid next)) s =
  runAppTest (next (Map.lookup uid (testUsers s))) s
runAppTest (Free (SaveUser u next)) s =
  runAppTest next (s { testUsers = Map.insert (userId u) u (testUsers s) })
runAppTest (Free (LogInfo msg next)) s =
  runAppTest next (s { testLog = testLog s ++ [msg] })
runAppTest (Free (SendEmail e msg next)) s =
  runAppTest next (s { testEmails = testEmails s ++ [(e, msg)] })
```

### Testing with Free Monad

```haskell
-- Test: verify the exact operations performed
test_processUser :: Spec
test_processUser = it "logs and saves when user exists" $ do
  let initState = TestState
        { testUsers  = Map.fromList [(uid, existingUser)]
        , testLog    = []
        , testEmails = []
        }
  let (result, finalState) = runAppTest (processUser uid) initState
  result          `shouldBe` Right ()
  testLog finalState `shouldContain` ["Processing: " <> show uid]
  Map.member uid (testUsers finalState) `shouldBe` True
```

### When to Use

- When you need to verify not just the result but the sequence of operations
- When the same program needs multiple production backends (database, message queue, etc.)
- When you need mockable effects without a mocking framework
- Research-grade or framework-level code where interpretability matters most

### Limitations

- Boilerplate per operation (constructor, smart constructor, interpreter case)
- Performance overhead from heap-allocated trees
- Cognitive overhead for developers unfamiliar with Free monads
- Composing multiple Free languages requires coproducts (additional complexity)

---

## Pattern 4: Tagless Final (mtl / Final Encoding)

Instead of encoding the program as a data structure (Free monad), Tagless Final uses typeclasses to abstract over effects. The program is polymorphic over any monad that satisfies the required constraints.

### Structure

```haskell
-- 1. Define capability typeclasses
class Monad m => UserRepo m where
  getUser  :: UserId -> m (Maybe User)
  saveUser :: User -> m ()

class Monad m => Logger m where
  logInfo  :: Text -> m ()
  logError :: Text -> m ()

class Monad m => Mailer m where
  sendEmail :: Email -> Text -> m ()

-- 2. Application code is polymorphic over any m that has the capabilities
processUser
  :: (UserRepo m, Logger m)
  => UserId
  -> m (Either AppError ())
processUser uid = do
  maybeUser <- getUser uid
  case maybeUser of
    Nothing   -> return (Left UserNotFound)
    Just user -> do
      logInfo ("Processing: " <> show uid)
      saveUser updatedUser
      return (Right ())

-- 3. Production instances (for IO)
instance UserRepo IO where
  getUser  uid  = realGetUser uid
  saveUser user = realSaveUser user

instance Logger IO where
  logInfo  msg = putStrLn ("[INFO]  " <> msg)
  logError msg = putStrLn ("[ERROR] " <> msg)

-- 4. Test instances (for a pure State monad)
newtype TestM a = TestM { runTestM :: State TestState a }
  deriving (Functor, Applicative, Monad)

instance UserRepo TestM where
  getUser uid   = TestM $ gets (Map.lookup uid . testUsers)
  saveUser user = TestM $ modify (\s -> s { testUsers = Map.insert (userId user) user (testUsers s) })

instance Logger TestM where
  logInfo msg = TestM $ modify (\s -> s { testLog = testLog s ++ [msg] })
  logError _  = pure ()

-- 5. Run
runProduction :: IO ()
runProduction = processUser someUid >>= print

runTest :: (Either AppError (), TestState)
runTest = runState (runTestM (processUser someUid)) initialState
```

### ReaderT + Tagless Final (common combination)

```haskell
-- Combine: use ReaderT for environment AND Tagless Final for capability abstraction
newtype AppM a = AppM { unAppM :: ReaderT Env IO a }
  deriving (Functor, Applicative, Monad, MonadIO, MonadReader Env)

instance UserRepo AppM where
  getUser uid = do
    db <- asks envDb
    liftIO $ _getUser db uid

instance Logger AppM where
  logInfo msg = do
    logger <- asks envLogger
    liftIO $ _logInfo logger msg
```

### When to Use

- Large applications with many capability requirements
- When you want compile-time enforcement that a function only uses declared capabilities
- When performance matters and you want to avoid the Free monad heap overhead
- Teams with strong Haskell/FP expertise

### Limitations

- Requires typeclass literacy; steep learning curve
- Instance coherence issues if capabilities have overlapping instances
- Can result in large constraint lists that are harder to read
- Harder to inspect "what would this program do?" compared to Free monad

---

## Pattern Comparison: Same Feature, Four Ways

```haskell
-- Service Handle
processOrder_SH :: AppHandle -> OrderId -> IO (Either OrderError ())

-- ReaderT
processOrder_RT :: OrderId -> App (Either OrderError ())
-- where type App a = ReaderT Env IO a

-- Free Monad
processOrder_FM :: OrderId -> OrderDSL (Either OrderError ())
-- where type OrderDSL = Free OrderLang

-- Tagless Final
processOrder_TF :: (OrderRepo m, Logger m, Mailer m) => OrderId -> m (Either OrderError ())
```

All four express the same intent. The difference is how dependencies are threaded and how the code is tested.
