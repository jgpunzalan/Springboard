-- 7. Write a SQL query to find all the venues where matches with penalty shootouts were played.
/* ANSWER: 
venue_name
'Stade de Bordeaux'
'Stade VElodrome'
'Stade Geoffroy Guichard'
*/

SELECT venue_name
FROM match_mast m
INNER JOIN soccer_venue v
  ON m.venue_id = v.venue_id
WHERE decided_by = 'P';