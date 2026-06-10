SELECT 
    s.studentid,
    s.firstname,
    s.lastname,
    c.coursename,
    e.grade
FROM students s
JOIN enrolments e ON s.studentid = e.studentid
JOIN courses c ON e.courseid = c.courseid;


SELECT 
    s.studentid,
    s.firstname,
    s.lastname,
    AVG(e.grade) AS gpa
FROM students s
JOIN enrolments e ON s.studentid = e.studentid
GROUP BY s.studentid, s.firstname, s.lastname;


SELECT 
    s.firstname,
    s.lastname,
    AVG(e.grade) AS average_score
FROM students s
JOIN enrolments e ON s.studentid = e.studentid
GROUP BY s.studentid
ORDER BY average_score DESC
LIMIT 1;


SELECT 
    c.coursename,
    AVG(e.grade) AS class_average
FROM courses c
JOIN enrolments e ON c.courseid = e.courseid
GROUP BY c.coursename;


SELECT 
    s.firstname,
    s.lastname,
    e.grade
FROM students s
JOIN enrolments e ON s.studentid = e.studentid
WHERE e.grade < 50;

SELECT 
    s.studentid,
    s.firstname,
    s.lastname,
    AVG(e.grade) AS average_score,

    CASE 
        WHEN AVG(e.grade) >= 70 THEN 'A'
        WHEN AVG(e.grade) >= 60 THEN 'B'
        WHEN AVG(e.grade) >= 50 THEN 'C'
        WHEN AVG(e.grade) >= 40 THEN 'D'
        ELSE 'F'
    END AS grade_letter

FROM students s
JOIN enrolments e ON s.studentid = e.studentid
GROUP BY s.studentid, s.firstname, s.lastname;


--view
DROP VIEW IF EXISTS student_performance;

CREATE VIEW student_performance AS
SELECT 
    s.studentid,
    s.firstname,
    s.lastname,
    AVG(e.grade) AS avg_grade
FROM students s
JOIN enrolments e ON s.studentid = e.studentid
GROUP BY s.studentid, s.firstname, s.lastname;

--use view
SELECT * FROM student_performance;

