# Write your MySQL query statement below

SELECT
    employee_id,
    name,
    (SELECT COUNT(*) FROM employees WHERE reports_to = e.employee_id) reports_count,
    ROUND((SELECT AVG(age) FROM employees WHERE reports_to = e.employee_id)) average_age
FROM employees e
WHERE employee_id IN (
    SELECT DISTINCT(reports_to) FROM employees WHERE reports_to IS NOT NULL
)
ORDER BY employee_id;