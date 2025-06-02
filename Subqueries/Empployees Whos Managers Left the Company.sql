# Write your MySQL query statement below
SELECT employee_id FROM employees e
WHERE salary < 30000
AND manager_id IS NOT NULL
AND NOT EXISTS (SELECT manager_id FROM employees WHERE employee_id = e.manager_id)
ORDER BY employee_id;