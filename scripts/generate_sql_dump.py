# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "psycopg[binary]>=3.1.12",
# ]
# ///
"""Generate SQL dumps of the database. See `scripts/generate_csv_dump.py` for details"""

from __future__ import annotations

import argparse
import logging
import os
import subprocess
import sys
import zipfile
from dataclasses import dataclass
from pathlib import Path

import psycopg
from generate_csv_dump import get_formula_one_tables

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
logger = logging.getLogger(__name__)


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
    inserts: bool
    no_owner: bool
    no_privileges: bool


def build_pg_dump_command(
    args: ScriptArguments,
    table_name: str,
    output_path: Path,
) -> list[str]:
    """Build pg_dump command with appropriate arguments.

    Args:
        args: Script arguments containing connection and export options.
        table_name: Name of the table to dump.
        output_path: Path where the SQL file will be written.

    Returns:
        List of command arguments for subprocess.
    """
    cmd = [
        "pg_dump",
        "--host",
        "127.0.0.1" if args.host == "localhost" else args.host,
        "--username",
        args.username,
        "--dbname",
        args.database,
        "--table",
        table_name,
        "--file",
        str(output_path),
    ]
    if args.verbose:
        cmd.append("--verbose")

    if args.inserts:
        cmd.append("--inserts")

    if args.no_owner:
        cmd.append("--no-owner")

    if args.no_privileges:
        cmd.append("--no-privileges")

    return cmd


def export_table_to_sql(
    args: ScriptArguments,
    table_name: str,
    output_path: Path,
    password: str | None = None,
) -> None:
    """Export a single table to SQL format using pg_dump.

    Args:
        args: Script arguments containing connection and export options.
        table_name: Name of the table to export.
        output_path: Path where the SQL file will be written.
        password: Database password (optional).

    Raises:
        subprocess.CalledProcessError: If pg_dump command fails.
        FileNotFoundError: If pg_dump is not found in PATH.
    """
    cmd = build_pg_dump_command(args, table_name, output_path)

    # Set up environment for pg_dump
    env = os.environ.copy()
    if password:
        env["PGPASSWORD"] = password

    try:
        result = subprocess.run(  # noqa: S603
            cmd,
            env=env,
            capture_output=True,
            text=True,
            check=True,
        )

        if args.verbose:
            if result.stderr:
                logger.debug(f"pg_dump stdout for {table_name}: {result.stderr}")
            if result.stdout:
                logger.debug(f"pg_dump stderr for {table_name}: {result.stdout}")

    except FileNotFoundError:
        raise FileNotFoundError(
            "pg_dump not found. Please install PostgreSQL client tools and ensure pg_dump is in your PATH."
        )
    except subprocess.CalledProcessError as e:
        error_msg = f"pg_dump failed for table {table_name}: {e.stderr if e.stderr else str(e)}"
        raise subprocess.CalledProcessError(e.returncode, e.cmd, e.stdout, error_msg)


def create_zip_archive(sql_dir: Path, zip_path: Path) -> None:
    """Create a reproducible zip file from SQL files with flat structure.

    Uses fixed timestamps to ensure identical content produces identical
    zip files with the same SHA256 hash across different runs.

    Args:
        sql_dir: Directory containing SQL files to archive.
        zip_path: Path where the zip file will be created.

    Raises:
        OSError: If there's an error creating the zip file.
    """
    # Use a fixed timestamp for reproducible zips
    fixed_timestamp = (1999, 1, 1, 0, 0, 0)

    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zipf:
        for sql_file in sorted(sql_dir.glob("*.sql")):
            zip_info = zipfile.ZipInfo(filename=sql_file.name)
            zip_info.date_time = fixed_timestamp
            zip_info.compress_type = zipfile.ZIP_DEFLATED

            with open(sql_file, "rb") as f:
                zipf.writestr(zip_info, f.read())


