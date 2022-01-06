-- 14. Write a SQL query to find referees and the number of bookings they made for the entire tournament. Sort your answer by the number of bookings in descending order.
/* ANSWER: 
referee_name, bookings
'Mark Clattenburg', '21'
'Nicola Rizzoli', '20'
'Milorad Mazic', '13'
'Bjorn Kuipers', '12'
'Damir Skomina', '12'
'Sergei Karasev', '12'
'Viktor Kassai', '12'
'Cuneyt Cakir', '11'
'Jonas Eriksson', '11'
'Pavel Kralovec', '11'
'Carlos Velasco Carballo', '10'
'Szymon Marciniak', '10'
'Ovidiu Hategan', '9'
'Martin Atkinson', '9'
'Felix Brych', '9'
'Svein Oddvar Moen', '8'
'William Collum', '8'
'Clement Turpin', '3'
*/

SELECT referee_name, count(*) bookings
FROM player_booked b
INNER JOIN match_mast m
  ON b.match_no = m.match_no
INNER JOIN referee_mast r
  ON m.referee_id = r.referee_id
GROUP BY referee_name
ORDER BY bookings DESC;