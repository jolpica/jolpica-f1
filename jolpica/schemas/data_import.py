from __future__ import annotations

import datetime
from collections.abc import Sequence
from datetime import date, timedelta
from typing import Annotated, Any, Literal

from pydantic import (
    BaseModel,
    BeforeValidator,
    ConfigDict,
    Field,
    HttpUrl,
    NonNegativeFloat,
    NonNegativeInt,
    PositiveFloat,
    PositiveInt,
)


class F1ImportSchema(BaseModel):
    model_config = ConfigDict(extra="forbid")
    object_type: str
    foreign_keys: F1ForeignKeys
    objects: Sequence[F1Object] = Field(min_length=1)


class F1ForeignKeysSchema(BaseModel):
    model_config = ConfigDict(extra="forbid")


class F1ObjectSchema(BaseModel):
    model_config = ConfigDict(extra="forbid")


class TimedeltaModel(BaseModel):
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
        return TimedeltaModel(**{key: val for key, val in value.items() if key != "_type"}).to_timedelta()
    return value


# class PointModel(BaseModel):
#     model_config = ConfigDict(extra="forbid")
#     x: float
#     y: float
#     srid: int = 4326

#     def to_point(self) -> Point:
#         return Point(**self.model_dump())


# def mutate_point_from_dict(value: Any) -> Any:
#     if isinstance(value, dict) and value.get("_type") == "point":
#         return PointModel(**{key: val for key, val in value.items() if key != "_type"}).to_point()
#     return value


class HasSeasonForeignKey(F1ForeignKeysSchema):
    year: int


class HasRoundForeignKey(F1ForeignKeysSchema):
    year: int
    round: int


class HasTeamForeignKey(F1ForeignKeysSchema):
    team_reference: str


class HasDriverForeignKey(F1ForeignKeysSchema):
    driver_reference: str


class HasTeamDriverForeignKey(F1ForeignKeysSchema):
    year: int
    driver_reference: str
    team_reference: str


class HasSessionForeignKey(F1ForeignKeysSchema):
    year: int
    round: int
    session: str


class HasRoundEntryForeignKey(F1ForeignKeysSchema):
    year: int
    round: int
    car_number: int


class HasSessionEntryForeignKey(F1ForeignKeysSchema):
    year: int
    round: int
    session: str
    car_number: int


class HasLapForeignKey(HasSessionEntryForeignKey):
    lap: int


class CircuitForeignKeys(F1ForeignKeysSchema):
    pass  # Circuit has No Foreign Keys


class CircuitObject(F1ObjectSchema):
    model_config = ConfigDict(extra="forbid", arbitrary_types_allowed=True)
    reference: str | None = None
    name: str | None = None
    locality: str | None = None
    country: str | None = None
    country_code: str | None = Field(None, max_length=3)
    # location: Annotated[Point | None, BeforeValidator(mutate_point_from_dict)] = None
    altitude: float | None = None
    wikipedia: HttpUrl | None = None


class CircuitImport(F1ImportSchema):
    object_type: Literal["Circuit"]
    foreign_keys: CircuitForeignKeys
    objects: list[CircuitObject] = Field(min_length=1)


class TeamForeignKeys(F1ForeignKeysSchema):
    pass  # Team has No Foreign Keys


class TeamObject(F1ObjectSchema):
    reference: str | None = None
    name: str | None = None
    nationality: str | None = None
    country_code: str | None = Field(None, max_length=3)
    wikipedia: HttpUrl | None = None


class TeamImport(F1ImportSchema):
    object_type: Literal["Team"]
    foreign_keys: TeamForeignKeys
    objects: list[TeamObject] = Field(min_length=1)


class DriverForeignKeys(F1ForeignKeysSchema):
    pass  # Driver has No Foreign Keys


