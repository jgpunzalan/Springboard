-- 18. Write a SQL query to find the highest number of foul cards given in one match.
-- ANSWER: 10

SELECT match_no, count(*) cnt
FROM player_booked
GROUP BY match_no
ORDER BY cnt DESC;