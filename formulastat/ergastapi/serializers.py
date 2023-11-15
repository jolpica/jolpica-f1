from rest_framework import serializers

from formulastat.ergast.models import Status
from formulastat.formula_one.models import Circuit, Season


class SeasonSerializer(serializers.HyperlinkedModelSerializer):
    season = serializers.CharField(source="year")
    url = serializers.CharField(source="wikipedia")

    class Meta:
        model = Season
        fields = ["season", "url"]


class CircuitSerializer(serializers.HyperlinkedModelSerializer):
    circuitId = serializers.CharField(source="reference")  # noqa: N815
    url = serializers.CharField(source="wikipedia")
    circuitName = serializers.CharField(source="name")  # noqa: N815
    Location = serializers.SerializerMethodField(method_name="get_location")

    def get_location(self, circuit: Circuit) -> dict:
        return {
            "lat": str(circuit.location.y),
            "long": str(circuit.location.x),
            "locality": circuit.locality,
            "country": circuit.country,
        }

    class Meta:
        model = Circuit
        fields = ["circuitId", "url", "circuitName", "Location"]


class StatusSerializer(serializers.HyperlinkedModelSerializer):
    statusId = serializers.CharField()  # noqa: N815
    status = serializers.CharField()
    count = serializers.CharField()

    class Meta:
        model = Status
        fields = ["statusId", "count", "status"]
