# from django.db import models
from django.contrib.gis.db import models


class Circuit(models.Model):
    """
    Table circuit {
        id integer [primary key]
        reference string
        name string
        location string
        country string
        latitude string
        longitude string
        altitude string
        wikipedia string
    }
    """

    id = models.BigAutoField(primary_key=True)
    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255)
    city = models.CharField(max_length=255, null=True, blank=True)
    country = models.CharField(max_length=255, null=True, blank=True)
    location = models.PointField(geography=True, null=True, blank=True)
    altitude = models.FloatField(null=True, blank=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.name}"
