-- Write your PostgreSQL query statement below
WITH all_data AS (
    SELECT id, email, RANK() OVER(PARTITION BY email ORDER BY id) rank FROM person
)
DELETE FROM person WHERE id IN (SELECT id FROM all_data WHERE rank > 1);