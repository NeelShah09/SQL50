# Write your MySQL query statement below
SELECT id
FROM weather w
WHERE temperature > (SELECT temperature FROM weather w1 WHERE recordDate = date_sub(w.recordDate,INTERVAL 1 DAY));