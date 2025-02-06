CREATE DATABASE imagineComp;
USE imagineComp;

CREATE TABLE employees(
employee_id INT AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
hourly_pay DECIMAL(10),
hire_date DATE,
PRIMARY KEY(employee_id)
);

RENAME TABLE employees TO workers;

ALTER TABLE workers 
ADD phone_number VARCHAR(20);

ALTER TABLE workers 
ADD mail VARCHAR(20);

ALTER TABLE workers
RENAME COLUMN mail TO email;

ALTER TABLE workers 
MODIFY COLUMN email VARCHAR(50);

ALTER TABLE workers
MODIFY COLUMN email VARCHAR(50)
AFTER last_name;

ALTER TABLE workers
DROP COLUMN phone_number;

ALTER TABLE workers MODIFY hourly_pay DECIMAL(5,2);

INSERT INTO workers (first_name, last_name, email, hourly_pay, hire_date)
VALUES('Sophia','Reynolds','sophia.reynods@email.com',21.00,'2022-03-15'),
('Lucas', 'Mitchell','lucas.mitchell@email.com',18.50,'2021-07-28'),
('Emma','Dawson','emma.dawson@email.com',16.75,'2023-11-05'),
('Ethan', 'Parker', 'ethan.parker@email.com', 19.25 ,'2020-01-12'),
('Olivia', 'Bennett', 'olivia.bennett@email.com', 17.00, '2022-06-19'),
('Aiden', 'Scott', 'aiden.scott@email.com', 20.00, '2021-09-10'),
('Mia', 'Clark', 'mia.clark@email.com', 18.25, '2020-10-03');


SELECT * FROM workers;

SELECT first_name,last_name,hourly_pay 
FROM workers
WHERE hourly_pay >= 20.00 ;

SELECT * 
FROM workers 
WHERE hire_date <= '2021-01-03';

SELECT * 
FROM workers 
ORDER BY hire_date DESC
LIMIT 1 ;

UPDATE workers
SET hourly_pay = hourly_pay + 3.00
WHERE employee_id = 3;

DELETE FROM workers 
WHERE employee_id = 5;


ALTER TABLE workers 
MODIFY email VARCHAR(50) UNIQUE ;

ALTER TABLE workers 
ADD CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 12.00);

SELECT * FROM workers;

INSERT INTO workers (first_name, last_name, email, hourly_pay, hire_date)
VALUES('Steven','Dawnson','steven.d@email.com',14.00,'2023-03-15');

ALTER TABLE workers 
ADD COLUMN job VARCHAR(25) AFTER hourly_pay;

UPDATE workers
SET job = "manager" 
WHERE employee_id = 3;


SELECT * 
FROM workers
WHERE hire_date < '2024-01-10' AND job = "manager";


