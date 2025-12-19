CREATE DATABASE Market;
GO

USE Market;
GO

CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);
GO

ALTER TABLE Products
ADD Brand NVARCHAR(50);
GO

INSERT INTO Products (Name, Price, Brand) VALUES
('Laptop', 1200.00, 'Dell'),
('Mouse', 25.50, 'Logitech'),
('Keyboard', 45.00, 'HP'),
('Monitor', 300.00, 'Samsung'),
('Headphones', 80.00, 'Sony'),
('Webcam', 65.00, 'Logitech'),
('Speaker', 120.00, 'JBL'),
('USB Cable', 8.00, 'Anker'),
('Phone', 800.00, 'Apple'),
('Tablet', 450.00, 'Samsung'),
('Charger', 30.00, 'Anker'),
('SSD Drive', 150.00, 'Kingston'),
('RAM', 90.00, 'Corsair'),
('Router', 75.00, 'TP-Link'),
('Printer', 200.00, 'Canon');
GO

UPDATE Products SET Price = 1150.00 WHERE Id = 1;
UPDATE Products SET Brand = 'Apple' WHERE Id = 9;
UPDATE Products SET Price = 85.00 WHERE Id = 5;
GO

DELETE FROM Products WHERE Id = 8;
DELETE FROM Products WHERE Id = 14;
GO

SELECT Id, Name, Price, Brand
FROM Products
WHERE Price < (SELECT AVG(Price) FROM Products);
GO

SELECT Id, Name, Price, Brand
FROM Products
WHERE Price > 10;
GO

SELECT CONCAT(Name, ' - ', Brand) AS ProductInfo
FROM Products
WHERE LEN(Brand) > 5;
GO


CREATE TABLE Employee (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Fullname NVARCHAR(255) NOT NULL,
    Age INT NOT NULL CHECK (Age > 0),
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary >= 300 AND Salary <= 2000)
);
GO


INSERT INTO Employee (Fullname, Age, Email, Salary) VALUES
('Aysel Mammadova', 28, 'aysel.m@company.az', 1500.00),
('Elvin Hasanov', 32, 'elvin.h@company.az', 1800.00),
('Leyla Aliyeva', 25, 'leyla.a@company.az', 1200.00),
('Ramil Quliyev', 35, 'ramil.q@company.az', 1950.00),
('Nigar Ismayilova', 29, 'nigar.i@company.az', 1400.00);
GO


SELECT Id, Fullname, Age, Email, Salary
FROM Employee
WHERE Salary > 1500;
GO


UPDATE Employee
SET Salary = 1600.00
WHERE Id = 1;
GO

DELETE FROM Employee
WHERE Id = 5;
GO


INSERT INTO Employee (Fullname, Age, Email, Salary)
VALUES ('Tural Rzayev', 30, 'tural.r@company.az', 1700.00);
GO