from __future__ import annotations

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
        del value["_type"]
        return TimedeltaModel(**value).to_timedelta()
    return value


class HasRoundForeignKey(F1ForeignKeysSchema):
    year: int
    round: int


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


class DriverForeignKeys(F1ForeignKeysSchema):
    pass  # Driver has No Foreign Keys


class DriverObject(F1ObjectSchema):
    reference: str | None = None
    forename: str | None = None
    surname: str | None = None
    abbreviation: str | None = None
    nationality: str | None = None
    permanent_car_number: PositiveInt | None = None
    date_of_birth: date | None = None
    wikipedia: HttpUrl | None = None


class DriverImport(F1ImportSchema):
    object_type: Literal["Driver"]
    foreign_keys: DriverForeignKeys
    objects: list[DriverObject] = Field(min_length=1)


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
    DriverImport | RoundEntryImport | SessionEntryImport | LapImport | PitStopImport, Field(discriminator="object_type")
]

type F1Object = DriverObject | RoundEntryObject | SessionEntryObject | LapObject | PitStopObject
type F1ForeignKeys = (
    DriverForeignKeys | RoundEntryForeignKeys | SessionEntryForeignKeys | LapForeignKeys | PitStopForeignKeys
)
