from django.db.models import Count, OuterRef, Q, Subquery, Sum

from .models import Driver, Round, SessionEntry, SessionStatus, SessionType
from .models.managed_views import DriverChampionship


def get_driver_career_stats(driver: Driver) -> dict[str, int | float]:
    session_entries = SessionEntry.objects.filter(round_entry__team_driver__driver=driver)
    race_entries = Q(session__type=SessionType.RACE)
    race_starts = (
        race_entries
        & Q(session__is_cancelled=False)
        & (
            Q(status__isnull=True)
            | ~Q(
                status__in=[
                    SessionStatus.DID_NOT_START,
                    SessionStatus.DID_NOT_QUALIFY,
                    SessionStatus.DID_NOT_PREQUALIFY,
                ]
            )
        )
    )

    session_stats = session_entries.aggregate(
        race_starts=Count("id", filter=race_starts),
        race_wins=Count("id", filter=race_entries & Q(position=1)),
        podiums=Count("id", filter=race_entries & Q(position__range=(1, 3))),
        total_points=Sum(
            "points",
            filter=Q(session__type__in=(SessionType.RACE, SessionType.SPRINT_RACE)),
            default=0,
        ),
        pole_positions=Count(
            "round_entry__round",
            distinct=True,
            filter=Q(session__type__startswith="Q", position=1),
        ),
    )

    final_round = Round.objects.filter(season_id=OuterRef("season_id")).order_by("-number").values("number")[:1]
    championships = DriverChampionship.objects.filter(
        driver=driver,
        season__isnull=False,
        position=1,
        round_number=Subquery(final_round),
    ).aggregate(count=Count("season_id", distinct=True))["count"]

    return {
        "race_starts": session_stats["race_starts"],
        "race_wins": session_stats["race_wins"],
        "podiums": session_stats["podiums"],
        "total_points": session_stats["total_points"],
        "pole_positions": session_stats["pole_positions"],
        "championships": championships,
    }
