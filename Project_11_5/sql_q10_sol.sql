-- 10. Write a SQL query to find all available information about the players under contract to Liverpool F.C. playing for England in EURO Cup 2016.
/* ANSWER: 
player_id, team_id, jersey_no, player_name, posi_to_play, dt_of_bir, age, playing_club
'160131', '1206', '4', 'James Milner', 'MF', '1986-01-04', '30', 'Liverpool'
'160130', '1206', '8', 'Adam Lallana', 'MF', '1988-05-10', '28', 'Liverpool'
'160121', '1206', '12', 'Nathaniel Clyne', 'DF', '1991-04-05', '25', 'Liverpool'
'160129', '1206', '14', 'Jordan Henderson', 'MF', '1990-06-17', '26', 'Liverpool'
'160137', '1206', '15', 'Daniel Sturridge', 'FD', '1989-09-01', '26', 'Liverpool'
*/

SELECT *
FROM player_mast
WHERE playing_club = 'Liverpool'
  AND team_id in (
	    SELECT country_id
        FROM soccer_country
        WHERE country_name = 'England'
	  );