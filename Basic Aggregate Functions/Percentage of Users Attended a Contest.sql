# Write your MySQL query statement below
SELECT contest_id, ROUND(COUNT(*)*100/(SELECT COUNT(*) FROM users),2) percentage
FROM register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;