class DriverObject(F1ObjectSchema):
    reference: str | None = None
    forename: str | None = None
    surname: str | None = None
    abbreviation: str | None = None
    nationality: str | None = None
    country_code: str | None = Field(None, max_length=3)
    permanent_car_number: PositiveInt | None = None
    date_of_birth: date | None = None
    wikipedia: HttpUrl | None = None


class DriverImport(F1ImportSchema):
    object_type: Literal["Driver"]
    foreign_keys: DriverForeignKeys
    objects: list[DriverObject] = Field(min_length=1)


class TeamDriverForeignKeys(HasSeasonForeignKey, HasTeamForeignKey, HasDriverForeignKey):
    pass


class TeamDriverObject(F1ObjectSchema):
    role: Literal[0, 1, 2] | None = None


class TeamDriverImport(F1ImportSchema):
    object_type: Literal["TeamDriver"]
    foreign_keys: TeamDriverForeignKeys
    objects: list[TeamDriverObject] = Field(min_length=1)


class RoundForeignKeys(HasSeasonForeignKey):
    pass


class RoundObject(F1ObjectSchema):
    number: PositiveInt | None = None
    name: str | None = None
    date: datetime.date | None = None
    race_number: PositiveInt | None = None
    wikipedia: HttpUrl | None = None
    is_cancelled: bool | None = None


class RoundImport(F1ImportSchema):
    object_type: Literal["Round"]
    foreign_keys: RoundForeignKeys
    objects: list[RoundObject] = Field(min_length=1)


class RoundEntryForeignKeys(HasRoundForeignKey, HasTeamDriverForeignKey):
    pass


class RoundEntryObject(F1ObjectSchema):
    car_number: PositiveInt | None = None


class RoundEntryImport(F1ImportSchema):
    object_type: Literal["RoundEntry"]
    foreign_keys: RoundEntryForeignKeys
    objects: list[RoundEntryObject] = Field(min_length=1)


class SessionEntryForeignKeys(HasSessionForeignKey, HasRoundEntryForeignKey):
    pass


class SessionEntryObject(F1ObjectSchema):
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


class SessionEntryImport(F1ImportSchema):
    object_type: Literal["SessionEntry"]
    foreign_keys: SessionEntryForeignKeys
    objects: list[SessionEntryObject] = Field(min_length=1)


class LapForeignKeys(HasSessionEntryForeignKey):
    pass


class LapObject(F1ObjectSchema):
    number: PositiveInt | None = None
    position: PositiveInt | None = None
    time: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    average_speed: PositiveFloat | None = None
    is_entry_fastest_lap: bool | None = None
    is_deleted: bool | None = None


class LapImport(F1ImportSchema):
    object_type: Literal["Lap", "lap"]
    foreign_keys: LapForeignKeys
    objects: list[LapObject] = Field(min_length=1)


class PitStopForeignKeys(HasLapForeignKey):
    pass


class PitStopObject(F1ObjectSchema):
    number: PositiveInt | None = None
    duration: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    local_timestamp: str | None = None


class PitStopImport(F1ImportSchema):
    object_type: Literal["PitStop", "pit_stop"]
    foreign_keys: PitStopForeignKeys
    objects: list[PitStopObject] = Field(min_length=1)


type F1Import = Annotated[
    RoundImport
    | CircuitImport
    | TeamDriverImport
    | TeamImport
    | DriverImport
    | RoundEntryImport
    | SessionEntryImport
    | LapImport
    | PitStopImport,
    Field(discriminator="object_type"),
]

type F1Object = (
    RoundObject
    | CircuitObject
    | TeamDriverObject
    | TeamObject
    | DriverObject
    | RoundEntryObject
    | SessionEntryObject
    | LapObject
    | PitStopObject
)
type F1ForeignKeys = (
    RoundForeignKeys
    | CircuitForeignKeys
    | TeamDriverForeignKeys
    | TeamForeignKeys
    | DriverForeignKeys
    | RoundEntryForeignKeys
    | SessionEntryForeignKeys
    | LapForeignKeys
    | PitStopForeignKeys
)
