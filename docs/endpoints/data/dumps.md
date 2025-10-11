# Database Dumps API

Returns information about database dumps that are available for download.

**URL** : `/data/dumps/download/`

**OpenAPI Documentation**: https://api.jolpi.ca/docs/#/dumps

## Access Tiers

Access to delayed and latest dumps are split into access tiers, with the latest dumps requiring authorization. See our main [database dumps documentation](../../database_dumps.md) for more details.

## Success Response

**Code** : `200 OK`

**Response Fields** :

|Field|Always Included|Description|Type|
|---|:---:|---|---|
|available_types|✅|The list of available types of dumps (csv, etc)|Array
|delay_days|✅|The number of days by which delayed dumps are delayed. If the last dump was made before this, then the delayed & latest dumps will be identical.|Number
|delayed_dumps|✅|Mapping of dump type to the latest delayed **Database Dump Object**.|Object
|latest_dumps|✅|Mapping of dump type to the latest **Database Dump Object**.|Object

---

**Database Dump Object** :

|Field|Always Included|Description|type|
|---|:---:|---|---|
|dump_type|✅|The type of the dump|String
|file_hash|✅|The SHA256 hash of the dump|String
|file_size|✅|The file size of the dump in bytes|Number
|uploaded_at|✅|The date and time at which the dump was created (ISO 8601 timestamp)|String
|download_url|✅|The download URL for this dump|String

---

### Example

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