def parse_arguments() -> ScriptArguments:
    """Parse command-line arguments with defaults.

    Returns:
        ScriptArguments dataclass with typed, validated arguments.
    """
    parser = argparse.ArgumentParser(
        description="Generate SQL dumps of Formula One database tables.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Environment Variables:
  PGPASSWORD    PostgreSQL password (if required)

Output Structure:
  The script creates:
    dump/sql/          # SQL files for each table
    dump/sql_dump.zip  # Zip archive of all SQL files

Export Options:
  Use --inserts to use INSERT statements instead of COPY commands.
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
    parser.add_argument(
        "--inserts",
        action="store_true",
        help="Use INSERT statements instead of COPY",
    )
    parser.add_argument(
        "--no-owner",
        action="store_true",
        help="Skip ownership information",
    )
    parser.add_argument(
        "--no-privileges",
        action="store_true",
        help="Skip privilege grants",
    )

    args = parser.parse_args()

    return ScriptArguments(
        host=args.host,
        username=args.username,
        database=args.database,
        output=args.output,
        quiet=args.quiet,
        verbose=args.verbose,
        inserts=args.inserts,
        no_owner=args.no_owner,
        no_privileges=args.no_privileges,
    )


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
    conn_str = f"host={host} dbname={database} user={username}"
    if password:
        conn_str += f" password={password}"
    return conn_str


def setup_dump_directory(output_dir: str | Path) -> tuple[Path, Path]:
    """Prepare the dump directory structure with safe cleanup.

    Creates the following structure:
        output_dir/
        ├── sql/          # For SQL files
        └── sql_dump.zip  # Will be created later

    Args:
        output_dir: Path to the output directory.

    Returns:
        Tuple of (base_dir, sql_dir) paths.
    """
    base_dir = Path(output_dir)
    sql_dir = base_dir / "sql"

    sql_dir.mkdir(parents=True, exist_ok=True)

    # Clean up old files safely
    # Only remove formula_one_*.sql files from previous runs
    if sql_dir.exists():
        for old_sql in sql_dir.glob("formula_one_*.sql"):
            old_sql.unlink()
            logger.debug(f"Removed old dump file: {old_sql.name}")

    # Remove old zip if it exists
    old_zip = base_dir / "sql_dump.zip"
    if old_zip.exists():
        old_zip.unlink()
        logger.debug("Removed old zip file: sql_dump.zip")

    return base_dir, sql_dir


def export_all_tables(args: ScriptArguments, tables: list[str], sql_dir: Path, password: str | None = None) -> None:
    """Export all specified tables to SQL files.

    Args:
        args: Script arguments containing connection and export options.
        tables: List of table names to export.
        sql_dir: Directory where SQL files will be written.
        password: Database password (optional).

    Raises:
        subprocess.CalledProcessError: If there's an error exporting a table.
        FileNotFoundError: If pg_dump is not found.
    """
    for table in tables:
        sql_path = sql_dir / f"{table}.sql"
        try:
            export_table_to_sql(args, table, sql_path, password)
            logger.info(f"Dumped {table}.sql")
        except Exception:
            logger.exception(f"Failed to dump {table}")
            raise


def main() -> None:
    """Main entry point for the script.

    Parses arguments, connects to the database to get table list,
    exports tables using pg_dump, and creates a zip archive.

    Returns:
        None on success, exits with code 1 on error.
    """
    # Parse command-line arguments
    args = parse_arguments()

    # Configure logging based on verbosity
    if args.quiet:
        logger.setLevel(logging.WARNING)
    elif args.verbose:
        logger.setLevel(logging.DEBUG)
        # Add debug handler with more detail
        for handler in logger.handlers:
            handler.setFormatter(logging.Formatter("%(asctime)s - %(levelname)s - %(message)s"))

    # Get password from environment
    password = os.environ.get("PGPASSWORD")

    # Echo host for compatibility with original script (unless quiet mode)
    if not args.quiet:
        print(args.host)

    # Prepare dump directory structure
    base_dir, sql_dir = setup_dump_directory(args.output)

    # Build connection string for table discovery
    conn_string = build_connection_params(args.host, args.database, args.username, password)

    logger.debug(f"Connecting to {args.username}@{args.host}/{args.database}")
    logger.debug(f"Output directory: {args.output}")
    logger.debug(f"SQL directory: {sql_dir}")
    logger.debug(f"Zip file: {base_dir / 'sql_dump.zip'}")

    try:
        # Connect to database to get table list
        with psycopg.connect(conn_string) as conn:
            # Get all formula_one_* tables
            tables = get_formula_one_tables(conn)

            if not tables:
                logger.warning("No formula_one_* tables found in database")
                return

        # Export each table to sql/ subdirectory using pg_dump
        export_all_tables(args, tables, sql_dir, password)

        # Create zip archive in the base directory
        zip_path = base_dir / "sql_dump.zip"
        create_zip_archive(sql_dir, zip_path)
        logger.info(f"Created zip archive: {zip_path}")

    except psycopg.Error:
        logger.exception("Database error during table discovery")
        sys.exit(1)
    except FileNotFoundError:
        logger.exception("pg_dump not found in PATH")
        sys.exit(1)
    except subprocess.CalledProcessError:
        logger.exception("pg_dump error")
        sys.exit(1)
    except Exception:
        logger.exception("Unexpected error")
        sys.exit(1)


if __name__ == "__main__":
    main()
