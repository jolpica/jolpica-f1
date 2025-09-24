# Database Dumps

## Information

Exports of our F1 database include all historical race data, driver information, constructor details, and championship standings.

### Available Formats

The CSV format reflects our database structure which you can explore in [our dbdocs](https://dbdocs.io/jolpica/jolpica-f1?view=relationships). We recommend addressing CSV columns by their column name instead of their order as we make no guarantees that their order will stay consistent as we expand our database.

Additional formats may be available in the future.

### Access Tiers
To support the running of the API, while balancing keeping our data free for everyone, there are two tiers of access for database dumps.

###  🆓 Free Database Dump Access - Non-Commercial Use

  - Dumps available for download 14 days after they are uploaded
  - (Unchanged from API access) Data freely available for non-commercial use
  - No authentication required

 ### 💎 Supporter Database Dump Access - Commercial Use

  - Latest dumps are available as soon as they are uploaded.
  - (Change from regular API access) Data licensed for commercial use
  - Authentication via API key required
  - We'll be providing details on how to access supporter downloads in the future, in the meantime feel free to message us on Ko-fi if you're an existing supporter wanting early access.


## Endpoint

Returns information about database dumps that are available for download.

**URL** : `/data/dumps/download/`


## Success Response

**Code** : `200 OK`

**Response Fields** :

`available_types` : The list of available types of dumps.

`delay_days` : The number of days by which delayed dumps are delayed.

`delayed_dumps.{type}` :  Database dump objects for delayed dumps by type of dump.

`latest_dumps.{type}` : Database dump objects for current dumps by type of dump.

---

## Database Dump Object Fields

|Field|Always Included|Description|type|
|---|:---:|---|---|
|dump_type|✅|The type of the dump|String
|file_hash|✅|The SHA256 hash of the dump|String
|file_size|✅|The file size of the dump in bytes|Number
|uploaded_at|✅|The date and time at which the dump was created (ISO 8601 timestamp)|String
|download_url|✅|The download URL for this dump|String

---

## Example

### Get information about the currently available database dumps

`https://api.jolpi.ca/data/dumps/download/`

```json
{
    "available_types": [
        "csv"
    ],
    "latest_dumps": {
        "csv": {
            "dump_type": "csv",
            "file_hash": "ca1d224586c0fce6d3010b17169d4a1f2f8451fff0d80911573e130d03744507",
            "file_size": 6619294,
            "uploaded_at": "2025-09-21T13:45:20.930056Z",
            "download_url": "https://api.jolpi.ca/data/dumps/download/latest/?dump_type=csv"
        }
    },
    "delayed_dumps": {
        "csv": {
            "dump_type": "csv",
            "file_hash": "1a40350d0f9cd463db29f7326788173c09eb45d79cdc360ade089fbb41aece3b",
            "file_size": 6600710,
            "uploaded_at": "2025-09-07T15:01:43.250560Z",
            "download_url": "https://api.jolpi.ca/data/dumps/download/delayed/?dump_type=csv"
        }
    },
    "delay_days": 14
}
```