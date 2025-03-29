from pathlib import Path
from time import sleep

import requests
from tqdm import tqdm

# Using specific drivers / teams to reduce size of fixtures
# piquet_jr drove in 2008-09
# brawn only in 2008
# glock drove toyota 2008-09 (otherwise 2004-2012)

endpoints = {
    "circuits": [
        "2023/10/circuits.json",
        "2023/99/circuits.json",
        "2023/circuits.json",
        "circuits/monaco.json",
        "constructors/brawn/circuits.json",
        "constructors/brawn/status/11/circuits.json",
        "drivers/brawn/circuits.json",
        "drivers/glock/constructors/toyota/circuits.json",
        "drivers/glock/constructors/toyota/grid/1/circuits.json",
        "drivers/glock/constructors/toyota/grid/1/results/1/circuits.json",
        "2008/drivers/alonso/fastest/0/circuits.json",
        "2008/drivers/alonso/fastest/1/circuits.json",
        "drivers/alonso/grid/11/circuits/monaco.json",
        "drivers/piquet_jr/grid/17/circuits/monaco.json",
        "2023/status/23/circuits.json",
    ],
    "constructors": [
        "2023/20/constructors.json",
        "2023/99/constructors.json",
        "2023/constructors.json",
        "constructors/red_bull.json",
    ],
    "drivers": [
        "2023/1/drivers.json",
        "2023/99/drivers.json",
        "2023/drivers.json",
        "drivers/piquet_jr.json",
        "2023/results/20/drivers.json",
    ],
    "laps": [
        "2023/18/laps.json?offset=45",
        "2023/1/laps.json",
        "2023/10/laps/1.json",
        "2023/1/drivers/leclerc/qualifying.json",
    ],
    "pitstops": [
        "2023/18/pitstops.json",
        "2023/1/pitstops.json?offset=30",
        "2023/10/pitstops/2.json",
        "2023/10/laps/7/pitstops.json",
    ],
    "qualifying": [
        "2023/13/qualifying.json",
        "2023/99/qualifying.json",
        "2023/qualifying.json",
        "constructors/brawn/qualifying.json",
        "drivers/piquet_jr/qualifying.json",
        "drivers/piquet_jr/qualifying.json?offset=220",
        "2023/qualifying/1.json",
        "2023/grid/12/circuits/bahrain/qualifying/12.json",
        "2023/grid/12/circuits/bahrain/qualifying.json?limit=1",
        "2023/12/qualifying/1.json",
        "2023/12/qualifying/13.json",
        "2023/fastest/1/qualifying.json",
        "2023/status/1/qualifying.json",
        "2023/grid/1/qualifying.json",
    ],
    "races": [
        "2023/7/races.json",
        "2023/99/races.json",
        "2023/races.json",
        "2023.json",
        "2023/last.json",
        "2023/next.json",
        "2023.json",
    ],
    "results": [
        "2023/99/results.json",
        "2023/9/results.json",
        "2023/results.json",
        "constructors/brawn/results.json?offset=15",
        "drivers/piquet_jr/results.json",
        "2023/results/2.json",
        "2023/grid/1/results.json",
        "2023/status/1/results.json",
    ],
    "seasons": [
        "2023/5/seasons.json",
        "2023/99/seasons.json",
        "2023/seasons.json",
        "constructors/notexist/seasons.json",
        "constructors/red_bull/drivers/alonso/seasons.json",
        "constructors/red_bull/seasons.json",
        "drivers/glock/constructors/toyota/grid/1/results/1/seasons.json",
        "drivers/glock/constructors/toyota/grid/1/seasons.json",
        "drivers/glock/constructors/toyota/seasons.json",
        "drivers/glock/constructors/toyota/status/22/seasons.json",
        "2023/drivers/alonso/fastest/0/seasons.json",
        "2023/drivers/alonso/fastest/1/seasons.json",
        "drivers/piquet_jr/grid/17/circuits/monaco/seasons.json",
        "drivers/alonso/seasons.json",
        "2023/drivers/piastri/results/1/seasons.json",
        "drivers/russell/seasons.json",
        "grid/999/constructors/notexist/seasons.json",
        "constructors/brabham-ford/circuits/ain-diab/seasons.json",
    ],
    "sprint": [
        "2023/3/sprint.json",
        "2023/99/sprint.json",
        "2023/sprint.json",
        "2023/sprint/1.json",
        "2023/constructors/red_bull/sprint.json",
        "drivers/de_vries/sprint.json",
        "2023/sprint/17.json",
        "2023/grid/1/sprint.json",
        "2023/status/1/sprint.json",
    ],
    "status": [
        "2023/17/status.json",
        "2023/99/status.json",
        "2023/status.json",
        "2023/status/131.json",
        "constructors/brawn/circuits/monaco/status.json",
        "constructors/brawn/grid/1/status.json",
        "constructors/brawn/results/11/status.json",
        "constructors/brawn/status.json",
        "drivers/glock/constructors/toyota/status.json",
        "drivers/piquet_jr/fastest/1/status.json",
        "drivers/piquet_jr/status.json",
        "drivers/piquet_jr/status/1.json",
    ],
    "driverstandings": [
        "2023/driverstandings.json",
        "2023/4/driverStandings.json",
        "2023/22/driverstandings.json",
        "1980/14/driverstandings.json?limit=21",
        "2023/22/driverstandings/1.json",
        "2023/4/driverstandings.json",
        "2023/5/driverstandings.json",
        "2023/drivers/alonso/driverstandings.json",
        "2023/4/driverStandings/22.json",
    ],
    "constructorstandings": [
        "2023/constructorstandings.json",
        "2023/1/constructorStandings.json",
        "2023/22/constructorstandings.json",
        "2023/13/constructorstandings.json",
        "2023/22/constructorstandings/1.json",
        "2023/constructors/alfa/constructorstandings.json",
        "2023/constructorStandings/12.json",
    ],
}

base_folder = Path("tests/fixtures/ergast_responses")
base_folder.mkdir(exist_ok=True)
for endpoint_type, test_urls in tqdm(endpoints.items()):
    folder = base_folder / endpoint_type
    folder.mkdir(exist_ok=True)
    for url in tqdm(test_urls, leave=False):
        file_path = folder / url.replace("/", "@").replace("?", "^")
        if file_path.exists():
            continue
        sleep(1)
        try:
            response = requests.get(f"https://api.jolpi.ca/ergast/f1/{url}", timeout=60)
        except Exception as ex:
            print(f"{url} had an exception: {ex}")
            continue
        if response.status_code != 200:
            print(f"{url} has non-200 status code: {response.status_code}")
            continue

        with open(file_path, "bw") as file:
            file.write(response.content)
