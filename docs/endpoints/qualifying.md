[← Documentation Home](/docs/README.md)
# Qualifying

Returns list of qualification results from each race.

**URL** : `/ergast/f1/qualifying/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters

### Season

Filters for qualifying results only from a specified season. Year numbers are valid as is `current` to get the current season.

`/{season}/` -> ex: `/ergast/f1/2024/qualifying/`

**Note**: To utilize the `season` parameter, it needs to be the first argument after `/ergast/f1/`.

---

### Round

Filters for the qualifying results for a specified round in a specific season. Round numbers 1 -> `n` races are valid as well as `last` and `next`.

`/{season}/{round}/` -> ex: `/ergast/f1/2024/5/qualifying/`

**Note**: To utilize the `round` parameter it must be combined with a season filter and needs to be the first argument after `/ergast/f1/{season}/`.

---

### circuits

Filters for the qualifying results at a specified circuit.

`/circuits/{circuitId}/` -> ex: `/ergast/f1/circuits/monza/qualifying/`

---

### constructors

Filters for the qualifying results of drivers driving for a specified constructor.

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/williams/qualifying/`

---

### drivers

Filters for the qualifying results of a specified driver.

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/hamilton/qualifying/`

---

### grid

Filters for the qualifying results of a driver who started the associated race in a specified grid position.

`/grid/{gridPosition}/` -> ex: `/ergast/f1/grid/18/qualifying/`

**Example**: Pierre Gasly finished Qualifying in 13th for the 2024 Azerbaijan Grand Prix but was disqualified due to instantaneous fuel mass flow limit and started P18 after Ocon and Hamilton. So `/ergast/f1/2024/17/grid/18/qualifying/` would return Gasly's results instead of Zhou who finished Qualifying in P18.

---

### fastest

Filters for the qualifying results a driver with the fastest lap rank at a given Grand Prix.

`/fastest/{lapRank}/` -> ex: `/ergast/f1/fastest/2/qualifying/`

**Example**: If you do `/ergast/f1/2024/17/fastest/1/qualifying/` it will return Lando Norris' qualifying result for the 2024 Azerbaijan Grand Prix as he had the fastest lap in the race, even though he qualified 16th.

---

### status

Filters for the qualifying results of any drivers with the finishing statusId at a given Grand Prix.

`/status/{statusId}/` -> ex: `/ergast/f1/status/11/qualifying/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.RaceTable` : The object containing the list of the all races and associated filters.

`MRData.RaceTable.Races` : The list of all races returned.

`MRData.RaceTable.Races[i]` : A given race object.

`MRData.RaceTable.Races[i].QualifyingResults` : The list of qualifying results for the given race.

`MRData.RaceTable.Races[i].QualifyingResults[i]` : A given qualifying result object.

---

## Qualifying Result Object Fields:

|Field|Always Included|Description|type
|---|:---:|---|---|
|number|✅|Driver's car number|String
|position|✅|Qualifying Result Position|String
|Driver|✅|Driver information (driverId, permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality)|Object
|Constructor|✅|Constructor information (constructorId, url, name, nationality)|Object
|Q1|🟡|Qualifying 1 Result (mm:ss.sss)|String
|Q2|🟡|Qualifying 2 Result (mm:ss.sss)|String
|Q3|🟡|Qualifying 3 Result (mm:ss.sss)|String

---

## Examples:

### Get list of all qualifying results in 2024

`http://api.jolpi.ca/ergast/f1/2024/qualifying/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2024/qualifying/",
    "limit": "30",
    "offset": "0",
    "total": "359",
    "RaceTable": {
      "season": "2024",
      "Races": [
        {
          "season": "2024",
          "round": "1",
          "url": "https://en.wikipedia.org/wiki/2024_Bahrain_Grand_Prix",
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
          "date": "2024-03-02",
          "time": "15:00:00Z",
          "QualifyingResults": [
            {
              "number": "1",
              "position": "1",
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
              "Q1": "1:30.031",
              "Q2": "1:29.374",
              "Q3": "1:29.179"
            },
            {
              "number": "16",
              "position": "2",
              "Driver": {
                "driverId": "leclerc",
                "permanentNumber": "16",
                "code": "LEC",
                "url": "http://en.wikipedia.org/wiki/Charles_Leclerc",
                "givenName": "Charles",
                "familyName": "Leclerc",
                "dateOfBirth": "1997-10-16",
                "nationality": "Monegasque"
              },
              "Constructor": {
                "constructorId": "ferrari",
                "url": "http://en.wikipedia.org/wiki/Scuderia_Ferrari",
                "name": "Ferrari",
                "nationality": "Italian"
              },
              "Q1": "1:30.243",
              "Q2": "1:29.165",
              "Q3": "1:29.407"
            },
            ...more
          ]
        }
      ]
    }
  }
}
```

### Get the qualifying results from the 17th Round of the 2024 season.

`http://api.jolpi.ca/ergast/f1/2024/17/qualifying/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2024/17/qualifying/",
    "limit": "30",
    "offset": "0",
    "total": "20",
    "RaceTable": {
      "season": "2024",
      "round": "17",
      "Races": [
        {
          "season": "2024",
          "round": "17",
          "url": "https://en.wikipedia.org/wiki/2024_Azerbaijan_Grand_Prix",
          "raceName": "Azerbaijan Grand Prix",
          "Circuit": {
            "circuitId": "baku",
            "url": "http://en.wikipedia.org/wiki/Baku_City_Circuit",
            "circuitName": "Baku City Circuit",
            "Location": {
              "lat": "40.3725",
              "long": "49.8533",
              "locality": "Baku",
              "country": "Azerbaijan"
            }
          },
          "date": "2024-09-15",
          "time": "11:00:00Z",
          "QualifyingResults": [
            {
              "number": "16",
              "position": "1",
              "Driver": {
                "driverId": "leclerc",
                "permanentNumber": "16",
                "code": "LEC",
                "url": "http://en.wikipedia.org/wiki/Charles_Leclerc",
                "givenName": "Charles",
                "familyName": "Leclerc",
                "dateOfBirth": "1997-10-16",
                "nationality": "Monegasque"
              },
              "Constructor": {
                "constructorId": "ferrari",
                "url": "http://en.wikipedia.org/wiki/Scuderia_Ferrari",
                "name": "Ferrari",
                "nationality": "Italian"
              },
              "Q1": "1:42.775",
              "Q2": "1:42.056",
              "Q3": "1:41.365"
            },
            {
              "number": "81",
              "position": "2",
              "Driver": {
                "driverId": "piastri",
                "permanentNumber": "81",
                "code": "PIA",
                "url": "http://en.wikipedia.org/wiki/Oscar_Piastri",
                "givenName": "Oscar",
                "familyName": "Piastri",
                "dateOfBirth": "2001-04-06",
                "nationality": "Australian"
              },
              "Constructor": {
                "constructorId": "mclaren",
                "url": "http://en.wikipedia.org/wiki/McLaren",
                "name": "McLaren",
                "nationality": "British"
              },
              "Q1": "1:43.033",
              "Q2": "1:42.598",
              "Q3": "1:41.686"
            },
            ...more
          ]
        }
      ]
    }
  }
}
```