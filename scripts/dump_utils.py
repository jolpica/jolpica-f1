"""Shared helpers for the formula_one_* database dump scripts.

Imported as a plain sibling module by generate_csv_dump.py and
generate_sql_dump.py (scripts/ has no __init__.py by design - each dump
script is a standalone `uv run` PEP 723 script). This module has no
third-party dependencies, so it doesn't need a dependency block of its own.
"""

from __future__ import annotations

import shutil
import zipfile
from collections.abc import Iterable
from pathlib import Path


def create_zip_archive(files: Iterable[Path], zip_path: Path) -> None:
    """Create a reproducible zip archive containing the given files (flat structure).

    Uses a fixed timestamp so identical content produces an identical zip
    file (same SHA256 hash) across different runs. Each file is streamed
    into the archive rather than loaded fully into memory.

    Args:
        files: Files to archive. Each is stored under its own name (no
            directory structure), so names must be unique.
        zip_path: Path where the zip file will be created.

    Raises:
        OSError: If there's an error creating the zip file.
    """
    fixed_timestamp = (1999, 1, 1, 0, 0, 0)

    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zipf:
        for file_path in files:
            zip_info = zipfile.ZipInfo(filename=file_path.name)
            zip_info.date_time = fixed_timestamp
            zip_info.compress_type = zipfile.ZIP_DEFLATED

            with open(file_path, "rb") as src, zipf.open(zip_info, "w") as dest:
                shutil.copyfileobj(src, dest)
