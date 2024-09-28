[← Documentation Home](/docs/README.md)
# Results

Returns a list of race results.

**URL** : `/ergast/f1/results/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters

### Season

Filters for race results only from a specified season. Year numbers are valid as is `current` to get the current season.

`/{season}/` -> ex: `/ergast/f1/2024/results/`

**Note**: To utilize the `season` parameter, it needs to be the first argument after `/ergast/f1/`.

---

### Round

Filters for the race results for a specified round in a specific season. Round numbers 1 -> `n` races are valid as well as `last`.

`/{season}/{round}/` -> ex: `/ergast/f1/2024/last/results/`

**Note**: To utilize the `round` parameter it must be combined with a season filter and needs to be the first argument after `/ergast/f1/{season}/`.

---

### circuits

Filters for only race results from races at a specified circuit.

`/circuits/{circuitId}/` -> ex: `/ergast/f1/circuits/monza/results/`

---

### constructors

Filters for only race results for drivers racings for a specified constructor.

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/williams/results/`

---

### drivers

Filters for only race results for a specified driver.

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/hamilton/results/`


---

### fastest

Filters for only race results of the driver who had the `n`th fastest lap of the race.

`/fastest/{lapRank}/` -> ex: `/ergast/f1/2024/fastest/1/results/`

---

### grid

Filters for only race results for drivers starting in a specified grid position.

`/grid/{gridPosition}/` -> ex: `/ergast/f1/2024/grid/9/results/`

---

### status

Filters for only race results of a driver who finished the race with a specific status.

`/status/{statusId}/` -> ex: `/ergast/f1/status/14/results/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.RaceTable` : The object containing the list of the all races.

`MRData.RaceTable.Races` : The list of all races returned.

`MRData.RaceTable.Races[i]` : A given race object.

`MRData.RaceTable.Races[i].season` : The season the race is from.

`MRData.RaceTable.Races[i].round` : The round of season the race was.

`MRData.RaceTable.Races[i].url` : The wikipedia link of the race.

`MRData.RaceTable.Races[i].raceName` : The name of the race.

`MRData.RaceTable.Races[i].Circuit` : The circuit information.

`MRData.RaceTable.Races[i].date` : The date of the race.

`MRData.RaceTable.Races[i].time` : The time of the race.

`MRData.RaceTable.Races[i].Results` : The list of race results.

`MRData.RaceTable.Races[i].Results[j]` : The a given race result object.

---

## Race Result Object Fields:

|Field|Always Included|Description|type
|---|:---:|---|---|
|number|✅|The drivers number|String
|position|✅|Finishing position of the driver|String
|positionText|✅|Finishing position text representation|String
|points|✅|Points the driver earned for this result|String
|Driver|✅|Driver information (driverId, permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality)|Object
|Constructor|🟡|Driver information (constructorId, url, name, nationality)|Object
|grid|🟡|The driver's grid position|String
|laps|🟡|The laps this driver completed|String
|status|🟡|The drivers finishing status in long form|String
|FastestLap|🟡|The fastest lap information for this driver (rank, lap, Time, AverageSpeed)|Object

---

## Examples:

### Get the race results from the 9th round of the 2021 season.

`http://api.jolpi.ca/ergast/f1/2021/9/results/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2021/9/results/",
    "limit": "30",
    "offset": "0",
    "total": "20",
    "RaceTable": {
      "season": "2021",
      "round": "9",
      "Races": [
        {
          "season": "2021",
          "round": "9",
          "url": "http://en.wikipedia.org/wiki/2021_Austrian_Grand_Prix",
          "raceName": "Austrian Grand Prix",
          "Circuit": {
            "circuitId": "red_bull_ring",
            "url": "http://en.wikipedia.org/wiki/Red_Bull_Ring",
            "circuitName": "Red Bull Ring",
            "Location": {
              "lat": "47.2197",
              "long": "14.7647",
              "locality": "Spielberg",
              "country": "Austria"
            }
          },
          "date": "2021-07-04",
          "time": "13:00:00Z",
          "Results": [
            {
              "number": "33",
              "position": "1",
              "positionText": "1",
              "points": "26",
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
              "grid": "1",
              "laps": "71",
              "status": "Finished",
              "Time": {
                "millis": "5034543",
                "time": "1:23:54.543"
              },
              "FastestLap": {
                "rank": "1",
                "lap": "62",
                "Time": {
                  "time": "1:06.200"
                },
                "AverageSpeed": {
                  "units": "kph",
                  "speed": "234.815"
                }
              }
            },
            {
              "number": "77",
              "position": "2",
              "positionText": "2",
              "points": "18",
              "Driver": {
                "driverId": "bottas",
                "permanentNumber": "77",
                "code": "BOT",
                "url": "http://en.wikipedia.org/wiki/Valtteri_Bottas",
                "givenName": "Valtteri",
                "familyName": "Bottas",
                "dateOfBirth": "1989-08-28",
                "nationality": "Finnish"
              },
              "Constructor": {
                "constructorId": "mercedes",
                "url": "http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One",
                "name": "Mercedes",
                "nationality": "German"
              },
              "grid": "5",
              "laps": "71",
              "status": "Finished",
              "Time": {
                "millis": "5052516",
                "time": "+17.973"
              },
              "FastestLap": {
                "rank": "6",
                "lap": "52",
                "Time": {
                  "time": "1:08.374"
                },
                "AverageSpeed": {
                  "units": "kph",
                  "speed": "227.349"
                }
              }
            },
            ...more results from the race
          ]
        },
        ...more races
      ]
    }
  }
}
```

### Get all 2023 race results of all races where a driver finished 2 laps down

`https://api.jolpi.ca/ergast/f1/2023/status/12/results/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2023/status/12/results/",
    "limit": "30",
    "offset": "0",
    "total": "6",
    "RaceTable": {
      "season": "2023",
      "status": "12",
      "Races": [
        {
          "season": "2023",
          "round": "1",
          "url": "https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix",
          "raceName": "Bahrain Grand Prix",
          "Circuit": {
            "circuitId": "bahrain",
            "url": "http://en.wikipedia.org/wiki/Bahrain_International_Circuit",
            "circuitName": "Bahrain International Circuit",
            "Location": {
              "lat": "26.0325",
              "long": "50.5106",
              "locality": "Sakhir",
              "country": "Bahrain"
            }
          },
          "date": "2023-03-05",
          "time": "15:00:00Z",
          "Results": [
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
              "grid": "11",
              "laps": "55",
              "status": "+2 Laps",
              "FastestLap": {
                "rank": "3",
                "lap": "51",
                "Time": {
                  "time": "1:35.822"
                },
                "AverageSpeed": {
                  "units": "kph",
                  "speed": "203.327"
                }
              }
            }
          ]
        },
        {
          "season": "2023",
          "round": "6",
          "url": "https://en.wikipedia.org/wiki/2023_Monaco_Grand_Prix",
          "raceName": "Monaco Grand Prix",
          "Circuit": {
            "circuitId": "monaco",
            "url": "http://en.wikipedia.org/wiki/Circuit_de_Monaco",
            "circuitName": "Circuit de Monaco",
            "Location": {
              "lat": "43.7347",
              "long": "7.42056",
              "locality": "Monte-Carlo",
              "country": "Monaco"
            }
          },
          "date": "2023-05-28",
          "time": "13:00:00Z",
          "Results": [
            {
              "number": "22",
              "position": "15",
              "positionText": "15",
              "points": "0",
              "Driver": {
                "driverId": "tsunoda",
                "permanentNumber": "22",
                "code": "TSU",
                "url": "http://en.wikipedia.org/wiki/Yuki_Tsunoda",
                "givenName": "Yuki",
                "familyName": "Tsunoda",
                "dateOfBirth": "2000-05-11",
                "nationality": "Japanese"
              },
              "Constructor": {
                "constructorId": "alphatauri",
                "url": "http://en.wikipedia.org/wiki/Scuderia_AlphaTauri",
                "name": "AlphaTauri",
                "nationality": "Italian"
              },
              "grid": "9",
              "laps": "76",
              "status": "+2 Laps",
              "FastestLap": {
                "rank": "16",
                "lap": "36",
                "Time": {
                  "time": "1:17.680"
                },
                "AverageSpeed": {
                  "units": "kph",
                  "speed": "154.649"
                }
              }
            },
            ...more drivers 2 laps down in Monaco 
          ]
        },
        ...more races in 2023 where a driver finished 2 laps down
      ]
    }
  }
}
```