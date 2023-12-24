from .models import BestResultsPerSplitScheme, ChampionshipScheme, SeasonSplitScheme


def year_to_championship_scheme(year: int) -> ChampionshipScheme:
    if year >= 1950 and year <= 1953:
        ref = "s1950"
    elif year >= 1954 and year <= 1957:
        ref = "s1954"
    elif year in (1958, 1960, 1963, 1964, 1965):
        ref = "s1958"
    elif year in (1959, 1961, 1962, 1966):
        ref = "s1959"
    elif year >= 1967 and year <= 1978:
        ref = "s1967"
    elif year == 1979:
        ref = "s1979"
    elif year == 1980:
        ref = "s1980"
    elif year >= 1981 and year <= 1990:
        ref = "s1981"
    elif year >= 1991:
        ref = "s1991"
    else:
        raise ValueError(f"Invalid year: {year}")
    return ChampionshipScheme.objects.get(reference=ref)


def calculate_championship_points(
    round_points: dict[int, float | int | None],
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
    if split_type == SeasonSplitScheme.NONE:
        splits.append(list(clean_round_points.values()))
    elif split_type in (SeasonSplitScheme.HALF_LARGER_BACK, SeasonSplitScheme.HALF_LARGER_FRONT):
        splits = [[], []]
        if split_type == SeasonSplitScheme.HALF_LARGER_FRONT:
            rounds_in_first_split = (total_rounds + 1) // 2
        else:
            rounds_in_first_split = total_rounds // 2

        for key, points in clean_round_points.items():
            split_index = 0 if key <= rounds_in_first_split else 1
            splits[split_index].append(points)
    else:
        raise ValueError("Invalid season split type")

    if best_results_type == BestResultsPerSplitScheme.NONE:
        return None

    # Sort points from most to least (unless the point scheme uses all results)
    if best_results_type != BestResultsPerSplitScheme.ALL:
        if best_results_type == BestResultsPerSplitScheme.ALL_BUT_ONE:
            if split_type == SeasonSplitScheme.NONE:
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


def races_to_championship_points(year: int, round_points: dict[int, float | int | None], constructors=False) -> float | None:
    """Calculate championship points from points per round using given year's rules

    Args:
        year: The year of the eligible results ruleset to be applied
        round_points: Dictionary of round number to points scored

    Returns:
        Overall Championship Points for given race results
    """
    match year:
        case 1977:
            total_rounds = 17
        case 1978 | 1976:
            total_rounds = 16
        case 1979 | 1974 | 1973:
            total_rounds = 15
        case 1980 | 1975:
            total_rounds = 14
        case 1970:
            total_rounds = 13
        case 1972 | 1968:
            total_rounds = 12
        case 1971 | 1969 | 1967:
            total_rounds = 11
        case _:
            total_rounds = 99 
    scheme = year_to_championship_scheme(year)
    if not constructors:
        return calculate_championship_points(
            round_points, scheme.driver_season_split, scheme.driver_best_results, total_rounds
        )
    else:
        return calculate_championship_points(
            round_points, scheme.team_season_split, scheme.team_best_results, total_rounds
        )
