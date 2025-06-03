-- Write your PostgreSQL query statement below
WITH friends_list AS (
    SELECT requester_id id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id id FROM RequestAccepted
) SELECT id, COUNT(*) num FROM friends_list
GROUP BY id
ORDER BY num DESC
LIMIT 1