import knox.views
from django.http.request import HttpRequest
from rest_framework.authentication import BasicAuthentication
from rest_framework.decorators import api_view
from rest_framework.response import Response


class LoginView(knox.views.LoginView):
    authentication_classes = [BasicAuthentication]


@api_view(["GET"])
def auth(request: HttpRequest):
    return Response(
        data={
            "user": str(request.user),
        },
        status=200,
    )
