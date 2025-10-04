from typing import TYPE_CHECKING, ClassVar

from django.db import models

from .mixins import ApiIDMixin

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


class PointSystem(ApiIDMixin, models.Model):
    """Session point calculation rules"""

    ID_PREFIX = "pointsystem"

    id = models.BigAutoField(primary_key=True)
    sessions: models.QuerySet["Session"]

    api_id = models.CharField(max_length=64, unique=True, db_index=True)
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


class BestRoundsChampionshipScheme(models.IntegerChoices):
    """Integer number of rounds per split to include, with special cases of ALL and ALL_BUT_ONE"""

    ALL_BUT_ONE = -2, "One less than total rounds per split"
    ALL = -1, "All rounds are counted"
    NONE = 0, "No rounds are counted"
    FOUR = 4
    FIVE = 5
    SIX = 6
    SEVEN = 7
    EIGHT = 8
    ELEVEN = 11


class EligibilityChampionshipScheme(models.IntegerChoices):
    """How is eligibility for Championship Standings determined"""

    HAS_POINT = 1, "Entry must score at least 1 championship point"
    HAS_FINISH = 2, "Entry must have a classified finish in at least 1 round"


class PointsPerSessionChampionshipScheme(models.IntegerChoices):
    """What point scoring results should be selected for the team championship"""

    SUM_POINTS = 0, "All points are summed"
    BEST_POINTS = 1, "Single highest points selected"


class ChampionshipSystem(ApiIDMixin, models.Model):
    """Drivers and Team Championship score calculation rules"""

    ID_PREFIX = "championshipsystem"

    id = models.BigAutoField(primary_key=True)
    seasons: models.QuerySet["Season"]

    api_id = models.CharField(max_length=64, unique=True, db_index=True)
    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)

    eligibility = models.PositiveSmallIntegerField(choices=EligibilityChampionshipScheme.choices)

    driver_season_split = models.PositiveSmallIntegerField(choices=SplitChampionshipScheme.choices)
    driver_best_results = models.SmallIntegerField(choices=BestRoundsChampionshipScheme.choices)

    team_season_split = models.PositiveSmallIntegerField(choices=SplitChampionshipScheme.choices)
    team_best_results = models.SmallIntegerField(choices=BestRoundsChampionshipScheme.choices)
    team_points_per_session = models.PositiveSmallIntegerField(choices=PointsPerSessionChampionshipScheme.choices)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(
                fields=[
                    "eligibility",
                    "driver_season_split",
                    "driver_best_results",
                    "team_season_split",
                    "team_best_results",
                    "team_points_per_session",
                ],
                name="championship_point_scheme_unique",
            )
        ]

    def __str__(self) -> str:
        return f"{self.name}"


class ChampionshipAdjustmentType(models.IntegerChoices):
    """Type of Championship Adjustment. Point Adjustment / Disqualification / Exclusion

    All adjustments that should result in removal from championship will have values > 100.
    """

    NONE = 0
    POINT_DEDUCTION = 1
    DISQUALIFIED = 101  # Keep points and results, but lose championship standing
    EXCLUDED = 102  # Lose all points


class ChampionshipAdjustment(ApiIDMixin, models.Model):
    """Adjustments such as Disqualifications and Exclusions from Driver/Team Championships"""

    ID_PREFIX = "championshipadjustment"

    id = models.BigAutoField(primary_key=True)

    season = models.ForeignKey("formula_one.Season", on_delete=models.CASCADE, related_name="championship_adjustments")
    driver = models.ForeignKey(
        "formula_one.Driver", on_delete=models.CASCADE, related_name="championship_adjustments", null=True, blank=True
    )
    team = models.ForeignKey(
        "formula_one.Team", on_delete=models.CASCADE, related_name="championship_adjustments", null=True, blank=True
    )
    api_id = models.CharField(max_length=64, unique=True, db_index=True)
    adjustment = models.PositiveSmallIntegerField(choices=ChampionshipAdjustmentType.choices)
    points = models.FloatField(
        null=True, blank=True, help_text="Points to deduct if POINT_DEDUCTION adjustment, otherwise null"
    )
