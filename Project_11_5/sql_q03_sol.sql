-- 3. Write a SQL query to find the match number, date, and score for matches in which no stoppage time was added in the 1st half.
/* ANSWER:
match_no, play_date, goal_score
'4', '2016-06-12 00:00:00', '1-1'
*/

SELECT match_no, play_date, goal_score
FROM match_mast
WHERE stop1_sec = 0;