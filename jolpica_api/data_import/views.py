from django.conf import settings
from django.contrib.auth.models import User
from django.db import transaction
from pydantic import BaseModel, ConfigDict, Field, ValidationError
from rest_framework.permissions import BasePermission
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

from jolpica.formula_one.importer.deserialisers import DeserialisationResult
from jolpica.formula_one.importer.importer import JSONModelImporter
from jolpica.schemas.data_import import F1Import

from .models import DataImportLog


class DryRunError(Exception):
    pass


class ImportDataRequestData(BaseModel):
    model_config = ConfigDict(extra="forbid")
    # If True, the data will be validated but not saved to the database
    dry_run: bool = True

    # If True, provisions to be compatible with legacy existing data will be used.
    # Should never be used for data from 2025 onwards.
    legacy_import: bool = False

    # Short description of what the import contains
    description: str = Field("", max_length=255)

    data: list[F1Import] = Field(min_length=1)


class CanImportDataPermission(BasePermission):
    """
    Allows access only to users with the 'can_import_f1_data' permission for PUT requests,
    or if the user is a site admin (is_superuser).
    """

    def has_permission(self, request, view):
        if request.method == "PUT":
            user = request.user
            return user.is_authenticated and (user.has_perm("data_import.can_import_f1_data") or user.is_superuser)
        return False


class ImportData(APIView):
    permission_classes = [CanImportDataPermission]

    def put(self, request: Request) -> Response:
        if request.user.is_anonymous:
            return Response({"detail": "Authentication credentials were not provided."}, status=401)
        try:
            request_data = ImportDataRequestData.model_validate(request.data)
        except ValidationError as ex:
            errors: list = ex.errors(include_url=False)
            dry_run = request.data.get("dry_run", True)
            log_data_import_result(
                request.user,
                dry_run=dry_run if isinstance(dry_run, bool) else True,
                error_type="VALIDATION",
                errors=errors,
            )
            return Response({"errors": errors}, status=400)

        model_importer = JSONModelImporter(legacy_import=request_data.legacy_import)
        result = model_importer.deserialise_all(request.data["data"])

        if not result.success:
            log_data_import_result(
                request.user,
                dry_run=request_data.dry_run,
                description=request_data.description,
                error_type="DESERIALISATION",
                errors=result.errors,
            )
            return Response({"errors": result.errors}, status=400)

        try:
            import_stats = save_deserialisation_result_to_db(result, request_data.dry_run)
        except Exception as ex:
            errors = [{"type": "import_error", "message": repr(ex), "notes": getattr(ex, "__notes__", None)}]
            log_data_import_result(
                request.user,
                dry_run=request_data.dry_run,
                description=request_data.description,
                error_type="IMPORT",
                errors=errors,
            )
            return Response({"errors": errors}, status=400)

        log_data_import_result(
            request.user, dry_run=request_data.dry_run, description=request_data.description, import_stats=import_stats
        )
        return Response(import_stats)


def save_deserialisation_result_to_db(result: DeserialisationResult, dry_run: bool) -> dict:
    try:
        with transaction.atomic():
            import_stats = JSONModelImporter.save_deserialisation_result_to_db(result)

            if dry_run:
                raise DryRunError("Transaction should be rolled back as this is a dry run")  # noqa: TRY301
    except DryRunError:
        pass  # Rollback the transaction, but keep import_stats
    return import_stats


def log_data_import_result(
    user: User,
    dry_run: bool,
    description: str = "",
    import_stats: dict | None = None,
    error_type: str | None = None,
    errors: list | None = None,
):
    DataImportLog(
        is_success=False if error_type else True,
        dry_run=dry_run,
        user=user,
        description=description,
        total_records=import_stats.get("total_count") if import_stats else None,
        import_result=import_stats,
        error_type=error_type,
        errors=errors,
        api_version=settings.VERSION,
    ).save()
