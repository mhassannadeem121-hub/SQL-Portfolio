create database society;
use society;

-- Create apartments table to store apartment information

create table apartments (
	apartment_id INT PRIMARY KEY,
    apartment_number VARCHAR(10) NOT NULL,
    floor_number INT NOT NULL,
    wing_name CHAR(1) NOT NULL
);

-- Insert sample apartment data

Insert into apartments (apartment_id, apartment_number, floor_number, wing_name) VALUES
(1, '101', 1, 'A'),
(2, '102', 1, 'A'),
(3, '201', 2, 'A'),
(4, '202', 2, 'A'),
(5, '301', 3, 'A'),
(6, '302', 3, 'A'),
(7, '401', 4, 'A'),
(8, '402', 4, 'A'),
(9, '501', 5, 'B'),
(10, '502', 5, 'B');

-- Create residents table with foreign key to apartments
CREATE TABLE residents (
    resident_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    occupation VARCHAR(100),
    apartment_id INT,
    FOREIGN KEY (apartment_id) REFERENCES apartments(apartment_id)
);

-- Insert sample resident data
INSERT INTO residents (resident_id, first_name, last_name, occupation, apartment_id) VALUES
(1, 'Jethalal', 'Gada', 'Electronics Shop Owner', 1),
(2, 'Daya', 'Gada', 'Housewife', 1),
(3, 'Taarak', 'Mehta', 'Writer', 2),
(4, 'Anjali', 'Mehta', 'Teacher', 2),
(5, 'Popatlal', 'Pandey', 'Reporter', 3),
(6, 'Bhide', 'Aatmaram', 'School Teacher', 4),
(7, 'Madhavi', 'Bhide', 'Housewife', 4),
(8, 'Dr', 'Hathi', 'Doctor', 5),
(9, 'Komal', 'Hathi', 'Housewife', 5);
-- Note: We've left some apartments without residents

-- Basic SELECT query to view all residents
SELECT * FROM residents;
SELECT * FROM apartments;

-- DEMO: LEFT JOIN to see all apartments and their residents (if any)

select a.apartment_number, a.floor_number, a.wing_name, r.first_name, r.last_name
from apartments a
left join residents r
on r.apartment_id = a.apartment_id;

-- DEMO: RIGHT JOIN to see all apartments and their residents (if any)

select a.apartment_number, a.floor_number, a.wing_name, r.first_name, r.last_name
from residents r
right join apartments a
on r.apartment_id = a.apartment_id;

-- Create maintenance_requests table with foreign key to apartments
CREATE TABLE maintenance_requests (
    request_id INT PRIMARY KEY,
    apartment_id INT,
    request_date DATE NOT NULL,
    description TEXT NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (apartment_id) REFERENCES apartments(apartment_id)
);

-- Insert sample maintenance request data
INSERT INTO maintenance_requests (request_id, apartment_id, request_date, description, status) VALUES
(1, 1, '2023-01-15', 'Leaky faucet in kitchen', 'Completed'),
(2, 1, '2023-02-20', 'Broken window handle', 'Completed'),
(3, 2, '2023-03-10', 'Electricity fluctuation', 'In Progress'),
(4, 4, '2023-03-15', 'Ceiling fan not working', 'Pending'),
(5, 5, '2023-04-01', 'Bathroom door lock broken', 'Completed'),
(6, 8, '2023-04-10', 'Water seepage in wall', 'In Progress');

select * from maintenance_requests;

-- EXERCISE 1: Finding Unoccupied Apartments

SELECT a.apartment_id, a.apartment_number, a.floor_number, a.wing_name
from residents r
right join apartments a
on a.apartment_id = r.apartment_id
where r.resident_id is null;

-- EXERCISE 2: Count the number of residents per apartment
SELECT a.apartment_id, a.apartment_number, COUNT(r.resident_id) AS resident_count
FROM  residents r 
LEFT JOIN apartments a
ON a.apartment_id = r.apartment_id
group by a.apartment_id;

-- EXERCISE 3: List all apartments with their residents and maintenance request status

SELECT 
    a.apartment_id, 
    a.apartment_number, 
    a.floor_number, 
    a.wing_name,
    CONCAT(r.first_name, ' ', r.last_name) AS resident_name,
    mr.status AS maintenance_status
from apartments a
left join residents r ON a.apartment_id = r.apartment_id
left join maintenance_requests mr ON a.apartment_id = mr.apartment_id;


-- EXERCISE 4: Write a query to find the floor with the most unoccupied apartments

select    
floor_number,
wing_name,
COUNT(*) AS unoccupied_count
from  residents r
RIGHT join apartments a on a.apartment_id = r.apartment_id
where r.resident_id is null
group by floor_number, wing_name
order by unoccupied_count desc
limit 1;

-- EXERCISE 5: Write a query to list all apartments along with the total number of maintenance requests
SELECT 
    a.apartment_id, 
    a.apartment_number, 
    a.floor_number, 
    a.wing_name,
    COUNT(mr.request_id) AS maintenance_request_count
FROM 
    maintenance_requests mr
RIGHT JOIN 
    apartments a ON a.apartment_id = mr.apartment_id
GROUP BY 
    a.apartment_id;