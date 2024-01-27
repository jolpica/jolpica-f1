from django.http import JsonResponse


def healthcheck(request):
    return JsonResponse(data={"status": "OK"}, status=200)
