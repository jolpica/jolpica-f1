[← Documentation Home](/docs/README.md)
# Pitstops Standings

Gets a given races list of pitstops in from earliest to latest `time` in which the pitstop occurred.

**Note**: Data starts for the 2011 season.

**URL** : `/ergast/f1/{season}/{ROUND}/pitstops/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters:

### Season \*\*REQUIRED\*\*

**Filters for the season that the list of pitstops will be from. Year numbers are valid as is `current` to get the pitstops of a given round in the current season**

`/{season}/` -> ex: `/ergast/f1/2024/1/pitstops/`

**Note**: To utilize the `season` parameter it needs to be the first route after `/ergast/f1/`

---

### Round \*\*REQUIRED\*\*

**Filters for the round in a specific season that the list of pitstops will be from. Round numbers 1 -> n races are valid as well as `last`**

`/{season}/{round}/` -> ex: `/ergast/f1/2024/5/pitstops/`

**Note**: To utilize the `round` parameter it must be combined with a season filter and needs to be the first route after `/ergast/f1/{season}/`

---

### drivers

**Filters for only for a specific drivers's list of pitstops in a seasons round**

`/drivers/{driversId}/` -> ex: `/ergast/f1/2024/1/drivers/hamilton/pitstops/`

---

### laps

**Filters for only pitstops that took place in a given lap of a race**

`/laps/{lapNumber}` -> ex: `/ergast/f1/2019/4/laps/12/pitstops`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.RaceTable` : The object containing the pitstops information.

`MRData.RaceTable.season` : The filtered season.

`MRData.RaceTable.round` : The filtered round.

`MRData.RaceTable.url` : The race's wikipedia url.

`MRData.RaceTable.raceName` : The race's name.

`MRData.RaceTable.Circuit` : The circuit of the race.

`MRData.RaceTable.date` : The date of the race.

`MRData.RaceTable.time` : The time of the race.

`MRData.RaceTable.Races` : The list of races.

`MRData.RaceTable.Races[i]` : A given race's object.

`MRData.RaceTable.Races[i].Pitstops` : The list of pitstops in a given race.

---

## Pitstops Object Fields:

|Field|Always Included|
|---|:---:|
|driverId| ✅ |
|lap|🟡|
|stop|🟡|
|time|🟡|
|duration|🟡|

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

`http://api.jolpi.ca/ergast/f1/2023/13/drivers/alonso/pitstops//`

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