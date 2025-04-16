-- Create the database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Create Employee table
CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    e_name VARCHAR(255) NOT NULL,
    e_dept VARCHAR(255),
    e_addr VARCHAR(255)
);

-- Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL,
    dept_location VARCHAR(255)
);

-- Create Salary table
CREATE TABLE Salary (
    sal_id INT PRIMARY KEY,
    emp_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES Employee(Id)
);

-- Create Project table
CREATE TABLE Project (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(255) NOT NULL,
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(Id)
);

-- Insert values into Employee table
INSERT INTO Employee VALUES 
(1, 'Sangram', 'Computing', 'Mumbai'),
(2, 'Ram', 'E&Tc', 'Pune'),
(3, 'Kamlesh', 'IT', 'Delhi'),
(4, 'Ketan', 'Data Science', 'Bangalore'),
(5, 'Rahul', 'Computing', 'Hyderabad'),
(6, 'Shubham', 'Computer Science', 'Shirpur'),
(7, 'Amit', 'Cyber Security', 'Kolkata'),
(8, 'Priya', 'AI & ML', 'Chennai');

-- Insert values into Department table
INSERT INTO Department VALUES
(1, 'Computing', 'Mumbai'),
(2, 'E&Tc', 'Pune'),
(3, 'IT', 'Delhi'),
(4, 'Data Science', 'Bangalore');

-- Insert values into Salary table
INSERT INTO Salary VALUES
(1, 1, 60000.00),
(2, 2, 55000.00),
(3, 3, 70000.00),
(4, 4, 75000.00),
(5, 5, 62000.00),
(6, 6, 58000.00),
(7, 7, 80000.00),
(8, 8, 90000.00);

-- Insert values into Project table
INSERT INTO Project VALUES
(1, 'AI Automation', 1),
(2, 'Cloud Computing', 3),
(3, 'Cyber Security Analysis', 7),
(4, 'Big Data Processing', 4),
(5, 'IoT Development', 5),
(6, 'Blockchain Security', 6),
(7, 'Virtual Reality', 2),
(8, 'Quantum Computing', 8);

-- Update Employee table
UPDATE Employee 
SET e_dept = 'Artificial Intelligence'
WHERE Id = 8;

UPDATE Salary 
SET amount = 95000.00
WHERE emp_id = 8;

-- Select queries to verify data
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Salary;
SELECT * FROM Project;