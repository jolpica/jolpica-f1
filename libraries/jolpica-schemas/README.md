# jolpica.schemas

Pydantic schemas for the jolpica F1 API project.

## Structure

This package uses the **src-layout** pattern:

```
jolpica-schemas/
├── pyproject.toml          # Package configuration
├── uv.lock                 # Dependency lock file
└── src/                    # Source directory
    └── jolpica/
        └── schemas/
            ├── __init__.py
            ├── data_import.py      # Import/export schemas
            ├── f1_api/             # API response schemas
            │   └── alpha/
            └── tests/              # Unit tests
```

## Installation

From the repository root:

```bash
# Editable install (for development)
uv pip install -e jolpica-schemas/

# Or via the root project dependencies
uv sync
```

## Usage

```python
from jolpica.schemas.data_import import F1Import, CircuitImport
from jolpica.schemas.f1_api.alpha.circuit import CircuitSummary
```

## Development

### Running Tests

```bash
# From repository root
uv run pytest jolpica-schemas/src/jolpica/schemas/tests/

# Or from jolpica-schemas directory
cd jolpica-schemas
uv run pytest src/jolpica/schemas/tests/
```

### Building

```bash
cd jolpica-schemas
uv build
```

This creates both sdist and wheel in `dist/`:
- `jolpica_schemas-X.Y.Z.tar.gz`
- `jolpica_schemas-X.Y.Z-py3-none-any.whl`

## Why Src-Layout?

The src-layout provides several benefits:

1. **Editable installs**: Fully supported by hatchling
2. **Import safety**: Can't accidentally import from source during tests
3. **Clear separation**: Source code vs. configuration files
4. **Standard practice**: Recommended by Python Packaging Authority
5. **Tool compatibility**: Works with all modern Python build tools

## Namespace Package

`jolpica` is a namespace package (PEP 420) that spans multiple directories:
- `jolpica.formula_one` - Django models and business logic
- `jolpica.schemas` - Pydantic schemas (this package)

This allows both packages to coexist under the same `jolpica` namespace.

