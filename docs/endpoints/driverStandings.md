[← Documentation Home](/docs/README.md)
# Driver Standings

Gets a season's drivers standings from first to last place. 

**URL** : `/ergast/f1/{season}/driverstandings/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters:

### Season \*\*REQUIRED\*\*

**Filters for the drivers standing of a specified season. Year numbers are valid as is `current` to get the current seasons drivers standings**

`/{season}/` -> ex: `/ergast/f1/2024/driverstandings/`

**Note**: To utilize the `season` parameter it needs to be the first route after `/ergast/f1/`

---

### Round

**Filters for the drivers standings after a specified round in a specific season. Round numbers 1 -> n races are valid as well as `last`**

`/{season}/{round}/` -> ex: `/ergast/f1/2024/5/driverstandings/`

**Note**: To utilize the `round` parameter it must be combined with a season filter and needs to be the first route after `/ergast/f1/{season}/`

---

### drivers

**Filters for only a specific driver's drivers standing information for a given year**

`/drivers/{driverId}/` -> ex: `/ergast/f1/2024/drivers/hamilton/driverstandings/`

---

### position

**Filters for only the driver in a given position for a given year**

`/{finishPosition}` -> ex: `/ergast/f1/2024/driverstandings/1/`

**Note**: The position must be at the end after any filters and after `/driverstandings/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.StandingsTable` : The object containing the season's drivers standing information.

`MRData.StandingsTable.season` : The filtered season.

`MRData.StandingsTable.round` : The round that the season the standings represent.

`MRData.StandingsTable.StandingsLists` : The list of drivers standings.

`MRData.StandingsTable.StandingsLists[i]` : A given drivers standings list object.

`MRData.StandingsTable.StandingsLists[i].DriverStandings` : The list of drivers standings objects.

---

## Drivers Standing Object Fields:

|Field|Always Included|Description|type
|---|:---:|---|---|
|position|🟡|Position in the Championship|String
|positonText|✅|Description of position `*`|String
|points|✅|Total points in the Championship|String
|wins|✅|Count of race wins|String
|Driver|✅|Driver information (driverId, url, givenName, familyName, dateOfBirth, nationality)|Object
|Constructors|✅|List of all constructors the driver drove for in the given season|Array

`*` - Possible values for positionText include: `E` Excluded, `D` Disqualified (1997 Schumacher), `-` for ineligible or the position as a string otherwise.  

---

## Examples:

### Get the 1972 season's drivers standing information

`https://api.jolpi.ca/ergast/f1/1972/driverstandings/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/1972/driverstandings/",
    "limit": "30",
    "offset": "0",
    "total": "42",
    "StandingsTable": {
      "season": "1972",
      "round": "12",
      "StandingsLists": [
        {
          "season": "1972",
          "round": "12",
          "DriverStandings": [
            {
              "position": "1",
              "positionText": "1",
              "points": "61",
              "wins": "5",
              "Driver": {
                "driverId": "emerson_fittipaldi",
                "url": "http://en.wikipedia.org/wiki/Emerson_Fittipaldi",
                "givenName": "Emerson",
                "familyName": "Fittipaldi",
                "dateOfBirth": "1946-12-12",
                "nationality": "Brazilian"
              },
              "Constructors": [
                {
                  "constructorId": "team_lotus",
                  "url": "http://en.wikipedia.org/wiki/Team_Lotus",
                  "name": "Team Lotus",
                  "nationality": "British"
                }
              ]
            },
            {
              "position": "2",
              "positionText": "2",
              "points": "45",
              "wins": "4",
              "Driver": {
                "driverId": "stewart",
                "url": "http://en.wikipedia.org/wiki/Jackie_Stewart",
                "givenName": "Jackie",
                "familyName": "Stewart",
                "dateOfBirth": "1939-06-11",
                "nationality": "British"
              },
              "Constructors": [
                {
                  "constructorId": "tyrrell",
                  "url": "http://en.wikipedia.org/wiki/Tyrrell_Racing",
                  "name": "Tyrrell",
                  "nationality": "British"
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

### Get Pierre Gasly's 2020 drivers standing information

`http://api.jolpi.ca/ergast/f1/2020/drivers/gasly/driverstandings/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2020/drivers/gasly/driverstandings/",
    "limit": "30",
    "offset": "0",
    "total": "1",
    "StandingsTable": {
      "season": "2020",
      "driverId": "gasly",
      "round": "17",
      "StandingsLists": [
        {
          "season": "2020",
          "round": "17",
          "DriverStandings": [
            {
              "position": "10",
              "positionText": "10",
              "points": "75",
              "wins": "1",
              "Driver": {
                "driverId": "gasly",
                "permanentNumber": "10",
                "code": "GAS",
                "url": "http://en.wikipedia.org/wiki/Pierre_Gasly",
                "givenName": "Pierre",
                "familyName": "Gasly",
                "dateOfBirth": "1996-02-07",
                "nationality": "French"
              },
              "Constructors": [
                {
                  "constructorId": "alphatauri",
                  "url": "http://en.wikipedia.org/wiki/Scuderia_AlphaTauri",
                  "name": "AlphaTauri",
                  "nationality": "Italian"
                }
              ]
            }
          ]
        }
      ]
    }
  }
}
```