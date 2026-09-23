# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "psycopg[binary]>=3.1.12",
# ]
# ///
"""Generate a SQL dump of Formula One database tables using pg_dump.

This script exports all tables with the 'formula_one_' prefix from a PostgreSQL
database to a single .sql file (schema + data) using pg_dump, then zips it.

Table Selection:
    The database also holds tables unrelated to Formula One data (Django auth,
    Knox API tokens, dump metadata, etc.), some of which hold sensitive data.
    To make sure those are never included:
      1. The live table list is queried from pg_catalog, restricted to the
         'public' schema, and filtered to the 'formula_one_' prefix.
      2. pg_dump is invoked with that list passed explicitly as repeated -t
         flags of schema-qualified names, which makes pg_dump an allow-list:
         it will only ever emit schema/data for exactly the tables named,
         nothing else.
      3. After pg_dump runs, the resulting .sql file is scanned for CREATE
         TABLE statements as a defense-in-depth check - if anything without
         the 'formula_one_' prefix shows up, the file is deleted and the
         script aborts rather than risk publishing it.

Performance:
    All schema/data extraction happens inside pg_dump itself (server-side,
    via COPY), so this script makes at most one lightweight metadata query
    over the wire (the table list) rather than iterating rows in Python -
    this keeps it fast even when the database is remote/high-latency.

Reproducibility:
    pg_dump picks a fresh random key for its `\\restrict`/`\\unrestrict` pair on
    every run, so an unchanged database would otherwise produce a differently
    hashed dump each time. That key is rewritten to a digest of the dump's own
    contents, so identical data always yields an identical .sql (and zip).

Output Structure:
    The script creates the following structure in the output directory:
    dump/
    ├── sql/                     # Contains the exported SQL file
    │   └── jolpica-f1-dump.sql
    └── sql_dump.zip             # Zip archive of the SQL file

Requirements:
    pg_dump must be installed and available on PATH (see the `setup` Makefile
    target, which installs the postgresql-client package alongside psql).

Usage:
    python generate_sql_dump.py [OPTIONS]

Options:
    -H, --host HOST       PostgreSQL host (default: localhost)
    -u, --username USER   PostgreSQL username (default: postgres)
    -d, --database DB     Database name (default: jolpica)
    -o, --output DIR      Output directory for all files (default: dump)
    -q, --quiet           Suppress informational output
    -v, --verbose         Enable verbose output
    -h, --help            Show help message

Environment:
    PGPASSWORD - PostgreSQL password (if required)
"""

from __future__ import annotations

import argparse
import hashlib
import logging
import os
import re
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import TYPE_CHECKING

import dump_utils
import psycopg
from psycopg.conninfo import make_conninfo

if TYPE_CHECKING:
    from psycopg import Connection

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
logger = logging.getLogger(__name__)

TABLE_PREFIX = "formula_one_"
SCHEMA_NAME = "public"

CREATE_TABLE_RE = re.compile(r'^CREATE TABLE(?:\s+IF NOT EXISTS)?\s+(?:"?[\w$]+"?\.)?"?([\w$]+)"?', re.IGNORECASE)

RESTRICT_RE = re.compile(rb"(\\(?:un)?restrict)[ \t]+([A-Za-z0-9]+)([ \t]*\r?\n?)\Z")
RESTRICT_PLACEHOLDER = b"PLACEHOLDER"


@dataclass
class ScriptArguments:
    """Typed container for script arguments.

    This provides static type checking and clear documentation
    of all script parameters.
    """

    host: str
    username: str
    database: str
    output: str
    quiet: bool
    verbose: bool


