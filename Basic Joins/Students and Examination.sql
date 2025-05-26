# Write your MySQL query statement below
SELECT st.student_id, st.student_name, sb.subject_name, (
    SELECT COUNT(1) FROM Examinations
    WHERE student_id = st.student_id
    AND subject_name = sb.subject_name) attended_exams
FROM Students st CROSS JOIN Subjects sb
ORDER BY student_id, subject_name;