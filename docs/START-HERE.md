# Start Here

## Project Status, July 2024

The Ergast replacement has essentially reached parity with Ergast and is ready for Alpha testing. The API can be tested by using Ergast endpoint URLs against the [Jolpica server](http://api.jolpi.ca/ergast/f1/). In the coming weeks, Jolpica's maintainers will focus on setting up server/infrastructure monitoring and building out Jolpica's documentation to minimally be on par with Ergast.

API enhancements and changes will not be a priority until the 2025 season. For the remainder of the 2024 season, the project's focus will be on reaching complete parity, including automated data ingestion, with Ergast before it is deprecated.

## Code of Conduct

TKTK

## Differences between Ergast and Jolpica APIs

- Jolpica does not provide API responses in XML; JSON only.
- If multiple of the same criteria are specified, the last specified will be used (not a 400 response).
- `/results`
  - `positionText` no longer has "N" as a possible value, "R" is used instead.
  - The `Time.time` key will always 3 digits after decimal points (using trailing zeros).
- Constructor and Driver standings require a year parameter to be specified.

## API Rate Limiting

TKTK

## API Authentication Tokens

TKTK

## How to Contribute

Details on contributing to Jolpica can be found in [CONTRIBUTING.md](/CONTRIBUTING.md).
