-- Create tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Statements
BEGIN TRANSACTION;

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, JoinDate) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2024-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2024-01-20'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '2024-01-25');

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity) VALUES
(1, 'Running Shoes', 129.99, 50),
(2, 'Tennis Racket', 199.99, 30),
(3, 'Basketball', 49.99, 100);

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, 1, '2024-02-01', 1),
(2, 2, 2, '2024-02-02', 2),
(3, 3, 3, '2024-02-03', 1);

COMMIT;

-- Update Statements
BEGIN TRANSACTION;

-- Update John's email
UPDATE Customers 
SET Email = 'john.doe.new@example.com'
WHERE CustomerID = 1;

-- Update Tennis Racket price
UPDATE Products
SET Price = 219.99
WHERE ProductName = 'Tennis Racket';

-- Update Jane's order quantity
UPDATE Orders
SET Quantity = 1
WHERE CustomerID = 2 AND ProductID = 2;

COMMIT;

--  Delete Statements
BEGIN TRANSACTION;

-- Delete Alice's orders first (due to foreign key constraint)
DELETE FROM Orders
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Alice' AND LastName = 'Johnson');

-- Delete Alice's account
DELETE FROM Customers
WHERE FirstName = 'Alice' AND LastName = 'Johnson';

-- Delete specific product
DELETE FROM Products
WHERE ProductName = 'Basketball';

-- Delete specific order
DELETE FROM Orders
WHERE OrderID = 3;

COMMIT;
