-- 9. Write a SQL query to find the goalkeeper’s name and jersey number, playing for Germany, who played in Germany’s group stage matches.
/* ANSWER: 
player_name, jersey_no
'Manuel Neuer', '1'
*/

SELECT DISTINCT player_name, jersey_no
FROM match_details d
INNER JOIN soccer_country c
  ON d.team_id = c.country_id
INNER JOIN player_mast p
  ON d.player_gk = p.player_id
WHERE country_name = 'Germany'
  AND play_stage = 'G';
