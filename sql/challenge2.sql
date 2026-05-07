-- step1 
SELECT DISTINCT name
FROM schools;

-- step2
SELECT 
    s.name AS student_name,
    sub.name AS subject,
    e.score AS score,
    sch.name AS school_name
FROM students AS s
LEFT JOIN exam_results AS e
    ON s.id = e.student_id
LEFT JOIN subjects AS sub
    ON e.subject_id = sub.id
JOIN schools AS sch
    ON s.school_id = sch.id


-- Step3 
SELECT t.name as name 
FROM teachers as t
JOIN exam_results as e
ON t.subject_id = e.subject_id
WHERE e.score = 100;

-- step4 
SELECT DISTINCT s.name 
FROM students as s
JOIN exam_results as e 
ON s.id = e.student_id
WHERE e.score >= 90

