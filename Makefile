setup:
	pre-commit install # Install pre-commit hooks

format:
	ruff format .
	ruff check --fix-only .

lint:
	ruff check . --no-fix
	ruff format . --check
	mypy --ignore-missing-imports .

test: format lint
	pytest
	
run: format
	python manage.py runserver
	
dbml:
	python manage.py dbml \
      --add_project_name jolpica-f1 --add_project_notes "jolpica-f1 Database Structure" --disable_update_timestamp \
      --output_file jolpica/formula_one/models/models.dbml formula_one 
	npx @softwaretechnik/dbml-renderer -i jolpica/formula_one/models/models.dbml -o docs/database.svg

test-fixtures:
	tests/create_data_fixtures.sh
	pytest --create-db
	
deploy:
	DJANGO_DEBUG=False python manage.py collectstatic
	eb deploy