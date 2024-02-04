from collections import defaultdict
from dataclasses import dataclass

from django.db.models import F

from jolpica.formula_one.models import ChampionshipAdjustmentType, ChampionshipSystem, Season, SessionEntry, SessionType
from jolpica.formula_one.models.managed_views import DriverChampionship
from jolpica.formula_one.utils import (
    add_to_encoded_finishing_positions,
    calculate_championship_points,
    highest_finish_from_encoded_finishing_position,
)


def get_points_position_classification(entries) -> tuple[float, int | None, bool | None]:
    points = 0
    best_position = None
    is_classified = None
    for entry in entries:  # type: ignore
        if entry.is_eligible_for_points and entry.points:
            points += entry.points
        if (
            best_position is None
            or entry.position < best_position
            and (not is_classified or entry.is_classified is True)
        ):
            best_position = entry.position
            is_classified = entry.is_classified
    return (points, best_position, is_classified)


@dataclass(order=True)
class ChampionshipSortKey:
    points: float = 0
    finish_string: str = ""
    retirement_string: str = ""


def generate_season_driver_standings(
    season: Season, championship_system: ChampionshipSystem | None = None, season_rounds: int | None = None
):
    if championship_system is None:
        if season.championship_system:
            championship_system = season.championship_system
        else:
            raise ValueError("No ChampionshipSystem")
    if season_rounds is None:
        season_rounds = season.rounds.filter(is_cancelled=False).count()
    adjustments = {
        adjustment.driver_id: adjustment.adjustment
        for adjustment in season.championship_adjustments.filter(driver__isnull=False)
    }
    session_entries = list(
        SessionEntry.objects.filter(session__round__season_id=season.pk, session__point_system_id__gt=1)
        .annotate(
            round_id=F("session__round__pk"),
            round_num=F("session__round__number"),
            session_type=F("session__type"),
            driver_id=F("round_entry__team_driver__driver__pk"),
        )
        .order_by("round_num", "session__date", "session__time")
    )
    entries_dict: dict[tuple, dict[tuple, dict[int, list[SessionEntry]]]] = defaultdict(
        lambda: defaultdict(lambda: defaultdict(list))
    )
    for entry in session_entries:
        entries_dict[(entry.round_id, entry.round_num)][(entry.session_id, entry.session_type)][entry.driver_id].append(
            entry
        )

    driver_round_points: dict[int, dict[int, float]] = defaultdict(lambda: defaultdict(float))
    driver_sort_key: dict[int, ChampionshipSortKey] = defaultdict(lambda: ChampionshipSortKey())

    driver_standings = []
    current_standings: list[DriverChampionship] = []
    for (round_id, round_num), entries_type_dict in entries_dict.items():
        for (session_id, session_type), driver_entries in entries_type_dict.items():
            driver_standings.extend(current_standings)
            current_standings = []
            for driver_id, entries in driver_entries.items():
                session_points, best_position, is_classified = get_points_position_classification(entries)
                driver_round_points[driver_id][round_num] += session_points

                if session_type == SessionType.RACE and best_position is not None:
                    if is_classified:
                        driver_sort_key[driver_id].finish_string = add_to_encoded_finishing_positions(
                            driver_sort_key[driver_id].finish_string, best_position
                        )
                    else:
                        driver_sort_key[driver_id].retirement_string = add_to_encoded_finishing_positions(
                            driver_sort_key[driver_id].retirement_string, best_position
                        )
                driver_sort_key[driver_id].points = calculate_championship_points(
                    driver_round_points[driver_id],
                    split_type=championship_system.driver_season_split,
                    best_results_type=championship_system.driver_best_results,
                    total_rounds=season_rounds,
                )

            # session
            drivers_by_finishes = sorted(driver_sort_key.items(), key=lambda d: driver_sort_key[d[0]], reverse=True)
            best_position = 1
            draw_count = -1
            last_key = ChampionshipSortKey(-1, "", "")
            for driver_id, sort_key in drivers_by_finishes:
                # sort_key = tuple(sort_key)
                points, finish_string = sort_key.points, sort_key.finish_string
                is_eligible = True if finish_string else False  # Eligible for a championship position
                is_classified = True  # Classified in championship (or is disqualified)
                if driver_id in adjustments.keys():
                    is_classified = False
                    if adjustments[driver_id] == ChampionshipAdjustmentType.EXCLUDED:
                        points = 0
                elif sort_key < last_key:
                    best_position += 1 + draw_count
                    draw_count = 0
                else:
                    draw_count += 1
                last_key = sort_key
                current_standings.append(
                    DriverChampionship(
                        session_id=session_id,
                        driver_id=driver_id,
                        year=season.year,
                        round_number=round_num,
                        position=best_position if is_eligible and is_classified else None,
                        points=points,
                        win_count=int(finish_string[:2]) if finish_string else 0,
                        highest_finish=highest_finish_from_encoded_finishing_position(finish_string),
                        finish_string=finish_string,
                        is_eligible=is_eligible,
                        adjustment_type=adjustments.get(driver_id, ChampionshipAdjustmentType.NONE),
                    )
                )
        # round
        for standing in current_standings:
            standing.round_id = round_id
    # season
    for standing in current_standings:
        standing.season_id = season.pk
    driver_standings.extend(current_standings)
    return driver_standings
