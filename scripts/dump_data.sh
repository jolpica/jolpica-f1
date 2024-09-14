DATABASE_HOST=$1
#set PGPASSWORD environment variable

python manage.py migrate formula_one zero
python manage.py migrate formula_one
# pg_dump -h localhost -U postgres -d jolpica -t formula_one* -a > scripts/dump.sql
psql -h $DATABASE_HOST -U postgres -d jolpica -f scripts/dump.sql