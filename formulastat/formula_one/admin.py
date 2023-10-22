from django.apps import apps
from django.contrib import admin
from django.contrib.gis import admin as geo_admin


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
                    "race",
                    "session_entry",
                    "race_entry",
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
            self.list_filter = ["session_entry__session__type"]
        super().__init__(model, admin_site)

    def _get_search_fields(self, model_name: str) -> list[str]:
        match model_name:
            case "Circuit":
                return ["name", "reference", "country","city"]
            case "Season":
                return ["year"]
            case "Race":
                return ["season__year", "name", "circuit__country"]
            case "Driver":
                return ["forename", "surname", "abbreviation"]
            case "Team":
                return ["name", "reference"]
            case "Lap":
                return [
                    "session_entry__session__type",
                    "number",
                    "session_entry__race_entry__driver__forename",
                    "session_entry__race_entry__driver__surname",
                ]
            case "Session":
                return ["race__season__year", "race__name", "type"]
            case "RaceEntry":
                return ["race__name", "car_number"]
            case "SessionEntry":
                return ["session__race__season__year", "session__race__name", "race_entry__driver__forename"]
        return []


class FormulaOneModelAdmin(ListAdminMixin, geo_admin.GISModelAdmin):
    gis_widget_kwargs = {"attrs": {"default_lon": 10, "default_lat": 55, "default_zoom": 3.75}}  # noqa: RUF012


models = apps.get_app_config("formula_one").get_models()
for model in models:
    admin_class = type("AdminClass", (FormulaOneModelAdmin,), {})
    try:
        admin.site.register(model, admin_class)
    except admin.sites.AlreadyRegistered:
        pass
