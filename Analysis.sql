-- Which countries have won the most titles
SELECT winner AS team, COUNT(*) AS titles
FROM fifa_world_cup_matches
WHERE stage = 'Final'
GROUP BY winner
ORDER BY titles DESC;

-- Which teams have played the most matches?
SELECT
    team,
    COUNT(*) AS matches_played
FROM (
    SELECT team1 AS team
    FROM fifa_world_cup_matches

    UNION ALL

    SELECT team2
    FROM fifa_world_cup_matches
) teams
GROUP BY team
ORDER BY matches_played DESC;

-- Which teams have scored the most goals?
SELECT
    team,
    SUM(goals) AS total_goals
FROM (
    SELECT
        team1 AS team,
        total_goals_team1 AS goals
    FROM fifa_world_cup_matches

    UNION ALL

    SELECT
        team2,
        total_goals_team2
    FROM fifa_world_cup_matches
) goals
GROUP BY team
ORDER BY total_goals DESC;

-- Who are the all-time top goal scorers (by nation)?
WITH all_goals AS (
    SELECT
        team1 AS team,
        total_goals_team1 AS goals
    FROM fifa_world_cup_matches

    UNION ALL

    SELECT
        team2 AS team,
        total_goals_team2 AS goals
    FROM fifa_world_cup_matches
)

SELECT
    team,
    SUM(goals) AS total_goals
FROM all_goals
GROUP BY team
ORDER BY total_goals DESC
LIMIT 10;

-- Which World Cup tournament had the most goals
SELECT world_cup_year,
       SUM(total_goals_team1 + total_goals_team2) AS total_goals,
       COUNT(*) AS matches_played,
       ROUND(SUM(total_goals_team1 + total_goals_team2)::numeric / COUNT(*), 2) AS goals_per_match
FROM fifa_world_cup_matches
GROUP BY world_cup_year
ORDER BY total_goals DESC
LIMIT 10;

-- Does home-field advantage actually work?
WITH team_matches AS (
    SELECT
        host_country,
        team1 AS team,
        CASE WHEN winner = team1 THEN 1 ELSE 0 END AS win
    FROM fifa_world_cup_matches

    UNION ALL

    SELECT
        host_country,
        team2 AS team,
        CASE WHEN winner = team2 THEN 1 ELSE 0 END
    FROM fifa_world_cup_matches
)

SELECT
    team,
    ROUND(
        AVG(win) FILTER (WHERE team = host_country)::numeric,
        3
    ) AS host_win_rate,

    ROUND(
        AVG(win) FILTER (WHERE team <> host_country)::numeric,
        3
    ) AS non_host_win_rate,

    ROUND(
        (
            AVG(win) FILTER (WHERE team = host_country)
            -
            AVG(win) FILTER (WHERE team <> host_country)
        )::numeric,
        3
    ) AS difference

FROM team_matches
GROUP BY team
HAVING COUNT(*) FILTER (WHERE team = host_country) > 0
ORDER BY difference DESC;

-- Which teams perform best in knockout matches?
WITH knockout_teams AS (
    SELECT team1 AS team,
           CASE WHEN winner = team1 THEN 1 ELSE 0 END AS win
    FROM fifa_world_cup_matches
    WHERE stage NOT IN ('Group Stage', 'First round', 'Preliminary round', 'First round, Replays')
    UNION ALL
    SELECT team2 AS team,
           CASE WHEN winner = team2 THEN 1 ELSE 0 END AS win
    FROM fifa_world_cup_matches
    WHERE stage NOT IN ('Group Stage', 'First round', 'Preliminary round', 'First round, Replays')
)
SELECT
    team,
    COUNT(*) AS knockout_matches,
    SUM(win) AS knockout_wins,
    ROUND(SUM(win)::numeric / COUNT(*), 3) AS knockout_win_rate
FROM knockout_teams
GROUP BY team
HAVING COUNT(*) >= 10 
ORDER BY knockout_win_rate DESC
LIMIT 15;

--Which teams have appeared in the World Cup the most times overall
WITH team_appearances AS (
    SELECT world_cup_year, team1 AS team FROM fifa_world_cup_matches
    UNION
    SELECT world_cup_year, team2 AS team FROM fifa_world_cup_matches
)
SELECT team, COUNT(DISTINCT world_cup_year) AS tournaments_appeared
FROM team_appearances
GROUP BY team
ORDER BY tournaments_appeared DESC
LIMIT 15;