
--ACTIVITY 2
USE school;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);
DESCRIBE enrollments;

ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES students(id);

ALTER TABLE enrollments
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses(id);

DESCRIBE enrollments;

SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(1,1,'2026-10-7'),
(1,2,'2026-10-7'),
(2,1,'2026-10-7'),
(2,2,'2026-10-7'),
(4,3,'2026-10-7'),
(1,6,'2026-10-7'),
(1,8,'2026-10-7'),
(1,10,'2026-10-7'),
(10,8,'2026-10-7'),
(8,5,'2026-10-7'),
(1,6,'2026-10-7'),
(5,2,'2026-10-7'),
(2,5,'2026-10-7'),
(5,7,'2026-10-7'),
(6,4,'2026-10-7')
;

SELECT * FROM enrollment;

--basic JOIN
SELECT 
    students.name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students_id
JOIN courses
    ON enrollments.course_id = courses.course_id;

--filter using WHERE
SELECT 
    students.name,
    courses.course_name
FROM enrollments
JOIN students 
    ON enrollments.student_id = students_id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'CC5';


--Ascending
SELECT 
    students.name,
    courses.course_name
FROM enrollments
JOIN students 
    ON enrollments.student_id = students_id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name ASC;

--descending
SELECT 
    students.name,
    courses.course_name
FROM enrollments
JOIN students 
    ON enrollments.student_id = students_id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name DESC;

--count number of the students
SELECT COUNT(*) AS total_students
FROM students;

--count student enrollments
SELECT COUNT(*) AS total_enrollments
FROM enrollments

--count students per course
SELECT 
    courses.course_name
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

--find most popular course
SELECT 
    courses.course_name
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC;

--student report
SELECT 
    students.id AS student_id,
    students.name AS student.name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name;



--CHALLENGE TASK

--display students enrolled in particular course
SELECT 
    students.name,
    courses.course_name
FROM enrollments
JOIN students 
    ON enrollments.student_id = students_id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'CC2';

--courses taken by a particular student
SELECT 
    students.name,
    courses.course_name
FROM enrollments
JOIN students 
    ON enrollments.student_id = students_id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE students.name = 'Maria Santos';

--count students each course
SELECT 
    courses.course_name
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

--course with the most students
SELECT 
    courses.course_name
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

--alphabetical students
SELECT * FROM students
ORDER BY name ASC;


--total enrollments
SELECT COUNT(*) AS total_enrollments
FROM enrollments
