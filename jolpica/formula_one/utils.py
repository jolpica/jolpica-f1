from collections import defaultdict

from django.db.models import F

from .models import (
    ChampionshipAdjustmentType,
    ChampionshipSystem,
    DriverChampionship,
    ResultsChampionshipScheme,
    Season,
    SessionEntry,
    SessionType,
    SplitChampionshipScheme,
)


def calculate_championship_points(
    round_points: dict[int, float],
    split_type: int,
    best_results_type: int,
    total_rounds: int,
) -> float | None:
    if total_rounds <= 0:
        raise ValueError("Total rounds must be greater than 0")
    clean_round_points: dict[int, float] = {}
    for round, points in round_points.items():
        if round <= 0:
            raise ValueError("Round numbers must be greater than 0")
        if points is not None:
            clean_round_points[round] = float(points)

    splits: list[list[float]] = []
    if split_type == SplitChampionshipScheme.NONE:
        splits.append(list(clean_round_points.values()))
    elif split_type in (SplitChampionshipScheme.HALF_LARGER_BACK, SplitChampionshipScheme.HALF_LARGER_FRONT):
        splits = [[], []]
        if split_type == SplitChampionshipScheme.HALF_LARGER_FRONT:
            rounds_in_first_split = (total_rounds + 1) // 2
        else:
            rounds_in_first_split = total_rounds // 2

        for key, points in clean_round_points.items():
            split_index = 0 if key <= rounds_in_first_split else 1
            splits[split_index].append(points)
    else:
        raise ValueError("Invalid season split type")

    if best_results_type == ResultsChampionshipScheme.NONE:
        return None

    # Sort points from most to least (unless the point scheme uses all results)
    if best_results_type != ResultsChampionshipScheme.ALL:
        if best_results_type == ResultsChampionshipScheme.ALL_BUT_ONE:
            if split_type == SplitChampionshipScheme.NONE:
                take_until_indexes = [total_rounds - 1]
            else:
                take_until_indexes = [rounds_in_first_split - 1, (total_rounds - rounds_in_first_split) - 1]
        elif best_results_type > 0:
            take_until_indexes = len(splits) * [best_results_type]
        else:
            raise ValueError("Invalid best results type")

        for i, take_until_index in enumerate(take_until_indexes):
            splits[i] = sorted(splits[i], reverse=True)[:take_until_index]

    total_points = 0.0
    for split in splits:
        total_points += sum(split)
    return total_points


def add_to_encoded_finishing_positions(encoded: str, position: int, amount: int = 1) -> str:
    if not isinstance(position, int):
        raise TypeError(position)
    start, end = (position - 1) * 2, (position) * 2
    if len(encoded) < end:
        encoded = encoded.ljust(end, "0")
    return encoded[:start] + f"{int(encoded[start:end]) + amount:0>2}" + encoded[end:]


def highest_finish_from_encoded_finishing_position(encoded: str) -> int | None:
    if encoded.strip("0") == "":
        return None
    return 1 + (len(encoded) - len(encoded.lstrip("0"))) // 2


def generate_season_driver_standings(
    season: Season, championship_system: ChampionshipSystem | None = None, season_rounds: int | None = None
):
    if championship_system is None:
        if season.championship_system:
            championship_system = season.championship_system
        else:
            raise ValueError("No ChampionshipSystem")
    if season_rounds is None:
        season_rounds = season.races.filter(is_cancelled=False).count()
    adjustments = {
        adjustment.driver_id: adjustment.adjustment
        for adjustment in season.championship_adjustments.filter(driver__isnull=False)
    }
    session_entries = list(
        SessionEntry.objects.filter(session__race__season_id=season.pk, session__point_system_id__gt=1)
        .annotate(
            race_id=F("session__race__pk"),
            round=F("session__race__round"),
            session_type=F("session__type"),
            driver_id=F("race_entry__team_driver__driver__pk"),
        )
        .order_by("round", "session__date", "session__time")
    )
    entries_dict: dict[int, dict[int, dict[int, list[SessionEntry]]]] = defaultdict(
        lambda: defaultdict(lambda: defaultdict(list))
    )
    for entry in session_entries:
        entries_dict[entry.round][entry.session_id][entry.driver_id].append(entry)

    driver_round_points: dict[int, dict[int, float]] = defaultdict(lambda: defaultdict(float))
    driver_sort_key: dict = defaultdict(lambda: [0.0, "", ""])

    driver_standings = []
    current_standings: list[DriverChampionship] = []
    for round, entries_type_dict in entries_dict.items():
        race_id = None
        for session_id, driver_entries in entries_type_dict.items():
            session_type = None
            driver_standings.extend(current_standings)
            current_standings = []
            for driver_id, entries in driver_entries.items():
                position = None
                is_classified = None
                for entry in entries:  # type: ignore
                    race_id = entry.race_id
                    session_type = entry.session_type
                    if entry.is_eligible_for_points and entry.points:
                        driver_round_points[driver_id][round] += entry.points
                    if (
                        position is None
                        or entry.position < position
                        and (not is_classified or entry.is_classified is True)
                    ):
                        position = entry.position
                        is_classified = entry.is_classified
                if session_type == SessionType.RACE and position is not None:
                    if is_classified:
                        driver_sort_key[driver_id][1] = add_to_encoded_finishing_positions(
                            driver_sort_key[driver_id][1], position
                        )
                    else:
                        driver_sort_key[driver_id][2] = add_to_encoded_finishing_positions(
                            driver_sort_key[driver_id][2], position
                        )
                driver_sort_key[driver_id][0] = calculate_championship_points(
                    driver_round_points[driver_id],
                    split_type=championship_system.driver_season_split,
                    best_results_type=championship_system.driver_best_results,
                    total_rounds=season_rounds,
                )

            # session
            drivers_by_finishes = sorted(driver_sort_key.items(), key=lambda d: driver_sort_key[d[0]], reverse=True)
            position = 1
            draw_count = -1
            last_key = (-1, "", "")
            for driver_id, sort_key in drivers_by_finishes:
                sort_key = tuple(sort_key)
                points, finish_string, _ = sort_key
                classified = True if finish_string else False
                if driver_id in adjustments.keys():
                    classified = False
                    if adjustments[driver_id] == ChampionshipAdjustmentType.EXCLUDED:
                        points = 0
                elif sort_key < last_key:
                    position += 1 + draw_count
                    draw_count = 0
                else:
                    draw_count += 1
                last_key = sort_key
                current_standings.append(
                    DriverChampionship(
                        session_id=session_id,
                        driver_id=driver_id,
                        year=season.year,
                        round=round,
                        position=position if classified else None,
                        points=points,
                        win_count=int(finish_string[:2]) if finish_string else 0,
                        highest_finish=highest_finish_from_encoded_finishing_position(finish_string),
                        finish_string=finish_string,
                    )
                )
        # round
        for standing in current_standings:
            standing.race_id = race_id
    # season
    for standing in current_standings:
        standing.season_id = season.pk
    driver_standings.extend(current_standings)
    return driver_standings


def create_driver_standings(apps, schema_editor):
    Season = apps.get_model("formula_one", "Season")
    DriverStanding = apps.get_model("formula_one", "DriverStanding")

    driver_standings = []
    for season in Season.objects.all().select_related("championship_system"):
        driver_standings.extend(generate_season_driver_standings(season))
    DriverStanding.objects.bulk_create(driver_standings)
