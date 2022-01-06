-- 19. Write a SQL query to find the number of captains who were also goalkeepers.
-- ANSWER: 17

SELECT count(*)
FROM player_mast p
INNER JOIN match_captain c
  ON p.player_id = c.player_captain
WHERE p.posi_to_play = 'GK';