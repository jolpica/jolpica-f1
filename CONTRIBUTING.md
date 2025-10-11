# Contributing
## Contributor License Agreement

By contributing to this project, you agree that your contributions will be licensed under the same license as the project, the Apache License 2.0.

Specifically:
- You grant us (and everyone else) a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable license to use, reproduce, prepare derivative works of, publicly display, publicly perform, sublicense, and distribute your contributions and such derivative works under the terms of the Apache License 2.0.
- You represent that you have the right to grant this license for your contributions.
- You agree to share non-exclusive copyright ownership of your contributions with the project owners.
- The project owners reserve the right to change the license of the project at their discretion. Any changes will be communicated to contributors and users through the appropriate channels.

If you do not agree to these terms, please do not submit contributions to this project.

## How to contribute

### Did you find a bug?

* **Ensure the bug was not already reported** by searching on GitHub under [Issues](https://github.com/jolpica/jolpica-f1/issues).

* If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/jolpica/jolpica-f1/issues/new). Be sure to include a **title and clear description**, as much relevant information as possible, the endpoint returning an unexpected result alongside the expected result.

### Did you write a patch that fixes a bug?

- Open a new GitHub pull request with the patch.

- Ensure the PR description clearly describes the problem and solution. Include the relevant issue number if applicable.

- Include a minimal test case which would fail before your bugfix, and succeeds afterwards.

- Before submitting, please read the [License](/LICENSE) and [Contributor License Agreement](#contributor-license-agreement) as by contributing and submitting a PR you agree to follow both.

### Do you intend to add a new feature or change an existing one?

- Suggest your change on GitHub under [Issues](https://github.com/jolpica/jolpica-f1/issues) before writing code, specifying what you intend to contribute.

- We will not accept changes to the ergast compatible api that add new features or break backwards compatibility. 

- Generally we will not accept additions to the database model before a source for the data has been found with an automated ingestion method developed. 

- Before submitting, please read the [License](/LICENSE) and [Contributor License Agreement](#contributor-license-agreement) as by contributing and submitting a PR you agree to follow both. 

# Developing
How to setup the project locally for development.

## Initial Setup
### Prerequisite
Use of the devcontainer is recommended. If not using, we will provide no debugging help,
but please look at `.devcontainer/Dockerfile` for the required installs and versions (e.g. `poetry < 2`>).<br>

Current requirements are:
- Poetry for python (get the version from the devcontainer)
- A postgres database which can be accessed via the `DATABASE_SECRET_URL` environment variable.

### Data Import

  
- Run any initial setup for development (e.g. python dependencies, pre-commit)
  ```
  make setup
  ```
  - If not using the devcontainer, you will need to have the correct poetry version installed and activate the environment first:  
    `source "$(poetry env info -p)"/bin/activate`

- Create all required database tables
  ```
  python manage.py migrate
  ```

- Download a [csv dump here](https://api.jolpi.ca/data/dumps/download/delayed/?dump_type=csv) (See the metadata for the latest delayed dumps [here](https://api.jolpi.ca/data/dumps/download/)).  
  This dump should be delayed by 14 days or less, so should be good for most development.

- Place the csv dump in the root of the project (next to the README.md), and rename it to jolpica-f1-csv.zip

- Run the data import:
  ```
  sh scripts/restore_from_csv_dump.sh localhost jolpica postgres
  ```
    - If using custom database (e.g. not the devcontainer) add the following args to the above command:
       - replace `localhost` with the address of your postgres server
       - replace `jolpica` with the name of the database
       - replace `postgres` with the username used to authenticate
       - export the password for the user to the `PGPASSWORD` environment variable
  
  If you are having issues with a schema mismatch / constraint violation, you may need to follow one of the FAQs [here](/docs/database_dumps.md).

- Do the initial setup of the test database then run the tests
  ```
  pytest --create-db
  ```
  By default we re-use the same database between tests, and so have to create the initial test database. This is so all future tests will run quicker.

## Running the Server

To run the server

```make run```

This will start jolpica-f1 on port 8000. Once it is running you can access the API via browser, curl or any other tools with `http://localhost:8000/ergast/f1/`. Any changes made to the source code will be automatically updated, while it is running.

## Running Tests
The first time the tests are run it will take upto 2 minutes to populate the database with test data, pytest is configured to reuse this database on future runs, so tests should run much faster on future runs.<br>
To run tests after a migration change you must run with the `--create-db` flag to ensure it uses the new migrations.<br>

To run the tests
```pytest```