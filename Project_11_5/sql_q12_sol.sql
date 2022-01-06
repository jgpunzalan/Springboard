-- 12. Write a SQL query that returns the total number of goals scored by each position on each country’s team. Do not include positions which scored no goals.
/* ANSWER: 
country_name, position_desc, goals
'Albania', 'Defenders', '1'
'Austria', 'Midfielders', '1'
'Belgium', 'Defenders', '4'
'Belgium', 'Midfielders', '5'
'Croatia', 'Defenders', '1'
'Croatia', 'Midfielders', '4'
'Czech Republic', 'Defenders', '2'
'England', 'Defenders', '3'
'England', 'Midfielders', '1'
'France', 'Defenders', '9'
'France', 'Midfielders', '4'
'Germany', 'Defenders', '4'
'Germany', 'Midfielders', '3'
'Hungary', 'Defenders', '4'
'Hungary', 'Midfielders', '1'
'Iceland', 'Defenders', '6'
'Iceland', 'Midfielders', '3'
'Italy', 'Defenders', '5'
'Italy', 'Midfielders', '1'
'Northern Ireland', 'Defenders', '3'
'Poland', 'Defenders', '2'
'Poland', 'Midfielders', '2'
'Portugal', 'Defenders', '8'
'Portugal', 'Midfielders', '1'
'Republic of Ireland', 'Defenders', '1'
'Republic of Ireland', 'Midfielders', '3'
'Romania', 'Defenders', '2'
'Russia', 'Defenders', '1'
'Russia', 'Midfielders', '1'
'Slovakia', 'Midfielders', '3'
'Spain', 'Defenders', '5'
'Switzerland', 'Defenders', '2'
'Switzerland', 'Midfielders', '1'
'Turkey', 'Defenders', '1'
'Turkey', 'Midfielders', '1'
'Wales', 'Defenders', '8'
'Wales', 'Midfielders', '1'
*/

SELECT country_name, position_desc, count(*) goals
FROM goal_details g
INNER JOIN player_mast p
  ON g.player_id = p.player_id
INNER JOIN playing_position pos
  ON p.posi_to_play = pos.position_id
INNER JOIN soccer_country c
  ON p.team_id = c.country_id
GROUP BY country_name, position_desc
ORDER BY country_name, position_desc;