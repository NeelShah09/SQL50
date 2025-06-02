-- Write your PostgreSQL query statement below
SELECT s1.id id, s2.student student
FROM seat s1 CROSS JOIN seat s2
WHERE (s1.id % 2 = 1 AND s1.id + 1 = s2.id) OR (s1.id % 2 = 0 AND s1.id = s2.id + 1)

UNION
(SELECT id, student FROM seat WHERE id = (SELECT MAX(id) FROM seat) AND id % 2 = 1)
ORDER BY id