-- 4. Write a SQL query to compute a list showing the number of substitutions that happened in various stages of play for the entire tournament.
/* ANSWER:
# play_schedule, count(1)
'NT', '275'
'ST', '9'
'ET', '9'

*/

SELECT play_schedule, count(1)
FROM player_in_out
WHERE in_out = 'I'
GROUP BY play_schedule;