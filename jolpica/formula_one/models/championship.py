from typing import TYPE_CHECKING, ClassVar

from django.db import models

if TYPE_CHECKING:
    from . import Season


class ChampionshipSplitType(models.IntegerChoices):
    """How a championship season is divided. Such that best results are picked independently from each."""

    NONE = 0, "Season is not split"
    HALF_LARGER_FRONT = 2, "Split in halves (remainder in first half)"
    HALF_LARGER_BACK = 3, "Split in halves (remainder in second half)"


class ChampionshipBestResultsType(models.IntegerChoices):
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


class ChampionshipScheme(models.Model):
    """Drivers and Team Championship score calculation rules"""

    id = models.BigAutoField(primary_key=True)
    seasons: models.QuerySet["Season"]

    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    driver_season_split = models.PositiveSmallIntegerField(choices=ChampionshipSplitType.choices)
    driver_best_results = models.SmallIntegerField(choices=ChampionshipBestResultsType.choices)
    team_season_split = models.PositiveSmallIntegerField(choices=ChampionshipSplitType.choices)
    team_best_results = models.SmallIntegerField(choices=ChampionshipBestResultsType.choices)

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
