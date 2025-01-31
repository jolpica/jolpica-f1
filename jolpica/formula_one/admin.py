from django.apps import apps
from django.contrib import admin
from django.contrib.gis import admin as geo_admin

from jolpica.formula_one import models as f1


class ListAdminMixin:
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields]
        self.search_fields = self._get_search_fields(model.__name__)
        if model.__name__ not in {"PointScheme"}:
            self.autocomplete_fields = [
                field.name
                for field in model._meta.fields
                if field.name
                in {
                    "round",
                    "session_entry",
                    "round_entry",
                    "driver",
                    "team",
                    "lap",
                    "session",
                    "fastest_lap",
                    "season",
                    "circuit",
                }
            ]
        if model.__name__ == "Lap":
            self.list_filter = [
                "session_entry__session__type",
                "session_entry__session__round__season__year",
                "session_entry__session__round__number",
                "session_entry__round_entry__team_driver__driver",
            ]
        elif model.__name__ == "SessionEntry":
            self.list_filter = ["session__type", "session__round__season", "session__round__number"]
        elif model.__name__ == "Session":
            self.list_filter = ["type", "round__season", "round__number"]
        elif model.__name__ == "TeamDriver":
            self.list_filter = ["season"]
        elif model.__name__ == "DriverChampionship" or model.__name__ == "TeamChampionship":
            self.list_filter = [
                ("season", admin.EmptyFieldListFilter),
                ("round", admin.EmptyFieldListFilter),
                "year",
                "round_number",
            ]
        super().__init__(model, admin_site)

    def _get_search_fields(self, model_name: str) -> list[str]:
        match model_name:
            case "Circuit":
                return ["name", "reference", "country", "locality"]
            case "Season":
                return ["year"]
            case "Round":
                return ["season__year", "name", "circuit__country"]
            case "Driver":
                return ["forename", "surname", "abbreviation"]
            case "Team":
                return ["name", "reference"]
            case "Lap":
                return [
                    "session_entry__session__type",
                    "number",
                    "session_entry__round_entry__driver__forename",
                    "session_entry__round_entry__driver__surname",
                ]
            case "Session":
                return ["round__season__year", "round__name", "type"]
            case "RoundEntry":
                return ["round__name", "car_number"]
            case "SessionEntry":
                return ["session__round__season__year", "session__round__name", "round_entry__driver__forename"]
        return []


class SessionInline(admin.TabularInline):
    model = f1.Session


class FormulaOneModelAdmin(ListAdminMixin, geo_admin.GISModelAdmin):
    gis_widget_kwargs = {"attrs": {"default_lon": 10, "default_lat": 55, "default_zoom": 3.75}}

    def __init__(self, model, admin_site):
        super().__init__(model, admin_site)
        if model.__name__ == "Round":
            self.inlines = [SessionInline]


models = apps.get_app_config("formula_one").get_models()
for model in models:
    admin_class = type("AdminClass", (FormulaOneModelAdmin,), {})
    try:
        admin.site.register(model, admin_class)
    except admin.sites.AlreadyRegistered:  # type: ignore
        pass
