[← Documentation Home](/docs/README.md)
# Drivers

Gets list of drivers in alphabetical order by driverId

**URL** : `/ergast/f1/drivers/`

[Available Query Parameters](/docs/README.md#query-parameters)

---

## Route Parameters:

### Season

**Filters only drivers that participated in a specified season. Year numbers are valid as is `current` to get the current season list of drivers**

`/{season}/` -> ex: `/ergast/f1/2024/drivers/`

**Note**: To utilize the `season` parameter it needs to be the first route after `/ergast/f1/`

---

### Round

**Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as `last`**

`/{round}/` -> ex: `/ergast/f1/2024/1/drivers/`

**Note**: To utilize the `round` parameter it needs to be used with the `season` filter and be the first route after `/ergast/f1/{season}`

---

### circuits

**Filters for only drivers who have participated in a race at a given circuit**

`/circuits/{circuitId}/` -> ex: `/ergast/f1/2024/circuits/albert_park/drivers/`

---

### constructors

**Filters for only drivers who have raced for a specified constructor**

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/williams/drivers/`

---

### drivers

**Filters for only drivers that match the specific driverId**

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/hamilton/`


---

### fastest

**Filters for only drivers that finished a race with a lap that was the ranked in the specified position**

`/fastest/{lapRank}/` -> ex: `/ergast/f1/fastest/1/drivers/`


---

### grid

**Filters for only drivers who has started a race in a specific grid position**

`/grid/{gridPosition}/` -> ex: `/ergast/f1/grid/1/drivers/`

---

### results

**Filters for only drivers who has finished a race in a specific position**

`/results/{finishPosition}/` -> ex: `/ergast/f1/results/1/drivers/`

---

### status

**Filters for only drivers who have finished a race with a specific statusId**

`/status/{statusId}/` -> ex: `/ergast/f1/status/2/drivers/`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.DriverTable` : The object containing the list of the all drivers.

`MRData.DriverTable.Drivers` : The list of all drivers returned.

`MRData.DriverTable.Drivers[i]` : A given driver object

---

## Driver Object Fields:

|Field|Always Included|Description|type
|---|:---:|---|---|
|driverId|✅|Unique ID of the Driver|String
|permanentNumber|🟡|Permanent Number assigned to the driver|String
|code|🟡|Driver Code, usually 3 characters|String
|url|✅|Wikipedia URL to the Drivers profile|String
|givenName|✅|First name|String
|familyName|✅|Last name|String
|dateOfBirth|✅|Date of Birth (YYYY-MM-DD format)|String
|nationality|✅|Nationality of Driver|String

---

## Examples:

### Get list of all drivers in F1 history

`https://api.jolpi.ca/ergast/f1/drivers/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/drivers/",
    "limit": "30",
    "offset": "0",
    "total": "860",
    "DriverTable": {
      "Drivers": [
        {
          "driverId": "abate",
          "url": "http://en.wikipedia.org/wiki/Carlo_Mario_Abate",
          "givenName": "Carlo",
          "familyName": "Abate",
          "dateOfBirth": "1932-07-10",
          "nationality": "Italian"
        },
        {
          "driverId": "abecassis",
          "url": "http://en.wikipedia.org/wiki/George_Abecassis",
          "givenName": "George",
          "familyName": "Abecassis",
          "dateOfBirth": "1913-03-21",
          "nationality": "British"
        },
        ...more
      ]
    }
  }
}
```

### Get all drivers who participated in the 2024 race at Albert Park

* Note this is missing Logan Sargent as he did not start the race even though he participated in the weekend.

`https://api.jolpi.ca/ergast/f1/2024/circuits/albert_park/drivers/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2024/circuits/albert_park/drivers/",
    "limit": "30",
    "offset": "0",
    "total": "19",
    "DriverTable": {
      "season": "2024",
      "circuitId": "albert_park",
      "Drivers": [
        {
          "driverId": "albon",
          "permanentNumber": "23",
          "code": "ALB",
          "url": "http://en.wikipedia.org/wiki/Alexander_Albon",
          "givenName": "Alexander",
          "familyName": "Albon",
          "dateOfBirth": "1996-03-23",
          "nationality": "Thai"
        },
        {
          "driverId": "alonso",
          "permanentNumber": "14",
          "code": "ALO",
          "url": "http://en.wikipedia.org/wiki/Fernando_Alonso",
          "givenName": "Fernando",
          "familyName": "Alonso",
          "dateOfBirth": "1981-07-29",
          "nationality": "Spanish"
        },
        ...more
      ]
    }
  }
}
```