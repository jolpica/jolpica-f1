# Races

Gets list of races 

**URL** : `/ergast/f1/races`

[Available Query Parameters](./README.md#query-parameters)

---

## Route Parameters:

### Season

**Filters for races only from a specified season. Year numbers are valid as is 'current' to get the current season**

`/{season}/` -> ex: `/ergast/f1/2024/races`

**Note**: To utilize the `season` parameter it needs to be the first route after `/ergast/f1/`

---

### Circuit

**Filters for only races featuring a specified circuit**

`/circuits/{circuitId}/` -> ex: `/ergast/f1/circuits/monza/races`

---

### Constructor

**Filters for only races featuring a specified constructor**

`/constructors/{constructorId}/` -> ex: `/ergast/f1/constructors/williams/races`

---

### Driver

**Filters for only races featuring a specified driver**

`/drivers/{driverId}/` -> ex: `/ergast/f1/drivers/hamilton/races`


---

### Grid

**Filters for only races featuring a specified grid position**

`/grid/{gridPosition}/` -> ex: `/ergast/f1/grid/27/races`

---

### Status

**Filters for only races featuring a specified finishing status of a driver**

`/status/{statusId}/` -> ex: `/ergast/f1/status/2/races`

---

## Success Response

**Code** : `200 OK`

**Response Fields** :

[Common Response Fields](./README.md#common-response-fields)

`MRData.RaceTable` : The object containing the list of the all races.

`MRData.RaceTable.Races` : The list of all races returned.

`MRData.RaceTable.Races[i]` : A given race object

---

## Race Object Fields:

|Field|Required|
|---|:---:|
|season| ✅ |
|round|✅|
|url|✅|
|raceName|✅|
|Circuit|✅|
|date|✅|
|time|❌|
|FirstPractice|❌|
|SecondPractice|❌|
|ThirdPractice|❌|
|Qualifying|❌|
|Sprint|❌|
|SprintQualifying|❌|

---

## Examples:

### Get list of races in F1 history

`https://api.jolpi.ca/ergast/f1/races/`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/races/",
    "limit": "30",
    "offset": "0",
    "total": "1125",
    "RaceTable": {
      "Races": [
        {
          "season": "1950",
          "round": "1",
          "url": "http://en.wikipedia.org/wiki/1950_British_Grand_Prix",
          "raceName": "British Grand Prix",
          "Circuit": {
            "circuitId": "silverstone",
            "url": "http://en.wikipedia.org/wiki/Silverstone_Circuit",
            "circuitName": "Silverstone Circuit",
            "Location": {
              "lat": "52.0786",
              "long": "-1.01694",
              "locality": "Silverstone",
              "country": "UK"
            }
          },
          "date": "1950-05-13"
        },
        {
          "season": "1950",
          "round": "2",
          "url": "http://en.wikipedia.org/wiki/1950_Monaco_Grand_Prix",
          "raceName": "Monaco Grand Prix",
          "Circuit": {
            "circuitId": "monaco",
            "url": "http://en.wikipedia.org/wiki/Circuit_de_Monaco",
            "circuitName": "Circuit de Monaco",
            "Location": {
              "lat": "43.7347",
              "long": "7.42056",
              "locality": "Monte-Carlo",
              "country": "Monaco"
            }
          },
          "date": "1950-05-21"
        },
        ...more
      ]
    }
  }
}
```

### Get all races of a specific season (2024) and associated information

`https://api.jolpi.ca/ergast/f1/2024/races`

```json
{
  "MRData": {
    "xmlns": "",
    "series": "f1",
    "url": "http://api.jolpi.ca/ergast/f1/2024/races/",
    "limit": "30",
    "offset": "0",
    "total": "24",
    "RaceTable": {
      "season": "2024",
      "Races": [
        {
          "season": "2024",
          "round": "1",
          "url": "https://en.wikipedia.org/wiki/2024_Bahrain_Grand_Prix",
          "raceName": "Bahrain Grand Prix",
          "Circuit": {
            "circuitId": "bahrain",
            "url": "http://en.wikipedia.org/wiki/Bahrain_International_Circuit",
            "circuitName": "Bahrain International Circuit",
            "Location": {
              "lat": "26.0325",
              "long": "50.5106",
              "locality": "Sakhir",
              "country": "Bahrain"
            }
          },
          "date": "2024-03-02",
          "time": "15:00:00Z",
          "FirstPractice": {
            "date": "2024-02-29",
            "time": "11:30:00Z"
          },
          "SecondPractice": {
            "date": "2024-02-29",
            "time": "15:00:00Z"
          },
          "ThirdPractice": {
            "date": "2024-03-01",
            "time": "12:30:00Z"
          },
          "Qualifying": {
            "date": "2024-03-01",
            "time": "16:00:00Z"
          }
        },
        ...more
      ]
    }
  }
}
```