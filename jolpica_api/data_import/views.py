from collections import defaultdict

from django.contrib.auth.models import User
from pydantic import BaseModel, Field, ValidationError
from rest_framework.permissions import IsAdminUser, IsAuthenticated
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

from jolpica.formula_one.importer.deserialisers import DeserialisationResult
from jolpica.formula_one.importer.importer import JSONModelImporter
from jolpica.formula_one.importer.json_models import F1Import

from .models import DataImportLog


class ImportDataRequestData(BaseModel):
    # If True, the data will be validated but not saved to the database
    dry_run: bool = True

    # If True, provisions to be compatible with legacy existing data will be used.
    # Should never be used for data from 2025 onwards.
    legacy_import: bool = False

    # Short description of what the import contains
    description: str = Field("", max_length=255)

    data: list[F1Import] = Field(min_length=1)


class ImportData(APIView):
    permission_classes = [IsAuthenticated, IsAdminUser]

    def put(self, request: Request) -> Response:
        if request.user.is_anonymous or not request.user.is_staff:
            return Response(status=401)
        try:
            request_data = ImportDataRequestData.model_validate(request.data)
        except ValidationError as ex:
            errors = ex.errors(include_url=False)
            DataImportLog(user=request.user, is_success=False, error_type="VALIDATION", errors=errors).save()
            return Response({"errors": errors}, status=400)

        model_importer = JSONModelImporter(legacy_import=request_data.legacy_import)
        result = model_importer.deserialise_all(request.data["data"])

        if not result.success:
            DataImportLog(
                description=request_data.description,
                user=request.user,
                is_success=False,
                error_type="DESERIALISATION",
                errors=result.errors,
            ).save()
            return Response({"errors": result.errors}, status=400)

        if not request_data.dry_run:
            try:
                model_importer.save_deserialisation_result_to_db(result)
            except Exception as ex:
                DataImportLog(
                    description=request_data.description,
                    user=request.user,
                    is_success=False,
                    error_type="IMPORT",
                    errors=[repr(ex)],
                ).save()
                return Response({"errors": [{"type": "import_error", "message": repr(ex)}]}, status=400)

            save_successful_import_to_db(request_data.description, request.user, result)
        return Response({})


def save_successful_import_to_db(description: str, user: User | None, result: DeserialisationResult) -> None:
    updated_record_count = 0
    updated_records = defaultdict(list)
    for model_import, instances in result.instances.items():
        instance_pks = [ins.pk for ins in instances]
        updated_record_count += len(instance_pks)
        updated_records[model_import.model_class.__name__].extend(instance_pks)

    DataImportLog(
        description=description,
        user=user,
        is_success=True,
        total_records=updated_record_count,
        updated_records=updated_records,
    ).save()
