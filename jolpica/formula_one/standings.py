from __future__ import annotations

from collections import Counter
from dataclasses import dataclass, field
from enum import Enum
from typing import Literal, overload

from .models import (
    ChampionshipAdjustment,
    ChampionshipAdjustmentType,
    ChampionshipSystem,
    EligibilityChampionshipScheme,
    Season,
    Session,
    SessionEntry,
    SessionType,
)
from .models.managed_views import DriverChampionship, TeamChampionship
from .utils import calculate_championship_points


class Group(Enum):
    DRIVER = 1
    TEAM = 2
    OTHER = 3


@dataclass()
class EntryData:
    round_number: int
    session_number: int

    driver_id: int
    team_id: int

    points: float | None
    position: int | None
    is_classified: bool | None

    @classmethod
    def from_session_entry(cls, entry: SessionEntry) -> EntryData:
        if entry.round_entry.round.number and entry.session.number and entry.round_entry:
            return cls(
                round_number=entry.round_entry.round.number,
                session_number=entry.session.number,
                driver_id=entry.round_entry.team_driver.driver_id,
                team_id=entry.round_entry.team_driver.team_id,
                points=entry.points,
                position=entry.position,
                is_classified=entry.is_classified,
            )
        raise ValueError("Missing required fields in entry")


class Stats:
    points_by_round: Counter[int]
    finish_counts: Counter[int]
    unclassified_counts: Counter[int]

    group_type: Group
    championship_system: ChampionshipSystem | None

    def __init__(
        self,
        points: float | dict | None = None,
        finish_counts: dict | list | None = None,
        unclassified_counts: dict | list | None = None,
        championship_system: ChampionshipSystem | None = None,
        group_type: Group = Group.OTHER,
        point_adjustment: float = 0,
    ) -> None:
        if isinstance(points, int | float):
            self.points_by_round = Counter({99: points})
        elif points is None:
            self.points_by_round = Counter()
        else:
            self.points_by_round = Counter(points)

        self.finish_counts = Counter(finish_counts)
        self.unclassified_counts = Counter(unclassified_counts)
        self.championship_system = championship_system
        self.group_type = group_type
        self.point_adjustment = point_adjustment

    @property
    def points(self) -> float:
        if self.championship_system is None:
            return self.points_by_round.total()

        if self.group_type == Group.DRIVER:
            season_split = self.championship_system.driver_season_split
            best_results = self.championship_system.driver_best_results
        elif self.group_type == Group.TEAM:
            season_split = self.championship_system.team_season_split
            best_results = self.championship_system.team_best_results
        else:
            raise NotImplementedError()

        points = calculate_championship_points(
            self.points_by_round,
            season_split,
            best_results,
            14,
        )
        if points is None:
            points = 0

        points = max(0, points + self.point_adjustment)

        return points

    def with_point_adjustment(self, point_adjustment: float) -> Stats:
        """Create a copy of this Stat, with an updated point adjustment"""
        new = self + Stats()
        new.point_adjustment = point_adjustment
        return new

    @staticmethod
    def from_entry(
        entry: EntryData,
        group_type: Group,
        session_type: SessionType,
        round_number: int,
        championship_system: ChampionshipSystem | None = None,
    ):
        finishes, unclassifies = [], []
        if session_type == SessionType.RACE and entry.position is not None:
            if entry.is_classified is True:
                finishes.append(entry.position)
            elif entry.is_classified is False:
                unclassifies.append(entry.position)
        if entry.points is None:
            points_by_round = {}
        else:
            points_by_round = {round_number: entry.points}
        return Stats(points_by_round, finishes, unclassifies, championship_system, group_type)

    def __eq__(self, other):
        if not isinstance(other, Stats):
            raise NotImplementedError()
        return (
            self.points == other.points
            and self.finish_counts == other.finish_counts
            and self.unclassified_counts == other.unclassified_counts
        )

    def __gt__(self, other):
        if not isinstance(other, Stats):
            raise NotImplementedError()

        if self.points > other.points:
            return True
        elif self.points < other.points:
            return False

        if self.finish_counts != other.finish_counts:
            for finish in sorted([*self.finish_counts, *other.finish_counts]):
                val1, val2 = self.finish_counts.get(finish, 0), other.finish_counts.get(finish, 0)
                if val1 == val2:
                    continue
                else:
                    return val1 > val2

        if self.unclassified_counts != other.unclassified_counts:
            for finish in sorted([*self.unclassified_counts, *other.unclassified_counts]):
                val1, val2 = self.unclassified_counts.get(finish, 0), other.unclassified_counts.get(finish, 0)
                if val1 == val2:
                    continue
                else:
                    return val1 > val2

        return False

    def __add__(self, other):
        if not isinstance(other, Stats):
            raise NotImplementedError()

        if (
            self.championship_system == other.championship_system
            and self.group_type == other.group_type
            or (other == Stats())
        ):
            championship_system = self.championship_system
            group_type = self.group_type
        elif self == Stats():
            championship_system = other.championship_system
            group_type = other.group_type
        else:
            raise ValueError("Can only add stats of same group type and point system")

        finishes = Counter(self.finish_counts)
        finishes.update(other.finish_counts)
        unclassifieds = Counter(self.unclassified_counts)
        unclassifieds.update(other.unclassified_counts)
        points_by_round = Counter(self.points_by_round)
        points_by_round.update(other.points_by_round)

        return Stats(points_by_round, finishes, unclassifieds, championship_system, group_type)


