# Write your MySQL query statement below

SELECT name FROM employee
WHERE id IN (
    SELECT managerid FROM employee
    GROUP BY managerid HAVING COUNT(managerid)>=5
);