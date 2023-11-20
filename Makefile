format:
	ruff format .
	ruff check --fix-only .

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
	python manage.py dump_object formula_one.sessionentry --query '{"session__race__season__year__gte":2000}' > tests/fixtures/2000s_sessions.json
	python manage.py dump_object formula_one.pitstop --query '{"pk__gte":0}' > tests/fixtures/2000s_pitstops.json
	python manage.py dump_object ergast.status --query '{"pk__gte":0}' > tests/fixtures/ergast_status.json
	python manage.py merge_fixtures tests/fixtures/2000s_pitstops.json tests/fixtures/2000s_sessions.json tests/fixtures/ergast_status.json > tests/fixtures/2000s_data.json
	sed -ri 's/^\s+//g' tests/fixtures/2000s_data.json
	sed -i ':a;N;$!ba;s/\n//g' tests/fixtures/2000s_data.json
	gzip -f tests/fixtures/2000s_data.json
	rm tests/fixtures/2000s_pitstops.json tests/fixtures/2000s_sessions.json tests/fixtures/ergast_status.json