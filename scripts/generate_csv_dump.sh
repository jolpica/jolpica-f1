DATABASE_HOST=${1:-localhost}
#set PGPASSWORD environment variable
echo $DATABASE_HOST

tables=$(psql -h $DATABASE_HOST -U postgres -d jolpica -t -c "SELECT tablename FROM pg_tables WHERE tablename LIKE 'formula_one_%';")

rm -rf dump/
mkdir -p dump

for table in $tables; do
  psql -h $DATABASE_HOST -U postgres -d jolpica -c "\copy (
  SELECT *
  FROM 
      ${table}
  ) TO 'dump/${table}.csv'
  WITH CSV HEADER;"
  echo "Dumped ${table}.csv"
done

zip -r dump.zip dump/
echo "Zipped dump folder into dump.zip"