-- step 1
SELECT s.id, s.name, s.grade, 
CASE 
  WHEN s.grade = 6 THEN NULL 
  ELSE s.grade
END AS after_grade 
FROM students as s 
LEFT JOIN schools as sch 
ON s.school_id = sch.id 
WHERE school_id = 5 ; 

-- step2 
SELECT 
  COUNT(id) as number_of_students, 
  COUNT(id) / 8 AS sets,
  COUNT(id) % 8 AS single 
FROM students

-- step 3 
SELECT s.id, s.name as name , s.grade as grade, sch.id as school_id,  
CASE 
  WHEN s.grade IN (1, 2) THEN "lower"
  WHEN s.grade IN (3, 4) THEN "middle"
  WHEN s.grade IN (5, 6) THEN "upper"
  ELSE "other"
END AS grade_level
FROM students as s 
LEFT JOIN schools as sch 
ON s.school_id = sch.id 
WHERE school_id IN (4, 5) ; 

-- step4 
SELECT id, name, strftime("%m/%d", anniversary) as anniversary_date
FROM schools

-- step5 
SELECT e.id, e.subject_id, s.grade, e.score,
CASE 
WHEN e.score IS NULL then 40
ELSE e.score
END 
as after_score
FROM students as s 
JOIN exam_results as e
on s.id = e.student_id
WHERE s.grade = 4 AND e.subject_id =2  
