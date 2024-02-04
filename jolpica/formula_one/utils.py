from .models import (
    ResultsChampionshipScheme,
    SplitChampionshipScheme,
)


def calculate_championship_points(
    round_points: dict[int, float],
    split_type: int,
    best_results_type: int,
    total_rounds: int,
) -> float:
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
        return 0

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