@dataclass(order=True)
class SessionData:
    round_number: int
    session_number: int

    entry_datas: list[EntryData] = field(compare=False)
    session_type: SessionType
    session_id: int
    round_id: int
    championship_system: ChampionshipSystem | None = None

    @classmethod
    def from_session(
        cls,
        session: Session,
        round_number: int,
        session_type: SessionType,
        championship_system: ChampionshipSystem | None,
    ) -> SessionData:
        entry_datas = [EntryData.from_session_entry(entry) for entry in session.session_entries.all()]
        if session.number is None:
            raise ValueError("Session must have non-null number")

        return cls(
            round_number=round_number,
            session_number=session.number,
            entry_datas=entry_datas,
            session_type=session_type,
            session_id=session.id,
            round_id=session.round_id,
            championship_system=championship_system,
        )

    def group_data_by(self, grouping_type: Group) -> dict[int, list[EntryData]]:
        """Group all entry data by driver_id or team_id.

        Args:
            grouping_type: What to group by

        Raises:
            ValueError for invalid grouping_type

        Returns:
            Mapping of driver_id/team_id to entry data.
        """
        data: dict[int, list[EntryData]] = {}
        for entry_data in self.entry_datas:
            key = entry_data.driver_id if grouping_type == Group.DRIVER else entry_data.team_id
            if key in data:
                data[key].append(entry_data)
            else:
                data[key] = [entry_data]
        return data

    def stats_by_group(self, grouping_type: Group, aggregate: Literal["SUM", "BEST"]) -> dict[int, Stats]:
        """Get a mapping of stats (points/position) by driver or team for the session.

        Args:
            grouping_type: What to get stats by: DRIVER or TEAM
            aggregate: How to aggregate multiple points values in a group: SUM or BEST

        Raises:
            ValueError: Invalid grouping_type or aggregate

        Returns:
            Mapping of group id to points for this session
        """
        data_map = self.group_data_by(grouping_type)

        stat_map = {}
        for key, entries in data_map.items():
            stats = map(
                lambda x: Stats.from_entry(
                    x, grouping_type, self.session_type, self.round_number, self.championship_system
                ),
                entries,
            )
            if aggregate == "SUM":
                stat_map[key] = sum(stats, start=Stats())
            elif aggregate == "BEST":
                stat_map[key] = max(stats)
            else:
                raise ValueError("Invalid aggregate")

        return stat_map


