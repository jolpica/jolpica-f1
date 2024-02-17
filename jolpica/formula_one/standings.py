from __future__ import annotations

from collections import Counter
from dataclasses import dataclass, field
from typing import Literal

from .models import SessionEntry


@dataclass()
class EntryData:
    round_number: int
    session_number: int

    driver_id: int
    team_id: int

    points: float | None
    position: int | None
    is_classified: bool | None

    def get_key_from_grouping_type(self, grouping_type: Literal["DRIVER", "TEAM"]) -> int:
        if grouping_type == "DRIVER":
            return self.driver_id
        elif grouping_type == "TEAM":
            return self.team_id
        raise ValueError("Unrecognised grouping type")

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


class PositionData:
    finish_map: Counter[int]
    unclassified_map: Counter[int]

    def __init__(self, finish_map: dict, retirement_map: dict) -> None:
        self.finish_map = Counter(finish_map)
        self.unclassified_map = Counter(retirement_map)

    @staticmethod
    def from_position(position, is_classified=False):
        if position is None or is_classified is None:
            return PositionData({}, {})
        elif is_classified:
            return PositionData(Counter([position]), {})
        else:
            return PositionData({}, Counter([position]))

    def __add__(self, other):
        if not isinstance(other, PositionData):
            raise NotImplementedError()

        finishes = Counter(self.finish_map)
        finishes.update(other.finish_map)
        unclassifieds = Counter(self.unclassified_map)
        unclassifieds.update(other.unclassified_map)

        return PositionData(finishes, unclassifieds)


@dataclass(order=True)
class SessionData:
    round_number: int
    session_number: int

    entry_datas: list[EntryData] = field(compare=False)

    def group_data_by(self, grouping_type: Literal["DRIVER", "TEAM"]) -> dict[int, list[EntryData]]:
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
            key = entry_data.get_key_from_grouping_type(grouping_type)
            if key in data:
                data[key].append(entry_data)
            else:
                data[key] = [entry_data]
        return data

    def points_by_group(
        self, grouping_type: Literal["DRIVER", "TEAM"], aggregate: Literal["SUM", "BEST"]
    ) -> dict[int, float]:
        """Get a mapping of points by driver or team for the session.

        Args:
            grouping_type: What to get points by: DRIVER or TEAM
            aggregate: How to aggregate multiple points values in a group: SUM or BEST

        Raises:
            ValueError: Invalid grouping_type or aggregate

        Returns:
            Mapping of group id to points for this session
        """
        data_map = self.group_data_by(grouping_type)

        point_map = {}
        for key, entries in data_map.items():
            if aggregate == "SUM":
                point_map[key] = sum(entry.points for entry in entries if entry.points)
            elif aggregate == "BEST":
                points_list = list(entry.points for entry in entries if entry.points)
                point_map[key] = max(points_list) if points_list else 0
            else:
                raise ValueError("Invalid aggregate")
        return point_map

    def position_by_group(
        self, grouping_type: Literal["DRIVER", "TEAM"], aggregate: Literal["SUM", "BEST"]
    ) -> dict[int, PositionData]:
        data_map = self.group_data_by(grouping_type)

        position_map = {}
        for key, entries in data_map.items():
            position_datas = map(lambda x: PositionData.from_position(x.position, x.is_classified), entries)
            if aggregate == "SUM":
                position_map[key] = sum(position_datas, start=PositionData({}, {}))
            elif aggregate == "BEST":
                position_map[key] = max(position_datas)

        return position_map


class SeasonData:
    session_datas: list


def generate_standings(data: list):
    pass
