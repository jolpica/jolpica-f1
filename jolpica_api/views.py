from datetime import datetime

from django.http import JsonResponse
from django.http.request import HttpRequest
from django_ratelimit.decorators import ratelimit


def healthcheck(request: HttpRequest):
    return JsonResponse(data={"status": "OK"}, status=200)


def ratelimited_error(request: HttpRequest, exception):
    return JsonResponse(data={"error": "ratelimited"}, status=429)


@ratelimit(group="test", key="user_or_ip", rate="1/s", block=False)
@ratelimit(group="test", key="user_or_ip", rate="10/m", block=True)
def test(request: HttpRequest):
    try:
        return JsonResponse(
            data={
                "timestamp": datetime.now(),
                "REMOTE_ADDR": request.META["REMOTE_ADDR"],
                "HTTP_X_FORWARDED_FOR": request.META.get("HTTP_X_FORWARDED_FOR", ""),
                "ratelimited": getattr(request, "limited", False),
            },
            status=200,
        )
    except Exception as ex:
        return JsonResponse({"error": repr(ex)})
