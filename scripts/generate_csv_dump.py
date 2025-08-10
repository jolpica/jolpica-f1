# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "psycopg[binary]>=3.1.12",
# ]
# ///
"""Generate CSV dumps of Formula One database tables.

This script exports all tables with the 'formula_one_' prefix from a PostgreSQL
database to CSV files, then creates a zip archive of the exported data.

Output Structure:
    The script creates the following structure in the output directory:
    dump/
    ├── csv/                 # Contains all exported CSV files
    │   ├── formula_one_circuits.csv
    │   ├── formula_one_drivers.csv
    │   └── ...
    └── csv_dump.zip        # Zip archive of CSV files (flat structure)

Column Ordering:
    Columns are exported with 'id' first, then in alphabetical order.
    This ensures dumps are stable and identical across different databases
    with the same schema, regardless of column creation order.

IMPORTANT:
    - New columns will appear alphabetically, not at the end of the CSV
    - Scripts reading these CSVs should reference columns by name (using headers),
      not by position, to handle schema changes gracefully

Usage:
    python generate_csv_dump.py [OPTIONS]

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
import logging
import os
import sys
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import TYPE_CHECKING

import psycopg
from psycopg import sql

if TYPE_CHECKING:
    from psycopg import Connection

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


def get_formula_one_tables(conn: Connection[tuple]) -> list[str]:
    """Retrieve all table names with 'formula_one_' prefix.

    Args:
        conn: PostgreSQL database connection.

    Returns:
        List of table names that start with 'formula_one_'.
    """
    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT tablename
            FROM pg_tables
            WHERE tablename LIKE 'formula_one_%'
            ORDER BY tablename;
        """
        )
        return [row[0] for row in cur.fetchall()]


