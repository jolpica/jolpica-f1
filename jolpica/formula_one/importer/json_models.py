from collections.abc import Sequence
from datetime import timedelta
from typing import Annotated, Any, Literal

from pydantic import BaseModel, BeforeValidator, ConfigDict


# TODO: Create more validators (e.g. points > 26 likely is an error)
def mutate_timedelta_from_dict(value: Any) -> Any:
    if isinstance(value, dict) and value.get("_type") == "timedelta":
        del value["_type"]
        for val in value.keys():
            if val not in {"milliseconds", "seconds", "minutes", "hours", "days"}:
                raise ValueError(f"{val} is not a valid field for timedelta")
        return timedelta(**value)
    return value


class F1ForeignKeys(BaseModel):
    model_config = ConfigDict(extra="forbid")


class F1Object(BaseModel):
    model_config = ConfigDict(extra="forbid")


class F1Import[T: F1Object, R: F1ForeignKeys](BaseModel):
    model_config = ConfigDict(extra="forbid")
    object_type: str
    foreign_keys: R
    objects: Sequence[T]


class RoundEntryForeignKeys(F1ForeignKeys):
    year: int
    round: int
    driver_reference: str
    team_reference: str


class RoundEntryObject(F1Object):
    car_number: int | None = None


class RoundEntryImport(F1Import):
    object_type: Literal["RoundEntry"]
    foreign_keys: RoundEntryForeignKeys
    objects: list[RoundEntryObject]


class SessionEntryForeignKeys(F1ForeignKeys):
    year: int
    round: int
    session: str
    car_number: int


class SessionEntryObject(F1Object):
    position: int | None = None
    is_classified: bool | None = None
    status: int | None = None
    detail: str | None = None
    points: int | None = None
    is_eligible_for_points: bool | None = None
    grid: int | None = None
    time: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    fastest_lap_rank: int | None = None
    laps_completed: int | None = None


class SessionEntryImport(F1Import):
    object_type: Literal["SessionEntry"]
    foreign_keys: SessionEntryForeignKeys
    objects: list[SessionEntryObject]


class LapForeignKeys(F1ForeignKeys):
    year: int
    round: int
    session: str
    car_number: int


class LapObject(F1Object):
    number: int | None = None
    position: int | None = None
    time: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    average_speed: float | None = None
    is_entry_fastest_lap: bool | None = None
    is_deleted: bool | None = None


class LapImport(F1Import):
    object_type: Literal["Lap", "lap"]
    foreign_keys: LapForeignKeys
    objects: list[LapObject]


class PitStopForeignKeys(F1ForeignKeys):
    year: int
    round: int
    session: str
    car_number: int
    lap: int


class PitStopObject(F1Object):
    number: int | None = None
    duration: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    local_timestamp: str | None = None


class PitStopImport(F1Import):
    object_type: Literal["PitStop", "pit_stop"]
    foreign_keys: PitStopForeignKeys
    objects: list[PitStopObject]
