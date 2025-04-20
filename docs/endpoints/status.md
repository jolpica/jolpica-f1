[← Documentation Home](/docs/README.md)
# Status

Returns a list of finishing statuses and their counts across races matching the filters.

## Changes to Returned Data

In the future data returned by this endpoint, and the status field returned by other endpoints may be changed.

Seasons prior to 2024 may have their corresponding status ids changed to match our updated enumeration of possible statuses ([see here](https://github.com/jolpica/jolpica-f1/blob/71f12b1c9637aa838926abcb6f4840fbfac4d87c/jolpica/formula_one/models/session.py#L64-L71)). So it is not recommended to rely on statusId values other than: 1 (Finished), 2 (Disqualified), 3 (Accident), 31 (Retired), 143 (Lapped).

Please note statusId 3, is currently not implemented for newer seasons, so some statuses that currently return 31 (Retired), may be updated to 3 (Accident) in the future.

**URL** : `/ergast/f1/status/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters

### Season

Filters only statuses from races within a specified season. Year numbers are valid as is `current`.

`/{season}/` -> ex: `/ergast/f1/2023/status/`

**Note**: To utilize the `season` parameter, it needs to be the first argument after `/ergast/f1/`.

---

### Round

Filters only statuses from a specified round of a specific season. Round numbers 1 -> `n` races are valid as well as `last`.

`/{round}/` -> ex: `/ergast/f1/2023/10/status/`

**Note**: To utilize the `round` parameter it needs to be used with the `season` filter and be the first argument after `/ergast/f1/{season}/`.

---

### Circuits

Filters for only statuses from races held at a given circuit.

`/circuits/{circuitId}/` -> ex: `/ergast/f1/circuits/monza/status/`

---

### Constructors

Filters for only statuses achieved by drivers driving for a specified constructor.

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/ferrari/status/`

---

### Drivers

Filters for only statuses achieved by a specified driver.

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/alonso/status/`

---

### Grid

Filters for only statuses from drivers who started a race in a specific grid position.

`/grid/{gridPosition}/` -> ex: `/ergast/f1/grid/1/status/`

---

### Results

Filters for only statuses from drivers who finished a race in a specific position.

`/results/{finishPosition}/` -> ex: `/ergast/f1/results/1/status/`

---

### Fastest

Filters for only statuses from drivers who achieved a specific fastest lap rank in a race.

`/fastest/{lapRank}/` -> ex: `/ergast/f1/fastest/1/status/`

---

### status

Filters for only a specific status ID.

`/status/{statusId}/` -> ex: `/ergast/f1/status/1/`

**DISCLAIMER**: Seasons prior to 2024 may have their corresponding status ids changed to match our updated enumeration of possible statuses ([see here](https://github.com/jolpica/jolpica-f1/blob/71f12b1c9637aa838926abcb6f4840fbfac4d87c/jolpica/formula_one/models/session.py#L64-L71)). So it is not recommended to rely on `statusId` values other than: 1 (Finished), 2 (Disqualified), 3 (Accident), 31 (Retired), 143 (Lapped).

Please note `statusId` 3, is currently not implemented for newer seasons, so some statuses that currently return 31 (Retired), may be updated to 3 (Accident) in the future.

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](/docs/README.md#common-response-fields)

`MRData.StatusTable` : The object containing the list of statuses.

`MRData.StatusTable.Status` : The list of all statuses returned, ordered by count descending.

`MRData.StatusTable.Status[i]` : A given status object.

---

## Status Object Fields:

|Field|Always Included|Description|type|
|---|:---:|---|---|
|statusId|✅|Unique ID of the status|String
|count|✅|Number of times this status occurred within the filtered races|String
|status|✅|Description of the status|String

---

## Examples:

### Get list of all statuses in F1 history

`https://api.jolpi.ca/ergast/f1/status/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/status/",
    "limit": "30",
    "offset": "0",
    "total": "138",
    "StatusTable": {
      "Status": [
        {
          "statusId": "1",
          "count": "14785",
          "status": "Finished"
        },
        {
          "statusId": "11",
          "count": "2986",
          "status": "+1 Lap"
        },
        {
          "statusId": "12",
          "count": "1409",
          "status": "+2 Laps"
        },
        {
            "statusId": "5",
            "count": "977",
            "status": "Engine"
        },
        ...more
      ]
    }
  }
}
```

### Get all statuses achieved by Ferrari in the 2024 season

`https://api.jolpi.ca/ergast/f1/2024/constructors/ferrari/status/`

```json
{
    "MRData": {
        "xmlns": "",
        "series": "f1",
        "url": "http://api.jolpi.ca/ergast/f1/2024/constructors/ferrari/status/",
        "limit": "30",
        "offset": "0",
        "total": "3",
        "StatusTable": {
            "season": "2024",
            "constructorId": "ferrari",
            "Status": [
                {
                    "statusId": "1",
                    "count": "44",
                    "status": "Finished"
                },
                {
                    "statusId": "31",
                    "count": "3",
                    "status": "Retired"
                },
                {
                    "statusId": "143",
                    "count": "1",
                    "status": "Lapped"
                }
            ]
        }
    }
}
```