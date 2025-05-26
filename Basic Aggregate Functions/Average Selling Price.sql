# Write your MySQL query statement below
SELECT p.product_id, IFNULL(ROUND(SUM(price*units)/SUM(units),2), 0) average_price
FROM prices p LEFT JOIN unitssold us
ON p.product_id = us.product_id
AND (us.purchase_date BETWEEN p.start_date AND p.end_date)
GROUP BY p.product_id;