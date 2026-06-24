-- Create Table employees

create table employees(
employe_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
hire_date date default (current_date()),
email varchar(100) unique,
phone_no varchar(100) unique,
salary decimal(10,2) check (salary > 0.0),
empolyment_status enum ('active', 'inactive') default 'active',
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

-- Insert data into table

INSERT INTO employees 
(first_name, last_name, hire_date, email, phone_no, salary, empolyment_status)
VALUES
('John', 'Doe', '2022-01-15', 'john.doe@example.com', '1234567890', 50000.00, 'active'),
('Jane', 'Smith', '2021-06-20', 'jane.smith@example.com', '1234567891', 60000.00, 'active'),
('Michael', 'Brown', '2020-03-10', 'michael.brown@example.com', '1234567892', 55000.00, 'inactive'),
('Emily', 'Davis', '2023-07-05', 'emily.davis@example.com', '1234567893', 62000.00, 'active'),
('David', 'Wilson', '2019-11-25', 'david.wilson@example.com', '1234567894', 70000.00, 'active'),
('Sarah', 'Taylor', '2022-09-14', 'sarah.taylor@example.com', '1234567895', 48000.00, 'inactive'),
('Chris', 'Anderson', '2021-12-01', 'chris.anderson@example.com', '1234567896', 53000.00, 'active'),
('Laura', 'Thomas', '2020-05-18', 'laura.thomas@example.com', '1234567897', 61000.00, 'active'),
('Daniel', 'Jackson', '2023-02-28', 'daniel.jackson@example.com', '1234567898', 45000.00, 'active'),
('Sophia', 'White', '2021-08-09', 'sophia.white@example.com', '1234567899', 67000.00, 'active');



INSERT INTO employees 
(first_name, last_name, hire_date, email, phone_no, salary, empolyment_status)
VALUES
('Ali', 'Haider', '2021-08-09', 'ali.haider@example.com', '1234567989', 67000.00, 'active');

INSERT INTO employees 
(first_name, last_name, hire_date, email, phone_no, salary, empolyment_status)
VALUES
('Hassan', 'Nadeem', '2021-08-09', 'hassan@example.com', '1234567786', 67000.00, 'active');


SHOW Databases; -- this shows all Database

use emp_db; -- this use databse

select * from employees

DELETE FROM employees
WHERE first_name = 'Ali' AND last_name = 'Haider';

DELETE FROM employees
WHERE first_name = 'Sophia' AND last_name = 'White';

-- Create the departments table

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL UNIQUE
);
 
INSERT INTO departments (department_name) VALUES
('Sales'),
('Marketing'),
('Engineering'),
('HR');

 -- Add a department_id column to employees
ALTER TABLE employees
ADD COLUMN department_id INT,
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Assign existing 10 employees to departments

UPDATE employees SET department_id = 1 WHERE employe_id IN (1, 2, 3);   -- Sales
UPDATE employees SET department_id = 2 WHERE employe_id IN (4, 5);      -- Marketing
UPDATE employees SET department_id = 3 WHERE employe_id IN (6, 7, 8);    -- Engineering
UPDATE employees SET department_id = 4 WHERE employe_id IN (9, 10);      -- HR

SELECT * FROM departments

SELECT * FROM departments ORDER BY department_id;

SELECT employe_id, first_name, last_name, department_id FROM employees;

select * from employees where department_id = '2'


 