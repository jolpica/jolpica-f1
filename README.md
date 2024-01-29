# jolpica-f1

geo libraries for postgis and geodjango are required to be installed
``

# Differences to Ergast API

- No support for XML
- If multiple of the same criteria are specified, the last specified will be used (not a 400 response)
- /results
    - positionText no longer has "N" as a possible value, "R" is used instead.
    - The Time.time key will always 3 digits after decimal points (using trailing zeros).
    - Time.time is generated from Time.millis so they will now always be consistent.
- Standings position is based on total points scored instead of championship points rules (only effects seasons before 1991)
- Standings requires a year to be specified

## TODO
- Remove session entries for drivers who did not (pre) qualify

Fun Facts
- Brazil 1962 had no second place
- Drivers scored 1/7 of a point in 1954 British Grand Prix

# Development
## Initial Setup
### Prerequisite
Use of the devcontainer is recommended. If not using, look at `.devcontainer/Dockerfile` for required installs.<br>
Current requirements are:
- Poetry for python
- [Geo Libraries for postgis and geodjango](https://docs.djangoproject.com/en/4.2/ref/contrib/gis/install/geolibs/#geosbuild)
- A postgres database which can be accessed via the `DATABASE_SECRET_URL` environment variable.

### Data Import
- If not using the devcontainer, Install python dependencies `poetry install`, and activate the venv `poetry shell`
- Create all required database tables
  ```
  python manage.py migrate
  ```
- Download csv data from ergast and import into postgres database
  ```
  make load-ergast-data
  ```
- Convert data to new schema, then run & create the test database
  ```
  make import-from-ergast
  pytest --create-db
  ```
This will fill the database with the latest data from ergast, and create the initial test database so all future tests will run quicker.

## Running Tests
The first time the tests are run it will take upto 2 minutes to populate the database with test data, pytest is configured to reuse this database on future runs, so tests should run much faster on future runs.<br>
To run tests after a migration change you must run with the `--create-db` flag to ensure it uses the new migrations.<br>

To run the tests
```pytest```