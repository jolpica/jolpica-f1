# Jolpica F1 API — Schema Design Guidelines (v1)

Design principles and conventions for Pydantic schemas in `jolpica_schemas.f1_api.alpha`.

---

## 1. Architecture Overview

Schemas live in `libraries/jolpica-schemas/src/jolpica_schemas/f1_api/alpha/` and are organized into three layers:

| Layer | File | Purpose |
|---|---|---|
| **Shared** | `shared.py` | Reusable entity schemas (`Driver`, `Round`, `Session`, etc.) |
| **Metadata** | `metadata.py` | Generic response wrappers (`DetailResponse[T]`, `PaginatedResponse[T]`) |
| **Endpoint** | `driver.py`, `schedule.py`, etc. | Endpoint-specific compositions and query params |

---

## 2. Shared Component Design (`shared.py`)

### 2.1 Two-Tier Pattern: `Basic*` and Full

Every database-backed entity follows a two-tier pattern:

```python
class BasicDriver(BaseModel):   # Minimal: id + url + key identifiers
    id: str
    url: HttpUrl
    abbreviation: str | None = Field(None, max_length=10)
    given_name: str
    family_name: str

class Driver(BasicDriver):      # Full: adds optional/extended fields
    nationality: str | None = None
    country_code: str | None = Field(None, max_length=3)
    permanent_car_number: int | None = None
    date_of_birth: datetime.date | None = None
    wikipedia: HttpUrl | None = None
```

**Why two tiers?**
- `Basic*` is used when an entity appears as a **related object** in another endpoint's response (e.g., `BasicDriver` inside a `SessionEntrySummary`). It keeps payloads small by including only what's needed for identification and display.
- The full variant is used when the entity is the **primary resource** being returned (e.g., the `/drivers/` endpoint returns `Driver`).

**Rules:**
- `Basic*` must always include `id: str` and `url: HttpUrl`.
- `Basic*` should include the minimum fields needed to identify and display the entity (e.g., `name`, `given_name`/`family_name`).
- The full variant inherits from `Basic*` and adds optional detail fields.
- Not every entity needs both tiers — if there's no meaningful difference, a single class suffices.

### 2.2 IDs and URLs

Every schema that maps to a database object **must** have:
- `id: str` — a stable, opaque identifier for the API resource.
- `url: HttpUrl` — the canonical API URL for the resource.

These always appear as the first two fields.

### 2.3 When NOT to Add an ID

