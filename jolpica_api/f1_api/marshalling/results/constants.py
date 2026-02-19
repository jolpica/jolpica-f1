"""Constants for results marshalling."""

from __future__ import annotations

# Display titles for result types (used in Results response)
RESULT_TYPE_TITLES: dict[str, str] = {
    "Q": "Qualifying",
    "SQ": "Sprint Qualifying",
    "R": "Race",
    "SR": "Sprint Race",
    "FP": "Free Practice",
    "FP1": "Practice 1",
    "FP2": "Practice 2",
    "FP3": "Practice 3",
}


# Display names for session components (used in ResultComponent)
COMPONENT_DISPLAY_NAMES: dict[str, str] = {
    "FP1": "Practice 1",
    "FP2": "Practice 2",
    "FP3": "Practice 3",
    "Q1": "Qualifying 1",
    "Q2": "Qualifying 2",
    "Q3": "Qualifying 3",
    "SQ1": "Sprint Qualifying 1",
    "SQ2": "Sprint Qualifying 2",
    "SQ3": "Sprint Qualifying 3",
    "GRID": "Grid Position",
    "SGRID": "Sprint Grid Position",
}
