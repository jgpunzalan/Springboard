-- 13. Write a SQL query to find all the defenders who scored a goal for their teams.
/* ANSWER: 
player_id, team_id, jersey_no, player_name, posi_to_play, dt_of_bir, age, playing_club
'160023', '1201', '10', 'Armando Sadiku', 'FD', '1991-05-27', '25', 'Vaduz'
'160050', '1203', '2', 'Toby Alderweireld', 'DF', '1989-03-02', '27', 'Tottenham'
'160065', '1203', '22', 'Michy Batshuayi', 'FD', '1993-10-02', '22', 'Marseille'
'160067', '1203', '9', 'Romelu Lukaku', 'FD', '1993-05-13', '23', 'Everton'
'160089', '1204', '16', 'Nikola Kalinic', 'FD', '1988-01-05', '28', 'Fiorentina'
'160114', '1205', '7', 'TomasNecid', 'FD', '1989-08-13', '26', 'Bursaspor'
'160115', '1205', '12', 'Milan Skoda', 'FD', '1986-01-16', '30', 'Slavia Praha'
'160136', '1206', '10', 'Wayne Rooney', 'FD', '1985-10-24', '30', 'Man. United'
'160137', '1206', '15', 'Daniel Sturridge', 'FD', '1989-09-01', '26', 'Liverpool'
'160138', '1206', '11', 'Jamie Vardy', 'FD', '1987-01-11', '29', 'Leicester'
'160159', '1207', '9', 'Olivier Giroud', 'FD', '1986-09-30', '29', 'Arsenal'
'160160', '1207', '7', 'Antoine Griezmann', 'FD', '1991-03-21', '25', 'Atletico'
'160165', '1208', '17', 'Jerome Boateng', 'DF', '1988-09-03', '27', 'Bayern'
'160182', '1208', '23', 'Mario Gomez', 'FD', '1985-07-10', '30', 'Besiktas'
'160183', '1208', '13', 'Thomas Muller', 'FD', '1989-09-13', '26', 'Bayern'
'160202', '1209', '7', 'Balazs Dzsudzsak', 'FD', '1986-12-23', '29', 'Bursaspor'
'160203', '1209', '10', 'Zoltan Gera', 'FD', '1979-04-22', '37', 'Ferencvaros'
'160207', '1209', '9', 'Adam Szalai', 'FD', '1987-12-09', '28', 'Hannover'
'160216', '1210', '2', 'Birkir Saevarsson', 'DF', '1984-11-11', '31', 'Hammarby'
'160219', '1210', '21', 'Arnor Ingvi Traustason', 'DF', '1993-04-30', '23', 'Norrkoping'
'160226', '1210', '15', 'Jon Dadi Bodvarsson', 'FD', '1992-05-25', '24', 'Kaiserslautern'
'160230', '1210', '9', 'Kolbeinn Sigthorsson', 'FD', '1990-03-14', '26', 'Nantes'
'160235', '1211', '19', 'Leonardo Bonucci', 'DF', '1987-05-01', '29', 'Juventus'
'160236', '1211', '3', 'Giorgio Chiellini', 'DF', '1984-08-14', '31', 'Juventus'
'160248', '1211', '17', 'Eder', 'FD', '1986-11-15', '29', 'Internazionale'
'160252', '1211', '9', 'Graziano Pelle', 'FD', '1985-07-15', '30', 'Southampton'
'160262', '1212', '4', 'Gareth McAuley', 'DF', '1979-12-05', '36', 'West Brom'
'160275', '1212', '7', 'Niall McGinn', 'FD', '1987-07-20', '28', 'Aberdeen'
'160297', '1213', '9', 'Robert Lewandowski', 'FD', '1988-08-21', '27', 'Bayern'
'160298', '1213', '7', 'Arkadiusz Milik', 'FD', '1994-02-28', '22', 'Ajax'
'160319', '1214', '9', 'Eder', 'FD', '1987-12-22', '28', 'LOSC'
'160320', '1214', '17', 'Nani', 'FD', '1986-11-17', '29', 'Fenerbahce'
'160321', '1214', '20', 'Ricardo Quaresma', 'FD', '1983-09-26', '32', 'Besiktas'
'160322', '1214', '7', 'Cristiano Ronaldo', 'FD', '1985-02-05', '31', 'Real Madrid'
'160327', '1215', '3', 'Ciaran Clark', 'DF', '1989-09-26', '26', 'Aston Villa'
'160368', '1216', '19', 'Bogdan Stancu', 'FD', '1987-06-28', '28', 'Genclerbirligi'
'160373', '1217', '14', 'Vasili Berezutski', 'DF', '1982-06-20', '33', 'CSKA Moskva'
'160423', '1219', '3', 'Gerard Pique', 'DF', '1987-02-02', '29', 'Barcelona'
'160435', '1219', '7', 'Alvaro Morata', 'FD', '1992-10-23', '23', 'Juventus'
'160436', '1219', '22', 'Nolito', 'FD', '1986-10-15', '29', 'Celta'
'160470', '1221', '22', 'Fabian Schar', 'DF', '1991-12-20', '24', 'Hoffenheim'
'160481', '1221', '18', 'Admir Mehmedi', 'FD', '1991-03-16', '25', 'Leverkusen'
'160504', '1222', '17', 'Burak Yilmaz', 'FD', '1985-07-15', '30', 'Beijing Guoan'
'160538', '1224', '3', 'Neil Taylor', 'DF', '1989-02-07', '27', 'Swansea'
'160539', '1224', '6', 'Ashley Williams', 'DF', '1984-08-23', '31', 'Swansea'
'160547', '1224', '11', 'Gareth Bale', 'FD', '1989-07-16', '26', 'Real Madrid'
'160550', '1224', '9', 'Hal Robson-Kanu', 'FD', '1989-05-21', '27', 'Reading'
'160551', '1224', '18', 'Sam Vokes', 'FD', '1989-10-21', '26', 'Burnley'
*/

SELECT DISTINCT p.*
FROM goal_details g
INNER JOIN player_mast p
  ON g.player_id = p.player_id
INNER JOIN playing_position pos
  ON p.posi_to_play = pos.position_id
WHERE pos.position_desc = 'Defenders'
ORDER BY player_id;