setup:
	pre-commit install # Install pre-commit hooks

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

test-fixtures:
	tests/create_data_fixtures.sh
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