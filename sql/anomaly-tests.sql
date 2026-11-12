-- Run after anomaly-demo.sql, one section at a time.
USE university_db;

-- A. Redundancy and update anomaly
SELECT COUNT(*) AS copies
FROM registration_flat
WHERE lecturer_email = 'perera@uni.lk';

UPDATE registration_flat
SET lecturer_email = 'perera.new@uni.lk'
WHERE student_id = 'S001' AND course_code = 'CS101';

SELECT DISTINCT lecturer_name, lecturer_email
FROM registration_flat
WHERE lecturer_name = 'Dr. Perera';

-- B. Insert anomaly
INSERT INTO registration_flat
  (course_code, course_title, credits, lecturer_name, lecturer_email,
   department_code, department_name)
VALUES
  ('CS301', 'Software Engineering', 3, 'Dr. Fernando',
   'fernando@uni.lk', 'D01', 'Computer Science');

-- C. Delete anomaly
DELETE FROM registration_flat
WHERE student_id = 'S004';

SELECT *
FROM registration_flat
WHERE course_code = 'CS201';
