setup:
	uv sync --locked
	pre-commit install --hook-type pre-push # Install pre-push hooks
	python manage.py migrate

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
	# Remove the time_zone_session_timezone enum as it makes the visualisation hard to read
	sed '/^enum formula_one\.time_zone_session_timezone {$$/,/^}$$/d' \
      jolpica/formula_one/models/models.dbml > jolpica/formula_one/models/models.filtered.dbml
	npx @softwaretechnik/dbml-renderer -i jolpica/formula_one/models/models.filtered.dbml -o docs/database.svg
	rm jolpica/formula_one/models/models.filtered.dbml

test-fixtures:
	tests/create_data_fixtures.sh
	pytest --create-db
	
deploy:
	DJANGO_DEBUG=False python manage.py collectstatic
	eb deploy