from pathlib import Path
from zipfile import ZipFile

import pandas as pd
import requests
from django.apps import apps
from django.db import transaction
from tqdm import tqdm


class ErgastUpdater:
    table_keys = {
        "circuits": ["circuitId"],
        "constructorresults": ["constructorResultsId"],
        "constructorstandings": ["constructorStandingsId"],
        "constructors": ["constructorId"],
        "driverstandings": ["driverStandingsId"],
        "drivers": ["driverId"],
        "laptimes": ["raceId", "driverId", "lap"],
        "pitstops": ["raceId", "driverId", "stop"],
        "qualifying": ["qualifyId"],
        "races": ["raceId"],
        "results": ["resultId"],
        "sprintresults": ["resultId"],
        "seasons": ["year"],
        "status": ["statusId"],
    }

    def __init__(self, url="http://ergast.com/downloads/f1db_csv.zip"):
        self.url = url

    def update(self):
        print(f"Downloading updated files from {self.url}")
        self.get_files()
        print("Updating models from files")
        self.update_from_csv()
        print("Update complete")

    def get_files(self):
        zip_path = Path("jolpica/ergast/download/ergast.zip")
        extract_path = Path("jolpica/ergast/download/csv")
        extract_path.mkdir(parents=True, exist_ok=True)
        r = requests.get(self.url)
        with open(zip_path, "wb") as f:
            f.write(r.content)

        with ZipFile(zip_path) as zip:
            zip.extractall(extract_path)

    def update_from_csv(self):
        csv_folder = Path("jolpica/ergast/download/csv")
        with transaction.atomic():
            for table in [
                "circuits",
                "constructors",
                "drivers",
                "seasons",
                "races",
                "qualifying",
                "status",
                "results",
                "sprint_results",
                "constructor_results",
                "constructor_standings",
                "driver_standings",
                "lap_times",
                "pit_stops",
            ]:
                csv = csv_folder / Path(table + ".csv")
                if csv.suffix == ".csv":
                    model_name = csv.stem.replace("_", "").lower()
                    print(model_name)
                    try:
                        model = apps.get_model("ergast", model_name)
                    except:
                        print(f"Couldn't get model for {csv.name}")

                    data = pd.read_csv(csv)

                    missing_fields = set()
                    update_fields = set()
                    new_models = []
                    for row in tqdm(data.iterrows()):
                        row = row[1]
                        if model_name in ["pitstops", "laptimes"]:
                            primary_keys = {"id": "|".join([str(row[field]) for field in self.table_keys[model_name]])}
                        else:
                            primary_keys = {field: row[field] for field in self.table_keys[model_name]}

                        new_row = dict()
                        for field in row.keys():
                            update_fields.add(field)
                            try:
                                model_field = model._meta.get_field(field)
                            except:
                                missing_fields.add(f"{field} missing in {table}")
                                continue
                            if row[field] == "\\N":
                                row[field] = None
                            if model_field.get_internal_type() == "ForeignKey":
                                related_model = apps.get_model("ergast", model_field.related_model()._meta.model_name)
                                # row[field] = related_model.objects.get(pk=row[field])
                                new_row[field + "_id"] = int(row[field])
                            else:
                                new_row[field] = row[field]
                        # model.objects.update_or_create(defaults=dict(new_row), **primary_keys)
                        new_models.append(model(**{**dict(new_row), **primary_keys}))

                    unique_fields = self.table_keys[model_name]
                    for key in unique_fields:
                        update_fields.remove(key)
                    print("creating in db...")
                    model.objects.bulk_create(
                        new_models,
                        batch_size=1000,
                        update_conflicts=True,
                        unique_fields=unique_fields,
                        update_fields=update_fields,
                    )
                if missing_fields:
                    print(missing_fields)


if __name__ == "__main__":
    import os

    import django

    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings.local")
    django.setup()
    upd = ErgastUpdater()
    upd.update()
