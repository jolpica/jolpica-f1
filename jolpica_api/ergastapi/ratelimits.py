from __future__ import annotations

from typing import TYPE_CHECKING

from django_ratelimit.core import is_ratelimited
from rest_framework.request import Request
from rest_framework.throttling import BaseThrottle
from rest_framework.views import APIView

if TYPE_CHECKING:
    from rest_framework.request import Request


class RatelimitThrottle(BaseThrottle):
    group = None

    def get_ratelimit(self, request: Request, view: APIView) -> tuple[int, int] | None:
        """Get the allowed rate limit for the request

        Returns:
            tuple: 2-tuple of requests allowed, and timeframe in seconds
        """
        raise NotImplementedError(".get_ratelimit must be overridden")

    def allow_request(self, request: Request, view: APIView) -> bool:
        ratelimit = self.get_ratelimit(request, view)

        return not is_ratelimited(
            request=request,
            group=self.group,
            key="user_or_ip",
            rate=ratelimit,
            increment=True,
        )


class ErgastLongThrottle(RatelimitThrottle):
    group = "ergast"

    def get_ratelimit(self, request: Request, view: APIView) -> tuple[int, int]:
        if request.user.is_anonymous:
            # 500 per hour
            return (500, 60 * 60)
        return None


class ErgastShortThrottle(RatelimitThrottle):
    group = "ergast"

    def get_ratelimit(self, request: Request, view: APIView) -> tuple[int, int]:
        if request.user.is_anonymous:
            # 4 per second
            return (1, 10)
        return None
