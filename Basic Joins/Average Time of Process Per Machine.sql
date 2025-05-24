# Write your MySQL query statement below
WITH process_times AS (
    SELECT machine_id, process_id, (
        SELECT timestamp FROM Activity
        WHERE machine_id = a.machine_id
        AND process_id = a.process_id
        AND activity_type = 'end') - (
        SELECT timestamp FROM Activity
        WHERE machine_id = a.machine_id
        AND process_id = a.process_id
        AND activity_type = 'start') process_time
        FROM Activity a
)
SELECT machine_id, ROUND(AVG(process_time),3) processing_time FROM process_times
GROUP BY machine_id;