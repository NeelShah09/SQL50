# Write your MySQL query statement below
SELECT 
    DATE_FORMAT(trans_date,'%Y-%m') month,
    country,
    COUNT(*) trans_count,
    COUNT(CASE WHEN state='approved' THEN 1 END) approved_count,
    SUM(amount) trans_total_amount,
    IFNULL(SUM(CASE WHEN state='approved' THEN amount END),0) approved_total_amount
FROM transactions
GROUP BY DATE_FORMAT(trans_date,'%Y-%m'), country;