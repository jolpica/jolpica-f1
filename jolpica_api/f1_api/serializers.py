from rest_framework import serializers

from jolpica.formula_one.models import (
    Circuit,
    Driver,
    Round,
    Season,
    Session,
    SessionEntry,
    Team,
)


class RoundSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Round
        fields = ["url", "number", "date", "race_number"]


class SeasonSerializer(serializers.HyperlinkedModelSerializer):
    rounds = RoundSerializer(many=True, read_only=True)

    class Meta:
        model = Season
        fields = ["url", "year", "rounds"]
        extra_kwargs = {"url": {"lookup_field": "year"}}


class CircuitSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Circuit
        fields = ["url", "name", "location", "country"]


class TeamSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Team
        fields = ["url", "name", "nationality"]


class DriverSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Driver
        fields = ["url", "forename", "surname", "nationality"]


class SessionSerializer(serializers.HyperlinkedModelSerializer):
    round = RoundSerializer(read_only=True)
    circuit = CircuitSerializer(read_only=True)

    class Meta:
        model = Session
        fields = [
            "url",
            "round",
            "circuit",
            "session_type",
            "date",
            "time",
        ]


class SessionEntrySerializer(serializers.HyperlinkedModelSerializer):
    session = SessionSerializer(read_only=True)
    team = TeamSerializer(read_only=True)
    driver = DriverSerializer(read_only=True)

    class Meta:
        model = SessionEntry
        fields = [
            "url",
            "session",
            "team",
            "driver",
            "race_number",
            "lap_time",
            "position",
            "points",
        ]
