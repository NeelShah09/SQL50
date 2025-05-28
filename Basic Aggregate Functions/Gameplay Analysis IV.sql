# Write your MySQL query statement below
WITH players_start_date AS (
    SELECT DISTINCT player_id, MIN(event_date) OVER(PARTITION BY player_id) AS start_date
    FROM activity
)
SELECT ROUND(
    (
        SELECT COUNT(*)
        FROM activity a
        JOIN players_start_date psd
        ON a.player_id = psd.player_id AND a.event_date = date_add(psd.start_date,INTERVAL 1 DAY)
    ) / (SELECT COUNT(*) FROM players_start_date), 2) AS fraction;