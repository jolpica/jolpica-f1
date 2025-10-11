# Database Dumps

## Information

Exports of our F1 database include all historical race data, driver information, constructor details, and championship standings.

### Available Formats

The CSV format reflects our database structure which you can explore in [our dbdocs](https://dbdocs.io/jolpica/jolpica-f1?view=relationships). We recommend addressing CSV columns by their column name instead of their order as we make no guarantees that their order will stay consistent as we expand our database. See the breaking changes below for more details on what guarantees we make.

Additional formats may be available in the future.

## Database Dumps Endpoint

See documentation for our API endpoint to [view and download database dumps](endpoints/data/dumps.md).

## Dump Access Tiers
To support the running of the API, while balancing keeping our data free for everyone, there are two tiers of access for database dumps.

###  🆓 Free Database Dump Access - Non-Commercial Use

  - Dumps available for download 14 days after they are uploaded
  - (Unchanged from API access) Data freely available for non-commercial use
  - No authentication required

### 💎 Supporter Database Dump Access - Commercial Use

  - Latest dumps are available as soon as they are uploaded.
  - (Change from regular API access) Data licensed for commercial use
  - Authentication via API key required
  - We'll be providing details on how to access supporter downloads in the future, in the meantime feel free to message us on Ko-fi if you're an existing supporter wanting early access.

## Frequently Asked Questions

<details>
<summary>What do the numbers in PointScheme / SessionEntry.status / ... mean? </summary>

Throughout our database we use Integer Enumerations to map certain pre-defined fields such as a car's finishing status or a certain ruleset for a race. Currently, you can only find the meanings of these encodings in our model source code.

In the future we hope to make this more accessible by including them in dumps. If you'd like to help implement this feel free to reach out in [discussions](https://github.com/jolpica/jolpica-f1/discussions) or on [discord](https://discord.com/invite/HHNBT2zJew).

The definitions for some common enums can be found here. Please make sure to switch to the main branch after clicking the link to get the most up to date model definitions:
  - [SessionStatus](https://github.com/jolpica/jolpica-f1/blob/ac7925689ced6dfa49d5336585a9fac64673aff1/jolpica/formula_one/models/session.py#L92-L102) (SessionEntry.status)
  - [PointSystem Enums](https://github.com/jolpica/jolpica-f1/blob/ac7925689ced6dfa49d5336585a9fac64673aff1/jolpica/formula_one/models/point_scheme.py#L11-L51)
  - [ChampionshipScheme Enums](https://github.com/jolpica/jolpica-f1/blob/ac7925689ced6dfa49d5336585a9fac64673aff1/jolpica/formula_one/models/point_scheme.py#L95-L128)
  - [ChampionshipAdjustmentType](https://github.com/jolpica/jolpica-f1/blob/ac7925689ced6dfa49d5336585a9fac64673aff1/jolpica/formula_one/models/point_scheme.py#L171-L179C31) (ChampionshipAdjustment.adjustment)
  - [TeamDriverRole](https://github.com/jolpica/jolpica-f1/blob/ac7925689ced6dfa49d5336585a9fac64673aff1/jolpica/formula_one/models/team.py#L55-L60) (TeamDriver.role)
  - [SessionType](https://github.com/jolpica/jolpica-f1/blob/ac7925689ced6dfa49d5336585a9fac64673aff1/jolpica/formula_one/models/session.py#L92-L102) (Session.type) - Uses a Text enum instead of integer.

</details>

<details>
<summary> Issue Importing Dump into jolpica-f1 API (violates constraint / schema mismatch)</summary>
This can occasionally happen when we introduce a database migration and the database dumps haven't been updated to reflect the new schema yet. The suggested solution is to either wait until the delayed dump has updated, or purchase a higher access tier. However you can manually upgrade the dump by following the below instructions.<br>

### Migrate the Dump to the new schema
You can resolve this by importing the data, then running the migrations manually yourself:

1. Find the timestamp when the dump you are using was created (The `uploaded_at` field on [Dumps Overview](endpoints/data/dumps.md) endpoint)
2. Find the commit of the latest commit to the repository [here](https://github.com/jolpica/jolpica-f1/commits/main/), which was created before that timestamp and note down its hash.
3. **Important** (Or your database may get out of sync): Undo all migrations for the formula one app: <br> 
`python manage.py migrate formula_one zero`
4. Checkout the commit you found earlier `git checkout <commit_hash>`
5. Run Migrations: `python manage.py migrate formula_one`
6. Import Data - Use your method of choice (For example, `python scripts/restore_from_csv_dump.sh`)
7. Checkout the main branch, and run migrations: <br> `git checkout main && git pull && python manage.py migrate`

Done! You have successfully migrated an old database to use a new schema. Some database migrations may take a while to run if they contain large data migrations.<br>
If you are having troubles with dependencies, make sure you reinstall / sync dependencies after each git checkout.
</details>