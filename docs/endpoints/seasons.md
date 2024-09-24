[← Documentation Home](/docs/README.md)
# Seasons

Gets list of seasons from earliest to latest.

**URL** : `/ergast/f1/seasons/`

[Available Query Parameters](docs/README.md#query-parameters)

---

## Route Parameters:

### Season

**Filters for a specified season. Year numbers are valid as is `current` to get the current season**

`/{season}/` -> ex: `/ergast/f1/2024/seasons/`

**Note**: To utilize the `season` parameter it needs to be the first route after `/ergast/f1/`

---

### circuits

**Filters for only seasons featuring a specified circuit**

`/circuits/{circuitId}/` -> ex: `/ergast/f1/circuits/monza/seasons/`

---

### constructors

**Filters for only seasons featuring a specified constructor**

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/williams/seasons/`

---

### drivers

**Filters for only seasons featuring a specified driver**

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/hamilton/seasons/`


---

### grid

**Filters for only seasons featuring a specified grid position**

`/grid/{gridPosition}/` -> ex: `/ergast/f1/grid/27/seasons/`

---

### status

**Filters for only seasons featuring a specified finishing status of a driver in at least one race that season**

`/status/{statusId}/` -> ex: `/ergast/f1/status/2/seasons/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.SeasonTable` : The object containing the list of the all seasons returned.

`MRData.SeasonTable.Seasons` : The list of all seasons returned.

`MRData.SeasonTable.Seasons[i]` : A given season object

---

## Season Object Fields:

|Field|Always Included|
|---|:---:|
|season|✅|
|url|✅|

---

## Examples:

### Get list of seasons in F1 history

`https://api.jolpi.ca/ergast/f1/seasons/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/seasons/",
    "limit": "30",
    "offset": "0",
    "total": "75",
    "SeasonTable": {
      "Seasons": [
        {
          "season": "1950",
          "url": "http://en.wikipedia.org/wiki/1950_Formula_One_season"
        },
        {
          "season": "1951",
          "url": "http://en.wikipedia.org/wiki/1951_Formula_One_season"
        },
        {
          "season": "1952",
          "url": "http://en.wikipedia.org/wiki/1952_Formula_One_season"
        },
        ...more
      ]
    }
  }
}
```

### Get all seasons featuring a specific constructor (Alfa)

`https://api.jolpi.ca/ergast/f1/constructors/alfa/seasons/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/constructors/alfa/seasons/",
    "limit": "30",
    "offset": "0",
    "total": "16",
    "SeasonTable": {
      "constructorId": "alfa",
      "Seasons": [
        {
          "season": "1950",
          "url": "http://en.wikipedia.org/wiki/1950_Formula_One_season"
        },
        {
          "season": "1951",
          "url": "http://en.wikipedia.org/wiki/1951_Formula_One_season"
        },
        {
          "season": "1963",
          "url": "http://en.wikipedia.org/wiki/1963_Formula_One_season"
        },
        {
          "season": "1965",
          "url": "http://en.wikipedia.org/wiki/1965_Formula_One_season"
        },
        ...more
      ]
    }
  }
}
```