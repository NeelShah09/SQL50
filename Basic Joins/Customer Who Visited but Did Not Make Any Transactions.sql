# Write your MySQL query statement below
SELECT customer_id, COUNT(customer_id) count_no_trans
FROM visits v LEFT JOIN transactions t
ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY customer_id;