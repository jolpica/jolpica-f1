from __future__ import annotations

from collections import Counter
from dataclasses import dataclass, field
from typing import Literal

from .models import ChampionshipAdjustmentType, Season, Session, SessionEntry
from .models.managed_views import DriverChampionship


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
    points: float
    finish_counts: Counter[int]
    unclassified_counts: Counter[int]

    def __init__(
        self,
        points: float | None = None,
        finish_counts: dict | list | None = None,
        unclassified_counts: dict | list | None = None,
    ) -> None:
        self.points = 0 if points is None else points
        self.finish_counts = Counter(finish_counts)
        self.unclassified_counts = Counter(unclassified_counts)

    @staticmethod
    def from_position(position, is_classified=False):
        if position is None or is_classified is None:
            return Stats(0, {}, {})
        elif is_classified:
            return Stats(0, Counter([position]), {})
        else:
            return Stats(0, {}, Counter([position]))

    @staticmethod
    def from_entry(entry: SessionEntry):
        finishes, unclassifies = [], []
        if entry.position is not None:
            if entry.is_classified is True:
                finishes.append(entry.position)
            elif entry.is_classified is False:
                unclassifies.append(entry.position)
        return Stats(entry.points, finishes, unclassifies)

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

        finishes = Counter(self.finish_counts)
        finishes.update(other.finish_counts)
        unclassifieds = Counter(self.unclassified_counts)
        unclassifieds.update(other.unclassified_counts)

        return Stats(self.points + other.points, finishes, unclassifieds)


@dataclass(order=True)
class SessionData:
    round_number: int
    session_number: int

    entry_datas: list[EntryData] = field(compare=False)
    session_id: int
    round_id: int

    @classmethod
    def from_session(cls, session: Session, round_number: int) -> SessionData:
        entry_datas = [EntryData.from_session_entry(entry) for entry in session.session_entries.all()]
        if session.number is None:
            raise ValueError("Session must have non-null number")

        return cls(
            round_number=round_number,
            session_number=session.number,
            entry_datas=entry_datas,
            session_id=session.id,
            round_id=session.round_id,
        )

    def group_data_by(self, grouping_type: Literal["DRIVER", "TEAM"]) -> dict[int, list[EntryData]]:
        """Group all entry data by driver_id or team_id.

        Args:
            grouping_type: What to group by

        Raises:
            ValueError for invalid grouping_type

        Returns:
            Mapping of driver_id/team_id to entry data.
        """
        if grouping_type not in {"DRIVER", "TEAM"}:
            raise ValueError("Unrecognised grouping type")
        data: dict[int, list[EntryData]] = {}
        for entry_data in self.entry_datas:
            key = entry_data.driver_id if grouping_type == "DRIVER" else entry_data.team_id
            if key in data:
                data[key].append(entry_data)
            else:
                data[key] = [entry_data]
        return data

    def stats_by_group(
        self, grouping_type: Literal["DRIVER", "TEAM"], aggregate: Literal["SUM", "BEST"]
    ) -> dict[int, Stats]:
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
            stats = map(lambda x: Stats.from_entry(x), entries)
            if aggregate == "SUM":
                stat_map[key] = sum(stats, start=Stats(0, {}, {}))
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
    driver_adjustments: dict[int, ChampionshipAdjustmentType] = field(default_factory=dict)

    @classmethod
    def from_season(cls, season: Season) -> SeasonData:
        session_datas = []
        for round in season.rounds.all():
            if round.number is None:
                continue
            for session in round.sessions.filter(
                point_system__gt=1
            ):  # Assumption that point system 1 is only non-point
                if session.number is None:
                    continue
                session_datas.append(SessionData.from_session(session, round.number))
        return cls(
            season_year=season.year,
            session_datas=session_datas,
            season_id=season.id,
            # TODO: driver_adjustments =
        )

    def is_stat_eligible_for_standings(self, stat: Stats) -> bool:
        """Return True if the stat has met the baseline for inclusion in standings"""
        return bool(stat.finish_counts)

    def is_stat_disqualified_from_standings(self, adjustment: ChampionshipAdjustmentType) -> bool:
        """Return True if this driver/team should be exclused from standings"""
        return adjustment != ChampionshipAdjustmentType.NONE

    def stats_to_driver_standings(self, stats: dict[int, Stats]) -> list[DriverChampionship]:
        order = sorted(stats.items(), key=lambda t: t[1], reverse=True)
        standings = []

        position = 1
        draw_count = -1
        last_stat = None
        for group_id, stat in order:
            adjustment = self.driver_adjustments.get(group_id, ChampionshipAdjustmentType.NONE)
            if ChampionshipAdjustmentType.EXCLUDED == adjustment:
                pass
            elif last_stat is None or stat < last_stat:
                position += 1 + draw_count
                draw_count = 0
            elif stat == last_stat:
                draw_count += 1
            else:
                raise NotImplementedError()

            is_eligible = self.is_stat_eligible_for_standings(stat)
            is_disqualified = self.is_stat_disqualified_from_standings(adjustment)

            standing = DriverChampionship(
                driver_id=group_id,
                year=self.season_year,
                position=position if is_eligible and not is_disqualified else None,
                points=stat.points,
                win_count=stat.finish_counts[1],
                highest_finish=min(stat.finish_counts.keys()) if stat.finish_counts else None,
                finish_string="",
                is_eligible=is_eligible,
                adjustment_type=adjustment,
            )
            standings.append(standing)
        return standings

    def generate_standings(self):
        ordered_sessions = sorted(self.session_datas, key=lambda x: (x.round_number, x.session_number))

        stats_by_driver = {}
        season_standings = []
        for session, next_session in zip(ordered_sessions, [*ordered_sessions[1:], None]):
            new_stats = session.stats_by_group("DRIVER", "BEST")
            for driver in {*stats_by_driver, *new_stats}:
                stats_by_driver[driver] = stats_by_driver.get(driver, Stats()) + new_stats.get(driver, Stats())

            standings = self.stats_to_driver_standings(stats_by_driver)
            for standing in standings:
                standing.session_id = session.session_id
                standing.round_number = session.round_number
                # standing.session_number = session.session_number
                if next_session is None or session.round_number != next_session.round_number:
                    # Last point scoring session of round
                    standing.round_id = session.round_id
                if next_session is None:
                    # Last point scoring session of season
                    standing.season_id = self.season_id
            season_standings.extend(standings)
        return season_standings


def generate_standings(data: list):
    pass
