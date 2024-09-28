# jolpica-f1 Documentation

jolpica-f1 is an open-source API for querying Formula 1 data. It is the successor to the Ergast F1 API, containing backwards compatible endpoints for the soon to be deprecated API.

---
| Important information
|-
| [Rate Limits](/docs/rate_limits.md)
| [Differences to Ergast](/docs/ergast_differences.md)

---

## Endpoints and Documentation:
For any gaps found within our documentation, please check the Ergast docs [here](http://ergast.com/mrd/). 

| Endpoint                                              | Route |
|-----                                                  |-----|
| [Circuits](/docs/endpoints/circuits.md)               | `/ergast/f1/circuits/`|
| [Constructors](/docs/endpoints/constructors.md)       | `/ergast/f1/constructors/` |
| [Constructor Standings](/docs/endpoints/constructorStandings.md)  | `/ergast/f1/{season}/constructorstandings/` |
| [Drivers](/docs/endpoints/drivers.md)                 | `/ergast/f1/drivers/` |
| [Driver Standings](/docs/endpoints/driverStandings.md)| `/ergast/f1/{season}/driverstandings/` |
| Laps                                                  | `/ergast/f1/{season}/{round}/laps/` |
| [Pitstops](/docs/endpoints/pitstops.md)               | `/ergast/f1/{season}/{round}/pitstops/` |
| [Qualifying](/docs/endpoints/qualifying)              | `/ergast/f1/{season}/qualifying/` |
| [Races](/docs/endpoitns/races.md)                     | `/ergast/f1/races/` |
| Results                                               | `/ergast/f1/results/` |
| [Seasons](/docs/endpoints/seasons.md)                 | `/ergast/f1/seasons/` |
| Sprint                                                | `/ergast/f1/sprint/` |
| Status                                                |  `/ergast/f1/status/` |

**Note**: All endpoints should either end with a `/` or `.json`

---

## Query Parameters

These parameters are shared between all API endpoints

`limit` - Maximum number of results results returned. Defaults to 30. Max is 100

`offset` - Allows you to offset the results by the specified number for pagination. Defaults to 0.

---

## Common Response Fields:

These are field definitions that you will receive in the response for any call:

`MRData` : The root object of the json response.

`MRData.series` : The racing series of the results (always `f1`).

`MRData.xmlns` : Blank, provided for compatibility with legacy ergast API.

`MRData.url` : The API URL that the returned data was retrived from (without query paramters).

`MRData.limit` : The limit used for this call. May be different from the query parameter set in some cases.

`MRData.offset` : The result offset of this call.

`MRData.total` : The total number of items available from the endpoint.

---
