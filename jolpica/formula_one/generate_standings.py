from collections import defaultdict
from dataclasses import dataclass, field

from django.db.models import F

from jolpica.formula_one.models import ChampionshipAdjustmentType, ChampionshipSystem, Season, SessionEntry, SessionType
from jolpica.formula_one.models.managed_views import DriverChampionship
from jolpica.formula_one.utils import (
    add_to_encoded_finishing_positions,
    calculate_championship_points,
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


# def update_points_for_session(
#     driver_round_points: dict, driver_sort_key: dict, driver_entries: dict
# ) -> tuple[dict, dict]:
#     for driver_id, entries in driver_entries.items():
#         session_points, best_position, is_classified = get_points_position_classification(entries)
#         driver_round_points[driver_id][round_num] += session_points

#         if session_type == SessionType.RACE and best_position is not None:
#             if is_classified:
#                 driver_sort_key[driver_id].add_finish_position(best_position)
#             else:
#                 driver_sort_key[driver_id].add_retirement_position(best_position)

#         driver_sort_key[driver_id].points = calculate_championship_points(
#             driver_round_points[driver_id],
#             split_type=championship_system.driver_season_split,
#             best_results_type=championship_system.driver_best_results,
#             total_rounds=season_rounds,
#         )
#     return driver_round_points, driver_sort_key


@dataclass(order=True)
class ChampionshipData:
    """Championship Data for a Team/Driver, is orderable by championship position."""

    championship_system: ChampionshipSystem = field(compare=False)
    season_rounds: int = field(compare=False)
    points_per_round: dict[int, float] = field(default_factory=lambda: defaultdict(float), compare=False, init=False)

    points: float = 0
    finish_string: str = ""
    retirement_string: str = ""

    def add_finish_position(self, position: int):
        self.finish_string = add_to_encoded_finishing_positions(self.finish_string, position)

    def add_retirement_position(self, position: int):
        self.retirement_string = add_to_encoded_finishing_positions(self.retirement_string, position)

    def get_highest_finish(self) -> int | None:
        if self.finish_string.strip("0") == "":
            return None
        return 1 + (len(self.finish_string) - len(self.finish_string.lstrip("0"))) // 2

    def get_number_wins(self) -> int:
        return int(self.finish_string[:2]) if len(self.finish_string) >= 2 else 0

    def is_eligible(self) -> bool:
        return bool(self.finish_string.strip("0"))

    def add_points_to_round(self, round: int, points: float):
        self.points_per_round[round] += points
        self._update_points()

    def _update_points(self):
        self.points = calculate_championship_points(
            self.points_per_round,
            split_type=self.championship_system.driver_season_split,
            best_results_type=self.championship_system.driver_best_results,
            total_rounds=self.season_rounds,
        )


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

    driver_data: dict[int, ChampionshipData] = defaultdict(
        lambda: ChampionshipData(championship_system=championship_system, season_rounds=season_rounds)
    )

    driver_standings = []
    current_standings: list[DriverChampionship] = []
    for (round_id, round_num), entries_type_dict in entries_dict.items():
        for (session_id, session_type), driver_entries in entries_type_dict.items():
            driver_standings.extend(current_standings)
            current_standings = []

            for driver_id, entries in driver_entries.items():
                session_points, best_position, is_classified = get_points_position_classification(entries)
                driver_data[driver_id].add_points_to_round(round_num, session_points)

                if session_type == SessionType.RACE and best_position is not None:
                    if is_classified:
                        driver_data[driver_id].add_finish_position(best_position)
                    else:
                        driver_data[driver_id].add_retirement_position(best_position)

            # session
            drivers_by_finishes = sorted(driver_data.items(), key=(lambda d: d[1]), reverse=True)
            best_position = 1
            draw_count = -1
            last_data = None
            for driver_id, sort_key in drivers_by_finishes:
                points = sort_key.points
                is_eligible = sort_key.is_eligible()  # Eligible for a championship position
                is_classified = True  # Classified in championship (or is disqualified)
                if driver_id in adjustments.keys():
                    is_classified = False
                    if adjustments[driver_id] == ChampionshipAdjustmentType.EXCLUDED:
                        points = 0
                elif last_data is None or sort_key < last_data:
                    best_position += 1 + draw_count
                    draw_count = 0
                else:
                    draw_count += 1
                last_data = sort_key
                current_standings.append(
                    DriverChampionship(
                        session_id=session_id,
                        driver_id=driver_id,
                        year=season.year,
                        round_number=round_num,
                        position=best_position if is_eligible and is_classified else None,
                        points=points,
                        win_count=sort_key.get_number_wins(),
                        highest_finish=sort_key.get_highest_finish(),
                        finish_string=sort_key.finish_string,
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
