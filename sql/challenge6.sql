-- step 1 
SELECT 
examination_date,
score,
student_id,
subject_id
FROM exam_results 
WHERE STRFTIME("%d",examination_date) = "01"

-- step 2 
SELECT
s.id as id,
s.grade as grade,
CASE s.is_repeat
  WHEN 1 then s.grade
  ELSE 
    CASE 
    WHEN s.grade == 6 THEN NULL
    ELSE s.grade + 1
    END
END   
as next_grade
FROM students as s
JOIN schools as sch 
on sch.id = s.school_id
WHERE sch.id = 5



-- step 3
SELECT 
STRFTIME("%Y-%m",e.examination_date) as examination_month,
sub.name as name,
count(sub.id) as number_of_examinations
FROM exam_results as e 
JOIN subjects as sub 
ON sub.id = e.subject_id 
GROUP BY STRFTIME("%Y-%m",e.examination_date) , sub.name 
ORDER BY STRFTIME("%Y-%m",e.examination_date)  DESC, sub.name ASC;

-- step 4
SELECT 
e.examination_date as examination_date,
STRFTIME("%Y",examination_date) || " "  || UPPER(SUBSTR(e.season,1,3)) || " " ||  sub.name as max_exam_name,
MAX(e.score) as max_score
FROM exam_results as e 
JOIN subjects as sub 
ON e.subject_id = sub.id 
GROUP BY e.examination_date 
ORDER BY e.score DESC;

-- step 5
SELECT 
e.id as id,
e.examination_date as examination_date,
e.student_id as student_id,
e.subject_id as subject_id,
e.score as score,
CASE STRFTIME("%d",examination_date)
  WHEN "01" THEN e.score 
  ELSE (
    SELECT 
    e1.score
    FROM exam_results as e1
    WHERE 
    STRFTIME("%Y-%m", e1.examination_date) = STRFTIME("%Y-%m", e.examination_date) 
    AND 
    STRFTIME("%d", e1.examination_date) = "01"
        AND e1.student_id = e.student_id
        AND e1.subject_id = e.subject_id

    LIMIT 1
  )
END
   as er_month_score,
CASE 
WHEN STRFTIME("%d",e.examination_date) = "01" THEN "-"
WHEN 
  (
    SELECT
    e2.score 
    FROM exam_results as e2
    WHERE  STRFTIME("%Y-%m", e.examination_date) = STRFTIME("%Y-%m", e2.examination_date) 
    AND STRFTIME("%d", e2.examination_date) = "01"
    AND e2.student_id = e.student_id
    AND e2.subject_id = e.subject_id
 LIMIT 1
  ) <=  e.score THEN "○"
  WHEN 
  (
    SELECT
    e3.score 
    FROM exam_results as e3
    WHERE  STRFTIME("%Y-%m", e.examination_date) = STRFTIME("%Y-%m", e3.examination_date) 
    AND STRFTIME("%d", e3.examination_date) = "01"
    AND e3.student_id = e.student_id
    AND e3.subject_id = e.subject_id

 LIMIT 1
  ) >  e.score THEN "△"
END
 as changing
FROM exam_results  as e

WHERE EXISTS (
  SELECT 1
  FROM exam_results e1
  WHERE 
    STRFTIME("%Y-%m", e1.examination_date) = STRFTIME("%Y-%m", e.examination_date)
    AND STRFTIME("%d", e1.examination_date) = "01"
    AND e1.student_id = e.student_id
    AND e1.subject_id = e.subject_id
)

ORDER BY e.examination_date ASC, e.id ASC

-- step 6
SELECT 
e.id as id,
sub.name as name,
e.score as score,
e.examination_date as examination_date,
STRFTIME("%Y",e.examination_date) || " "  || UPPER(SUBSTR(e.season,1,3)) || " " ||  
(
  SELECT sub2.name 
  FROM exam_results as e4
  JOIN subjects as sub2 
  ON sub2.id = e4.subject_id
  WHERE e4.examination_date = e.examination_date 
  ORDER BY e4.score DESC LIMIT 1
)
 as max_exam_name,
   ( SELECT MAX(e2.score)
    FROM exam_results e2
    WHERE e2.examination_date = e.examination_date)
as max_score
FROM exam_results as e
JOIN subjects as sub 
ON sub.id = e.subject_id
ORDER BY e.examination_date ASC, e.id ASC
