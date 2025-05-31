-- Write your PostgreSQL query statement below
SELECT DISTINCT num "ConsecutiveNums" FROM logs l
WHERE (SELECT COUNT(*) FROM logs l2 WHERE (l2.id = l.id+1 OR l2.id = l.id+2) AND l2.num = l.num) = 2