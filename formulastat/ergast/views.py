from datetime import date

from django.db.models import Exists, Max, OuterRef
from rest_framework import exceptions, status
from rest_framework.generics import ListAPIView
from rest_framework.response import Response
from rest_framework.views import APIView

from formulastat.ergast import models, serializers

# NEXT_ROUND = models.Races.objects.filter(date__gte=DATE).first().round
# LAST_ROUND = NEXT_ROUND - 1 if NEXT_ROUND > 1 else models.Races.objects.filter(date__lte=DATE).first().round


# Create your views here.
class Test(APIView):
    def get(self, request, format=None):
        return Response({"testing": True})


class RaceView(ListAPIView):
    serializer_class = serializers.RacesSerializer
    ordering_fields = ["year"]

    def get_kwargs(self):
        kwargs = self.kwargs
        for key, val in kwargs.items():
            try:
                kwargs[key] = int(kwargs[key])
            except:
                pass
        if not (kwargs.get("year") in [None, "current"] or type(kwargs.get("year")) == int):
            raise exceptions.ValidationError(detail="Invalid season")

        if not (kwargs.get("round") in [None, "next", "last"] or type(kwargs.get("round")) == int):
            raise exceptions.ValidationError(detail="Invalid round")

        return kwargs

    def get_queryset(self):
        CURRENT_SEASON = models.Races.objects.aggregate(Max("year"))["year__max"]
        kwargs = self.get_kwargs()
        if kwargs.get("year") == "current":
            kwargs["year"] = CURRENT_SEASON

        if kwargs.get("round") == "next":
            if kwargs.get("year") == CURRENT_SEASON:
                next_race_result = models.Races.objects.filter(
                    ~Exists(models.Results.objects.filter(raceId=OuterRef("pk")))
                ).first()
                kwargs["round"] = next_race_result.round
            else:
                if kwargs.get("year"):
                    kwargs["year"] += 1
                kwargs["round"] = 1
        elif kwargs.get("round") == "last":
            if kwargs.get("year") == CURRENT_SEASON:
                next_race_result = models.Races.objects.filter(
                    Exists(models.Results.objects.filter(raceId=OuterRef("pk")))
                ).last()
                kwargs["round"] = next_race_result.round
            else:
                last_race = models.Races.objects
                if kwargs.get("year"):
                    last_race = last_race.filter(year=kwargs["year"])
                kwargs["round"] = last_race.last().round

        queryset = models.Races.objects.filter(**kwargs)

        return queryset.prefetch_related("circuitId")


class CircuitView(ListAPIView):
    serializer_class = serializers.CircuitsSerializer
    ordering_fields = ["year"]

    def get_queryset(self):
        return models.Circuits.objects.all()
