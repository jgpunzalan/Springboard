-- 5. Write a SQL query to find the number of bookings that happened in stoppage time.
-- ANSWER: 10

SELECT COUNT(*)
FROM player_booked
WHERE play_schedule = 'ST';