-- step1
SELECT id, name, grade FROM students WHERE grade = 1;

-- step2 
INSERT INTO teachers (name, subject)
VALUES ("KRAUSE Ronald", "English")

-- step3
UPDATE teachers
SET subject = "English" WHERE id = 4
