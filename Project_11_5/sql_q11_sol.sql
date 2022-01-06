-- 11. Write a SQL query to find the players, their jersey number, and playing club who were the goalkeepers for England in EURO Cup 2016.
/* ANSWER: 
player_id, team_id, jersey_no, player_name, posi_to_play, dt_of_bir, age, playing_club
'160117', '1206', '1', 'Joe Hart', 'GK', '1987-04-19', '29', 'Man. City'
*/

SELECT DISTINCT p.*
FROM player_mast p
INNER JOIN soccer_country c
  ON p.team_id = c.country_id
INNER JOIN match_details m
  ON p.player_id = m.player_gk
WHERE c.country_name = 'England';