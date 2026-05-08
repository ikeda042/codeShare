--条件を満たす科目を抽出
SELECT title FROM subjects 
WHERE NOT EXISTS (
SELECT 1 FROM accounts 
WHERE subject_id = subjects.id)
