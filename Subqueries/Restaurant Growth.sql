-- Write your PostgreSQL query statement below
SELECT DISTINCT visited_on,
        (
            SELECT SUM(amount)
            FROM customer WHERE visited_on BETWEEN c.visited_on - INTERVAL '6 days'
            AND c.visited_on
        ) amount,
        (
            SELECT ROUND(SUM(amount) / 7.0, 2)
            FROM customer WHERE visited_on BETWEEN c.visited_on - INTERVAL '6 days'
            AND c.visited_on
        ) average_amount
FROM customer c
WHERE EXISTS (
    SELECT visited_on FROM customer c2 WHERE c2.visited_on = c.visited_on - INTERVAL '6 days')
ORDER BY visited_on