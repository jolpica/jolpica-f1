format:
	black .
	ruff check --select I --fix .

lint:
	ruff check .
	mypy .
	
run: format
	python manage.py runserver
	
dbml:
	python manage.py dbml formula_one > formulastat/formula_one/models.dbml
# Remove duplicate through tables
	perl -i -0pe "s/Table (formula_one[a-zA-Z_]+).+(\n|.)+ref:.* > \1.*\n\n\n//g" formulastat/formula_one/models.dbml