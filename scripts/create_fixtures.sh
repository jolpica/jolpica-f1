# team champ 1,376
# driver champ 3,280

# lap 44,000
# sessionentry 4,800
# roundentry 1,600
# pitstop 1,040


pg_dump -h localhost -U postgres -d jolpica  -a \
    -t "formula_one*" \
    -t "ergast_status" \
    -T "formula_one_lap" \
    -T "formula_one_*championship" \
    -T "formula_one_pitstop" \
    -T "formula_one_*entry" > dump/tables.sql

PITSTOP_WHERE_CLAUSE="season.year = 2014 AND (round.number in (5, 10))"
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
) to 'dump/pitstops.csv' 
WITH CSV HEADER;"

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
    (lap.is_entry_fastest_lap = true and (season.year >= 2015 OR season.year in (2001,2002,2003,2004,2005,2006)))
    OR (season.year = 2013 AND (round.number in (1, 10, 18)))
    OR ($PITSTOP_WHERE_CLAUSE) 
) to 'dump/laps.csv'
WITH CSV HEADER;"

SESSION_ENTRY_WHERE_CLAUSE="1979,1980,1997"
psql -h localhost -U postgres -d jolpica -c "\copy
(
SELECT sessionentry.*
FROM 
    formula_one_sessionentry as sessionentry
    JOIN formula_one_session as session ON sessionentry.session_id = session.id
    JOIN formula_one_round as round ON session.round_id = round.id
    JOIN formula_one_season as season ON round.season_id = season.id
WHERE 
    (season.year >= 2001) OR (season.year IN ($SESSION_ENTRY_WHERE_CLAUSE))
) to 'dump/sessionentrys.csv'
WITH CSV HEADER;"

psql -h localhost -U postgres -d jolpica -c "\copy (
SELECT roundentry.*
FROM 
    formula_one_roundentry as roundentry
    JOIN formula_one_round as round ON roundentry.round_id = round.id
    JOIN formula_one_season as season ON round.season_id = season.id
WHERE 
    (season.year >= 2001) OR (season.year IN ($SESSION_ENTRY_WHERE_CLAUSE))
) TO 'dump/roundentrys.csv'
WITH CSV HEADER;"