@dataclass()
class SeasonData:
    season_year: int
    session_datas: list[SessionData]
    season_id: int
    championship_system: ChampionshipSystem
    adjustments: dict[tuple[Group, int], ChampionshipAdjustment] = field(default_factory=dict)
    aggregate_by_grouping: dict[Group, Literal["SUM", "BEST"]] = field(
        default_factory=lambda: {Group.DRIVER: "BEST", Group.TEAM: "SUM"}
    )

    @classmethod
    def from_season(cls, season: Season) -> SeasonData:
        session_datas = []
        for round in season.rounds.all():
            if round.number is None:
                continue
            for session in round.sessions.filter(
                point_system__gt=1  # Assumption that point system with pk 1 is the only non-point system
            ):
                if session.number is None:
                    continue
                session_datas.append(
                    SessionData.from_session(
                        session, round.number, SessionType(session.type), season.championship_system
                    )
                )
        adjustments = {}
        for adjustment in season.championship_adjustments.all():
            if adjustment.driver_id:
                adjustments[Group.DRIVER, adjustment.driver_id] = adjustment
            if adjustment.team_id:
                adjustments[Group.TEAM, adjustment.team_id] = adjustment

        if season.championship_system is None:
            raise ValueError()

        return cls(
            season_year=season.year,
            session_datas=session_datas,
            season_id=season.id,
            championship_system=season.championship_system,
            adjustments=adjustments,
        )

    def get_adjustment(self, group_type: Group, group_id: int) -> ChampionshipAdjustment:
        return self.adjustments.get(
            (group_type, group_id), ChampionshipAdjustment(adjustment=ChampionshipAdjustmentType.NONE)
        )

    def is_stat_eligible_for_standings(self, stat: Stats) -> bool:
        """Return True if the stat has met the baseline for inclusion in standings"""
        if self.championship_system.eligibility == EligibilityChampionshipScheme.HAS_FINISH:
            return bool(stat.finish_counts)
        elif self.championship_system.eligibility == EligibilityChampionshipScheme.HAS_POINT:
            return stat.points > 0
        else:
            raise NotImplementedError()

    def is_stat_disqualified_from_standings(self, group_type: Group, group_id: int) -> bool:
        """Return True if this driver/team should be exclused from standings"""
        # Adjustments with value > 100 will result in removal
        return self.get_adjustment(group_type, group_id).adjustment >= ChampionshipAdjustmentType.DISQUALIFIED

    def is_stripped_of_points(self, adjustment: ChampionshipAdjustment) -> bool:
        """Return True if this driver/team should be stripped of points"""
        return adjustment.adjustment == ChampionshipAdjustmentType.EXCLUDED

    def get_points_from_stat(self, stat: Stats, group_type: Group, group_id: int) -> float:
        adjustment = self.get_adjustment(group_type, group_id)
        if self.is_stripped_of_points(adjustment):
            return 0

        return stat.points

    def create_group_standing(
        self,
        grouping_type: Group,
        group_id: int,
        stat: Stats,
        position: int,
    ) -> DriverChampionship | TeamChampionship:
        is_eligible = self.is_stat_eligible_for_standings(stat)
        is_disqualified = self.is_stat_disqualified_from_standings(grouping_type, group_id)
        kwargs = {
            "year": self.season_year,
            "position": position if is_eligible and not is_disqualified else None,
            "points": self.get_points_from_stat(stat, grouping_type, group_id),
            "win_count": stat.finish_counts[1],
            "highest_finish": min(stat.finish_counts.keys()) if stat.finish_counts else None,
            "finish_string": "",
            "is_eligible": is_eligible,
            "adjustment_type": self.get_adjustment(grouping_type, group_id).adjustment,
        }
        if grouping_type == Group.DRIVER:
            return DriverChampionship(driver_id=group_id, **kwargs)
        elif grouping_type == Group.TEAM:
            return TeamChampionship(team_id=group_id, **kwargs)
        else:
            raise NotImplementedError()

    def stats_to_group_standings(
        self, stats: dict[int, Stats], grouping_type: Group
    ) -> list[TeamChampionship] | list[DriverChampionship]:
        for group_id, stat in stats.items():
            adjustment = self.get_adjustment(grouping_type, group_id)
            if adjustment.adjustment == ChampionshipAdjustmentType.POINT_DEDUCTION and adjustment.points:
                stats[group_id] = stat.with_point_adjustment(-adjustment.points)

        ordered_stats = sorted(stats.items(), key=lambda t: t[1], reverse=True)
        standings = []

        position = 1
        draw_count = -1
        last_stat = None
        for group_id, stat in ordered_stats:
            # Increment Position
            if self.is_stat_disqualified_from_standings(grouping_type, group_id):
                pass
            elif last_stat is None or stat < last_stat:
                position += 1 + draw_count
                draw_count = 0
            elif stat == last_stat:
                draw_count += 1
            else:
                raise NotImplementedError()

            if grouping_type == Group.DRIVER or grouping_type == Group.TEAM:
                standing = self.create_group_standing(grouping_type, group_id, stat, position)

            standings.append(standing)
        return standings  # type: ignore

    @overload
    def generate_standings(self, grouping_type: Literal[Group.DRIVER]) -> list[DriverChampionship]:
        ...

    @overload
    def generate_standings(self, grouping_type: Literal[Group.TEAM]) -> list[TeamChampionship]:
        ...

    def generate_standings(self, grouping_type: Group) -> list:
        ordered_sessions = sorted(self.session_datas, key=lambda x: (x.round_number, x.session_number))

        stats_by_group: dict[int, Stats] = {}
        season_standings: list = []
        for session, next_session in zip(ordered_sessions, [*ordered_sessions[1:], None]):
            new_stats = session.stats_by_group(grouping_type, self.aggregate_by_grouping[grouping_type])
            for group_id in {*stats_by_group, *new_stats}:
                stats_by_group[group_id] = stats_by_group.get(group_id, Stats()) + new_stats.get(group_id, Stats())

            standings = self.stats_to_group_standings(stats_by_group, grouping_type)
            for standing in standings:
                standing.session_id = session.session_id
                standing.round_number = session.round_number
                standing.session_number = session.session_number
                if next_session is None or session.round_number != next_session.round_number:
                    # Last point scoring session of round
                    standing.round_id = session.round_id
                if next_session is None:
                    # Last point scoring session of season
                    standing.season_id = self.season_id
            season_standings.extend(standings)
        return season_standings
