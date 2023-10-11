from django.db import models


class Driver(models.Model):
    id = models.BigAutoField(primary_key=True)
    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    forename = models.CharField(max_length=255)
    surname = models.CharField(max_length=255)
    abbreviation = models.CharField(max_length=10, null=True, blank=True)
    permanent_car_number = models.PositiveSmallIntegerField(null=True, blank=True)
    date_of_birth = models.DateField(null=True, blank=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

