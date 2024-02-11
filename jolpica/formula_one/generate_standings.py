from __future__ import annotations

from collections import defaultdict

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


class ChampionshipData:
    """Championship Data for a Team/Driver, is orderable by championship position."""

    championship_system: ChampionshipSystem
    season_rounds: int
    adjustment_type: int
    points_per_round: dict[int, float]

    finish_string: str
    retirement_string: str

    @property
    def points(self) -> float:
        if self.adjustment_type == ChampionshipAdjustmentType.EXCLUDED:
            return 0
        else:
            return calculate_championship_points(
                self.points_per_round,
                split_type=self.championship_system.driver_season_split,
                best_results_type=self.championship_system.driver_best_results,
                total_rounds=self.season_rounds,
            )

    def __init__(
        self,
        championship_system: ChampionshipSystem,
        season_rounds: int,
        adjustment_type=ChampionshipAdjustmentType.NONE,
    ):
        self.championship_system = championship_system
        self.season_rounds = season_rounds
        self.adjustment_type = adjustment_type
        self.points_per_round = {i + 1: 0 for i in range(season_rounds)}

        self.finish_string = ""
        self.retirement_string = ""

    def _get_order_tuple(self):
        return (self.points, self.finish_string, self.retirement_string)

    def __eq__(self, other):
        if not isinstance(other, ChampionshipData):
            return False
        return self._get_order_tuple() == other._get_order_tuple()

    def __lt__(self, other: ChampionshipData):
        if not isinstance(other, ChampionshipData):
            return False
        return self._get_order_tuple() < other._get_order_tuple()

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
        """Eligibility for a championship position"""
        return bool(self.finish_string.strip("0"))

    def is_classified(self) -> bool:
        """Classification for championship position (or is disqualified)"""
        if self.adjustment_type == ChampionshipAdjustmentType.NONE:
            return True
        return False

    def add_points_to_round(self, round: int, points: float):
        self.points_per_round[round] += points

    def create_standing(self, position: None | int, data_id: int) -> DriverChampionship:
        is_eligible = self.is_eligible()  # Eligible for a championship position
        is_classified = self.is_classified()  # Classified in championship (or is disqualified)

        return DriverChampionship(
            driver_id=data_id,
            position=position if is_eligible and is_classified else None,
            points=self.points,
            win_count=self.get_number_wins(),
            highest_finish=self.get_highest_finish(),
            finish_string=self.finish_string,
            is_eligible=is_eligible,
            adjustment_type=self.adjustment_type,
        )


def standings_from_championship_data(data_map: dict[int, ChampionshipData]) -> list[DriverChampionship]:
    """Generate a list of Driver Championship, from a dictionary of driver id to championship data.

    Args:
        data_map (dict[int, ChampionshipData]): Dictionary of driver_id to championship data

    Returns:
        list[DriverChampionship]: List of DriverChampionship objects with relevant position data.
    """
    standings = []
    drivers_by_finishes = sorted(data_map.items(), key=(lambda d: d[1]), reverse=True)
    position = 1
    draw_count = -1
    last_data = None
    for driver_id, driver_data in drivers_by_finishes:
        if not driver_data.is_classified():
            pass
        elif last_data is None or driver_data < last_data:
            position += 1 + draw_count
            draw_count = 0
        else:
            draw_count += 1
        last_data = driver_data
        standing = driver_data.create_standing(position, driver_id)
        standings.append(standing)
    return standings


def generate_season_driver_standings(
    season: Season,
    championship_system: ChampionshipSystem | None = None,
    season_rounds: int | None = None,
    team_championship=False,
):
    if team_championship:
        data_type = "team"
    else:
        data_type = "driver"

    if championship_system is None:
        if season.championship_system:
            championship_system = season.championship_system
        else:
            raise ValueError("No ChampionshipSystem")
    if season_rounds is None:
        season_rounds = season.rounds.filter(is_cancelled=False).count()

    session_entries = list(
        SessionEntry.objects.filter(session__round__season_id=season.pk, session__point_system_id__gt=1)
        .annotate(
            round_id=F("session__round__pk"),
            round_num=F("session__round__number"),
            session_type=F("session__type"),
            data_id=F(f"round_entry__team_driver__{data_type}__pk"),
        )
        .order_by("round_num", "session__date", "session__time")
    )
    entries_dict: dict[tuple, dict[tuple, dict[int, list[SessionEntry]]]] = defaultdict(
        lambda: defaultdict(lambda: defaultdict(list))
    )
    for entry in session_entries:
        entries_dict[(entry.round_id, entry.round_num)][(entry.session_id, entry.session_type)][entry.data_id].append(
            entry
        )

    data_map: dict[int, ChampionshipData] = defaultdict(
        lambda: ChampionshipData(championship_system=championship_system, season_rounds=season_rounds)
    )
    for adjustment in season.championship_adjustments.filter(**{f"{data_type}__isnull": False}):
        data_id = getattr(adjustment, f"{data_type}_id")
        data_map[data_id].adjustment_type = adjustment.adjustment

    all_standings = []
    current_standings: list[DriverChampionship] = []
    for (round_id, round_num), entries_type_dict in entries_dict.items():
        for (session_id, session_type), data_entries in entries_type_dict.items():
            for data_id, entries in data_entries.items():
                session_points, best_position, is_classified = get_points_position_classification(entries)
                data_map[data_id].add_points_to_round(round_num, session_points)

                if session_type == SessionType.RACE and best_position is not None:
                    if is_classified:
                        data_map[data_id].add_finish_position(best_position)
                    else:
                        data_map[data_id].add_retirement_position(best_position)

            # session
            all_standings.extend(current_standings)
            current_standings = standings_from_championship_data(data_map)

            for standing in current_standings:
                standing.session_id = session_id
                standing.year = season.year
                standing.round_number = round_num
        # round
        for standing in current_standings:
            standing.round_id = round_id
    # season
    for standing in current_standings:
        standing.season_id = season.pk
    all_standings.extend(current_standings)
    return all_standings
