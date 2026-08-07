DROP TABLE IF EXISTS fifa_world_cup_matches;
CREATE TABLE fifa_world_cup_matches (
    match_id INT PRIMARY KEY,
    world_cup_year INT,
    host_country VARCHAR(100),
    match_date DATE,
    stage VARCHAR(50),
    round_raw VARCHAR(50),
    group_name VARCHAR(30),
    team1 VARCHAR(100),
    team2 VARCHAR(100),

    halftime_score_team1 INT,
    halftime_score_team2 INT,

    fulltime_score_team1 INT,
    fulltime_score_team2 INT,

    extra_time_score_team1 INT,
    extra_time_score_team2 INT,

    penalty_score_team1 INT,
    penalty_score_team2 INT,

    winner VARCHAR(100),
    result_method VARCHAR(50),

    stadium VARCHAR(150),
    city VARCHAR(100),

    total_goals_team1 INT,
    total_goals_team2 INT
);

COPY fifa_world_cup_matches 
FROM 'C:/ProgramData/Microsoft/Windows/Start Menu/Programs/PostgreSQL 16/data/fifa_world_cup_all_matches_1930_2026.csv'
DELIMITER ','
CSV HEADER;

