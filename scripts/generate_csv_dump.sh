DATABASE_HOST=${1:-localhost}
USERNAME=${2:-postgres}
DATABASE=${3:-jolpica}
#set PGPASSWORD environment variable
echo $DATABASE_HOST

tables=$(psql -h $DATABASE_HOST -U $USERNAME -d $DATABASE -t -c "SELECT tablename FROM pg_tables WHERE tablename LIKE 'formula_one_%';")

rm -rf dump/
mkdir -p dump

for table in $tables; do
  psql -h $DATABASE_HOST -U $USERNAME -d $DATABASE --csv -c "SELECT * FROM ${table};" > "dump/${table}.csv"
  echo "Dumped ${table}.csv"
done

zip -r dump.zip dump/
echo "Zipped dump folder into dump.zip"