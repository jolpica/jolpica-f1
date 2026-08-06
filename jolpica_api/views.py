from datetime import datetime

from django.core.cache import cache
from django.db import connection
from django.http import JsonResponse
from django.http.request import HttpRequest
from django_ratelimit.decorators import ratelimit

from jolpica_api import settings


def healthcheck(request: HttpRequest):
    return JsonResponse(data={"status": "OK"}, status=200)


def _database_is_available() -> bool:
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1")
    except Exception:
        return False

    return True


def _cache_is_available() -> bool:
    try:
        cache.get("service-status")
    except Exception:
        return False

    return True


def service_status(request: HttpRequest):
    database_available = _database_is_available()
    cache_available = _cache_is_available()
    is_available = database_available and cache_available

    return JsonResponse(
        data={"status": "OK" if is_available else "DEGRADED"},
        status=200,
    )


def ratelimited_error(request: HttpRequest, exception):
    return JsonResponse(
        data={
            "error": "ratelimited",
        },
        status=429,
    )


@ratelimit(group="test", key="user_or_ip", rate="2/10s", block=False)
def test(request: HttpRequest):
    try:
        return JsonResponse(
            data={
                "timestamp": datetime.now(),
                "REMOTE_ADDR": request.META["REMOTE_ADDR"],
                "HTTP_X_FORWARDED_FOR": request.META.get("HTTP_X_FORWARDED_FOR", ""),
                "ratelimited": getattr(request, "limited", False),
                "user": str(request.user),
                "v": settings.VERSION,
            },
            status=200,
        )
    except Exception as ex:
        return JsonResponse({"error": repr(ex)})
