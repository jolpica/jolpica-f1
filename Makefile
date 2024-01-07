format:
	ruff format .
	ruff check --fix-only .

lint:
	ruff check .
	mypy .
	
run: format
	python manage.py runserver
	
dbml:
	python manage.py dbml formula_one > jolpica/formula_one/models.dbml
# Remove duplicate through tables
	perl -i -0pe "s/Table (formula_one[a-zA-Z_]+).+(\n|.)+ref:.* > \1.*\n\n\n//g" jolpica/formula_one/models.dbml
	
test-fixture:
	python manage.py dump_object formula_one.sessionentry --query '{"session__race__season__year__gte":2000}' > tests/fixtures/2000s_session_entries.json
	python manage.py dump_object formula_one.session --query '{"race__season__year__gte":2000}' > tests/fixtures/2000s_sessions.json
	python manage.py dump_object formula_one.pitstop --query '{"session_entry__session__race__season__year":2014}' > tests/fixtures/2000s_pitstops.json
	python manage.py dump_object formula_one.lap --query '{"session_entry__session__race__season__year":2013}' > tests/fixtures/2000s_laps.json
	python manage.py dump_object ergast.status --query '{"pk__gte":0}' > tests/fixtures/ergast_status.json
	python manage.py merge_fixtures tests/fixtures/2000s_session_entries.json tests/fixtures/2000s_pitstops.json tests/fixtures/2000s_sessions.json tests/fixtures/ergast_status.json > tests/fixtures/2000s_data.json tests/fixtures/2000s_laps.json
# Remove spaces from fixture
	sed -ri 's/^\s+//g' tests/fixtures/2000s_data.json
# Remove newlines from fixture
	sed -i ':a;N;$!ba;s/\n//g' tests/fixtures/2000s_data.json
	gzip -f tests/fixtures/2000s_data.json
	rm tests/fixtures/2000s_pitstops.json tests/fixtures/2000s_sessions.json tests/fixtures/ergast_status.json tests/fixtures/2000s_session_entries.json tests/fixtures/2000s_laps.json

standings-fixture:
	python manage.py dump_object formula_one.sessionentry --query '{"session__race__season__year__in": [1960, 1969, 1975, 1979, 1980, 1985, 1997], "session__type": "R"}' > tests/fixtures/standings.json
	
import-and-update:
	python manage.py migrate formula_one 0001
	python manage.py migrate
	python manage.py shell -c "from jolpica.formula_one.import_from_ergast import run_import; run_import()"
	make test-fixture 
	make standings-fixture
	pytest --create-db
	
deploy:
	DJANGO_DEBUG=False python manage.py collectstatic
	eb deploy