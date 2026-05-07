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

-- step5 
SELECT s.name as name, 
sub.name as subject,
e.score,
ROUND(a_t.avg_score,0) as average_subject
FROM exam_results as e 
JOIN students as s
ON e.student_id = s.id 
JOIN subjects as sub 
ON e.subject_id = sub.id 
JOIN (
  SELECT subject_id,
  AVG(score) as avg_score
  FROM exam_results
  GROUP BY subject_id
) a_t 
ON e.subject_id = a_t.subject_id;
