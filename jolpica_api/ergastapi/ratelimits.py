from __future__ import annotations

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from rest_framework.request import Request


def long_ratelimit(group, request: Request) -> tuple[int, int] | None:
    if request.user.is_anonymous:
        if group == "ergast":
            return (500, 60 * 60)
    return None


def short_ratelimit(group, request: Request) -> tuple[int, int] | None:
    if request.user.is_anonymous:
        if group == "ergast":
            return (4, 1)
    return None
