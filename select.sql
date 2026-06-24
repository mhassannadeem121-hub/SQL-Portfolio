USE emp_db;
CREATE TABLE team (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

Insert into team (first_name, last_name, department, salary, hire_date) VALUES
('John', 'Doe', 'HR', 60000.00, '2022-05-10'),
('Jane', 'Smith', 'IT', 75000.00, '2021-08-15'),
('Alice', 'Johnson', 'Finance', 82000.00, '2019-03-20'),
('Bob', 'Williams', 'IT', 72000.00, '2020-11-25'),
('Charlie', 'Brown', 'Marketing', 65000.00, '2023-01-05');

select * from team

SELECT first_name as 'First Name' , last_name, department FROM team;

SELECT * FROM team where department="IT" ORDER BY SALARY;

SELECT * FROM team where department="IT" ORDER BY SALARY desc limit 1 ;

SELECT * FROM team limit 3;

select  department FROM team;

select distinct department FROM team;

USE emp_db;

select concat(first_name, last_name) as 'Full Name' from team; -- concat combine to columns

select year(hire_date) from team; -- year function coverts date into year

select round(salary,1) from team; -- round fucntion is to convert into fix digit and 1 is limit after decimal point

select concat(first_name, last_name) as 'Full Name' , year(hire_date), round(salary,1) from team;

select AVG(salary) from team; -- calculate average salary

select first_name, salary from team where salary > (select AVG(salary) from team)

SELECT first_name, last_name FROM team WHERE department = 'IT' UNION  --union combine results
SELECT first_name, last_name FROM team WHERE department = 'HR';

select count(*), department from team group by department;