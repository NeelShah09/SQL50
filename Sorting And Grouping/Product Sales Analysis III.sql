-- Write your PostgreSQL query statement below
SELECT product_id, first_year, quantity, price FROM (
    SELECT product_id,
        year first_year,
        quantity,
        price,
        DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) r
    FROM sales
)
WHERE r = 1;