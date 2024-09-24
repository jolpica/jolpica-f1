[← Documentation Home](/docs/README.md)
# Constructors

Gets list of constructors alphabetically by constructorId

**URL** : `/ergast/f1/constructors/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters:

### Season

**Filters only constructors that participated in a specified season. Year numbers are valid as is `current` to get the current season list of constructors**

`/{season}/` -> ex: `/ergast/f1/2024/constructors/`

**Note**: To utilize the `season` parameter it needs to be the first route after `/ergast/f1/`

---

### Round

**Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as `last`**

`/{round}/` -> ex: `/ergast/f1/2024/1/constructors/`

**Note**: To utilize the `round` parameter it needs to be used with the `season` filter and be the first route after `/ergast/f1/{season}/`

---

### circuits

**Filters for only constructors who have participated in a race at a given circuit**

`/circuits/{circuitId}/` -> ex: `/ergast/f1/circuits/bahrain/constructors/`

---

### constructors

**Filters for only a specified constructor**

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/williams/`

---

### drivers

**Filters for only constructors that had a driver race for them**

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/hamilton/constructors/`


---

### fastest

**Filters for only constructors that finished a race with a lap that was the ranked in the specified position**

`/fastest/{lapRank}/` -> ex: `/ergast/f1/fastest/1/constructors/`


---

### grid

**Filters for only constructors which had a driver racing for them start a race in a specific grid position**

`/grid/{gridPosition}/` -> ex: `/ergast/f1/grid/1/constructors/`

---

### results

**Filters for only constructors which had a driver racing for them finish a race in a specific position**

`/results/{finishPosition}/` -> ex: `/ergast/f1/results/1/constructors/`

---

### status

**Filters for only constructors who had a driver finish a race with a specific statusId**

`/status/{statusId}/` -> ex: `/ergast/f1/status/2/constructors/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.ConstructorTable` : The object containing the list of the all constructors.

`MRData.ConstructorTable.Constructors` : The list of all constructors returned.

`MRData.ConstructorTable.Constructors[i]` : A given constructor object

---

## Constructor Object Fields:

|Field|Always Included|
|---|:---:|
|constructorId| 🟡 |
|url|🟡|
|name|✅|
|nationality|🟡|

---

## Examples:

### Get list of all constructors in F1 history

`https://api.jolpi.ca/ergast/f1/constructors/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/constructors/",
    "limit": "30",
    "offset": "0",
    "total": "212",
    "ConstructorTable": {
      "Constructors": [
        {
          "constructorId": "adams",
          "url": "http://en.wikipedia.org/wiki/Adams_(constructor)",
          "name": "Adams",
          "nationality": "American"
        },
        {
          "constructorId": "afm",
          "url": "http://en.wikipedia.org/wiki/Alex_von_Falkenhausen_Motorenbau",
          "name": "AFM",
          "nationality": "German"
        },
        ...more
      ]
    }
  }
}
```

### Get all constructors who had a driver who won a race

`https://api.jolpi.ca/ergast/f1/results/1/constructors/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/results/1/constructors/",
    "limit": "30",
    "offset": "0",
    "total": "47",
    "ConstructorTable": {
      "position": "1",
      "Constructors": [
        {
          "constructorId": "alfa",
          "url": "http://en.wikipedia.org/wiki/Alfa_Romeo_in_Formula_One",
          "name": "Alfa Romeo",
          "nationality": "Swiss"
        },
        {
          "constructorId": "alphatauri",
          "url": "http://en.wikipedia.org/wiki/Scuderia_AlphaTauri",
          "name": "AlphaTauri",
          "nationality": "Italian"
        },
        ...more
      ]
    }
  }
}
```