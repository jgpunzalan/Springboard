-- 2. Write a SQL query to find the number of matches that were won by penalty shootout.
-- ANSWER: 3

SELECT COUNT(*)
FROM match_mast
WHERE results = 'WIN'
  AND decided_by = 'P';