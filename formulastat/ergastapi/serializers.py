from rest_framework import serializers

from formulastat.formula_one.models import Season


class SeasonSerializer(serializers.HyperlinkedModelSerializer):
    season = serializers.CharField(source="year")
    url = serializers.CharField(source="wikipedia")

    class Meta:
        model = Season
        fields = ["season", "url"]
