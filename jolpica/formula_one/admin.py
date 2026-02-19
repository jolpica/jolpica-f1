from django.apps import apps
from django.contrib import admin
from django.urls import resolve

from jolpica.formula_one import models as f1


class ListAdminMixin:
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields]
        self.search_fields = self._get_search_fields(model)
        if model.__name__ not in {"PointScheme"}:
            self.autocomplete_fields = [
                field.name
                for field in model._meta.fields
                if field.name
                in {
                    "round",
                    "session_entry",
                    "round_entry",
                    "team_driver",
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
                "is_entry_fastest_lap",
                "session_entry__session__type",
                "session_entry__session__round__number",
                "session_entry__session__round__season__year",
                "session_entry__round_entry__team_driver__driver",
            ]
        elif model.__name__ == "PitStop":
            self.list_select_related = [
                "session_entry",
                "lap__session_entry__session__round__season",
                "lap__session_entry__round_entry__team_driver__driver",
                "lap__session_entry__round_entry__team_driver__team",
                "session_entry__session__round__season",
                "session_entry__round_entry__round__season",
                "session_entry__round_entry__team_driver__driver",
                "session_entry__round_entry__team_driver__team",
                "session_entry__round_entry__team_driver__season",
            ]
            self.list_filter = [
                "session_entry__session__round__season__year",
                "session_entry__session__round__number",
                "session_entry__session__type",
                "lap__number",
            ]
        elif model.__name__ == "SessionEntry":
            self.list_display = [*self.list_display, "round_entry__car_number"]
            self.list_filter = ["session__type", "session__round__number", "session__round__season"]
        elif model.__name__ == "Session":
            self.list_filter = ["type", "round__season", "round__number"]
        elif model.__name__ == "Round":
            self.list_filter = ["is_cancelled", "number", "season"]
        elif model.__name__ == "Season":
            self.list_select_related = ["championship_system"]
        elif model.__name__ == "TeamDriver":
            self.list_filter = ["season"]
        elif model.__name__ == "DriverChampionship" or model.__name__ == "TeamChampionship":
            self.list_select_related = [
                "session__round__season",
                "season",
                "round__season",
            ]
            if model.__name__ == "TeamChampionship":
                self.list_select_related.append("team")
            else:
                self.list_select_related.append("driver")
            self.list_filter = [
                ("season", admin.EmptyFieldListFilter),
                ("round", admin.EmptyFieldListFilter),
                "round_number",
                "year",
            ]
        super().__init__(model, admin_site)

    def _get_search_fields(self, model) -> list[str]:
        search_fields = []
        model_name = model.__name__
        match model_name:
            case "Circuit":
                search_fields = ["name", "reference", "country", "locality"]
            case "Season":
                search_fields = ["year"]
            case "Round":
                search_fields = ["number", "season__year", "name", "circuit__country"]
            case "TeamDriver":
                search_fields = [
                    "season__year",
                    "team__reference",
                    "team__name",
                    "driver__reference",
                    "driver__forename",
                    "driver__surname",
                ]
            case "Driver":
                search_fields = ["forename", "surname", "abbreviation"]
            case "Team":
                search_fields = ["name", "reference"]
            case "Lap":
                search_fields = [
                    "session_entry__session__type",
                    "number",
                    "session_entry__round_entry__round__name",
                    "session_entry__round_entry__team_driver__driver__forename",
                    "session_entry__round_entry__team_driver__driver__surname",
                ]
            case "Session":
                search_fields = ["number", "round__season__year", "round__name", "type"]
            case "RoundEntry":
                search_fields = [
                    "round__season__year",
                    "round__name",
                    "car_number",
                    "team_driver__driver__forename",
                    "team_driver__driver__surname",
                ]
            case "SessionEntry":
                search_fields = [
                    "session__round__season__year",
                    "session__round__name",
                    "round_entry__team_driver__driver__forename",
                    "round_entry__team_driver__driver__surname",
                    "round_entry__team_driver__team__name",
                ]
        if hasattr(model, "api_id"):
            search_fields.append("api_id")
        return search_fields


class SessionInline(admin.TabularInline):
    model = f1.Session


class RoundEntryInline(admin.TabularInline):
    model = f1.RoundEntry

    def get_parent_id_from_request(self, request):
        resolved = resolve(request.path_info)
        if resolved.kwargs:
            return resolved.kwargs["object_id"]
        return None

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "team_driver":
            parent_id = self.get_parent_id_from_request(request)
            if parent_id:
                kwargs["queryset"] = f1.TeamDriver.objects.filter(season__rounds__id=parent_id).prefetch_related(
                    "team", "driver", "season"
                )
            else:
                kwargs["queryset"] = f1.TeamDriver.objects.prefetch_related("team", "driver", "season")
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


class FormulaOneModelAdmin(ListAdminMixin, admin.ModelAdmin):
    def __init__(self, model, admin_site):
        super().__init__(model, admin_site)
        if model.__name__ == "Round":
            self.inlines = [SessionInline, RoundEntryInline]


models = apps.get_app_config("formula_one").get_models()
for model in models:
    admin_class = type("AdminClass", (FormulaOneModelAdmin,), {})
    try:
        admin.site.register(model, admin_class)
    except admin.sites.AlreadyRegistered:  # type: ignore
        pass
