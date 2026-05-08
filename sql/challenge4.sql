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
