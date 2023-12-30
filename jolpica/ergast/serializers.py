from rest_framework import serializers

from jolpica.ergast import models


class CircuitsSerializer(serializers.ModelSerializer):
    circuitId = serializers.CharField(source="circuitRef")
    circuitName = serializers.CharField(source="name")
    Location = serializers.SerializerMethodField("get_location")

    class LocationSerializer(serializers.ModelSerializer):
        # Convert to char field as are strings in original api
        lat = serializers.CharField()
        long = serializers.CharField(source="lng")
        locality = serializers.CharField(source="location")

        class Meta:
            model = models.Circuits
            fields = ["lat", "long", "locality", "country"]

    def get_location(self, obj):
        return self.LocationSerializer(obj).data

    class Meta:
        model = models.Circuits
        fields = ["circuitId", "url", "circuitName", "Location"]


class RacesSerializer(serializers.ModelSerializer):
    season = serializers.PrimaryKeyRelatedField(source="year", many=False, read_only=True)
    raceName = serializers.CharField(source="name")
    Circuit = CircuitsSerializer(source="circuitId")

    class Meta:
        model = models.Races
        fields = ["season", "round", "url", "raceName", "Circuit", "date", "time"]
