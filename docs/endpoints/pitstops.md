[← Documentation Home](/docs/README.md)
# Pitstops

Returns a given races list of pitstops, from earliest to latest `time` in which the pitstop occurred.

**Note**: Data starts from the 2011 season.

**URL** : `/ergast/f1/{season}/{round}/pitstops/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters

### Season (required)

Filters for the season that the list of pitstops will be from. Year numbers are valid as is `current` to get the pitstops of a given round in the current season.

`/{season}/` -> ex: `/ergast/f1/2024/1/pitstops/`

**Note**: To utilize the `season` parameter, it needs to be the first argument after `/ergast/f1/`.

---

### Round (required)

Filters for the round in a specific season that the list of pitstops will be from. Round numbers 1 -> `n` races are valid as well as `last`.

`/{season}/{round}/` -> ex: `/ergast/f1/2024/5/pitstops/`

**Note**: To utilize the `round` parameter it must be combined with a season filter and needs to be the first argument after `/ergast/f1/{season}/`.

---

### Stop Number

Filters for the `n`th stop for each driver in a given race.

`/{season}/{round}/pitstops/{stopNumber}` -> ex: `/ergast/f1/2023/9/pitstops/4/`

**Note**: To utilize the `stopNumber` parameter, it needs to be the last argument at the end of request after `/pitstops/` -> `/ergast/f1/{season}/{round}/pitstops/{stopNumber}`.

---

### drivers

Filters for only for a specific drivers's list of pitstops in a season's round.

`/drivers/{driversId}/` -> ex: `/ergast/f1/2024/1/drivers/hamilton/pitstops/`

---

### laps

Filters for only pitstops that took place in a given lap of a race.

`/laps/{lapNumber}` -> ex: `/ergast/f1/2019/4/laps/12/pitstops`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](/docs/README.md#common-response-fields)

`MRData.RaceTable` : The object containing the pitstops information.

`MRData.RaceTable.season` : The filtered season.

`MRData.RaceTable.round` : The filtered round.

`MRData.RaceTable.url` : The race's wikipedia url.

`MRData.RaceTable.Races` : The list of races.

`MRData.RaceTable.Races[i]` : A given race's object.

`MRData.RaceTable.Races[i].raceName` : The race's name.

`MRData.RaceTable.Races[i].Circuit` : The circuit of the race.

`MRData.RaceTable.Races[i].date` : The date of the race.

`MRData.RaceTable.Races[i].time` : The time of the race.

`MRData.RaceTable.Races[i].Pitstops` : The list of pitstops in a given race.

---

## Pitstops Object Fields:

|Field|Always Included|Description|type
|---|:---:|---|---|
|driverId|✅|Unique ID of the driver|String
|lap|🟡|Lap Identifier|String
|stop|🟡|Stop number for this driver in the race|String
|time|🟡|Time that the stop occurred (HH:mm:ss)|String
|duration|🟡|Duration of the stop, including pit entry, exit and red flag time, if necessary (MM:ss.sss)|String

---

## Examples:

### Get the 4th round of the 2019 season's list of pitstops

`http://api.jolpi.ca/ergast/f1/2019/4/laps/12/pitstops/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2019/4/laps/12/pitstops/",
    "limit": "30",
    "offset": "0",
    "total": "3",
    "RaceTable": {
      "season": "2019",
      "round": "4",
      "lap": "12",
      "Races": [
        {
          "season": "2019",
          "round": "4",
          "url": "http://en.wikipedia.org/wiki/2019_Azerbaijan_Grand_Prix",
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
          "date": "2019-04-28",
          "time": "12:10:00Z",
          "PitStops": [
            {
              "driverId": "bottas",
              "lap": "12",
              "stop": "1",
              "time": "16:35:24",
              "duration": "20.006"
            },
            {
              "driverId": "sainz",
              "lap": "12",
              "stop": "1",
              "time": "16:35:58",
              "duration": "19.755"
            },
            {
              "driverId": "albon",
              "lap": "12",
              "stop": "1",
              "time": "16:36:16",
              "duration": "20.720"
            }
          ]
        }
      ]
    }
  }
}
```

### Get all of Fernando Alonso's pitstops in the 2023 Dutch Grand Prix

`http://api.jolpi.ca/ergast/f1/2023/13/drivers/alonso/pitstops/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2023/13/drivers/alonso/pitstops/",
    "limit": "30",
    "offset": "0",
    "total": "5",
    "RaceTable": {
      "season": "2023",
      "round": "13",
      "driverId": "alonso",
      "Races": [
        {
          "season": "2023",
          "round": "13",
          "url": "https://en.wikipedia.org/wiki/2023_Dutch_Grand_Prix",
          "raceName": "Dutch Grand Prix",
          "Circuit": {
            "circuitId": "zandvoort",
            "url": "http://en.wikipedia.org/wiki/Circuit_Zandvoort",
            "circuitName": "Circuit Park Zandvoort",
            "Location": {
              "lat": "52.3888",
              "long": "4.54092",
              "locality": "Zandvoort",
              "country": "Netherlands"
            }
          },
          "date": "2023-08-27",
          "time": "13:00:00Z",
          "PitStops": [
            {
              "driverId": "alonso",
              "lap": "2",
              "stop": "1",
              "time": "15:06:26",
              "duration": "20.647"
            },
            {
              "driverId": "alonso",
              "lap": "10",
              "stop": "2",
              "time": "15:18:10",
              "duration": "20.109"
            },
            {
              "driverId": "alonso",
              "lap": "48",
              "stop": "3",
              "time": "16:10:51",
              "duration": "25.147"
            },
            {
              "driverId": "alonso",
              "lap": "61",
              "stop": "4",
              "time": "16:27:35",
              "duration": "20.655"
            },
            {
              "driverId": "alonso",
              "lap": "64",
              "stop": "5",
              "time": "16:33:22",
              "duration": "40:55.302"
            }
          ]
        }
      ]
    }
  }
}
```

### Get the 4th stop of all drivers in the 2023 Austrian Grand Prix

`http://api.jolpi.ca/ergast/f1/2023/9/pitstops/4/`

```
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2023/9/pitstops/4/",
    "limit": "30",
    "offset": "0",
    "total": "4",
    "RaceTable": {
      "stop": "4",
      "season": "2023",
      "round": "9",
      "Races": [
        {
          "season": "2023",
          "round": "9",
          "url": "https://en.wikipedia.org/wiki/2023_Austrian_Grand_Prix",
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
          "date": "2023-07-02",
          "time": "13:00:00Z",
          "PitStops": [
            {
              "driverId": "piastri",
              "lap": "41",
              "stop": "4",
              "time": "15:54:36",
              "duration": "22.313"
            },
            {
              "driverId": "tsunoda",
              "lap": "43",
              "stop": "4",
              "time": "15:56:56",
              "duration": "21.392"
            },
            {
              "driverId": "stroll",
              "lap": "54",
              "stop": "4",
              "time": "16:09:28",
              "duration": "21.837"
            },
            {
              "driverId": "max_verstappen",
              "lap": "69",
              "stop": "4",
              "time": "16:25:43",
              "duration": "21.328"
            }
          ]
        }
      ]
    }
  }
}
```