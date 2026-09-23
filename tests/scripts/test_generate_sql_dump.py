"""Unit tests for scripts/generate_sql_dump.py.

These tests mock psycopg and subprocess so they run without a live Postgres
database or the pg_dump binary - they cover the script's own logic (command
construction, the non-prefixed-table safety check, output file handling),
not pg_dump's behaviour itself.
"""

from __future__ import annotations

import importlib.util
import subprocess
import sys
import zipfile
from pathlib import Path
from unittest.mock import MagicMock, patch

import pytest
from psycopg.conninfo import conninfo_to_dict

SCRIPTS_DIR = Path(__file__).resolve().parents[2] / "scripts"
MODULE_PATH = SCRIPTS_DIR / "generate_sql_dump.py"

# generate_sql_dump.py imports its sibling dump_utils.py as a plain module
# (scripts/ has no __init__.py - each script is standalone). At actual
# runtime Python puts the script's own directory on sys.path[0] for us;
# loading it here via spec_from_file_location doesn't, so it must be added
# explicitly for that import to resolve.
sys.path.insert(0, str(SCRIPTS_DIR))

_spec = importlib.util.spec_from_file_location("generate_sql_dump", MODULE_PATH)
assert _spec is not None and _spec.loader is not None
generate_sql_dump = importlib.util.module_from_spec(_spec)
sys.modules["generate_sql_dump"] = generate_sql_dump
_spec.loader.exec_module(generate_sql_dump)


def make_cursor(rows: list[tuple]) -> MagicMock:
    cursor = MagicMock()
    cursor.fetchall.return_value = rows
    cursor.__enter__.return_value = cursor
    cursor.__exit__.return_value = False
    return cursor


def test_get_formula_one_tables_returns_schema_qualified_table_names():
    conn = MagicMock()
    conn.cursor.return_value = make_cursor([("formula_one_circuit",), ("formula_one_driver",)])

    tables = generate_sql_dump.get_formula_one_tables(conn)

    assert tables == ["public.formula_one_circuit", "public.formula_one_driver"]


def test_get_formula_one_tables_queries_by_schema_and_prefix_params():
    conn = MagicMock()
    cursor = make_cursor([])
    conn.cursor.return_value = cursor

    generate_sql_dump.get_formula_one_tables(conn, schema="public", prefix="formula_one_")

    query, params = cursor.execute.call_args.args
    assert params == {"schema": "public", "prefix": "formula_one_"}
    assert "schemaname = %(schema)s" in query
    assert "starts_with(tablename, %(prefix)s)" in query
    assert "LIKE" not in query


def test_get_formula_one_tables_empty():
    conn = MagicMock()
    conn.cursor.return_value = make_cursor([])

    assert generate_sql_dump.get_formula_one_tables(conn) == []


@pytest.mark.parametrize(
    ["password", "expected"],
    [
        (None, "host=localhost dbname=jolpica user=postgres"),
        ("secret", "host=localhost dbname=jolpica user=postgres password=secret"),
        ("pass with spaces", "host=localhost dbname=jolpica user=postgres password='pass with spaces'"),
        ("back\\slash", "host=localhost dbname=jolpica user=postgres password=back\\\\slash"),
    ],
)
def test_build_connection_params(password, expected):
    assert generate_sql_dump.build_connection_params("localhost", "jolpica", "postgres", password) == expected


def test_build_connection_params_roundtrips_via_make_conninfo():
    conn_str = generate_sql_dump.build_connection_params("localhost", "jolpica", "postgres", "pass with spaces")

    assert conninfo_to_dict(conn_str) == {
        "host": "localhost",
        "dbname": "jolpica",
        "user": "postgres",
        "password": "pass with spaces",
    }


def test_setup_output_paths_creates_sql_dir_and_cleans_old_files(tmp_path):
    old_sql = tmp_path / "sql"
    old_sql.mkdir()
    (old_sql / "jolpica-f1-dump.sql").write_text("stale")
    (tmp_path / "sql_dump.zip").write_text("stale zip")

    sql_path, zip_path = generate_sql_dump.setup_output_paths(tmp_path)

    assert sql_path == tmp_path / "sql" / "jolpica-f1-dump.sql"
    assert zip_path == tmp_path / "sql_dump.zip"
    assert sql_path.parent.is_dir()
    assert not sql_path.exists()
    assert not zip_path.exists()


