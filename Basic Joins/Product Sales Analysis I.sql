# Write your MySQL query statement below
SELECT p.product_name product_name, s.year year, s.price price
FROM Sales s LEFT JOIN Product p
ON s.product_id = p.product_id;