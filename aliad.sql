-- MySQL Aliases Tutorial
-- Aliases are temporary names assigned to database tables, columns, or expressions 
-- to make them more readable and manageable.

-- Create and use the database
CREATE DATABASE db16;
USE db16;

-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

-- Insert initial employee data
INSERT INTO employees VALUES
    (1, 'John', 'Doe', 60000.00, '2020-01-15'),
    (2, 'Jane', 'Smith', 65000.00, '2019-11-20'),
    (3, 'Mike', 'Johnson', 55000.00, '2021-03-10');

-- View all employees
SELECT * FROM employees;

-- Basic column aliases: Creating full name using concatenation
SELECT CONCAT(first_name, " ", last_name) AS full_name FROM employees;

-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- Insert department data
INSERT INTO departments VALUES
    (1, 'Engineering', 'New York'),
    (2, 'Marketing', 'Los Angeles'),
    (3, 'Finance', 'Chicago');

-- Add department reference to employees table
drop table departments;