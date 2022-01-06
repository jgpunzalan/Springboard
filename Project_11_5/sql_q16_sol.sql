-- 16. Write a SQL query to find referees and the number of matches they worked in each venue.
/* ANSWER: 
referee_name, venue_name, cnt
'Bjorn Kuipers', 'Stade de Bordeaux', '1'
'Bjorn Kuipers', 'Stade de France', '2'
'Carlos Velasco Carballo', 'Stade Bollaert-Delelis', '2'
'Carlos Velasco Carballo', 'Stade Geoffroy Guichard', '1'
'Clement Turpin', 'Parc des Princes', '1'
'Clement Turpin', 'Stade de Bordeaux', '1'
'Cuneyt Cakir', 'Stade de Bordeaux', '1'
'Cuneyt Cakir', 'Stade de France', '1'
'Cuneyt Cakir', 'Stade Geoffroy Guichard', '1'
'Damir Skomina', 'Stade de Nice', '1'
'Damir Skomina', 'Stade Pierre Mauroy', '3'
'Felix Brych', 'Stade Bollaert-Delelis', '1'
'Felix Brych', 'Stade de Nice', '1'
'Felix Brych', 'Stade VElodrome', '1'
'Jonas Eriksson', 'Parc des Princes', '1'
'Jonas Eriksson', 'Stade de Lyon', '1'
'Jonas Eriksson', 'Stadium de Toulouse', '1'
'Mark Clattenburg', 'Stade de France', '1'
'Mark Clattenburg', 'Stade de Lyon', '1'
'Mark Clattenburg', 'Stade Geoffroy Guichard', '2'
'Martin Atkinson', 'Parc des Princes', '1'
'Martin Atkinson', 'Stade de Lyon', '1'
'Martin Atkinson', 'Stade Pierre Mauroy', '1'
'Milorad Mazic', 'Stade de France', '1'
'Milorad Mazic', 'Stade de Nice', '1'
'Milorad Mazic', 'Stadium de Toulouse', '1'
'Nicola Rizzoli', 'Parc des Princes', '1'
'Nicola Rizzoli', 'Stade de Lyon', '1'
'Nicola Rizzoli', 'Stade VElodrome', '2'
'Ovidiu Hategan', 'Stade de Nice', '1'
'Ovidiu Hategan', 'Stade Pierre Mauroy', '1'
'Pavel Kralovec', 'Stade de Lyon', '2'
'Sergei Karasev', 'Parc des Princes', '1'
'Sergei Karasev', 'Stade VElodrome', '1'
'Svein Oddvar Moen', 'Stade de Bordeaux', '1'
'Svein Oddvar Moen', 'Stade VElodrome', '1'
'Szymon Marciniak', 'Stade de France', '1'
'Szymon Marciniak', 'Stade Pierre Mauroy', '1'
'Szymon Marciniak', 'Stadium de Toulouse', '1'
'Viktor Kassai', 'Stade de Bordeaux', '1'
'Viktor Kassai', 'Stade de France', '1'
'Viktor Kassai', 'Stadium de Toulouse', '1'
'William Collum', 'Stade Bollaert-Delelis', '1'
'William Collum', 'Stade VElodrome', '1'
*/

SELECT r.referee_name, v.venue_name, count(*) cnt
FROM match_mast m
INNER JOIN referee_mast r
  ON m.referee_id = r.referee_id
INNER JOIN soccer_venue v
  ON m.venue_id = v.venue_id
GROUP BY r.referee_name, v.venue_name
ORDER BY r.referee_name, v.venue_name;