def test_find_pg_dump_returns_resolved_path():
    with patch.object(generate_sql_dump.shutil, "which", return_value="/usr/bin/pg_dump"):
        assert generate_sql_dump.find_pg_dump() == "/usr/bin/pg_dump"


def test_find_pg_dump_raises_when_missing():
    with (
        patch.object(generate_sql_dump.shutil, "which", return_value=None),
        pytest.raises(RuntimeError, match="PATH"),
    ):
        generate_sql_dump.find_pg_dump()


def test_build_pg_dump_command_includes_each_table_as_allow_list_flag(tmp_path):
    sql_path = tmp_path / "dump.sql"

    cmd = generate_sql_dump.build_pg_dump_command(
        "/usr/bin/pg_dump",
        "dbhost",
        "dbuser",
        "dbname",
        ["public.formula_one_circuit", "public.formula_one_driver"],
        sql_path,
    )

    assert cmd[0] == "/usr/bin/pg_dump"
    assert "--no-owner" in cmd
    assert "--no-privileges" in cmd
    assert "--strict-names" in cmd
    assert cmd.count("-t") == 2
    for table in ["public.formula_one_circuit", "public.formula_one_driver"]:
        idx = cmd.index(table)
        assert cmd[idx - 1] == "-t"
    assert cmd[cmd.index("-f") + 1] == str(sql_path)


def test_build_pg_dump_command_raises_on_empty_table_list(tmp_path):
    with pytest.raises(ValueError, match="No tables"):
        generate_sql_dump.build_pg_dump_command("/usr/bin/pg_dump", "h", "u", "d", [], tmp_path / "dump.sql")


def test_run_pg_dump_invokes_subprocess_with_check_and_capture():
    cmd = ["/usr/bin/pg_dump", "-t", "public.formula_one_circuit"]
    with patch.object(generate_sql_dump.subprocess, "run", return_value=MagicMock(stderr="")) as mock_run:
        generate_sql_dump.run_pg_dump(cmd)

    mock_run.assert_called_once_with(cmd, check=True, capture_output=True, text=True)


def test_run_pg_dump_logs_stderr_even_on_success():
    cmd = ["/usr/bin/pg_dump", "-t", "public.formula_one_circuit"]
    with (
        patch.object(generate_sql_dump.subprocess, "run", return_value=MagicMock(stderr="warning: table skipped")),
        patch.object(generate_sql_dump.logger, "warning") as mock_warning,
    ):
        generate_sql_dump.run_pg_dump(cmd)

    mock_warning.assert_called_once()
    assert "warning: table skipped" in mock_warning.call_args.args[0]


def test_run_pg_dump_propagates_called_process_error():
    with patch.object(
        generate_sql_dump.subprocess,
        "run",
        side_effect=subprocess.CalledProcessError(1, ["pg_dump"], stderr="boom"),
    ):
        with pytest.raises(subprocess.CalledProcessError):
            generate_sql_dump.run_pg_dump(["pg_dump"])


@pytest.mark.parametrize(
    ["sql_content", "expected_offenders"],
    [
        ("CREATE TABLE formula_one_circuit (\n    id bigint\n);\n", []),
        ("CREATE TABLE public.formula_one_circuit (\n    id bigint\n);\n", []),
        ('CREATE TABLE "public"."formula_one_circuit" (\n    id bigint\n);\n', []),
        ("CREATE TABLE auth_user (\n    id bigint\n);\n", ["auth_user"]),
        (
            "CREATE TABLE formula_one_circuit (\n    id bigint\n);\nCREATE TABLE knox_authtoken (\n    key text\n);\n",
            ["knox_authtoken"],
        ),
        (
            "CREATE TABLE knox_authtoken (\n);\nCREATE TABLE auth_user (\n);\n",
            ["auth_user", "knox_authtoken"],
        ),
    ],
)
def test_find_non_prefixed_tables(tmp_path, sql_content, expected_offenders):
    sql_path = tmp_path / "dump.sql"
    sql_path.write_text(sql_content)

    assert generate_sql_dump.find_non_prefixed_tables(sql_path) == expected_offenders


