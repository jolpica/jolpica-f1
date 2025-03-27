[← Documentation Home](/docs/README.md)
# Ergast Differences

## Reporting incompatibilities
Before opening an issue, please ensure the issue is not listed below, or an already existing issue exists.

## Known differences between `jolpica-f1` and `ergast` APIs
These issues are intentional and there are no plans to resolve them.

#### All Endpoints
- XML responses are not supported.
- `jolpica-f1` will ignore all but the the last filter when using duplicates of the same filter, whereas ergast returned a `400` error. (ex. `/2024/drivers/alonso/drivers/hamilton/results.json`)

#### Results
- `positionText` no longer has `N` as a possible value, `R` is used instead.
- `Time.time` will always contain 3 digits after decimal points (using trailing zeros).
- `status` see Status heading below for details on changed possible values.

#### Standings
- `jolpica-f1` requires a year to be specified.

#### Races
- 2023: Ergast lists the Sprint Shootout as "SecondPractice", we have renamed this to "SprintShootout".
- 2024 onwards: Ergast lists Sprint Qualifying as "SecondPractice", we have renamed this to "SprintQualifying".
For more details on the returned values, refer to the [races endpoint](./endpoints/races.md).

#### Status
- Results are ordered by count instead of statusId. This allows our Database to be independant of Ergast.
- From the 2025 season
  - Only the Statuses listed in [this enumeration](https://github.com/jolpica/jolpica-f1/blob/71f12b1c9637aa838926abcb6f4840fbfac4d87c/jolpica/formula_one/models/session.py#L64-L71) will be used.
  - All retirements and accidents will be listed as "Retired", as we do not currently have a data source to differentiate between accidents and retirements. [See this disucssion for details](https://github.com/jolpica/jolpica-f1/discussions/184](https://github.com/jolpica/jolpica-f1/discussions/184#discussioncomment-12633419)).
