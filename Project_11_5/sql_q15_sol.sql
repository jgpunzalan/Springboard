-- 15. Write a SQL query to find the referees who booked the most number of players.
/* ANSWER: Returning rank 1-5
referee_name, players_booked, rnk
'Mark Clattenburg', '21', '1'
'Nicola Rizzoli', '19', '2'
'Milorad Mazic', '13', '3'
'Bjorn Kuipers', '12', '4'
'Damir Skomina', '12', '4'
'Sergei Karasev', '12', '4'
'Viktor Kassai', '12', '4'
*/

WITH ref_player_bookings AS (
	SELECT r.referee_name, count(DISTINCT b.player_id) players_booked
	FROM player_booked b
	INNER JOIN match_mast m
	  ON b.match_no = m.match_no
	INNER JOIN referee_mast r
	  ON m.referee_id = r.referee_id
	GROUP BY r.referee_name
)
SELECT referee_name, players_booked, rnk
FROM (
	SELECT referee_name, players_booked, RANK() OVER (ORDER BY players_booked DESC) rnk
	FROM ref_player_bookings) a
WHERE  rnk < 6
ORDER BY rnk, referee_name