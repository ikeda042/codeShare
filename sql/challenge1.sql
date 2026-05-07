-- step1
SELECT id, name, grade FROM students WHERE grade = 1;

-- step2 
INSERT INTO teachers (name, subject)
VALUES ("KRAUSE Ronald", "English")

-- step3
UPDATE teachers
SET subject = "English" WHERE id = 4

-- step4
DELETE FROM exam_results WHERE teacher_name is NULL
-- step5
SELECT id, name, subject FROM teachers WHERE subject IN ("Japanese", "math", "English")
-- step6
SELECT student_name FROM exam_results 
WHERE student_grade = 5 AND subject = "Japanese" 
ORDER BY score Desc, student_name ASC 
LIMIT 5 OFFSET 5

-- step7
SELECT grade, count(id) AS each_grade FROM students GROUP BY grade
-- step8
SELECT subject FROM teachers GROUP BY subject HAVING COUNT(subject) <= 6
-- step9
SELECT student_name, SUM(score) AS total FROM exam_results GROUP BY student_name
