-- Write your PostgreSQL query statement below
WITH ranked_employees AS (
    SELECT name,
        departmentId,
        salary,
        dense_rank() OVER(PARTITION BY departmentId ORDER BY salary DESC) d_rank
    FROM employee
) SELECT d.name "Department", re.name "Employee", re.salary "Salary"
FROM ranked_employees re JOIN department d
ON re.departmentId = d.id
WHERE d_rank < 4;