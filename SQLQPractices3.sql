-- Selecting the College Database
USE college;

-- Creating Tables with Constraints
CREATE TABLE dept (
    id INT PRIMARY KEY,
    name VARCHAR(80)
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(90) NOT NULL,
    dept_id INT DEFAULT 35,
    FOREIGN KEY (dept_id) REFERENCES dept(id) ON UPDATE CASCADE
);

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(90),
    city VARCHAR(50),
    marks INT,
    grade VARCHAR(4),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id) ON UPDATE CASCADE
);

CREATE TABLE table1 (
    id INT PRIMARY KEY,
    grade VARCHAR(4)
);

-- Inserting Data into dept Table
INSERT INTO dept (id, name) VALUES 
(1, 'Comp'),
(2, 'Comp'),
(3, 'IT'),
(4, 'E&Tc'),
(5, 'Electrical');

-- Inserting Data into table1
INSERT INTO table1 (id, grade) VALUES 
(8, 'O'), (6, 'A'), (1, 'D'), (2, 'B'), (3, 'A'), (4, 'O');

ALTER TABLE table1 ADD COLUMN name VARCHAR(90);

-- Various Select Queries
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = 'Mumbai' AND marks > 80;
SELECT * FROM student WHERE marks + 10 > 100 OR city = 'Mumbai' AND grade = 'A';
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ('Delhi', 'Mumbai', 'Pune');
SELECT * FROM student;
SELECT * FROM student WHERE city NOT IN ('Delhi');

-- Ordering & Limit
SELECT * FROM student ORDER BY city DESC;
SELECT TOP 3 * FROM student ORDER BY marks ASC;
SELECT MAX(marks) AS MAXIMUM FROM student;
SELECT AVG(marks) AS average FROM student;

-- Grouping & Aggregation
SELECT city FROM student WHERE marks < 80 GROUP BY city;
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks);
SELECT grade, COUNT(rollno) FROM student GROUP BY grade;
SELECT city, COUNT(rollno) FROM student GROUP BY city HAVING MAX(marks) > 90;
SELECT city, COUNT(rollno) FROM student GROUP BY city HAVING AVG(marks) <= 90;
SELECT city, COUNT(rollno) FROM student WHERE grade = 'A' GROUP BY city HAVING MAX(marks) > 90;

-- Update Queries
UPDATE student SET city = 'Delhi' WHERE city = 'Deihi';
UPDATE student SET grade = 'O' WHERE grade = 'A';
UPDATE student SET marks = marks + 10 WHERE marks BETWEEN 1 AND 90;
UPDATE student SET marks = marks - 10 WHERE marks BETWEEN 1 AND 96;

-- System Queries
SELECT name FROM sys.databases;
SELECT * FROM table1;
SELECT * FROM student;