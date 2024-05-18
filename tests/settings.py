from jolpica_api.settings import *  # noqa: F403

INSTALLED_APPS += ["tests"]  # noqa: F405

REST_KNOX.update(
    {
        # Use faster hash algorithm for testing
        "SECURE_HASH_ALGORITHM": "hashlib.md5",
    }
)
