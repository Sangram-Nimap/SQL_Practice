-- 1. Create Database
CREATE DATABASE CompanyDB;
GO

-- 2. Use the Database
USE CompanyDB;
GO

-- 3. Create Departments Table
CREATE TABLE Departments (
    DeptId INT PRIMARY KEY IDENTITY(1,1),
    DeptName VARCHAR(50)
);

-- 4. Create Employees Table
CREATE TABLE Employees (
    EmpId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Age INT,
    Salary DECIMAL(10,2),
    DeptId INT FOREIGN KEY REFERENCES Departments(DeptId)
);

-- 5. Create Students Table
CREATE TABLE Students (
    StudentId INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100),
    Age INT,
    Course VARCHAR(50)
);

-- 6. Insert Departments
INSERT INTO Departments (DeptName) VALUES 
('HR'), 
('IT'), 
('Finance');

-- 7. Insert Employees
INSERT INTO Employees (Name, Age, Salary, DeptId) VALUES
('Sangram', 25, 50000, 2),
('Ravi', 28, 60000, 2),
('Priya', 30, 55000, 1),
('Amit', 35, 65000, 3);

-- 8. Insert Students
INSERT INTO Students (FullName, Age, Course) VALUES
('Neha Sharma', 20, 'BSc IT'),
('Rahul Mehta', 21, 'BCom'),
('Anita Jain', 19, 'BA');

-- 9. SELECT Queries
SELECT * FROM Employees;
SELECT Name, Salary FROM Employees WHERE Salary > 55000;

-- 10. JOIN Example
SELECT e.Name, d.DeptName
FROM Employees e
JOIN Departments d ON e.DeptId = d.DeptId;

-- 11. UPDATE
UPDATE Employees SET Salary = 70000 WHERE Name = 'Sangram';

-- 12. DELETE
DELETE FROM Students WHERE FullName = 'Rahul Mehta';

-- 13. ORDER BY
SELECT * FROM Employees ORDER BY Salary DESC;

-- 14. GROUP BY + Aggregate
SELECT DeptId, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DeptId;

-- 15. ALTER TABLE (Add column)
ALTER TABLE Students ADD Email VARCHAR(100);

-- 16. DROP TABLE (if needed)
-- DROP TABLE Students;
