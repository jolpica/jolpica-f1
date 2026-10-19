from django.db.models import Case, Count, IntegerField, OuterRef, Q, Subquery, Sum, When

from .models import Driver, Round, Session, SessionEntry, SessionStatus, SessionType
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
    final_qualifying_session = (
        Session.objects.filter(
            round_id=OuterRef("session__round_id"),
            type__startswith="Q",
        )
        .annotate(
            format_priority=Case(
                When(type="QA", then=3),
                When(type="QB", then=2),
                default=1,
                output_field=IntegerField(),
            )
        )
        .order_by("-format_priority", "-number")
        .values("id")[:1]
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
            filter=Q(position=1, session_id=Subquery(final_qualifying_session)),
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
