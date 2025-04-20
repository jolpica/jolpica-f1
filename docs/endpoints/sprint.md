[← Documentation Home](/docs/README.md)
# Sprint

Returns a list of sprint race results.

**URL** : `/ergast/f1/sprint/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters

### Season

Filters for sprint results only from a specified season. Year numbers are valid, as is `current`.

`/{season}/` -> ex: `/ergast/f1/2023/sprint/`

**Note**: To utilize the `season` parameter, it needs to be the first argument after `/ergast/f1/`.

---

### Round

Filters for the sprint results for a specified round in a specific season. Round numbers 1 -> `n` races are valid as well as `last`.

`/{season}/{round}/` -> ex: `/ergast/f1/2024/5/sprint/`

**Note**: To utilize the `round` parameter it must be combined with a season filter and needs to be the first argument after `/ergast/f1/{season}/`.

---

### circuits

Filters for only sprint results from races at a specified circuit.

`/circuits/{circuitId}/` -> ex: `/ergast/f1/circuits/red_bull_ring/sprint/`

---

### constructors

Filters for only sprint results for drivers racing for a specified constructor.

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/mclaren/sprint/`

---

### drivers

Filters for only sprint results for a specified driver.

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/norris/sprint/`

---

### grid

Filters for only sprint results for drivers starting the sprint in a specified grid position.

`/grid/{gridPosition}/` -> ex: `/ergast/f1/2024/grid/1/sprint/`

---

### status

Filters for only sprint results of a driver who finished the sprint with a specific status.

`/status/{statusId}/` -> ex: `/ergast/f1/status/1/sprint/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](/docs/README.md#common-response-fields)

`MRData.RaceTable` : The object containing the list of the all races with sprints matching filters.

`MRData.RaceTable.Races` : The list of all races returned.

`MRData.RaceTable.Races[i]` : A given race object.

`MRData.RaceTable.Races[i].season` : The season the race is from.

`MRData.RaceTable.Races[i].round` : The round of season the race was.

`MRData.RaceTable.Races[i].url` : The wikipedia link of the race.

`MRData.RaceTable.Races[i].raceName` : The name of the race.

`MRData.RaceTable.Races[i].Circuit` : The circuit information.

`MRData.RaceTable.Races[i].date` : The date of the main race.

`MRData.RaceTable.Races[i].time` : The time of the main race.

`MRData.RaceTable.Races[i].SprintResults` : The list of sprint race results.

`MRData.RaceTable.Races[i].SprintResults[j]` : The a given sprint result object.

---

## Sprint Result Object Fields:

|Field|Always Included|Description|type
|---|:---:|---|---|
|number|✅|The drivers number|String
|position|✅|Finishing position of the driver|String
|positionText|✅|Finishing position text representation|String
|points|✅|Points the driver earned for this sprint result|String
|Driver|✅|Driver information (driverId, permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality)|Object
|Constructor|🟡|Constructor information (constructorId, url, name, nationality)|Object
|grid|🟡|The driver's grid position for the sprint|String
|laps|🟡|The laps this driver completed in the sprint|String
|status|🟡|The drivers finishing status in the sprint|String
|Time|🟡|Finishing time information (millis, time)|Object
|FastestLap|🟡|The fastest lap information for this driver (rank, lap, Time, AverageSpeed)|Object

---

## Examples:

### Get the sprint results from the 5th round (China) of the 2024 season.

`http://api.jolpi.ca/ergast/f1/2024/5/sprint/`

```json
{
    "MRData": {
        "xmlns": "",
        "series": "f1",
        "url": "http://api.jolpi.ca/ergast/f1/2024/5/sprint/",
        "limit": "30",
        "offset": "0",
        "total": "20",
        "RaceTable": {
            "season": "2024",
            "round": "5",
            "Races": [
                {
                    "season": "2024",
                    "round": "5",
                    "url": "https://en.wikipedia.org/wiki/2024_Chinese_Grand_Prix",
                    "raceName": "Chinese Grand Prix",
                    "Circuit": {
                        "circuitId": "shanghai",
                        "url": "https://en.wikipedia.org/wiki/Shanghai_International_Circuit",
                        "circuitName": "Shanghai International Circuit",
                        "Location": {
                            "lat": "31.3389",
                            "long": "121.22",
                            "locality": "Shanghai",
                            "country": "China"
                        }
                    },
                    "date": "2024-04-21",
                    "time": "07:00:00Z",
                    "SprintResults": [
                        {
                            "number": "1",
                            "position": "1",
                            "positionText": "1",
                            "points": "8",
                            "Driver": {
                                "driverId": "max_verstappen",
                                "permanentNumber": "33",
                                "code": "VER",
                                "url": "http://en.wikipedia.org/wiki/Max_Verstappen",
                                "givenName": "Max",
                                "familyName": "Verstappen",
                                "dateOfBirth": "1997-09-30",
                                "nationality": "Dutch"
                            },
                            "Constructor": {
                                "constructorId": "red_bull",
                                "url": "http://en.wikipedia.org/wiki/Red_Bull_Racing",
                                "name": "Red Bull",
                                "nationality": "Austrian"
                            },
                            "grid": "4",
                            "laps": "19",
                            "status": "Finished",
                            "Time": {
                                "millis": "1924660",
                                "time": "32:04.660"
                            },
                            "FastestLap": {
                                "rank": "1",
                                "lap": "3",
                                "Time": {
                                    "time": "1:40.331"
                                }
                            }
                        },
                        ...more results from the sprint
                    ]
                }
            ]
        }
    }
}
```

### Get all sprint results for Lando Norris in the 2023 season

`https://api.jolpi.ca/ergast/f1/2023/drivers/norris/sprint/`

```json
{
    "MRData": {
        "xmlns": "",
        "series": "f1",
        "url": "http://api.jolpi.ca/ergast/f1/2023/drivers/norris/sprint/",
        "limit": "30",
        "offset": "0",
        "total": "6",
        "RaceTable": {
            "season": "2023",
            "driverId": "norris",
            "Races": [
                {
                    "season": "2023",
                    "round": "4",
                    "url": "https://en.wikipedia.org/wiki/2023_Azerbaijan_Grand_Prix",
                    "raceName": "Azerbaijan Grand Prix",
                    // ... Circuit info ...
                    "date": "2023-04-30",
                    "time": "11:00:00Z",
                    "SprintResults": [
                        {
                            "number": "4",
                            "position": "17",
                            "positionText": "17",
                            "points": "0",
                            "Driver": {
                                "driverId": "norris",
                                "permanentNumber": "4",
                                "code": "NOR",
                                "url": "http://en.wikipedia.org/wiki/Lando_Norris",
                                "givenName": "Lando",
                                "familyName": "Norris",
                                "dateOfBirth": "1999-11-13",
                                "nationality": "British"
                            },
                            "Constructor": {
                                "constructorId": "mclaren",
                                "url": "http://en.wikipedia.org/wiki/McLaren",
                                "name": "McLaren",
                                "nationality": "British"
                            },
                            "grid": "10",
                            "laps": "17",
                            "status": "Finished",
                            "Time": {
                                "millis": "2048771",
                                "time": "+51.104"
                            },
                            "FastestLap": {
                                "lap": "15",
                                "Time": {
                                    "time": "1:44.484"
                                }
                            }
                        }
                    ]
                },
                {
                    "season": "2023",
                    "round": "10",
                    "url": "https://en.wikipedia.org/wiki/2023_Austrian_Grand_Prix",
                    "raceName": "Austrian Grand Prix",
                    // ... Circuit info ...
                    "date": "2023-07-02",
                    "time": "13:00:00Z",
                    "SprintResults": [
                        // Sprint results
                    ]
                },
                 // ... Results from Belgium, Qatar, USA, Brazil sprints ...
            ]
        }
    }
}
```
