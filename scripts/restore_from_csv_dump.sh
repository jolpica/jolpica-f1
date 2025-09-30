#!/bin/bash
set -e

DATABASE_HOST=${1:-localhost}
DATABASE_NAME=${2:-jolpica}
DATABASE_USERNAME=${3:-postgres}

echo "Restoring database from dump.zip to $DATABASE_HOST"

# Unzip the dump
unzip -o jolpica-f1-csv.zip -d dump/

# Define the table order based on dependencies
FOREIGN_KEY_TABLE_ORDER=(
  "formula_one_championshipadjustment"
  "formula_one_teamdriver"
  "formula_one_round"
  "formula_one_roundentry"
  "formula_one_session"
  "formula_one_sessionentry"
  "formula_one_driverchampionship"
  "formula_one_teamchampionship"
  "formula_one_lap"
  "formula_one_pitstop"
  # Add other tables here in the correct order
)

# Get all tables from the dump
ALL_TABLES=($(ls dump/formula_one_*.csv | sed 's/dump\/\(.*\)\.csv/\1/'))

# Combine ordered tables and remaining tables (unordered tables go first)
PROCESS_TABLES=()
for table in "${ALL_TABLES[@]}"; do
  if [[ ! " ${FOREIGN_KEY_TABLE_ORDER[@]} " =~ " ${table} " ]]; then
    PROCESS_TABLES+=("$table")
    echo "Adding $table"
  fi
done

for table in "${FOREIGN_KEY_TABLE_ORDER[@]}"; do
  echo "prioritising  $table"
  PROCESS_TABLES+=("$table")
done

# Remove existing data from tables
echo "Starting table truncating"
for table in "${ALL_TABLES[@]}"; do
  echo "Truncating table: $table"
  PGOPTIONS="-c client_min_messages=error" psql -h $DATABASE_HOST -U $DATABASE_USERNAME -d $DATABASE_NAME -c "TRUNCATE TABLE $table CASCADE;"
done

# Import dumped data
echo "Starting table import"
# Process all tables in the combined array
for table in "${PROCESS_TABLES[@]}"; do
  file="dump/${table}.csv"
  if [ -f "$file" ]; then
    header=$(head -n 1 $file)
    echo "Restoring table: $table"
    psql -h $DATABASE_HOST -U $DATABASE_USERNAME -d $DATABASE_NAME -c "\copy $table ($header) FROM '$file' WITH CSV HEADER;"
    # Update the auto-increment sequence
    sequence_name="${table}_id_seq"
    psql -h $DATABASE_HOST -U $DATABASE_USERNAME -d $DATABASE_NAME -c "SELECT setval('${sequence_name}', (SELECT COALESCE(MAX(id), 1) FROM ${table}));"
  else
    echo "Warning: CSV file not found for table $table"
  fi
done

echo "Database restoration complete."
