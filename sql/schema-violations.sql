-- Fixed-schema experiments. Run one statement at a time.
USE university_db;

-- 1. Column does not exist
INSERT INTO student (student_code, full_name, email, phone)
VALUES ('S010', 'Test One', 'test1@example.com', '0771234567');

-- 2. Required NOT NULL column omitted
INSERT INTO student (student_code, full_name)
VALUES ('S011', 'Test Two');

-- 3. Wrong data type
INSERT INTO course (code, title, credits, lecturer_id)
VALUES ('CS301', 'Test Course', 'three', 1);

-- 4. Duplicate UNIQUE value
INSERT INTO student (student_code, full_name, email)
VALUES ('S001', 'Test Three', 'test3@example.com');

-- 5. Value longer than VARCHAR(10)
INSERT INTO department (code, name)
VALUES ('D0000000001', 'Too Long Code');

-- 6. Foreign key points to a missing row
INSERT INTO enrollment (student_id, course_id, grade)
VALUES (1, 999, 'A');

-- 7. Delete a row referenced by other rows
DELETE FROM department
WHERE code = 'D01';

-- 8. CHECK constraint violation
INSERT INTO course (code, title, credits, lecturer_id)
VALUES ('CS302', 'Test Course', 10, 1);

-- Deliberate schema change, then undo it.
ALTER TABLE student ADD COLUMN phone VARCHAR(15);
DESCRIBE student;
SELECT * FROM student;
ALTER TABLE student DROP COLUMN phone;
