from jolpica_api.settings import *  # noqa: F403
from jolpica_api.settings import INSTALLED_APPS, REST_KNOX

INSTALLED_APPS += ["tests"]

REST_KNOX.update(
    {
        # Use faster hash algorithm for testing
        "SECURE_HASH_ALGORITHM": "hashlib.md5",
    }
)
