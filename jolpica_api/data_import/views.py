from pydantic import BaseModel, ValidationError
from rest_framework.permissions import IsAdminUser
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

from jolpica.formula_one.importer.importer import JSONModelImporter


class ImportDataRequestData(BaseModel):
    dry_run: bool = True
    data: list


class ImportData(APIView):
    permission_classes = [IsAdminUser]

    def put(self, request: Request) -> Response:
        try:
            request_data = ImportDataRequestData.model_validate(request.data)
        except ValidationError as ex:
            return Response({"errors": ex.errors(include_url=False, include_input=False)}, status=400)

        result = JSONModelImporter().deserialise_all(request_data.data)

        if not result.success:
            return Response({"errors": result.errors}, status=400)

        if not request_data.dry_run and request.user.is_staff:
            for model_import, instances in result.instances.items():
                for ins in instances:
                    model_import.model_class.objects.update_or_create(
                        **{field: getattr(ins, field) for field in model_import.unique_fields},
                        defaults={field: getattr(ins, field) for field in model_import.update_fields},
                    )

        return Response({})
