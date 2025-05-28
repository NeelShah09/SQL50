# Write your MySQL query statement below
WITH order_nums_and_type AS (
    SELECT
    (CASE WHEN order_date = (SELECT MIN(order_date) FROM delivery WHERE customer_id = d.customer_id) THEN 'first_order' ELSE 'others' END) order_number,
    (CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END) order_type
    FROM delivery d
)
SELECT ROUND((SELECT COUNT(*) FROM order_nums_and_type WHERE order_number = 'first_order' AND order_type = 'immediate')*100/COUNT(*),2) immediate_percentage
FROM order_nums_and_type
WHERE order_number = 'first_order';