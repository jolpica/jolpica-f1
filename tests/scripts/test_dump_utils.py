"""Unit tests for scripts/dump_utils.py."""

from __future__ import annotations

import importlib.util
import sys
import zipfile
from pathlib import Path

MODULE_PATH = Path(__file__).resolve().parents[2] / "scripts" / "dump_utils.py"
_spec = importlib.util.spec_from_file_location("dump_utils", MODULE_PATH)
assert _spec is not None and _spec.loader is not None
dump_utils = importlib.util.module_from_spec(_spec)
sys.modules["dump_utils"] = dump_utils
_spec.loader.exec_module(dump_utils)


def test_create_zip_archive_contains_single_file(tmp_path):
    sql_path = tmp_path / "jolpica-f1-dump.sql"
    sql_path.write_text("CREATE TABLE formula_one_circuit ();\n")
    zip_path = tmp_path / "sql_dump.zip"

    dump_utils.create_zip_archive([sql_path], zip_path)

    assert zip_path.exists()
    with zipfile.ZipFile(zip_path) as zf:
        assert zf.namelist() == ["jolpica-f1-dump.sql"]
        assert zf.read("jolpica-f1-dump.sql") == sql_path.read_bytes()


def test_create_zip_archive_contains_multiple_files_flat(tmp_path):
    circuits = tmp_path / "formula_one_circuit.csv"
    drivers = tmp_path / "formula_one_driver.csv"
    circuits.write_text("id,name\n1,Monza\n")
    drivers.write_text("id,name\n1,Hamilton\n")
    zip_path = tmp_path / "csv_dump.zip"

    dump_utils.create_zip_archive([circuits, drivers], zip_path)

    with zipfile.ZipFile(zip_path) as zf:
        assert sorted(zf.namelist()) == ["formula_one_circuit.csv", "formula_one_driver.csv"]
        assert zf.read("formula_one_circuit.csv") == circuits.read_bytes()
        assert zf.read("formula_one_driver.csv") == drivers.read_bytes()


def test_create_zip_archive_is_reproducible(tmp_path):
    sql_path = tmp_path / "jolpica-f1-dump.sql"
    sql_path.write_text("CREATE TABLE formula_one_circuit ();\n")

    zip_path_a = tmp_path / "a.zip"
    zip_path_b = tmp_path / "b.zip"
    dump_utils.create_zip_archive([sql_path], zip_path_a)
    dump_utils.create_zip_archive([sql_path], zip_path_b)

    assert zip_path_a.read_bytes() == zip_path_b.read_bytes()
