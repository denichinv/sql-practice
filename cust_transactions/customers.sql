CREATE TABLE customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50),
    last_name VARCHAR(50)
);

ALTER TABLE customers
AUTO_INCREMENT = 1000;

INSERT INTO customers(first_name, last_name)
VALUES	('Sophia', 'Reynolds'),
		('Lucas', 'Mitchell'),
        ('Emma', 'Dawson'),
		('Ethan', 'Parker'),
        ('Olivia', 'Bennett');
        
SELECT * FROM customers;