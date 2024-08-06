format:
	ruff format . jolpica/ergast/*
	ruff check --fix-only . jolpica/ergast/*

lint:
	ruff check . --no-fix
	ruff format . --check
	mypy --ignore-missing-imports .
	
run: format
	python manage.py runserver
	
dbml:
	python manage.py dbml formula_one > jolpica/formula_one/models/models.dbml
# Remove duplicate through tables
	perl -i -0pe "s/Table (formula_one[a-zA-Z_]+).+(\n|.)+ref:.* > \1.*\n\n\n//g" jolpica/formula_one/models/models.dbml
	
2000s-fixture:
	python manage.py dump_object formula_one.sessionentry --query '{"session__round__season__year__gte":2000}' > tests/fixtures/2000s_session_entries.tmp.json
	python manage.py dump_object formula_one.session --query '{"round__season__year__gte":2000}' > tests/fixtures/2000s_sessions.tmp.json
	python manage.py dump_object formula_one.pitstop --query '{"session_entry__session__round__season__year":2014}' > tests/fixtures/2000s_pitstops.tmp.json
	python manage.py dump_object formula_one.lap --query '{"session_entry__session__round__season__year":2013}' > tests/fixtures/2000s_laps.tmp.json
	python manage.py dumpdata ergast.status > tests/fixtures/ergast_status.tmp.json
	python manage.py merge_fixtures tests/fixtures/*.tmp.json > tests/fixtures/2000s_data.json
	rm tests/fixtures/*.tmp.json
# Remove spaces from fixture
	sed -ri 's/^\s+//g' tests/fixtures/2000s_data.json
# Remove newlines from fixture
	sed -i ':a;N;$!ba;s/\n//g' tests/fixtures/2000s_data.json
	gzip -f tests/fixtures/2000s_data.json

legacy-fixture:
	python manage.py dump_object formula_one.sessionentry --query '{"session__round__season__year__in": [1960, 1969, 1975, 1979, 1980, 1985, 1997], "session__type": "R"}' > tests/fixtures/legacy_data.json
	gzip -f tests/fixtures/legacy_data.json

test-fixtures: 2000s-fixture legacy-fixture
	pytest --create-db
	
load-ergast-data:
	python manage.py updateergast	

import-from-ergast:
	python manage.py migrate formula_one zero
	python manage.py migrate
	python manage.py shell -c "from jolpica.formula_one.import_from_ergast import run_import; run_import()"
	
deploy:
	DJANGO_DEBUG=False python manage.py collectstatic
	eb deploy