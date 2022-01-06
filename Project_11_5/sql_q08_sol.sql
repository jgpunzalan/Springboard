-- 8. Write a SQL query to find the match number for the game with the highest number of penalty shots, and which countries played that match.
/* ANSWER: 
country_name
'Germany'
'Italy'
*/

WITH most_shots as (
	SELECT match_no
	FROM penalty_shootout
	GROUP BY match_no
	ORDER BY count(*) DESC
	LIMIT 1
)
SELECT country_name
FROM match_details d
INNER JOIN soccer_country c
  ON d.team_id = c.country_id
WHERE match_no in (SELECT match_no from most_shots);