def test_verify_dump_contains_only_prefixed_tables_passes_for_clean_dump(tmp_path):
    sql_path = tmp_path / "dump.sql"
    sql_path.write_text("CREATE TABLE formula_one_circuit (\n    id bigint\n);\n")

    generate_sql_dump.verify_dump_contains_only_prefixed_tables(sql_path)

    assert sql_path.exists()


def test_verify_dump_contains_only_prefixed_tables_deletes_file_and_raises(tmp_path):
    sql_path = tmp_path / "dump.sql"
    sql_path.write_text("CREATE TABLE formula_one_circuit (\n);\nCREATE TABLE knox_authtoken (\n);\n")

    with pytest.raises(RuntimeError, match="knox_authtoken"):
        generate_sql_dump.verify_dump_contains_only_prefixed_tables(sql_path)

    assert not sql_path.exists()


DEFAULT_BODY = "CREATE TABLE public.formula_one_circuit (\n    id bigint\n);\n"
TOKEN_LENGTH = 63


def write_dump(sql_path: Path, token: str, body: str = DEFAULT_BODY) -> Path:
    sql_path.write_text(f"--\n-- PostgreSQL database dump\n--\n\n\\restrict {token}\n\n{body}\n\\unrestrict {token}\n")
    return sql_path


def test_set_deterministic_restrict_key_replaces_both_lines_with_the_digest(tmp_path):
    token = "H8fBnZLe2MaOXEQW8EpYO1eoblvZG3uf5kfDpayEDuQ1pUnLQEEfeYTFwrzly5j"
    sql_path = write_dump(tmp_path / "dump.sql", token)
    original_size = sql_path.stat().st_size

    key = generate_sql_dump.set_deterministic_restrict_key(sql_path)

    assert key is not None
    assert len(key) == len(token)
    assert key.isalnum()
    lines = sql_path.read_text().splitlines()
    assert f"\\restrict {key}" in lines
    assert f"\\unrestrict {key}" in lines
    assert sql_path.stat().st_size == original_size


def test_set_deterministic_restrict_key_is_identical_for_identical_contents(tmp_path):
    first = write_dump(tmp_path / "first.sql", "a" * TOKEN_LENGTH)
    second = write_dump(tmp_path / "second.sql", "b" * TOKEN_LENGTH)

    generate_sql_dump.set_deterministic_restrict_key(first)
    generate_sql_dump.set_deterministic_restrict_key(second)

    assert first.read_bytes() == second.read_bytes()


def test_set_deterministic_restrict_key_differs_for_different_contents(tmp_path):
    first = write_dump(tmp_path / "first.sql", "a" * TOKEN_LENGTH)
    second = write_dump(tmp_path / "second.sql", "a" * TOKEN_LENGTH, body=DEFAULT_BODY.replace("id", "name"))

    assert generate_sql_dump.set_deterministic_restrict_key(first) != generate_sql_dump.set_deterministic_restrict_key(
        second
    )


def test_set_deterministic_restrict_key_leaves_dump_without_restrict_lines_untouched(tmp_path):
    sql_path = tmp_path / "dump.sql"
    sql_path.write_text(DEFAULT_BODY)

    assert generate_sql_dump.set_deterministic_restrict_key(sql_path) is None
    assert sql_path.read_text() == DEFAULT_BODY


def test_set_deterministic_restrict_key_preserves_other_backslash_lines(tmp_path):
    body = "COPY public.formula_one_circuit (id, name) FROM stdin;\n1\t\\N\n\\.\n"
    sql_path = write_dump(tmp_path / "dump.sql", "a" * TOKEN_LENGTH, body=body)

    generate_sql_dump.set_deterministic_restrict_key(sql_path)

    assert body in sql_path.read_text()


def test_set_deterministic_restrict_key_raises_when_keys_differ(tmp_path):
    sql_path = tmp_path / "dump.sql"
    sql_path.write_text(f"\\restrict {'a' * TOKEN_LENGTH}\n{DEFAULT_BODY}\\unrestrict {'b' * TOKEN_LENGTH}\n")

    with pytest.raises(RuntimeError, match="single pg_dump restrict key"):
        generate_sql_dump.set_deterministic_restrict_key(sql_path)


