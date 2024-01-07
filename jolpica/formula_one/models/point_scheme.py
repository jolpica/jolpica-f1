from typing import TYPE_CHECKING, ClassVar

from django.db import models

if TYPE_CHECKING:
    from . import Season, Session


class PositionPointScheme(models.IntegerChoices):
    """How many points should be awarded for a finishing position"""

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
    """How many points should be awarded for a fastest lap"""

    NONE = 0, "No Fastest Lap Point"
    ANY = 1, "Point for Fastest Lap"
    SHARED = 2, "Point divided between all who got fastest lap"
    TOP_TEN = 3, "Point if in top 10"
    TOP_TEN_HALF_RACE = 4, "Point if top 10, and >50% race distance"


class PartialPointScheme(models.IntegerChoices):
    """When, and how should partial points be awarded"""

    NONE = 0, "No Partial Points"
    HALF_30_60 = 1, "Half Points between 30% - 60%"
    HALF_2L_75 = 2, "Half Points between 2 Laps - 75%"
    RED_FLAG_QUARTERS = 3, "Red Flag Finish, 1-4 Quarters (rounded) of points, minimum 2 laps."
    QUARTERS = 4, "1-4 Quarters (rounded) of points, minimum 2 laps"


class SharedDrivePointScheme(models.IntegerChoices):
    """How many points should be awarded if two drivers share a car"""

    NONE = 0, "No Points"
    SHARED = 1, "Points Shared Equally"
    SHARED_MULTI = 2, "Shared Points of all drives, unless insufficent distance"
    SHARED_HIGHEST_FINISH = 3, "Shared Points of highest finish"


class PointSystem(models.Model):
    """Session point calculation rules"""

    id = models.BigAutoField(primary_key=True)
    sessions: models.QuerySet["Session"]

    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    driver_position_points = models.PositiveSmallIntegerField(choices=PositionPointScheme.choices)
    driver_fastest_lap = models.PositiveSmallIntegerField(choices=FastestLapPointScheme.choices, default=0)
    team_position_points = models.PositiveSmallIntegerField(choices=PositionPointScheme.choices)
    team_fastest_lap = models.PositiveSmallIntegerField(choices=FastestLapPointScheme.choices, default=0)
    partial = models.PositiveSmallIntegerField(choices=PartialPointScheme.choices, default=0)
    shared_drive = models.PositiveSmallIntegerField(
        choices=SharedDrivePointScheme.choices, default=SharedDrivePointScheme.NONE
    )
    is_double_points = models.BooleanField(default=False)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(
                fields=[
                    "driver_position_points",
                    "driver_fastest_lap",
                    "team_position_points",
                    "team_fastest_lap",
                    "partial",
                    "shared_drive",
                    "is_double_points",
                ],
                name="point_system_unique",
            )
        ]

    def __str__(self) -> str:
        return f"{self.name}"


class SplitChampionshipScheme(models.IntegerChoices):
    """How a championship season is divided. Such that best results are picked independently from each."""

    NONE = 0, "Season is not split"
    HALF_LARGER_FRONT = 2, "Split in halves (remainder in first half)"
    HALF_LARGER_BACK = 3, "Split in halves (remainder in second half)"


class ResultsChampionshipScheme(models.IntegerChoices):
    """Integer number of results per split to include, with special cases of ALL and ALL_BUT_ONE"""

    ALL_BUT_ONE = -2, "One less than total races per split"
    ALL = -1, "All results are counted"
    NONE = 0, "No results are counted"
    FOUR = 4
    FIVE = 5
    SIX = 6
    SEVEN = 7
    EIGHT = 8
    ELEVEN = 11


class ChampionshipSystem(models.Model):
    """Drivers and Team Championship score calculation rules"""

    id = models.BigAutoField(primary_key=True)
    seasons: models.QuerySet["Season"]

    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    driver_season_split = models.PositiveSmallIntegerField(choices=SplitChampionshipScheme.choices)
    driver_best_results = models.SmallIntegerField(choices=ResultsChampionshipScheme.choices)
    team_season_split = models.PositiveSmallIntegerField(choices=SplitChampionshipScheme.choices)
    team_best_results = models.SmallIntegerField(choices=ResultsChampionshipScheme.choices)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(
                fields=[
                    "driver_season_split",
                    "driver_best_results",
                    "team_season_split",
                    "team_best_results",
                ],
                name="championship_point_scheme_unique",
            )
        ]

    def __str__(self) -> str:
        return f"{self.name}"
