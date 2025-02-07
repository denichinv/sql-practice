-- Create the transactions table
CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2) NOT NULL,
    transaction_date_time DATETIME DEFAULT NOW(),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

-- Insert sample transaction data
INSERT INTO transactions (amount, customer_id)
VALUES (11.00, 1002);

-- Retrieve all transactions along with customer details
SELECT * 
FROM transactions 
INNER JOIN customers 
ON customers.customer_id = transactions.customer_id;

-- Retrieve transactions with customer names, handling missing customer data
SELECT COALESCE(CONCAT(first_name, ' ', last_name), 'Unknown') AS 'Full Name',
       transactions.transaction_id,
       transactions.amount,
       transactions.transaction_date_time
FROM customers 
RIGHT JOIN transactions 
ON customers.customer_id = transactions.customer_id;

-- Get today's transactions: count and total income
SELECT DATE(transaction_date_time) AS 'Date',
       COUNT(amount) AS 'Number of Transactions',
       SUM(amount) AS 'Income for Today'
FROM transactions
WHERE DATE(transaction_date_time) = CURRENT_DATE
GROUP BY DATE(transaction_date_time);

-- Retrieve the top 3 highest transactions
SELECT * FROM transactions 
ORDER BY amount DESC
LIMIT 3;

-- Find customers who have never made a transaction
SELECT first_name, last_name
FROM customers
WHERE customer_id NOT IN 
(SELECT DISTINCT customer_id
 FROM transactions
 WHERE customer_id IS NOT NULL);

-- Get total income grouped by date, including grand total using ROLLUP
SELECT SUM(amount), DATE(transaction_date_time)
FROM transactions
GROUP BY DATE(transaction_date_time) WITH ROLLUP;

-- Retrieve all transactions
SELECT * FROM transactions;
