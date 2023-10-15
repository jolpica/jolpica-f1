format:
	black .
	ruff check --select I --fix .
	ruff check .
	mypy .
	
run: format
	python manage.py runserver