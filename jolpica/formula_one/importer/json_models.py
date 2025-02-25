from collections.abc import Sequence
from datetime import timedelta
from typing import Annotated, Any, Literal

from pydantic import (
    BaseModel,
    BeforeValidator,
    ConfigDict,
    NonNegativeFloat,
    NonNegativeInt,
    PositiveFloat,
    PositiveInt,
)


class TimedeltaDict(BaseModel):
    model_config = ConfigDict(extra="forbid")
    milliseconds: NonNegativeInt = 0
    seconds: NonNegativeInt = 0
    minutes: NonNegativeInt = 0
    hours: NonNegativeInt = 0
    days: NonNegativeInt = 0

    def to_timedelta(self) -> timedelta:
        return timedelta(**self.model_dump())


def mutate_timedelta_from_dict(value: Any) -> Any:
    if isinstance(value, dict) and value.get("_type") == "timedelta":
        del value["_type"]
        return TimedeltaDict(**value).to_timedelta()
    return value


class F1ForeignKeys(BaseModel):
    model_config = ConfigDict(extra="forbid")

    year: int | None = None
    round: int | None = None
    session: str | None = None
    driver_reference: str | None = None
    team_reference: str | None = None
    car_number: int | None = None
    lap: int | None = None


class F1Object(BaseModel):
    model_config = ConfigDict(extra="forbid")


class F1Import[O: F1Object](BaseModel):
    model_config = ConfigDict(extra="forbid")
    object_type: str
    foreign_keys: F1ForeignKeys
    objects: Sequence[O]


class RoundEntryForeignKeys(F1ForeignKeys):
    year: int
    round: int
    driver_reference: str
    team_reference: str


class RoundEntryObject(F1Object):
    car_number: PositiveInt | None = None


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
    position: PositiveInt | None = None
    is_classified: bool | None = None
    status: int | None = None
    detail: str | None = None
    points: NonNegativeFloat | None = None
    is_eligible_for_points: bool | None = None
    grid: PositiveInt | None = None
    time: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    fastest_lap_rank: PositiveInt | None = None
    laps_completed: NonNegativeInt | None = None


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
    number: PositiveInt | None = None
    position: PositiveInt | None = None
    time: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    average_speed: PositiveFloat | None = None
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
    number: PositiveInt | None = None
    duration: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    local_timestamp: str | None = None


class PitStopImport(F1Import):
    object_type: Literal["PitStop", "pit_stop"]
    foreign_keys: PitStopForeignKeys
    objects: list[PitStopObject]
