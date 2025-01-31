from pydantic import BaseModel, ValidationError
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView


class ImportDataRequestData(BaseModel):
    mode: str
    data: list


class ImportData(APIView):
    def post(self, request: Request) -> Response:
        try:
            request_data = ImportDataRequestData.model_validate(request.data)
        except ValidationError as ex:
            return Response({"error": ex.errors(include_url=False, include_input=False)}, status=400)
        return Response({"message": request_data})
