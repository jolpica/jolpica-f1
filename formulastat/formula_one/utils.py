
def races_to_championship_points(year: int, round_points: dict[int, float | int | None], constructors = False) -> float:
    """Calculate championship points from points per round using given year's rules

    Args:
        year: The year of the eligible results ruleset to be applied
        round_points: Dictionary of round number to points scored

    Returns:
        Overall Championship Points for given race results
    """
    if year < 1950 or (constructors and year < 1958):
        raise ValueError(f"No championship system for {year=}, {constructors=}")
    clean_round_points = {}
    for round, points in round_points.items():
        if round <= 0:
            raise ValueError("Round numbers must be greater than 0") 
        if points is not None:
            clean_round_points[round] = points

    if year >= 1991 or (constructors and year >= 1979):  # Sum all points
        return sum(clean_round_points.values())
    elif (year >= 1981 and year <= 1990) or (year <= 1966 and year >= 1950):  # Best n points
        if year >= 1981:
            best_n = 11
        elif year <= 1953:
            best_n = 6
        elif year in (1954, 1955, 1956, 1957, 1959, 1960, 1961, 1962,1966):
            best_n = 5
        else:
            best_n = 6
                
        return sum(
            sorted(
                clean_round_points.values(),
                reverse=True,
            )[:best_n]
        )

    # Seasons with 2 groups of eligible races
    if year == 1980:
        rounds_in_first_split = 7
        best_n_races_in_split = (5, 5)
    elif year == 1979:
        rounds_in_first_split = 7
        best_n_races_in_split = (4, 4)
    elif year <= 1978 and year >= 1967:
        # Total rounds split in 2 (1 extra in first half if odd total rounds)
        # Top n-1 results from each half count
        match year:
            case 1977:
                total_rounds = 17
            case 1978 | 1976:
                total_rounds = 16
            case 1974 | 1973:
                total_rounds = 15
            case 1975:
                total_rounds = 14
            case 1970:
                total_rounds = 13
            case 1972 | 1968:
                total_rounds = 12
            case 1971 | 1969 | 1967:
                total_rounds = 11
            
        rounds_in_first_split = (total_rounds + 1) // 2
        best_n_races_in_split = (rounds_in_first_split - 1, (total_rounds - rounds_in_first_split) -1)
    else:
        raise ValueError()

    split_round_points: tuple[list[float], list[float]] = ([], [])
    for key, points in clean_round_points.items():
        if key <= rounds_in_first_split:
            split_round_points[0].append(points)
        else:
            split_round_points[1].append(points)
    points_splits = (
        (sorted(split_round_points[0], reverse=True)[: best_n_races_in_split[0]]),
        (sorted(split_round_points[1], reverse=True)[: best_n_races_in_split[1]]),
    )
    return sum(points_splits[0]) + sum(points_splits[1])
