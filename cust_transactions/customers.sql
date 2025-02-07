-- Create the customers table
CREATE TABLE customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Set the starting value for AUTO_INCREMENT to 1000
ALTER TABLE customers
AUTO_INCREMENT = 1000;

-- Insert sample customer data
INSERT INTO customers(first_name, last_name)
VALUES  ('Sophia', 'Reynolds'),
        ('Lucas', 'Mitchell'),
        ('Emma', 'Dawson'),
        ('Ethan', 'Parker'),
        ('Olivia', 'Bennett');

-- Show indexes on the customers table
SHOW INDEXES FROM customers;

-- Create an index on last_name and first_name for faster lookups
CREATE INDEX last_name_first_name_idx
ON customers(last_name, first_name);

-- Retrieve customer details for a specific person
SELECT * FROM customers
WHERE last_name = 'Parker' AND first_name = 'Ethan';

-- Create a stored procedure to find a customer by ID
DELIMITER $$ 
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
    SELECT * 
    FROM customers
    WHERE customer_id = id;
END$$
DELIMITER ;

-- Call the stored procedure to retrieve details of a specific customer
CALL find_customer(1004);

-- Retrieve all customer records
SELECT * FROM customers;
