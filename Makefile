format:
	black .
	ruff check --select I --fix .

lint:
	ruff check .
	mypy .
	
run: format
	python manage.py runserver