def test_set_deterministic_restrict_key_does_not_create_temporary_files(tmp_path):
    sql_path = write_dump(tmp_path / "dump.sql", "a" * TOKEN_LENGTH)

    generate_sql_dump.set_deterministic_restrict_key(sql_path)

    assert [path.name for path in tmp_path.iterdir()] == ["dump.sql"]


def test_main_exits_nonzero_when_no_tables_found(tmp_path):
    args = generate_sql_dump.ScriptArguments(
        host="localhost", username="postgres", database="jolpica", output=str(tmp_path), quiet=False, verbose=False
    )
    mock_conn = MagicMock()
    mock_conn.__enter__.return_value = mock_conn
    mock_conn.__exit__.return_value = False
    mock_conn.cursor.return_value = make_cursor([])

    with (
        patch.object(generate_sql_dump, "parse_arguments", return_value=args),
        patch.object(generate_sql_dump, "find_pg_dump", return_value="/usr/bin/pg_dump"),
        patch.object(generate_sql_dump.psycopg, "connect", return_value=mock_conn),
        patch.object(generate_sql_dump, "run_pg_dump") as mock_run_pg_dump,
        patch.object(generate_sql_dump.sys, "exit") as mock_exit,
    ):
        generate_sql_dump.main()

    mock_exit.assert_called_once_with(1)
    mock_run_pg_dump.assert_not_called()
    assert not (tmp_path / "sql_dump.zip").exists()


def test_main_happy_path_writes_zip(tmp_path):
    args = generate_sql_dump.ScriptArguments(
        host="localhost", username="postgres", database="jolpica", output=str(tmp_path), quiet=False, verbose=False
    )
    mock_conn = MagicMock()
    mock_conn.__enter__.return_value = mock_conn
    mock_conn.__exit__.return_value = False
    mock_conn.cursor.return_value = make_cursor([("formula_one_circuit",)])

    def fake_run_pg_dump(cmd: list[str]) -> None:
        assert "public.formula_one_circuit" in cmd
        sql_path = Path(cmd[cmd.index("-f") + 1])
        sql_path.write_text("CREATE TABLE public.formula_one_circuit (\n    id bigint\n);\n")

    with (
        patch.object(generate_sql_dump, "parse_arguments", return_value=args),
        patch.object(generate_sql_dump, "find_pg_dump", return_value="/usr/bin/pg_dump"),
        patch.object(generate_sql_dump.psycopg, "connect", return_value=mock_conn),
        patch.object(generate_sql_dump, "run_pg_dump", side_effect=fake_run_pg_dump),
    ):
        generate_sql_dump.main()

    zip_path = tmp_path / "sql_dump.zip"
    assert zip_path.exists()
    with zipfile.ZipFile(zip_path) as zf:
        assert zf.namelist() == ["jolpica-f1-dump.sql"]


def test_main_aborts_and_removes_dump_when_non_prefixed_table_found(tmp_path):
    args = generate_sql_dump.ScriptArguments(
        host="localhost", username="postgres", database="jolpica", output=str(tmp_path), quiet=False, verbose=False
    )
    mock_conn = MagicMock()
    mock_conn.__enter__.return_value = mock_conn
    mock_conn.__exit__.return_value = False
    mock_conn.cursor.return_value = make_cursor([("formula_one_circuit",)])

    def fake_run_pg_dump(cmd: list[str]) -> None:
        sql_path = Path(cmd[cmd.index("-f") + 1])
        sql_path.write_text("CREATE TABLE public.formula_one_circuit (\n);\nCREATE TABLE knox_authtoken (\n);\n")

    with (
        patch.object(generate_sql_dump, "parse_arguments", return_value=args),
        patch.object(generate_sql_dump, "find_pg_dump", return_value="/usr/bin/pg_dump"),
        patch.object(generate_sql_dump.psycopg, "connect", return_value=mock_conn),
        patch.object(generate_sql_dump, "run_pg_dump", side_effect=fake_run_pg_dump),
        patch.object(generate_sql_dump.sys, "exit") as mock_exit,
    ):
        generate_sql_dump.main()

    mock_exit.assert_called_once_with(1)
    assert not (tmp_path / "sql" / "jolpica-f1-dump.sql").exists()
    assert not (tmp_path / "sql_dump.zip").exists()
