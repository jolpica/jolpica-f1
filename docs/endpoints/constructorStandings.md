[← Documentation Home](/docs/README.md)
# Constructor Standings

Gets a season's constructors standings from first to last place.

**URL** : `/ergast/f1/{season}/constructorstandings/`

[Available Query Parameters](./README.md#query-parameters)

---

## Route Parameters:

### Season \*\*REQUIRED\*\*

**Filters for the constructors standing of a specified season. Year numbers are valid as is `current` to get the current seasons constructors standings**

`/{season}/` -> ex: `/ergast/f1/2024/constructorstandings/`

**Note**: To utilize the `season` parameter it needs to be the first route after `/ergast/f1/`

---

### Round

**Filters for the constructors standings after a specified round in a specific season. Round numbers 1 -> n races are valid as well as `last`**

`/{season}/{round}/` -> ex: `/ergast/f1/2024/5/constructorstandings/`

**Note**: To utilize the `round` parameter it must be combined with a season filter and needs to be the first route after `/ergast/f1/{season}/`

---

### constructors

**Filters for only for a specific constructors's constructors standing information for a given year**

`/constructors/{constructorsId}/` -> ex: `/ergast/f1/2024/constructors/ferrari/constructorstandings/`

---

### position

**Filters for only the constructor in a given position in a given year**

`/{finishPosition}` -> ex: `/ergast/f1/2024/constructorstandings/1/`

**Note**: The position must be at the end after any filters and after `/constructorstandings/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.StandingsTable` : The object containing the season's constructors standing information.

`MRData.StandingsTable.season` : The filtered season.

`MRData.StandingsTable.round` : The round that the season the standings represent.

`MRData.StandingsTable.StandingsLists` : The list of constructors standings.

`MRData.StandingsTable.StandingsLists[i]` : A given constructors standings list object.

`MRData.StandingsTable.StandingsLists[i].ConstructorStandings` : The list of constructors standings objects.

---

## Constrcutors Standing Object Fields:

|Field|Required|
|---|:---:|
|position| 🟡 |
|positonText|✅|
|points|✅|
|wins|✅|
|Constructor|✅|
Possible values for positionText include: `E` Excluded (2007 McLaren), `D` Disqualified, `-` for ineligible or the position as a string otherwise.  

---

## Examples:

### Get the 2007 season's constructors standing information

`https://api.jolpi.ca/ergast/f1/2007/constructorstandings/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2007/constructorstandings/",
    "limit": "30",
    "offset": "0",
    "total": "11",
    "StandingsTable": {
      "season": "2007",
      "round": "17",
      "StandingsLists": [
        {
          "season": "2007",
          "round": "17",
          "ConstructorStandings": [
            {
              "position": "1",
              "positionText": "1",
              "points": "204",
              "wins": "9",
              "Constructor": {
                "constructorId": "ferrari",
                "url": "http://en.wikipedia.org/wiki/Scuderia_Ferrari",
                "name": "Ferrari",
                "nationality": "Italian"
              }
            },
            {
              "position": "2",
              "positionText": "2",
              "points": "101",
              "wins": "0",
              "Constructor": {
                "constructorId": "bmw_sauber",
                "url": "http://en.wikipedia.org/wiki/BMW_Sauber",
                "name": "BMW Sauber",
                "nationality": "German"
              }
            },
            ...more,
            {
              "positionText": "E",
              "points": "0",
              "wins": "8",
              "Constructor": {
                "constructorId": "mclaren",
                "url": "http://en.wikipedia.org/wiki/McLaren",
                "name": "McLaren",
                "nationality": "British"
              }
            }
          ]
        }
      ]
    }
  }
}
```

### Get the 2020 constructors standing after the 9th round

`http://api.jolpi.ca/ergast/f1/2020/9/constructorstandings/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2020/9/constructorstandings/",
    "limit": "30",
    "offset": "0",
    "total": "10",
    "StandingsTable": {
      "season": "2020",
      "round": "9",
      "StandingsLists": [
        {
          "season": "2020",
          "round": "9",
          "ConstructorStandings": [
            {
              "position": "1",
              "positionText": "1",
              "points": "325",
              "wins": "7",
              "Constructor": {
                "constructorId": "mercedes",
                "url": "http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One",
                "name": "Mercedes",
                "nationality": "German"
              }
            },
            {
              "position": "2",
              "positionText": "2",
              "points": "173",
              "wins": "1",
              "Constructor": {
                "constructorId": "red_bull",
                "url": "http://en.wikipedia.org/wiki/Red_Bull_Racing",
                "name": "Red Bull",
                "nationality": "Austrian"
              }
            },
            ...more
          ]
        }
      ]
    }
  }
}
```