# jolpica-f1
API for querying formula one data, with backwards compatible endpoints for the soon to be deprecated ergast api.

The Ergast compatible API can be found here: http://api.jolpi.ca/ergast/f1/

All endpoints documented [here](http://ergast.com/mrd/) should work, simply replace the start of the url.



## Differences to Ergast API
For a full list of differences please see the Issues tab.

- No support for XML
- If multiple of the same criteria are specified, the last specified will be used (not a 400 response)
- /results
    - positionText no longer has "N" as a possible value, "R" is used instead.
    - The Time.time key will always 3 digits after decimal points (using trailing zeros).
- Standings requires a year to be specified

# Database Scheme
Rather than import the existing database scheme used by ergast, we use a new scheme which will allow better adaption to changing rulesets, reduce duplication of information, and allow storage of more F1 related data.
![Database Scheme for jolpica-f1](jolpica/formula_one/models/database.svg)
Many Enumerations are used in the database, the mappings of these values are defined in their respective model files. For example you can find the enumerations for the PointSystem table [here](jolpica/formula_one/models/point_scheme.py)

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