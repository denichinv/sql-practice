-- Create the database and use it
CREATE DATABASE imagineComp;
USE imagineComp;

-- Create the employees table
CREATE TABLE employees(
    employee_id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(10),
    hire_date DATE,
    PRIMARY KEY(employee_id)
);

-- Rename the employees table to workers
RENAME TABLE employees TO workers;

-- Add a phone number column
ALTER TABLE workers 
ADD phone_number VARCHAR(20);

-- Add an email column
ALTER TABLE workers 
ADD mail VARCHAR(20);

-- Rename the mail column to email
ALTER TABLE workers
RENAME COLUMN mail TO email;

-- Modify the email column to increase its length
ALTER TABLE workers 
MODIFY COLUMN email VARCHAR(50);

-- Move the email column after last_name
ALTER TABLE workers
MODIFY COLUMN email VARCHAR(50)
AFTER last_name;

-- Remove the phone number column
ALTER TABLE workers
DROP COLUMN phone_number;

-- Modify the hourly_pay column to ensure proper decimal format
ALTER TABLE workers 
MODIFY hourly_pay DECIMAL(5,2);

-- Insert sample data into the workers table
INSERT INTO workers (first_name, last_name, email, hourly_pay, hire_date)
VALUES  ('Sophia','Reynolds','sophia.reynods@email.com',21.00,'2022-03-15'),
        ('Lucas', 'Mitchell','lucas.mitchell@email.com',18.50,'2021-07-28'),
        ('Emma','Dawson','emma.dawson@email.com',16.75,'2023-11-05'),
        ('Ethan', 'Parker', 'ethan.parker@email.com', 19.25 ,'2020-01-12'),
        ('Olivia', 'Bennett', 'olivia.bennett@email.com', 17.00, '2022-06-19'),
        ('Aiden', 'Scott', 'aiden.scott@email.com', 20.00, '2021-09-10'),
        ('Mia', 'Clark', 'mia.clark@email.com', 18.25, '2020-10-03');

-- Retrieve all workers
SELECT * FROM workers;

-- Retrieve workers with hourly pay of 20.00 or more
SELECT first_name, last_name, hourly_pay 
FROM workers
WHERE hourly_pay >= 20.00;

-- Retrieve workers hired on or before January 3, 2021
SELECT * 
FROM workers 
WHERE hire_date <= '2021-01-03';

-- Retrieve the most recently hired worker
SELECT * 
FROM workers 
ORDER BY hire_date DESC
LIMIT 1;

-- Increase the hourly pay by 3.00 for the worker with employee_id 3
UPDATE workers
SET hourly_pay = hourly_pay + 3.00
WHERE employee_id = 3;

-- Delete the worker with employee_id 5
DELETE FROM workers 
WHERE employee_id = 5;

-- Ensure that the email column contains only unique values
ALTER TABLE workers 
MODIFY email VARCHAR(50) UNIQUE;

-- Add a constraint to ensure hourly pay is at least 12.00
ALTER TABLE workers 
ADD CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 12.00);

-- Retrieve all workers
SELECT * FROM workers;

-- Insert a new worker
INSERT INTO workers (first_name, last_name, email, hourly_pay, hire_date)
VALUES ('Steven','Dawnson','steven.d@email.com',14.00,'2023-03-15');

-- Add a job column after hourly_pay
ALTER TABLE workers 
ADD COLUMN job VARCHAR(25) AFTER hourly_pay;

-- Update job title to "manager" for employee_id 3
UPDATE workers
SET job = "manager" 
WHERE employee_id = 3;

-- Retrieve managers hired before January 10, 2024
SELECT * 
FROM workers
WHERE hire_date < '2024-01-10' AND job = "manager";

-- Retrieve workers with an hourly pay higher than the average
SELECT first_name, last_name, hourly_pay
FROM workers
WHERE hourly_pay > (SELECT AVG(hourly_pay) FROM workers);

-- Retrieve total hourly pay per employee, including a grand total using ROLLUP
SELECT SUM(hourly_pay) AS 'hourly pay', employee_id 
FROM workers
GROUP BY employee_id WITH ROLLUP;

-- Ensure the 'salary' column is positioned correctly and stores monetary values accurately  
ALTER TABLE workers  
ADD COLUMN salary DECIMAL (10,2) AFTER hourly_pay;  

-- Populate the new 'salary' column with initial values based on the standard yearly hours (40h/week * 52 weeks)  
UPDATE workers  
SET salary = hourly_pay * 2080;   

-- Automatically adjust 'salary' whenever 'hourly_pay' is updated to maintain consistency  
CREATE TRIGGER before_hourly_pay_update  
BEFORE UPDATE ON workers  
FOR EACH ROW   
SET NEW.salary = (NEW.hourly_pay * 2080);  
