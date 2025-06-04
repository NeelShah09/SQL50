-- Write your PostgreSQL query statement below
WITH pid_with_same_2015 AS (
    SELECT i1.pid pid FROM insurance i1, insurance i2
    WHERE i1.tiv_2015 = i2.tiv_2015
    AND i1.pid != i2.pid
),
pid_in_same_city AS (
    SELECT i1.pid pid FROM insurance i1, insurance i2
    WHERE i1.lat = i2.lat
    AND i1.lon = i2.lon
    AND i1.pid != i2.pid
)
 SELECT ROUND(SUM(tiv_2016)::numeric,2) tiv_2016 FROM insurance
 WHERE pid IN (
    SELECT pid FROM pid_with_same_2015
    EXCEPT
    SELECT pid FROM pid_in_same_city
 );