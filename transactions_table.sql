CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(5,2) NOT NULL,
    transaction_date DATETIME DEFAULT NOW()
    );
    
INSERT INTO transactions (transaction_id, amount)
VALUES  (1005,24.92);
		

SELECT * FROM transactions;
    