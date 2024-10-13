DATABASE_HOST=$1
#set PGPASSWORD environment variable

pg_dump -h localhost -U postgres -d jolpica -t formula_one* -a > scripts/dump.sql
python manage.py migrate formula_one zero
python manage.py migrate formula_one
psql -h $DATABASE_HOST -U postgres -d jolpica -f scripts/dump.sql

# For every table that is prefixed with "formula_one_", update the autoincrement sequence of column id
# to the max value of the id column in the table
# Loop through each table prefixed with "formula_one_" and update the autoincrement sequence
tables=$(psql -h $DATABASE_HOST -U postgres -d jolpica -t -c "SELECT tablename FROM pg_tables WHERE tablename LIKE 'formula_one_%';")

for table in $tables; do
  sequence_name="${table}_id_seq"
  psql -h $DATABASE_HOST -U postgres -d jolpica -c "SELECT setval('${sequence_name}', (SELECT COALESCE(MAX(id), 1) FROM ${table}));"
done
