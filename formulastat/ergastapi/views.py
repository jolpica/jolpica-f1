from rest_framework import permissions, viewsets

from formulastat.formula_one.models import Season

from . import pagination, serializers


class SeasonViewSet(viewsets.ModelViewSet):
    queryset = Season.objects.all().order_by("year")
    serializer_class = serializers.SeasonSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = pagination.ErgastAPIPagination
