CREATE DATABASE school;

USE school;

CREATE TABLE students(
    id INT AUTO_INCREMENET PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT
);
--insert data in the students table
INSERT INTO students(name, course, year_level)
VALUES
('Juan Dela Cruz','BSIT',1),
('Maria Santos','BSCS',2),
('Pedro Reyes','BSIT',3);


--show students data
SELECT * FROM students;
--filter data
--show students data only in BSIT
SELECT * FROM students;
WHERE course = 'BSIT'
--show students data in year 2 or higher
SELECT * FROM students;
WHERE year_level >= 2;

--Adding another student
INSERT INTO students(name, course, year_level)
VALUES
('Kacey Sangbaan','BSIT', 3);

SELECT * FROM students;

UPDATE students
SET year_level = 2
WHERE name = 'Juan Dela Cruz';

DELETE FROM students
WHERE name = 'Pedro Reyes';

CREATE TABLE courses(
    course_id INT AUTO_INCREMENET PRIMARY KEY,
    course_name VARCHAR(100),
    description VARCHAR(100),
    units INT
);
