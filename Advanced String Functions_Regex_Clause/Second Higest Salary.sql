WITH os AS (
    SELECT id, salary, DENSE_RANK() OVER(ORDER BY salary DESC) s_rank FROM employee
)
SELECT
    CASE
        WHEN EXISTS (SELECT salary FROM os WHERE s_rank = 2)
            THEN (SELECT DISTINCT salary FROM os WHERE s_rank = 2)
        ELSE NULL
    END "SecondHighestSalary";