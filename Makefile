format:
	ruff format .
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
	
test-fixture:
	python manage.py dump_object formula_one.pitstop --query '{"session_entry__session__race__season__year__gte":2000}' > tests/fixtures/2000s_data.json