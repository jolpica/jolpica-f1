# jolpica-f1 Documentation

API for querying formula one data, with backwards compatible endpoints for the soon to be deprecated ergast api.

---

## Endpoints and Documentation:

| Endpoint | Route |
|-----|-----|
| Circuits | `/ergast/f1/circuits` |
| Constructors | `/ergast/f1/constructors`|
| Constructor Standings | `/ergast/f1/2024/constructorstandings`|
| Drivers | `/ergast/f1/drivers`|
| Driver Standings | `/ergast/f1/2024/driverstandings`|
| Laps | `/ergast/f1/current/1/laps`|
| Pitstops | `/ergast/f1/2024/1/pitstop`|
| Qualifying | `/ergast/f1/2024/qualifying`|
| [Races](/docs/races.md) | `/ergast/f1/races`|
| Results | `/ergast/f1/results`|
| Season | `/ergast/f1/seasons`|
| Sprint | `/ergast/f1/sprint`|
| Status |  `/ergast/f1/status`|

---

## Known differences between Jolpica and Ergast

- Jolpica doesn't support XML responses like Ergast does

