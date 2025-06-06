-- Write your PostgreSQL query statement below
SELECT product_name, SUM(unit) unit
FROM orders o JOIN products p ON o.product_id = p.product_id
WHERE TO_CHAR(order_date,'YYYY-MM') = '2020-02'
GROUP BY product_name
HAVING SUM(unit) >= 100;