CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2) NOT NULL,
    transaction_date_time DATETIME DEFAULT NOW(),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
    );
    
INSERT INTO transactions (amount,customer_id)
VALUES  (16.00,1003);

SELECT * 
FROM transactions 
INNER JOIN customers 
ON customers.customer_id = transactions.customer_id;

SELECT COALESCE(CONCAT(first_name, ' ', last_name), 'Unknown') AS 'Full Name',
       transactions.transaction_id,
       transactions.amount,
       transactions.transaction_date_time
FROM customers 
RIGHT JOIN transactions 
ON customers.customer_id = transactions.customer_id;

SELECT DATE(transaction_date_time) AS 'Date',
       COUNT(amount) AS 'Number of Transactions',
       SUM(amount) AS 'Income for Today'
FROM transactions
WHERE DATE(transaction_date_time) = CURRENT_DATE
GROUP BY DATE(transaction_date_time);

SELECT * FROM transactions 
ORDER BY amount DESC
LIMIT 3;

SELECT * FROM transactions;
