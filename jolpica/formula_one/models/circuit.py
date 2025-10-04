from typing import TYPE_CHECKING

from django.db import models

from .mixins import ApiIDMixin

if TYPE_CHECKING:
    from . import Round


class Circuit(ApiIDMixin, models.Model):
    """Round venue information"""

    ID_PREFIX = "circuit"

    id = models.BigAutoField(primary_key=True)
    rounds: models.QuerySet["Round"]

    api_id = models.CharField(max_length=64, unique=True, db_index=True)
    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255)
    locality = models.CharField(max_length=255, null=True, blank=True)
    country = models.CharField(max_length=255, null=True, blank=True)
    country_code = models.CharField("3 Letter country code (ISO 3166-1 alpha-3)", max_length=3, null=True, blank=True)
    latitude = models.FloatField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)
    altitude = models.FloatField(null=True, blank=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.name}"
