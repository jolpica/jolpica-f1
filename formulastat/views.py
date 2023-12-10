from django.http import JsonResponse

from .settings import ALLOWED_HOSTS


def healthcheck(request):
    return JsonResponse(data={"status": "OK", "hosts": ALLOWED_HOSTS}, status=200)
