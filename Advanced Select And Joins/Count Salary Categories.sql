-- Write your PostgreSQL query statement below
WITH categorized_salary AS (
    SELECT CASE WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END category
    FROM accounts
)
SELECT 'Low Salary' category, COUNT(category) accounts_count FROM categorized_salary
WHERE category = 'Low Salary'
    UNION
SELECT 'Average Salary' category, COUNT(category) accounts_count FROM categorized_salary
WHERE category = 'Average Salary'
    UNION
SELECT 'High Salary' category, COUNT(category) accounts_count FROM categorized_salary
WHERE category = 'High Salary'