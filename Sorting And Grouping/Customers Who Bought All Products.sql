-- Write your PostgreSQL query statement below
WITH all_posibilities AS (
    SELECT DISTINCT c.customer_id, p.product_key FROM customer c
    CROSS JOIN product p
),
excluded_keys AS (
    SELECT * FROM all_posibilities
    EXCEPT
    SELECT * FROM customer
)
SELECT DISTINCT customer_id FROM customer WHERE customer_id NOT IN (SELECT customer_id FROM excluded_keys);