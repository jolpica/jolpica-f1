from collections import Counter
from datetime import timedelta


def calculate_championship_points(
    round_points: dict[int, float] | Counter[int],
    split_type: int,
    best_results_type: int,
    total_rounds: int,
) -> float | None:
    from .models import (
        ResultsChampionshipScheme,
        SplitChampionshipScheme,
    )

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


def format_timedelta(time: timedelta) -> str:
    total_seconds = time.total_seconds()
    hours, mins, secs = (
        total_seconds // (60 * 60),
        (total_seconds % (60 * 60)) // 60,
        total_seconds % (60) // 1,
    )
    millis = time.microseconds // 1000
    display_time = ""
    if hours:
        display_time += f"{int(hours):02}:"
    if mins:
        display_time += f"{int(mins):02}:"
    display_time += f"{int(secs):02}.{int(millis):03}"
    if display_time[0] == "0":
        display_time = display_time[1:]
    return display_time
