from pydantic import BaseModel, ValidationError
from rest_framework.permissions import IsAdminUser
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

from jolpica.formula_one.importer.importer import JSONModelImporter


class ImportDataRequestData(BaseModel):
    # If True, the data will be validated but not saved to the database
    dry_run: bool = True

    # If True, provisions to be compatible with legacy existing data will be used.
    # Should never be used for data from 2025 onwards.
    legacy_import: bool = False

    data: list


class ImportData(APIView):
    permission_classes = [IsAdminUser]

    def put(self, request: Request) -> Response:
        try:
            request_data = ImportDataRequestData.model_validate(request.data)
        except ValidationError as ex:
            return Response({"errors": ex.errors(include_url=False, include_input=False)}, status=400)

        model_importer = JSONModelImporter(legacy_import=request_data.legacy_import)
        result = model_importer.deserialise_all(request_data.data)

        if not result.success:
            return Response({"errors": result.errors}, status=400)

        if not request_data.dry_run and request.user.is_staff:
            model_importer.save_deserialisation_result_to_db(result)

        return Response({})
