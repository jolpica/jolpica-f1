[← Documentation Home](/docs/README.md)
# Circuits

Gets list of circuits in alphabetical order by circuitId

**URL** : `/ergast/f1/circuits/`

[Available Query Parameters](./README.md#query-parameters)

---

## Route Parameters:

### Season

**Filters only circuits which hosted a race in a given seasons. Year numbers are valid as is `current` to get the current season list of circuits**

`/{season}/` -> ex: `/ergast/f1/2024/circuits/`

**Note**: To utilize the `season` parameter it needs to be the first route after `/ergast/f1/`

---

### Round

**Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as `last` and `next`**

`/{round}/` -> ex: `/ergast/f1/2024/1/circuits/`

**Note**: To utilize the `round` parameter it needs to be used with the `season` filter and be the first route after `/ergast/f1/{season}`

---

### circuits

**Filters for only the circuit that matches the specified circuitId**

`/circuits/{circuitId}/` -> ex: `/ergast/f1/2024/circuits/albert_park/circuits/`

---

### constructors

**Filters for only circuits that the specified constructor has participated in a race at**

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/williams/circuits/`

---

### drivers

**Filters for only circuits that the specified driver has participated in a race at**

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/hamilton/circuits/`


---

### fastest

**Filters for only circuits that have had a race with a lap that was the ranked in the specified position**

`/fastest/{lapRank}/` -> ex: `/ergast/f1/fastest/24/circuits/`


---

### grid

**Filters for only circuits that have had a race with a specific grid position**

`/grid/{gridPosition}/` -> ex: `/ergast/f1/grid/29/circuits/`

---

### results

**Filters for only circuits that have had a race where a specific finishing position was valid**

`/results/{finishPosition}/` -> ex: `/ergast/f1/results/1/circuits/`

---

### status

**Filters for only circuits that have had a race where a driver finished with a specific statusId**

`/status/{statusId}/` -> ex: `/ergast/f1/status/2/drivers/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](docs/README.md#common-response-fields)

`MRData.CircuitTable` : The object containing the list of the all drivers.

`MRData.CircuitTable.Circuits` : The list of all drivers returned.

`MRData.CircuitTable.Circuits[i]` : A given driver object

---

## Circuits Object Fields:

|Field|Always Included|
|---|:---:|
|circuitId| ✅ |
|url|✅|
|circuitName|✅|
|Location|✅|

---

## Examples:

### Get list of all drivers in F1 history

`https://api.jolpi.ca/ergast/f1/drivers/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/circuits/",
    "limit": "30",
    "offset": "0",
    "total": "77",
    "CircuitTable": {
      "Circuits": [
        {
          "circuitId": "adelaide",
          "url": "http://en.wikipedia.org/wiki/Adelaide_Street_Circuit",
          "circuitName": "Adelaide Street Circuit",
          "Location": {
            "lat": "-34.9272",
            "long": "138.617",
            "locality": "Adelaide",
            "country": "Australia"
          }
        },
        {
          "circuitId": "ain-diab",
          "url": "http://en.wikipedia.org/wiki/Ain-Diab_Circuit",
          "circuitName": "Ain Diab",
          "Location": {
            "lat": "33.5786",
            "long": "-7.6875",
            "locality": "Casablanca",
            "country": "Morocco"
          }
        },
        {
          "circuitId": "aintree",
          "url": "http://en.wikipedia.org/wiki/Aintree_Motor_Racing_Circuit",
          "circuitName": "Aintree",
          "Location": {
            "lat": "53.4769",
            "long": "-2.94056",
            "locality": "Liverpool",
            "country": "UK"
          }
        },
        ...more
      ]
    }
  }
}
```

### Get all circuits which have had a race with 29 driver results.

`https://api.jolpi.ca/ergast/f1/results/29/circuits/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/results/29/circuits/",
    "limit": "30",
    "offset": "0",
    "total": "1",
    "CircuitTable": {
      "position": "29",
      "Circuits": [
        {
          "circuitId": "indianapolis",
          "url": "http://en.wikipedia.org/wiki/Indianapolis_Motor_Speedway",
          "circuitName": "Indianapolis Motor Speedway",
          "Location": {
            "lat": "39.795",
            "long": "-86.2347",
            "locality": "Indianapolis",
            "country": "USA"
          }
        }
      ]
    }
  }
}
```