def get_table_columns_stable(conn: Connection[tuple], table_name: str) -> list[str]:
    """Get table columns with 'id' first, then alphabetical order.

    This ensures consistent column ordering across different databases
    with the same schema, regardless of how tables were created or
    columns were added.

    Args:
        conn: PostgreSQL database connection.
        table_name: Name of the table.

    Returns:
        List of column names with 'id' first (if exists), then alphabetical.

    Raises:
        ValueError: If no columns are found for the table.
    """
    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT column_name 
            FROM information_schema.columns 
            WHERE table_name = %s 
            ORDER BY 
                CASE WHEN column_name = 'id' THEN 0 ELSE 1 END,
                column_name
            """,
            (table_name,),
        )
        columns = [row[0] for row in cur.fetchall()]

        if not columns:
            raise ValueError(f"No columns found for table '{table_name}'. Table may not exist or may be empty.")

        return columns


def export_table_to_csv(conn: Connection[tuple], table_name: str, output_path: Path) -> None:
    """Export a single table to CSV format using PostgreSQL COPY command.

    This uses PostgreSQL's COPY TO command with explicit column ordering
    to ensure stable, reproducible dumps across different databases.
    Columns are ordered with 'id' first, then alphabetically.

    Column ordering guarantees:
    - 'id' column always appears first (if present)
    - All other columns appear in alphabetical order
    - New columns will be inserted alphabetically, not at the end
    - Identical schemas produce identical dumps across databases

    Args:
        conn: PostgreSQL database connection.
        table_name: Name of the table to export.
        output_path: Path where the CSV file will be written.

    Raises:
        psycopg.Error: If there's an error executing the COPY command.
        OSError: If there's an error writing the file.
        ValueError: If no columns are found for the table.
    """
    with conn.cursor() as cur:
        # Get columns in stable order (id first, then alphabetical)
        # This will raise ValueError if no columns found
        columns = get_table_columns_stable(conn, table_name)

        # Build explicit column list for stable ordering
        column_list = sql.SQL(", ").join([sql.Identifier(col) for col in columns])
        copy_query = sql.SQL("COPY (SELECT {} FROM {} ORDER BY id) TO STDOUT WITH CSV HEADER").format(
            column_list, sql.Identifier(table_name)
        )

        # Use COPY TO with CSV format
        with open(output_path, "wb") as f:
            with cur.copy(copy_query) as copy:
                for data in copy:
                    f.write(data)


def create_zip_archive(csv_dir: Path, zip_path: Path) -> None:
    """Create a zip file from CSV files with flat structure.

    Args:
        csv_dir: Directory containing CSV files to archive.
        zip_path: Path where the zip file will be created.

    Raises:
        OSError: If there's an error creating the zip file.
    """
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zipf:
        for csv_file in sorted(csv_dir.glob("*.csv")):
            # Add files with just their name, no directory structure
            zipf.write(csv_file, csv_file.name)


def parse_arguments() -> ScriptArguments:
    """Parse command-line arguments with defaults.

    Returns:
        ScriptArguments dataclass with typed, validated arguments.
    """
    parser = argparse.ArgumentParser(
        description="Generate CSV dumps of Formula One database tables.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Environment Variables:
  PGPASSWORD    PostgreSQL password (if required)

Output Structure:
  The script creates:
    dump/csv/          # CSV files
    dump/csv_dump.zip  # Zip archive
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


def build_connection_params(host: str, database: str, username: str, password: str | None = None) -> dict[str, str]:
    """Build PostgreSQL connection parameters.

    Args:
        host: Database host.
        database: Database name.
        username: Database username.
        password: Database password (optional).

    Returns:
        Dictionary of connection parameters.
    """
    conn_params: dict[str, str] = {
        "host": host,
        "dbname": database,
        "user": username,
    }
    if password:
        conn_params["password"] = password
    return conn_params


def setup_dump_directory(output_dir: str | Path) -> tuple[Path, Path]:
    """Prepare the dump directory structure with safe cleanup.

    Creates the following structure:
        output_dir/
        ├── csv/          # For CSV files
        └── csv_dump.zip  # Will be created later

    Args:
        output_dir: Path to the output directory.

    Returns:
        Tuple of (base_dir, csv_dir) paths.
    """

    base_dir = Path(output_dir)
    csv_dir = base_dir / "csv"

    csv_dir.mkdir(parents=True, exist_ok=True)

    # Clean up old files safely
    # Only remove formula_one_*.csv files from previous runs
    if csv_dir.exists():
        for old_csv in csv_dir.glob("formula_one_*.csv"):
            old_csv.unlink()
            logger.debug(f"Removed old dump file: {old_csv.name}")

    # Remove old zip if it exists
    old_zip = base_dir / "csv_dump.zip"
    if old_zip.exists():
        old_zip.unlink()
        logger.debug("Removed old zip file: csv_dump.zip")

    return base_dir, csv_dir


def export_all_tables(conn: Connection[tuple], tables: list[str], csv_dir: Path) -> None:
    """Export all specified tables to CSV files.

    Args:
        conn: PostgreSQL database connection.
        tables: List of table names to export.
        csv_dir: Directory where CSV files will be written.

    Raises:
        psycopg.Error: If there's an error exporting a table.
    """
    for table in tables:
        csv_path = csv_dir / f"{table}.csv"
        try:
            export_table_to_csv(conn, table, csv_path)
            logger.info(f"Dumped {table}.csv")
        except Exception:
            logger.exception(f"Failed to dump {table}")
            raise


def main() -> None:
    """Main entry point for the script.

    Parses arguments, connects to the database, exports tables,
    and creates a zip archive.

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
    base_dir, csv_dir = setup_dump_directory(args.output)

    # Build connection parameters
    conn_params = build_connection_params(args.host, args.database, args.username, password)

    logger.debug(f"Connecting to {args.username}@{args.host}/{args.database}")
    logger.debug(f"Output directory: {args.output}")
    logger.debug(f"CSV directory: {csv_dir}")
    logger.debug(f"Zip file: {base_dir / 'csv_dump.zip'}")

    try:
        # Connect to database and export tables
        with psycopg.connect(**conn_params) as conn:
            # Get all formula_one_* tables
            tables = get_formula_one_tables(conn)

            if not tables:
                logger.warning("No formula_one_* tables found in database")
                return

            # Export each table to csv/ subdirectory
            export_all_tables(conn, tables, csv_dir)

        # Create zip archive in the base directory
        zip_path = base_dir / "csv_dump.zip"
        create_zip_archive(csv_dir, zip_path)
        logger.info(f"Created zip archive: {zip_path}")

    except psycopg.Error:
        logger.exception("Database error")
        sys.exit(1)
    except Exception:
        logger.exception("Unexpected error")
        sys.exit(1)


if __name__ == "__main__":
    main()
