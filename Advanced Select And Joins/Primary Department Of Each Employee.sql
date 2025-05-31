# Write your MySQL query statement below
SELECT employee_id, department_id FROM (
    SELECT employee_id, department_id, primary_flag, RANK() OVER(PARTITION BY employee_id ORDER BY primary_flag ) rrank
    FROM employee
) r
WHERE rrank = 1;