from jolpica.formula_one import models as f1


def get_available_full_session_codes(round: f1.Round) -> list[str]:
    """Get the list of result type codes available for a round."""
    session_types = {sess.type for sess in round.sessions.all()}

    results_for_round = [
        "R",
        "Q",
    ]
    for result_type in ["SQ", "SR", "FP1", "FP2", "FP3"]:
        if any(sess_type.startswith(result_type) for sess_type in session_types):
            results_for_round.append(result_type)
    return results_for_round
