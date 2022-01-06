-- 17. Write a SQL query to find the country where the most assistant referees come from, and the count of the assistant referees.
/* ANSWER: 
country_name, cnt
'England', '4'
*/

SELECT country_name, count(*) cnt
FROM asst_referee_mast a
INNER JOIN soccer_country c
  ON a.country_id = c.country_id
GROUP BY country_name
ORDER BY cnt DESC
LIMIT 1;