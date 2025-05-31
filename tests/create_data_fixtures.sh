pg_dump -h localhost -U postgres -d jolpica  -a \
    -t "formula_one*" \
    -T "formula_one_lap" \
    -T "formula_one_*championship" \
    -T "formula_one_pitstop" \
    -T "formula_one_*entry" > tests/fixtures/db/tables.sql

SESSION_ENTRY_WHERE_CLAUSE="1958,1979,1980,1997,2007,2008,2009,2020,2023"
PITSTOP_WHERE_CLAUSE="season.year = 2023 AND round.number in (1, 10, 18, 22)"
psql -h localhost -U postgres -d jolpica -c "\copy
(
SELECT pitstop.*
FROM 
    formula_one_pitstop as pitstop 
    JOIN formula_one_lap as lap ON pitstop.lap_id = lap.id
    JOIN formula_one_sessionentry as sessionentry ON pitstop.session_entry_id = sessionentry.id 
    JOIN formula_one_session as session ON sessionentry.session_id = session.id
    JOIN formula_one_round as round ON session.round_id = round.id
    JOIN formula_one_season as season ON round.season_id = season.id
WHERE 
    $PITSTOP_WHERE_CLAUSE
ORDER BY pitstop.id
) to 'tests/fixtures/db/pitstops.csv' 
WITH CSV HEADER;"

LAP_WHERE_CLAUSE="
    (season.year = 2023 AND (round.number in (1, 10, 18, 22)))
    OR ($PITSTOP_WHERE_CLAUSE)
"
psql -h localhost -U postgres -d jolpica -c "\copy
(
SELECT lap.*
FROM 
    formula_one_lap as lap 
    JOIN formula_one_sessionentry as sessionentry ON lap.session_entry_id = sessionentry.id 
    JOIN formula_one_session as session ON sessionentry.session_id = session.id
    JOIN formula_one_round as round ON session.round_id = round.id
    JOIN formula_one_season as season ON round.season_id = season.id
WHERE 
    (lap.is_entry_fastest_lap = true and (season.year in ($SESSION_ENTRY_WHERE_CLAUSE)))
    OR ($LAP_WHERE_CLAUSE)
ORDER BY lap.id
) to 'tests/fixtures/db/laps.csv'
WITH CSV HEADER;"

psql -h localhost -U postgres -d jolpica -c "\copy
(
SELECT sessionentry.*
FROM 
    formula_one_sessionentry as sessionentry
    JOIN formula_one_session as session ON sessionentry.session_id = session.id
    JOIN formula_one_round as round ON session.round_id = round.id
    JOIN formula_one_season as season ON round.season_id = season.id
WHERE 
    (season.year IN ($SESSION_ENTRY_WHERE_CLAUSE))
    OR ($LAP_WHERE_CLAUSE)
ORDER BY sessionentry.id
) to 'tests/fixtures/db/sessionentrys.csv'
WITH CSV HEADER;"

psql -h localhost -U postgres -d jolpica -c "\copy (
SELECT roundentry.*
FROM 
    formula_one_roundentry as roundentry
    JOIN formula_one_round as round ON roundentry.round_id = round.id
    JOIN formula_one_season as season ON round.season_id = season.id
WHERE 
    (season.year IN ($SESSION_ENTRY_WHERE_CLAUSE))
    OR ($LAP_WHERE_CLAUSE)
ORDER BY roundentry.id
) TO 'tests/fixtures/db/roundentrys.csv'
WITH CSV HEADER;"
