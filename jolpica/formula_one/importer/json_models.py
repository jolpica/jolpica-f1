from collections.abc import Sequence
from datetime import timedelta
from typing import Annotated, Any, Literal

from pydantic import (
    BaseModel,
    BeforeValidator,
    ConfigDict,
    Field,
    NonNegativeFloat,
    NonNegativeInt,
    PositiveFloat,
    PositiveInt,
)

type F1Import = Annotated[
    RoundEntryImport | SessionEntryImport | LapImport | PitStopImport, Field(discriminator="object_type")
]

type F1Object = RoundEntryObject | SessionEntryObject | LapObject | PitStopObject
type F1ForeignKeys = RoundEntryForeignKeys | SessionEntryForeignKeys | LapForeignKeys | PitStopForeignKeys


class F1ImportSchema(BaseModel):
    model_config = ConfigDict(extra="forbid")
    object_type: str
    foreign_keys: F1ForeignKeys
    objects: Sequence[F1Object]


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


class RoundEntryForeignKeys(HasRoundForeignKey, HasTeamDriverForeignKey):
    pass


class RoundEntryObject(F1ObjectSchema):
    car_number: PositiveInt | None = None


class RoundEntryImport(F1ImportSchema):
    object_type: Literal["RoundEntry"]
    foreign_keys: RoundEntryForeignKeys
    objects: list[RoundEntryObject]


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
    objects: list[SessionEntryObject]


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
    objects: list[LapObject]


class PitStopForeignKeys(HasLapForeignKey):
    pass


class PitStopObject(F1ObjectSchema):
    number: PositiveInt | None = None
    duration: Annotated[timedelta | None, BeforeValidator(mutate_timedelta_from_dict)] = None
    local_timestamp: str | None = None


class PitStopImport(F1ImportSchema):
    object_type: Literal["PitStop", "pit_stop"]
    foreign_keys: PitStopForeignKeys
    objects: list[PitStopObject]
