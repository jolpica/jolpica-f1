[← Documentation Home](/docs/README.md)
# Rate Limits
We implement ratelimiting to ensure the API stays available to everyone.

When using the API you may receive a `HTTP 429 Too Many Requests` error telling you that your `Request was throttled`. This means that you (or others sharing the same IP / API Token as you) are sending too many requests and have exceeded our burst or sustained rate limits.

## Current Limits
### Unauthenticated Access
Access to the API without any additional authentication are subject to these limits.

Burst Limit: `4 requests per second`  
Sustained Limit: `500 requests per hour`

These limits are subject to change, and **will decrease** in the future as we roll out token access and our new non-ergast compatible replacement API.

### API Token Access
We are currently in the process of implementing Token access. Once implemented, Tokens will provide higher limits than unauthenticated access.

## Need a higher rate limit?
Please try the following:

1. Implement a cache to store results.
2. Use more efficient queries utilising filters & offsets.
    * ex. Query using offsets `2024/12/laps.json?limit=100&offset=0` instead of requesting lap by lap.
    * ex. To get all of a driver's results for a season use `2024/drivers/hamilton/results.json` instead of querying each round.

If you think you have a valid usecase for a higher rate limit, and have tried the above. Feel free to reach out using [GitHub Discussions](https://github.com/jolpica/jolpica-f1/discussions).