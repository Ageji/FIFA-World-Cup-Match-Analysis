-- making corrections 
UPDATE fifa_world_cup_matches
SET stage = 'Third-place match'
WHERE stage IN ('Third-place play-off', 'Third Place Play-off');

-- merging west germany and germany
UPDATE fifa_world_cup_matches
SET team1 = 'Germany'
WHERE team1 = 'West Germany';

UPDATE fifa_world_cup_matches
SET team2 = 'Germany'
WHERE team2 = 'West Germany';

UPDATE fifa_world_cup_matches
SET winner = 'Germany'
WHERE winner = 'West Germany';