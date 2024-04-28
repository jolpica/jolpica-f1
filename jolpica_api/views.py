from datetime import datetime

from django.http import JsonResponse
from django.http.request import HttpRequest


def healthcheck(request: HttpRequest):
    return JsonResponse(data={"status": "OK"}, status=200)


def test(request: HttpRequest):
    try:
        return JsonResponse(
            data={
                "timestamp": datetime.now(),
                "REMOTE_ADDR": request.META["REMOTE_ADDR"],
                "HTTP_X_FORWARDED_FOR": request.META.get("HTTP_X_FORWARDED_FOR", ""),
            },
            status=200,
        )
    except Exception as ex:
        return JsonResponse({"error": repr(ex)})
