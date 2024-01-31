-- Active: 1706530240114@@127.0.0.1@5432@tjDB
CREATE TABLE students (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    location VARCHAR(100) NOT NULL
);

INSERT INTO students (id, first_name, last_name, age, location) VALUES
(1, 'Juan', 'Cruz', 18, 'Manila'),
(2, 'Anne', 'Wall', 20, 'Manila'),
(3, 'Theresa', 'Joseph', 21, 'Manila'),
(4, 'Issac', 'Gray', 19, 'Laguna'),
(5, 'Zack', 'Matthews', 22, 'Marikina'),
(6, 'Finn', 'Lam', 25, 'Manila');

UPDATE students
SET first_name = 'Ivan',
    middle_name = 'Ingram',
    last_name = 'Howard',
    age = 25,
    location = 'Bulacan'
WHERE id = 1;

DELETE
FROM students
WHERE id = (SELECT MAX(id) FROM students);

-- SELECT COUNT(*) AS total_students
-- FROM students;

-- SELECT *
-- FROM students
-- WHERE location = 'Manila';

-- SELECT ROUND(AVG(age),2) as average_age
-- FROM students;

-- SELECT *
-- FROM students
-- ORDER BY age DESC;

INSERT INTO students (id, first_name, last_name, age, location) VALUES
(6, 'Dhanniela', 'Lopez', 25, 'Manila'),
(7, 'Mau', 'Ojerio', 25, 'Cavite'),
(8, 'Gy', 'Trinidad', 25, 'Manila'),
(9, 'Gyric', 'Reyes', 24, 'Bulacan'),
(10, 'Juana', 'Trinidad', 19, 'Cavite'),
(11, 'TJ', 'Ojerio', 21, 'Bulacan');

CREATE TABLE classrooms(
	id INT PRIMARY KEY,
	student_id INT NOT NULL,
	section VARCHAR(1) NOT NULL,
	CONSTRAINT fk_student_id
		FOREIGN KEY(student_id)
			REFERENCES students(id)
);

INSERT INTO classrooms (id, student_id, section) VALUES
(1, 1, 'A'),
(2, 2, 'A'),
(3, 3, 'B'),
(4, 4, 'C'),
(5, 5, 'B'),
(6, 6, 'A'),
(7, 7, 'C'),
(8, 8, 'B'),
(9, 9, 'B'),
(10, 10, 'C');

SELECT s.id AS student_id, c.id AS classroom_id, c.section, s.first_name, s.middle_name, s.last_name, s.age, s.location
FROM students s
INNER JOIN classrooms c
ON s.id = c.student_id

SELECT s.id AS student_id, c.id AS classroom_id, c.section, s.first_name, s.middle_name, s.last_name, s.age, s.location
FROM students s
LEFT JOIN classrooms c
ON s.id = c.student_id

SELECT s.id AS student_id, c.id AS classroom_id, c.section, s.first_name, s.middle_name, s.last_name, s.age, s.location
FROM students s
RIGHT JOIN classrooms c
ON s.id = c.student_id

SELECT s.id AS student_id, c.id AS classroom_id, c.section, s.first_name, s.middle_name, s.last_name, s.age, s.location
FROM students s
FULL JOIN classrooms c
ON s.id = c.student_id