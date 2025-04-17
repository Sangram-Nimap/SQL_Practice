-- Create a database
CREATE DATABASE Company;

-- Use the created database
USE Company;

-- Create Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    salary INT NOT NULL
);

-- Insert values into Employee table
INSERT INTO Employee (id, name, salary)
VALUES
(1, 'Adam', 25000),
(2, 'Bob', 30000),
(3, 'Casey', 40000),
(4, 'Derek', 35000);

-- Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

-- Insert values into Department table
INSERT INTO Department (dept_id, dept_name)
VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

-- Create Employee_Department table for relationships
CREATE TABLE Employee_Department (
    emp_id INT,
    dept_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(id),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert values into Employee_Department table
INSERT INTO Employee_Department (emp_id, dept_id)
VALUES
(1, 101),
(2, 102),
(3, 101),
(4, 103);

-- Retrieve all employees with salary greater than 30000
SELECT * FROM Employee WHERE salary > 30000;

-- Retrieve employees whose names contain the letter 'a'
SELECT * FROM Employee WHERE name LIKE '%a%';

-- Retrieve employees who are part of 'IT' department using LEFT JOIN
SELECT e.name AS EmployeeName, d.dept_name AS DepartmentName
FROM Employee e
LEFT JOIN Employee_Department ed ON e.id = ed.emp_id
LEFT JOIN Department d ON ed.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

-- Create another table for student records
CREATE TABLE Student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

-- Insert values into Student table
INSERT INTO Student (rollno, name, marks, grade, city)
VALUES
(101, 'Anil', 78, 'C', 'Pune'),
(102, 'Bhumik', 93, 'A', 'Mumbai'),
(103, 'Chetan', 85, 'B', 'Mumbai'),
(104, 'Dhruv', 96, 'A', 'Delhi'),
(105, 'Emanuel', 12, 'F', 'Delhi'),
(106, 'Farah', 82, 'B', 'Delhi');

-- Retrieve students from Mumbai with marks greater than 80
SELECT * FROM Student WHERE marks > 80 AND city = 'Mumbai';

-- Retrieve distinct cities from the student records
SELECT DISTINCT city FROM Student;

-- Perform a LEFT JOIN with Employee and Student tables (hypothetical relationship)
SELECT e.name AS EmployeeName, s.name AS StudentName
FROM Employee e
LEFT JOIN Student s ON e.id = s.rollno
WHERE e.salary > 30000 OR s.marks > 80;