def get_formula_one_tables(conn: Connection[tuple], schema: str = SCHEMA_NAME, prefix: str = TABLE_PREFIX) -> list[str]:
    """Retrieve all table names with 'formula_one_' prefix, schema-qualified.

    Args:
        conn: PostgreSQL database connection.
        schema: Schema to search (tables outside it are ignored).
        prefix: Required table name prefix.

    Returns:
        List of schema-qualified table names (e.g. "public.formula_one_driver")
        for tables in `schema` whose name starts with `prefix`.
    """
    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = %(schema)s AND starts_with(tablename, %(prefix)s)
            ORDER BY tablename;
            """,
            {"schema": schema, "prefix": prefix},
        )
        return [f"{schema}.{row[0]}" for row in cur.fetchall()]


def build_connection_params(host: str, database: str, username: str, password: str | None = None) -> str:
    """Build PostgreSQL connection string.

    Args:
        host: Database host.
        database: Database name.
        username: Database username.
        password: Database password (optional).

    Returns:
        PostgreSQL connection string.
    """
    params: dict[str, str] = {"host": host, "dbname": database, "user": username}
    if password:
        params["password"] = password
    return make_conninfo(**params)


def setup_output_paths(output_dir: str | Path) -> tuple[Path, Path]:
    """Prepare the dump directory structure with safe cleanup.

    Args:
        output_dir: Path to the output directory.

    Returns:
        Tuple of (sql_path, zip_path) paths.
    """
    base_dir = Path(output_dir)
    sql_dir = base_dir / "sql"
    sql_dir.mkdir(parents=True, exist_ok=True)

    sql_path = sql_dir / "jolpica-f1-dump.sql"
    zip_path = base_dir / "sql_dump.zip"

    if sql_path.exists():
        sql_path.unlink()
        logger.debug(f"Removed old dump file: {sql_path.name}")

    if zip_path.exists():
        zip_path.unlink()
        logger.debug("Removed old zip file: sql_dump.zip")

    return sql_path, zip_path


def find_pg_dump() -> str:
    """Locate the pg_dump executable on PATH.

    Returns:
        Absolute path to the pg_dump executable.

    Raises:
        RuntimeError: If pg_dump cannot be found on PATH.
    """
    pg_dump_path = shutil.which("pg_dump")
    if pg_dump_path is None:
        raise RuntimeError(
            "pg_dump not found on PATH. Install the postgresql-client package (see the `setup` Makefile target)."
        )
    return pg_dump_path


def build_pg_dump_command(
    pg_dump_path: str, host: str, username: str, database: str, tables: list[str], sql_path: Path
) -> list[str]:
    """Build the pg_dump command line as an explicit table allow-list.

    Passing every table as its own -t flag means pg_dump will only ever emit
    schema/data for exactly these tables - no other table in the database
    (e.g. auth/Knox tables holding credentials) can appear in the output.

    Args:
        pg_dump_path: Absolute path to the pg_dump executable.
        host: Database host.
        username: Database username.
        database: Database name.
        tables: Table names to include (must be non-empty).
        sql_path: Path the SQL dump will be written to.

    Returns:
        Full pg_dump command as a list of arguments.

    Raises:
        ValueError: If `tables` is empty, since running pg_dump with no -t
            flags would dump the *entire* database instead of nothing.
    """
    if not tables:
        raise ValueError("No tables provided to dump - refusing to run pg_dump with no table filter.")

    cmd = [
        pg_dump_path,
        "-h",
        host,
        "-U",
        username,
        "-d",
        database,
        "--no-owner",
        "--no-privileges",
        "--strict-names",
        "-f",
        str(sql_path),
    ]
    for table in tables:
        cmd.extend(["-t", table])
    return cmd


def run_pg_dump(cmd: list[str]) -> None:
    """Run a pg_dump command, raising with captured stderr on failure.

    Args:
        cmd: Full pg_dump command, as built by `build_pg_dump_command`.

    Raises:
        subprocess.CalledProcessError: If pg_dump exits with a non-zero status.
    """
    logger.debug(f"Running: {' '.join(cmd)}")
    result = subprocess.run(cmd, check=True, capture_output=True, text=True)  # noqa: S603
    if result.stderr:
        logger.warning(f"pg_dump stderr: {result.stderr}")


def find_non_prefixed_tables(sql_path: Path, prefix: str = TABLE_PREFIX) -> list[str]:
    """Scan a pg_dump SQL file for CREATE TABLE statements outside `prefix`.

    This is a defense-in-depth check: `build_pg_dump_command` already
    restricts pg_dump to an explicit table allow-list, but this verifies the
    actual output before it is treated as safe to publish.

    Args:
        sql_path: Path to the pg_dump SQL output file.
        prefix: Required table name prefix.

    Returns:
        Sorted list of table names found that do not start with `prefix`.
    """
    offending: set[str] = set()
    with open(sql_path, encoding="utf-8") as f:
        for line in f:
            match = CREATE_TABLE_RE.match(line)
            if match and not match.group(1).startswith(prefix):
                offending.add(match.group(1))
    return sorted(offending)


def verify_dump_contains_only_prefixed_tables(sql_path: Path, prefix: str = TABLE_PREFIX) -> None:
    """Delete the dump file and raise if it contains any non-`prefix` table.

    Args:
        sql_path: Path to the pg_dump SQL output file.
        prefix: Required table name prefix.

    Raises:
        RuntimeError: If a CREATE TABLE for a non-prefixed table is found.
    """
    offending = find_non_prefixed_tables(sql_path, prefix)
    if offending:
        sql_path.unlink(missing_ok=True)
        raise RuntimeError(
            f"Refusing to publish dump: found non-'{prefix}' tables in pg_dump output: {', '.join(offending)}"
        )


def set_deterministic_restrict_key(sql_path: Path) -> str | None:
    """Rewrite pg_dump's random restrict key to one derived from the dump contents.

    pg_dump generates a fresh random key for its `\\restrict`/`\\unrestrict`
    pair on every run, so two dumps of identical data differ byte-for-byte and
    therefore hash differently. Those lines are normalised to a placeholder
    while digesting the file, and the digest is then written back over the
    original keys - so the same database contents always produce the same bytes.

    Args:
        sql_path: Path to the pg_dump SQL output file, rewritten in place.

    Returns:
        The derived key, or None if the dump contained no `\\restrict` lines
        (older pg_dump versions), in which case the file is left unchanged.

    Raises:
        RuntimeError: If the restrict lines do not all carry the same key.
    """
    digest = hashlib.sha256()
    matches: list[tuple[int, re.Match[bytes]]] = []
    offset = 0

    with open(sql_path, "rb") as f:
        for line in f:
            match = RESTRICT_RE.match(line)
            if match:
                matches.append((offset, match))
                digest.update(b"%s %s%s" % (match.group(1), RESTRICT_PLACEHOLDER, match.group(3)))
            else:
                digest.update(line)
            offset += len(line)

    if not matches:
        return None

    keys = {match.group(2) for _, match in matches}
    if len(keys) != 1:
        raise RuntimeError(f"Expected a single pg_dump restrict key, found {len(keys)}")

    # Truncated to the original key's length so each line keeps its size and can be patched in place.
    key = digest.hexdigest()[: len(keys.pop())]
    with open(sql_path, "r+b") as f:
        for line_offset, match in matches:
            f.seek(line_offset)
            f.write(b"%s %s%s" % (match.group(1), key.encode(), match.group(3)))

    return key


def parse_arguments() -> ScriptArguments:
    """Parse command-line arguments with defaults.

    Returns:
        ScriptArguments dataclass with typed, validated arguments.
    """
    parser = argparse.ArgumentParser(
        description="Generate a SQL dump of Formula One database tables.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Environment Variables:
  PGPASSWORD    PostgreSQL password (if required)

Output Structure:
  The script creates:
    dump/sql/jolpica-f1-dump.sql  # SQL dump from pg_dump
    dump/sql_dump.zip             # Zip archive of the SQL dump
        """,
    )

    parser.add_argument(
        "-H",
        "--host",
        default="localhost",
        help="PostgreSQL host (default: localhost)",
    )
    parser.add_argument(
        "-u",
        "--username",
        default="postgres",
        help="PostgreSQL username (default: postgres)",
    )
    parser.add_argument(
        "-d",
        "--database",
        default="jolpica",
        help="Database name (default: jolpica)",
    )
    parser.add_argument(
        "-o",
        "--output",
        default="dump",
        help="Output directory for all files (default: dump)",
    )
    parser.add_argument(
        "-q",
        "--quiet",
        action="store_true",
        help="Suppress informational output",
    )
    parser.add_argument(
        "-v",
        "--verbose",
        action="store_true",
        help="Enable verbose output",
    )

    args = parser.parse_args()

    return ScriptArguments(
        host=args.host,
        username=args.username,
        database=args.database,
        output=args.output,
        quiet=args.quiet,
        verbose=args.verbose,
    )


