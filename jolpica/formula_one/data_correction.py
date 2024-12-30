from .models import Session, SessionEntry, SessionType


def run_data_correction():
    session_entry_corrections()
    session_correction()


def session_entry_corrections():
    updated = []
    # 2011 round 7 - missed karthikeyan's penlty
    to_update = SessionEntry.objects.filter(
        session__type=SessionType.RACE,
        session__round__number=7,
        session__round__season__year=2011,
        round_entry__team_driver__driver__reference__in=[
            "ambrosio",
            "glock",
            "trulli",
            "karthikeyan",
        ],
    ).select_related("round_entry__team_driver__driver")
    correct = {
        "ambrosio": 14,
        "glock": 15,
        "trulli": 16,
        "karthikeyan": 17,
    }
    for entry in to_update:
        entry.position = correct[entry.round_entry.team_driver.driver.reference]
        updated.append(entry)
    # 1956 round 2 - only eligible for points from 1 finish
    entry = SessionEntry.objects.filter(
        session__round__number=2,
        session__round__season__year=1956,
        round_entry__team_driver__driver__reference="fangio",
        points=1.5,
    ).first()
    if entry:
        entry.is_eligible_for_points = False
        updated.append(entry)
    SessionEntry.objects.bulk_update(updated, fields=["position", "is_eligible_for_points"])


def session_correction():
    # 2024 round 23 - incorrect times for sessions issue #113
    corrections = {
        SessionType.RACE: "16:00:00",
        SessionType.SPRINT_RACE: "14:00:00",
        SessionType.QUALIFYING_ONE: "18:00:00",
        SessionType.QUALIFYING_TWO: "18:00:00",
        SessionType.QUALIFYING_THREE: "18:00:00",
    }

    qatar_2024 = Session.objects.filter(round__season__year=2024, round__number=23, type__in=corrections.keys())

    updates = []
    for session in qatar_2024:
        session.time = corrections[session.type]
        updates.append(session)

    Session.objects.bulk_update(updates, fields=["time"])
