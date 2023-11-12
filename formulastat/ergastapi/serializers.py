from rest_framework import serializers

from formulastat.formula_one.models import Season, Circuit


class SeasonSerializer(serializers.HyperlinkedModelSerializer):
    season = serializers.CharField(source="year")
    url = serializers.CharField(source="wikipedia")

    class Meta:
        model = Season
        fields = ["season", "url"]


class CircuitSerializer(serializers.HyperlinkedModelSerializer):
    circuitId = serializers.CharField(source="reference") # noqa: N815
    url = serializers.CharField(source="wikipedia")
    circuitName = serializers.CharField(source="name") # noqa: N815


    class Meta:
        model = Circuit
        fields = ["season", "url"]