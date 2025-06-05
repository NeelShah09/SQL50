-- Write your PostgreSQL query statement below
WITH all_unique_sales AS (
    SELECT DISTINCT sell_date, product FROM activities
) SELECT sell_date,
         COUNT(sell_date) num_sold,
         array_to_string(array(SELECT product FROM all_unique_sales WHERE sell_date = us.sell_date ORDER BY product), ',') products
FROM all_unique_sales us
GROUP BY sell_date
ORDER BY sell_date;