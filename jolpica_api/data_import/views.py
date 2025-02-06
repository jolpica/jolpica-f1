from pydantic import BaseModel, ValidationError
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView

from jolpica.formula_one.importer.importer import JSONModelImporter


class ImportDataRequestData(BaseModel):
    dry_run: bool = True
    data: list


class ImportData(APIView):
    def post(self, request: Request) -> Response:
        try:
            request_data = ImportDataRequestData.model_validate(request.data)
        except ValidationError as ex:
            return Response({"errors": ex.errors(include_url=False, include_input=False)}, status=400)

        results = JSONModelImporter().deserialise_all(request_data.data)

        deserialisation_errors = []
        instances = []
        for res in results:
            if res.has_failure:
                deserialisation_errors.extend(res.get_unique_failure_reasons())
            instances.extend(res.models)
        if deserialisation_errors:
            return Response({"errors": deserialisation_errors}, status=400)

        if not request_data.dry_run and request.user.is_staff:
            for ins in instances:
                ins.save()

        return Response({"instances": [repr(ins) for ins in instances]})
