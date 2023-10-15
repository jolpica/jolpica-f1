from typing import TYPE_CHECKING, ClassVar

from django.db import models

if TYPE_CHECKING:
    from . import Session


class RacePointScheme(models.IntegerChoices):
    NONE = 0, "No Points Awarded"
    RACE_1950 = 1, "1950 - Top 5 get upto 8 points"
    RACE_1960 = 2, "1960 - Top 6 get upto 8 points"
    RACE_1961 = 3, "1961 - Top 6 get upto 9 points"
    RACE_1991 = 5, "1991 - Top 6 get upto 10 points"
    RACE_2003 = 6, "2003 - Top 8 get upto 10 points"
    RACE_2010 = 7, "2010 - Top 10 get upto 25 points"
    SPRINT_2021 = 21, "Sprint 2021 - Top 3 get upto 3 points"
    SPRINT_2022 = 22, "Sprint 2022 - Top 8 get upto 8 points"


class FastestLapPointScheme(models.IntegerChoices):
    NONE = 0, "No Fastest Lap Point"
    ANY = 1, "Point for Fastest Lap"
    SHARED = 2, "Point divided between all who got fastest lap"
    TOP_TEN = 3, "Point if in top 10"
    TOP_TEN_HALF_RACE = 4, "Point if top 10, and >50% race distance"


class PartialPointScheme(models.IntegerChoices):
    NONE = 0, "No Partial Points"
    HALF_30_60 = 1, "Half Points between 30% - 60%"
    HALF_2L_75 = 2, "Half Points between 2 Laps - 75%"
    RED_FLAG_QUARTERS = 3, "Red Flag Finish, 1-4 Quarters (rounded) of points, minimum 2 laps."
    QUARTERS = 4, "1-4 Quarters (rounded) of points, minimum 2 laps"


class SharedDrivePointScheme(models.IntegerChoices):
    NONE = 0, "No Points"
    SHARED = 1, "Points Shared Equally"
    SHARED_MULTI = 2, "Shared Points of all drives, unless insufficent distance"
    SHARED_HIGHEST_FINISH = 3, "Shared Points of highest finish"


class PointScheme(models.Model):
    id = models.BigAutoField(primary_key=True)
    sessions: models.QuerySet["Session"]

    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    driver = models.PositiveSmallIntegerField(choices=RacePointScheme.choices)
    team = models.PositiveSmallIntegerField(choices=RacePointScheme.choices)
    fastest_lap = models.PositiveSmallIntegerField(choices=FastestLapPointScheme.choices, default=0)
    team_fastest_lap = models.PositiveSmallIntegerField(choices=FastestLapPointScheme.choices, default=0)
    partial = models.PositiveSmallIntegerField(choices=PartialPointScheme.choices, default=0)
    shared_drive = models.PositiveSmallIntegerField(
        choices=SharedDrivePointScheme.choices, default=SharedDrivePointScheme.NONE
    )

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(
                fields=["driver", "team", "fastest_lap", "team_fastest_lap", "partial", "shared_drive"],
                name="point_scheme_unique",
            )
        ]

    def __str__(self) -> str:
        return f"{self.name}"
