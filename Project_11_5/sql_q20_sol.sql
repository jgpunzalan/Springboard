-- 20. Write a SQL query to find the substitute players who came into the field in the first half of play, within a normal play schedule.
/* ANSWER: 
player_id, team_id, jersey_no, player_name, posi_to_play, dt_of_bir, age, playing_club
'160180', '1208', '7', 'Bastian Schweinsteiger', 'MF', '1984-08-01', '31', 'Man. United'
'160321', '1214', '20', 'Ricardo Quaresma', 'FD', '1983-09-26', '32', 'Besiktas'
'160444', '1220', '3', 'Erik Johansson', 'DF', '1988-12-30', '27', 'Kobenhavn'
*/

SELECT pm.*
FROM player_in_out pio
INNER JOIN player_mast pm
  ON pio.player_id = pm.player_id
WHERE pio.play_schedule = 'NT'
  AND pio.play_half = 1
  AND pio.in_out = 'I';