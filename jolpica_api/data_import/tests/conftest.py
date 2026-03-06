from __future__ import annotations

import pytest

import jolpica.formula_one.models as f1


@pytest.fixture
def season_2026_data() -> f1.Season:
    """Create all prerequisite DB objects for the 2026 Australian GP import.

    Creates Season 2026, Round 1, FP1/FP2 sessions, missing teams/drivers,
    and all 22 TeamDriver records.
    """
    season = f1.Season.objects.create(year=2026, championship_system_id=10)
    round_obj = f1.Round.objects.create(
        season=season,
        number=1,
        name="Australian Grand Prix",
        circuit_id=59,
    )
    f1.Session.objects.create(round=round_obj, type="FP1", number=1)
    f1.Session.objects.create(round=round_obj, type="FP2", number=2)

    # Create teams not in the test DB
    f1.Team.objects.create(reference="audi", name="Audi", nationality="German", country_code="DEU")
    f1.Team.objects.create(reference="cadillac", name="Cadillac F1 Team", nationality="American", country_code="USA")

    # Create drivers not in the test DB
    f1.Driver.objects.create(
        reference="arvid_lindblad",
        forename="Arvid",
        surname="Lindblad",
        abbreviation="LIN",
        nationality="British",
        country_code="GBR",
    )

    # All 22 driver→team pairings for 2026
    pairings = [
        ("norris", "mclaren"),
        ("piastri", "mclaren"),
        ("russell", "mercedes"),
        ("antonelli", "mercedes"),
        ("max_verstappen", "red_bull"),
        ("hadjar", "red_bull"),
        ("leclerc", "ferrari"),
        ("hamilton", "ferrari"),
        ("albon", "williams"),
        ("sainz", "williams"),
        ("lawson", "rb"),
        ("arvid_lindblad", "rb"),
        ("alonso", "aston_martin"),
        ("stroll", "aston_martin"),
        ("ocon", "haas"),
        ("bearman", "haas"),
        ("hulkenberg", "audi"),
        ("bortoleto", "audi"),
        ("gasly", "alpine"),
        ("colapinto", "alpine"),
        ("bottas", "cadillac"),
        ("perez", "cadillac"),
    ]
    drivers = {d.reference: d for d in f1.Driver.objects.filter(reference__in=[p[0] for p in pairings])}
    teams = {t.reference: t for t in f1.Team.objects.filter(reference__in=[p[1] for p in pairings])}

    for driver_ref, team_ref in pairings:
        f1.TeamDriver.objects.create(
            season=season,
            driver=drivers[driver_ref],
            team=teams[team_ref],
        )

    return season
