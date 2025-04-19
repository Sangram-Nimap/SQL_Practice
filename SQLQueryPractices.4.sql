-- Drop existing tables if they exist
DROP TABLE IF EXISTS deparment;
DROP TABLE IF EXISTS teacher;

-- Create department table
CREATE TABLE deparment (
    id INT PRIMARY KEY,
    dept VARCHAR(9)
);

-- Create teacher table with foreign key reference to department
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(90) NOT NULL,
    dept_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES deparment(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- Insert values into deparment table
INSERT INTO deparment (id, dept)
VALUES 
    (101, 'com'),
    (102, 'it'),
    (103, 'Hindi'),
    (104, 'Marathi'),
    (105, 'english');

-- Insert values into teacher table
INSERT INTO teacher (id, name, dept_id)
VALUES 
    (1, 'sangram', 101),
    (2, 'rahul', 103),
    (3, 'ketan', 103),
    (4, 'dhirendra', 104);

-- Select all records from teacher and deparment
SELECT * FROM teacher;
SELECT * FROM deparment;

-- Update department id
UPDATE deparment SET id = 100 WHERE id = 103;

-- Alter teacher table to add address column
ALTER TABLE teacher ADD address VARCHAR(90);

-- Update teacher address
UPDATE teacher SET address = 'DHULE' WHERE id = 1;

-- Rename teacher table
ALTER TABLE teacher RENAME TO teachers;

-- Create table t1
CREATE TABLE t1 (
    i INT PRIMARY KEY,
    name VARCHAR(90)
);

-- Insert data into t1
INSERT INTO t1 (i, name) VALUES (6, 'fduti');

-- Drop column from t1
ALTER TABLE t1 DROP COLUMN name;

-- Drop table t1
DROP TABLE IF EXISTS t1;

-- Attempting to add a column with a default value
ALTER TABLE t1 ADD addr VARCHAR(89) DEFAULT 'hi';

-- Drop constraint (if exists)
ALTER TABLE t1 DROP CONSTRAINT IF EXISTS DF__t1__id__6E01572D;

-- Use college database
USE college;

-- Rename column in student table
ALTER TABLE student CHANGE COLUMN name full_name;