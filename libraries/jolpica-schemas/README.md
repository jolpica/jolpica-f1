# jolpica_schemas

Pydantic schemas for the jolpica F1 API project.

## Structure

This package uses the **src-layout** pattern:

```
jolpica-schemas/
├── pyproject.toml          # Package configuration
└── src/                    # Source directory
    └── jolpica_schemas/
        ├── __init__.py
        ├── data_import.py      # Import/export schemas
        ├── f1_api/             # API response schemas
        │   └── alpha/
        └── tests/              # Unit tests
```

## Installation

From the repository root:

```bash
# via the root project dependencies
uv sync
```

## Usage

```python
from jolpica_schemas.data_import import F1Import, CircuitImport
from jolpica_schemas.f1_api.alpha.circuit import CircuitSummary
```
