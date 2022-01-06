-- Note: Data issue exists in match_mast file.  Some goal_score values are 'DD-MON'.  Attempted to correct the data issue before data was loaded (e.g. '01-Feb' --> '1-2')
-- Note: Data discrepancy in score for match_no 50 where match_mast shows a score of 2-0, but match_details records show a score of 2-1.  Provided 2 queries to answere question.
--       Query 2 using data table would be more accurate approach.

-- 6. Write a SQL query to find the number of matches that were won by a single point, but do not include matches decided by penalty shootout.

-- Query 1
-- ANSWER: 21

SELECT COUNT(*)
FROM match_mast m
WHERE decided_by = 'N'
  AND ABS(SUBSTRING(goal_score, 1, 1) - SUBSTRING(goal_score, 3, 1)) = 1


-- Query 2
-- ANSWER: 22

SELECT count(*)
FROM match_details t1
INNER JOIN match_details t2
  ON t1.match_no = t2.match_no
  AND t1.team_id <> t2.team_id
WHERE t1.decided_by = 'N'
  AND ABS(t1.goal_score - t2.goal_score) = 1
  AND t1.win_lose = 'W';