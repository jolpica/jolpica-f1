# jolpica-f1 Documentation

API for querying formula one data, with backwards compatible endpoints for the soon to be deprecated ergast api.

---

## Endpoints and Documentation:

| Endpoint | Route |
|-----|-----|
| Circuits | `/ergast/f1/circuits` |
| Constructors | `/ergast/f1/constructors`|
| Constructor Standings | `/ergast/f1/current/constructorstandings`|
| [Drivers](/docs/drivers.md) | `/ergast/f1/drivers`|
| Driver Standings | `/ergast/f1/current/driverstandings`|
| Laps | `/ergast/f1/current/1/laps`|
| Pitstops | `/ergast/f1/current/1/pitstops`|
| Qualifying | `/ergast/f1/current/qualifying`|
| [Races](/docs/races.md) | `/ergast/f1/races`|
| Results | `/ergast/f1/results`|
| [Seasons](/docs/seasons.md) | `/ergast/f1/seasons`|
| Sprint | `/ergast/f1/sprint`|
| Status |  `/ergast/f1/status`|

---

## Query Parameters

These parameters are shared between all API endpoints

`limit` - Allows you to alter the limit the number of results returned. Defaults to 30. Max is 100

`offset` - Allows you to offset the results by the specified number for pagination. Defaults to 0.

---

## Common Response Fields:

These are field definitions that you will receive in the response for any call:

`MRData` : The root object of the json response.

`MRData.series` : The racing series that the races are a part of.

`MRData.url` : The API URL that the returned data was retrived from (without query paramters).

`MRData.limit` : The limit of results that could be returned from this call.

`MRData.offset` : The result offset of this call.

`MRData.total` : The total number of items available from the endpoint.

---

## Known differences between Jolpica and Ergast

- Jolpica doesn't support XML responses like Ergast does

