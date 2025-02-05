CREATE TABLE products(
product_id INT,
product_name VARCHAR(25) UNIQUE,
price DECIMAL(4,2) DEFAULT 0
);

INSERT INTO products
VALUES  (101,'hamburger', 4.99),
		(102, 'fries', 2.49),
        (103, 'soda', 1.99);
        

INSERT INTO products(product_id,product_name)
VALUES  (104, 'straw'),
        (105, 'fork'),
        (106, 'napkin');
        
SELECT * FROM products;
       