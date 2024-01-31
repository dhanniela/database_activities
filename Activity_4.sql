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

CREATE TABLE research_papers(
	id INT PRIMARY KEY,
	student_id INT NOT NULL,
	grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F')) DEFAULT NULL,
	CONSTRAINT fk_student_id
		FOREIGN KEY(student_id)
			REFERENCES students(id)
);

INSERT INTO research_papers (id, student_id, grade) VALUES
(1, 1, 'A'),
(2, 1, 'A'),
(3, 3, 'B'),
(4, 4, NULL),
(5, 5, 'B'),
(6, 4, 'A'),
(7, 4, 'C'),
(8, 1, 'B'),
(9, 2, NULL),
(10, 4, 'C');

SELECT s.first_name, s.last_name, COUNT(rp.id) AS number_of_research_papers
from students s
INNER JOIN research_papers rp
ON s.id = rp.student_id
GROUP BY s.id
HAVING COUNT (rp.id) > 1;

SELECT s.first_name, s.last_name, rp.id AS research_paper_id, rp.grade
from students s
INNER JOIN research_papers rp
ON s.id = rp.student_id
WHERE rp.grade is NULL;