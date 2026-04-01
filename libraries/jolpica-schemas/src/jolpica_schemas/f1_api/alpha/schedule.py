from pydantic import BaseModel

from .metadata import DetailResponse, PaginatedResponse
from .shared import Circuit, FullSession, Round, Season


class ScheduleFullSession(FullSession):
    pass


class ScheduleEvent(BaseModel):
    round: Round
    circuit: Circuit
    schedule: list[ScheduleFullSession]


class ScheduleRoundInfoDetail(BaseModel):
    number: int
    index: int


class ScheduleRoundsInfo(BaseModel):
    next: ScheduleRoundInfoDetail | None = None
    previous: ScheduleRoundInfoDetail | None = None


class ScheduleSummary(Season):
    pass


class Schedule(ScheduleSummary):
    rounds_info: ScheduleRoundsInfo | None = None
    events: list[ScheduleEvent]


class ScheduleResponse(DetailResponse[Schedule]):
    """Schema for season schedule detail responses"""


class ListSchedulesResponse(PaginatedResponse[list[ScheduleSummary]]):
    """Schema for season schedule list responses"""