Schemas that represent **logical groupings** rather than database rows should **not** have an `id`. The key example is `FullSession` — it groups sub-sessions (Q1, Q2, Q3) into a logical "Qualifying" concept, but no single database row represents "Qualifying". See [Section 5](#5-session-vs-fullsession) for details.

### 2.4 Display Pairs

When a field has both a machine-readable code and a human-readable label, use a paired naming convention:

```python
type: str          # Machine-readable code
type_display: str  # Human-readable label

status: int
status_display: str
```

For `FullSession`, the pair is `code`/`title` instead, because it represents a consolidated concept rather than a direct database field.

### 2.5 Duration/Time Doubles

Temporal values that need multiple representations use a double pattern:

```python
time: timedelta | None         # ISO 8601 duration (machine-readable)
time_display: str | None       # Human-readable string
```


---

## 3. Prefer Flat Over Nested

### The Problem with Nesting

When entity B is nested inside entity A, it creates a tight coupling:

```python
# BAD: Circuit is nested inside Round
class ScheduleRound(BasicRound):
    circuit: ScheduleCircuit       # Nested
    sessions: list[ScheduleSession]  # Nested
```

This means:
- **Circuit can't be reused independently** — it's locked into the round's structure.
- **Adding a shared field to Circuit requires touching every parent** that nests it.
- **The response shape implies ownership** (circuit "belongs to" round) rather than association.

### The Flat Alternative

Sibling keys at the same level:

```python
# GOOD: Round and Circuit are siblings
class ScheduleEntry(BaseModel):
    round: Round                         # Flat
    circuit: Circuit                     # Flat
    date: datetime.date | None = None
    sessions: list[ScheduleFullSession]  # Flat
```

**When to flatten:**
- When two entities are **associated** but neither owns the other (round ↔ circuit).
- When the nested entity is a **reusable shared type** (circuits appear in many contexts).

**When nesting is still appropriate:**
- When the child is **truly owned** or **only meaningful in context** of the parent (e.g., `ResultComponent` only makes sense inside `ResultItem`).
- When the child is a **list of sub-items** tightly coupled to the parent (e.g., `sessions` inside `FullSession`).

---

## 4. Endpoint Schema Conventions

### 4.1 File Structure

Each endpoint file typically contains:

1. **Endpoint-specific subclasses** of shared types (if extra fields are needed).
2. **Summary/Detail schemas** composing the response shape.
3. **Response type aliases** wrapping in `DetailResponse[T]` or `PaginatedResponse[T]`.
4. **QueryParams** for filtering (if the endpoint supports filtering).

```python
# circuit.py — minimal endpoint file
from .shared import Circuit
from .metadata import DetailResponse, PaginatedResponse

class CircuitSummary(Circuit):
    pass

PaginatedCircuitSummary = PaginatedResponse[list[CircuitSummary]]
RetrievedCircuitDetail = DetailResponse[CircuitSummary]

class CircuitQueryParams(BaseModel):
    model_config = ConfigDict(extra="forbid")
    year: int | None = Field(None, description="...")
```

### 4.2 Endpoint-Specific Subclasses

When an endpoint needs a shared type **as-is**, create a pass-through subclass:

```python
class SessionEntryDriver(BasicDriver):
    pass
```

**Why not use `BasicDriver` directly?** Because:
- It allows **future endpoint-specific additions** without changing the shared type.
- It makes the **relationship explicit** in the schema graph (`SessionEntryDriver` vs `PitStopDriver`).

When an endpoint needs **extra fields**, add them to the subclass:

```python
class ScheduleFullSession(FullSession):
    results_url: HttpUrl | None = None  # Only meaningful in schedule context
```

### 4.3 Response Wrappers

All API responses are wrapped in either:

```python
DetailResponse[T]      # Single-item response with timestamp metadata
PaginatedResponse[T]   # List response with pagination metadata
```

Endpoint files define named type aliases for clarity:

```python
RetrievedDriverDetail = DetailResponse[DriverSummary]
PaginatedDriverSummary = PaginatedResponse[list[DriverSummary]]
```

### 4.4 QueryParams

Filter schemas use `ConfigDict(extra="forbid")` to reject unknown parameters. All filter fields are optional with `None` defaults.

```python
class DriverQueryParams(BaseModel):
    model_config = ConfigDict(extra="forbid")
    year: int | None = Field(None, description="Filter drivers who competed in a specific season year")
    team_id: str | None = Field(None, description="Filter by team API ID")
```

---

## 5. Session vs FullSession

This is the most nuanced concept in the schema design.

### Session (Database-Backed)

A `Session` maps 1:1 to a database row. Each has a specific type like `Q1`, `Q2`, `Q3`, `R`, `FP1`, `SR`, etc.

```python
class Session(BasicSession):
    id: str            # ← Has an ID, maps to a DB row
    url: HttpUrl
    type: str          # Specific: "Q1", "Q2", "Q3"
    type_display: str  # "Qualifying 1", "Qualifying 2"
    timestamp: datetime.datetime | None
    ...
```

### FullSession (Logical Grouping)

A `FullSession` represents a **logical session** that may be composed of multiple sub-sessions. For example, "Qualifying" (code `Q`) is made up of Q1, Q2, and Q3. A "Race" (code `R`) has just one sub-session.

```python
class FullSession(BaseModel):
    # No id — this is a logical concept, not a DB row
    code: str           # Consolidated: "Q", "SQ", "R", "FP1"
    title: str          # "Qualifying", "Sprint Qualifying", "Race"
    sessions: list[Session]  # The actual DB-backed sessions
```

**Key distinctions:**

| Aspect | `Session` | `FullSession` |
|---|---|---|
| Has `id` | Yes | No |
| Maps to DB | Yes, one row | No, logical grouping |
| Type granularity | Specific (`Q1`, `Q2`) | Consolidated (`Q`) |
| Field names | `type` / `type_display` | `code` / `title` |
| Contains | Single session data | List of `Session` objects |

### Consolidation Mapping

The mapping from individual session types to consolidated types:

| Individual Sessions | → | FullSession Code | FullSession Title |
|---|---|---|---|
| Q1, Q2, Q3, QO, QA, QB | → | Q | Qualifying |
| SQ1, SQ2, SQ3 | → | SQ | Sprint Qualifying |
| R | → | R | Race |
| SR | → | SR | Sprint Race |
| FP1 | → | FP1 | Free Practice 1 |
| FP2 | → | FP2 | Free Practice 2 |
| FP3 | → | FP3 | Free Practice 3 |

### Where Each is Used

- **Schedule endpoint** uses `FullSession` (via `ScheduleFullSession`) — shows the high-level race weekend structure. Users see "Qualifying" as one item, not three.
- **Results endpoint** uses `FullSession` as base class for `Results` — results operate on a logical session (all of qualifying), with individual sessions listed for context.
- **Session endpoint** uses `Session` directly — each individual session is its own API resource.
- **Round endpoint** uses `Session` directly — lists all individual sessions in a round.

---

## 6. Common Pitfalls

### 6.1 Don't Duplicate Shared Fields in Endpoint Schemas

**Bad:** Defining fields that already exist in shared types.

```python
# BAD: Redefining fields that exist on Session
class ScheduleSession(BaseModel):
    type: str
    type_display: str
    timestamp: datetime.datetime | None = None
    timezone: str | None = None
```

**Good:** Inherit from the shared type.

```python
# GOOD: Inherit and only add what's new
class ScheduleFullSession(FullSession):
    results_url: HttpUrl | None = None
```

### 6.2 Don't Add IDs to Non-Database Concepts

If a schema represents a grouping, aggregation, or computed concept that doesn't have a single database row, it should **not** have an `id` field. `FullSession` is the canonical example.

### 6.3 Don't Add Endpoint-Specific Fields to Shared Types

Fields that are only meaningful in one context should live on the endpoint subclass, not the shared base.

```python
# BAD: results_url only makes sense in the schedule context
class FullSession(BaseModel):
    results_url: HttpUrl | None = None  # Don't put this here

# GOOD: Put it on the schedule-specific subclass
class ScheduleFullSession(FullSession):
    results_url: HttpUrl | None = None
```

### 6.4 Don't Nest When You Should Flatten

If you find yourself creating a one-off wrapper class just to nest an entity, that's a signal to flatten instead.

```python
# BAD: Circuit nested inside Round for no strong reason
class ScheduleRound(BasicRound):
    circuit: ScheduleCircuit  # Why is circuit inside round?

# GOOD: Both are siblings
class ScheduleEntry(BaseModel):
    round: Round
    circuit: Circuit
```

### 6.5 Don't Forget Display Pairs

When adding a machine-readable code field, always consider whether a `*_display` companion is needed. API consumers often need both.

### 6.6 Use `Field(...)` for Required Fields with Metadata

Required fields that need descriptions or constraints should use `Field(...)`:

```python
type: str = Field(..., description="Session type code (e.g., R, Q1, FP1)")
```

Optional fields use `Field(None, ...)`:

```python
country_code: str | None = Field(None, max_length=3)
```

### 6.7 Keep `Basic*` Minimal

Resist the urge to add "nice to have" fields to `Basic*` classes. They appear in many responses as related objects, so every field added multiplies across all endpoints. Only include what's necessary for **identification and display**.

---

## 7. Adding a New Endpoint Schema

Checklist:

1. **Check `shared.py`** — does the entity already have `Basic*`/Full shared types? Use them.
2. **Create endpoint file** — e.g., `new_entity.py`.
3. **Subclass shared types** — create pass-through or extended subclasses for related entities.
4. **Compose the summary schema** — the primary entity with related entities as flat sibling fields.
5. **Define response wrappers** — `PaginatedResponse[list[Summary]]` and/or `DetailResponse[Summary]`.
6. **Add QueryParams** — with `ConfigDict(extra="forbid")` and all-optional fields.
7. **Only modify `shared.py`** if the new concept is genuinely reusable across multiple endpoints.

---

## 8. Modifying Shared Schemas

When changing `shared.py`:

- **Adding a field** to `Basic*` affects every endpoint that uses it — keep it minimal.
- **Adding a new shared class** (like `FullSession`) is safe if it doesn't change existing classes.
- **Renaming fields** is a breaking change — consider whether the old name is used in serialized API responses.
- **Test all endpoints** after any shared change, not just the one you're working on.