def main() -> None:
    """Main entry point for the script.

    Parses arguments, connects to the database to find the tables to dump,
    runs pg_dump, verifies the output, and creates a zip archive.

    Returns:
        None on success, exits with code 1 on error.
    """
    args = parse_arguments()

    if args.quiet:
        logger.setLevel(logging.WARNING)
    elif args.verbose:
        logger.setLevel(logging.DEBUG)
        for handler in logger.handlers:
            handler.setFormatter(logging.Formatter("%(asctime)s - %(levelname)s - %(message)s"))

    password = os.environ.get("PGPASSWORD")

    sql_path, zip_path = setup_output_paths(args.output)

    conn_string = build_connection_params(args.host, args.database, args.username, password)

    logger.debug(f"Connecting to {args.username}@{args.host}/{args.database}")
    logger.debug(f"SQL file: {sql_path}")
    logger.debug(f"Zip file: {zip_path}")

    try:
        pg_dump_path = find_pg_dump()

        with psycopg.connect(conn_string) as conn:
            tables = get_formula_one_tables(conn)

        if not tables:
            raise RuntimeError(  # noqa: TRY301 - inlined per review feedback rather than a one-line helper
                f"No '{TABLE_PREFIX}*' tables found in database - refusing to produce an empty dump"
            )

        logger.info(f"Found {len(tables)} table(s) to dump: {', '.join(tables)}")

        cmd = build_pg_dump_command(pg_dump_path, args.host, args.username, args.database, tables, sql_path)
        run_pg_dump(cmd)
        logger.info(f"pg_dump wrote {sql_path}")

        verify_dump_contains_only_prefixed_tables(sql_path)

        restrict_key = set_deterministic_restrict_key(sql_path)
        logger.debug(f"Restrict key set to {restrict_key}" if restrict_key else "No restrict lines found in dump")

        dump_utils.create_zip_archive([sql_path], zip_path)
        logger.info(f"Created zip archive: {zip_path}")

    except psycopg.Error:
        logger.exception("Database error")
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        logger.exception(f"pg_dump failed (exit code {e.returncode}): {e.stderr}")
        sys.exit(1)
    except (RuntimeError, ValueError):
        logger.exception("Dump generation failed")
        sys.exit(1)
    except Exception:
        logger.exception("Unexpected error")
        sys.exit(1)


if __name__ == "__main__":
    main()
