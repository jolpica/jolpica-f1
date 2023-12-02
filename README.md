# formula-stat

geo libraries for postgis and geodjango are required to be installed
`https://docs.djangoproject.com/en/4.2/ref/contrib/gis/install/geolibs/#geosbuild`

Fun Facts
- Brazil 1962 had no second place
- Drivers scored 1/7 of a point in 1954 British Grand Prix

# Differences to Ergast API

- No support for XML
- If multiple of the same criteria are specified, the last specified will be used (not a 400 response)
- /results
    - positionText no longer has "N" as a possible value, "R" is used instead. 
    - The Time.time key will always 3 digits after decimal points (using trailing zeros). 
    - Time.time is generated from Time.millis so they will now always be consistent.


# Develipment

## Running Tests
The first time the tests are run it will take upto 2 minutes to populate the database with test data, pytest is configured to reuse this database on future runs, so tests should run much faster on future runs.<br>
To run tests after a migration change you must run with the `--create-db` flag to ensure it uses the new migrations.<br>

To run the tests 
```pytest```