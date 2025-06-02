-- Write your PostgreSQL query statement below
SELECT person_name FROM Queue
WHERE turn = (SELECT q1.turn
    FROM Queue q1, Queue q2
    WHERE q2.turn <= q1.turn
    GROUP BY q1.turn
    HAVING SUM(q2.weight) <= 1000
ORDER BY turn DESC LIMIT 1)