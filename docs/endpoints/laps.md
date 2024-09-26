[← Documentation Home](/docs/README.md)
# Laps

Returns a list of data for laps from a given race.

**Note**: Data starts from the 1996 season.

**URL** : `/ergast/f1/{season}/{round}/laps/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters

### Season (required)

Filters for the season that the list of laps will be from. Year numbers are valid as is `current` to get the laps of a given round in the current season.

`/{season}/` -> ex: `/ergast/f1/2024/1/laps/`

**Note**: To utilize the `season` parameter, it needs to be the first argument after `/ergast/f1/`.

---

### Round (required)

Filters for the round in a specific season that the list of laps will be from. Round numbers 1 -> `n` races are valid as well as `last`.

`/{season}/{round}/` -> ex: `/ergast/f1/2024/5/laps/`

**Note**: To utilize the `round` parameter it must be combined with a season filter and needs to be the first argument after `/ergast/f1/{season}/`.

---

### Lap Number

Filters for the `n`th lap for each driver in a given race.

`/{season}/{round}/laps/{lapNumber}` -> ex: `/ergast/f1/2019/2/laps/4/`

**Note**: To utilize the `lapNumber` parameter, it needs to be the last argument at the end of request after `/laps/` -> `/ergast/f1/{season}/{round}/laps/{lapNumber}`.

---

### drivers

Filters for only for a specific drivers's list of laps in a specific race.

`/drivers/{driversId}/` -> ex: `/ergast/f1/2024/9/drivers/max_verstappen/laps/`

---

### constructors

Filters for the lap data for the drivers of a specific constructor in a given race.

`/constructors/{constructorId}` -> ex: `/ergast/f1/2021/11/constructors/alfa/laps/`

---

### laps

Filters for the lap data for a specific lap in a race. This functions the same as specifying the lap at the end of the request, however will be superceded if there is a specified lap the end of the request

`/laps/{lapNumber}` -> ex: `/ergast/f1/2019/4/laps/12/laps/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.RaceTable` : The object containing the lap information.

`MRData.RaceTable.season` : The filtered season.

`MRData.RaceTable.round` : The filtered round.

`MRData.RaceTable.url` : The race's wikipedia url.

`MRData.RaceTable.Races` : The list of races.

`MRData.RaceTable.Races[i]` : A given race's object.

`MRData.RaceTable.Races[i].raceName` : The race's name.

`MRData.RaceTable.Races[i].Circuit` : The circuit of the race.

`MRData.RaceTable.Races[i].date` : The date of the race.

`MRData.RaceTable.Races[i].time` : The time of the race.

`MRData.RaceTable.Races[i].laps/` : The list of laps in a given race.

---

## Laps Object Fields:

|Field|Always Included|Description|type
|---|:---:|---|---|
|number|✅|Lap Number|String
|Timings|✅|The list of Lap data objects|String
|Timings[`i`]|✅|Timing Object (driverId, position, time)|Object

---

## Examples:

### Get the laps from the 1997 Hungarian Grand Prix (11th round)

`http://api.jolpi.ca/ergast/f1/1997/11/laps/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/1997/11/laps/",
    "limit": "30",
    "offset": "0",
    "total": "1297",
    "RaceTable": {
      "season": "1997",
      "round": "11",
      "Races": [
        {
          "season": "1997",
          "round": "11",
          "url": "http://en.wikipedia.org/wiki/1997_Hungarian_Grand_Prix",
          "raceName": "Hungarian Grand Prix",
          "Circuit": {
            "circuitId": "hungaroring",
            "url": "http://en.wikipedia.org/wiki/Hungaroring",
            "circuitName": "Hungaroring",
            "Location": {
              "lat": "47.5789",
              "long": "19.2486",
              "locality": "Budapest",
              "country": "Hungary"
            }
          },
          "date": "1997-08-10",
          "Laps": [
            {
              "number": "1",
              "Timings": [
                {
                  "driverId": "michael_schumacher",
                  "position": "1",
                  "time": "1:24.350"
                },
                {
                  "driverId": "damon_hill",
                  "position": "2",
                  "time": "1:26.068"
                },
                {
                  "driverId": "irvine",
                  "position": "3",
                  "time": "1:27.457"
                },
                ...more drivers first lap
              ]
            },
            ...more laps
          ]
        }
      ]
    }
  }
}
```

### Get all of Max Verstappen's laps in the 2021 Abu Dhabi Grand Prix

`http://api.jolpi.ca/ergast/f1/2021/22/drivers/max_verstappen/laps/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2021/22/drivers/max_verstappen/laps/",
    "limit": "30",
    "offset": "0",
    "total": "58",
    "RaceTable": {
      "season": "2021",
      "round": "22",
      "driverId": "max_verstappen",
      "Races": [
        {
          "season": "2021",
          "round": "22",
          "url": "http://en.wikipedia.org/wiki/2021_Abu_Dhabi_Grand_Prix",
          "raceName": "Abu Dhabi Grand Prix",
          "Circuit": {
            "circuitId": "yas_marina",
            "url": "http://en.wikipedia.org/wiki/Yas_Marina_Circuit",
            "circuitName": "Yas Marina Circuit",
            "Location": {
              "lat": "24.4672",
              "long": "54.6031",
              "locality": "Abu Dhabi",
              "country": "UAE"
            }
          },
          "date": "2021-12-12",
          "time": "13:00:00Z",
          "Laps": [
            {
              "number": "1",
              "Timings": [
                {
                  "driverId": "max_verstappen",
                  "position": "2",
                  "time": "1:32.800"
                }
              ]
            },
            {
              "number": "2",
              "Timings": [
                {
                  "driverId": "max_verstappen",
                  "position": "2",
                  "time": "1:29.103"
                }
              ]
            },
            {
              "number": "3",
              "Timings": [
                {
                  "driverId": "max_verstappen",
                  "position": "2",
                  "time": "1:28.827"
                }
              ]
            },
            {
              "number": "4",
              "Timings": [
                {
                  "driverId": "max_verstappen",
                  "position": "2",
                  "time": "1:29.026"
                }
              ]
            },
            ...more
          ]
        }
      ]
    }
  }
}
```