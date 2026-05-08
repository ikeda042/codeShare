--条件を満たす科目を抽出
SELECT title FROM subjects 
WHERE NOT EXISTS (
SELECT 1 FROM accounts 
WHERE subject_id = subjects.id)

--条件を満たす科目を抽出する 2
SELECT title FROM subjects
LEFT JOIN accounts ON accounts.subject_id = subjects.id
GROUP BY subjects.title
HAVING COUNT(accounts.id) < 3;
