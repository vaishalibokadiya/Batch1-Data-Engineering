CREATE DATABASE BUSINESS;

USE BUSINESS;

CREATE TABLE PRODUCTS(
ProductId INT PRIMARY KEY,
ProductName VARCHAR(50),
SupplierId INT,
CategoryId INT,
Unit VARCHAR(50),
Price DECIMAL(10,2)
);

INSERT INTO PRODUCTS 
VALUES
(1, 'Chais', 1, 1, '10 boxes x 20 bags', 18),
(2,	'Chang', 1, 1, '24 - 12 oz bottles', 19),
(3,	'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10),
(4,	'Chef Anton\'s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22),
(5,	'Chef Anton\'s Gumbo Mix', 2, 2, '36 boxes', 21.35),
(6,	'Grandma\'s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25),
(7, 'Uncle Bob\'s Organic Dried Pears',	3, 7, '12 - 1 lb pkgs',	30),
(8,	'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40),
(9,	'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs',	97);

CREATE TABLE ORDERDETAILS(
OrderDetailId INT PRIMARY KEY,
OrderId INT,
ProductId INT,
Quantity INT
);

INSERT INTO OrderDetails
VALUES
(1,	10248, 1, 12),
(2,	10248, 2, 10),
(3,	10248, 2, 5),
(4,	10249, 4, 9),
(5,	10249, 1, 40),
(6,	10250, 1, 10),
(7,	10250, 1, 35),
(8,	10250, 5, 15),
(9,	10251, 2, 6),
(10, 10251,	7, 15);

CREATE TABLE SUPPLIERS(
SupplierID INT PRIMARY KEY,
SupplierName VARCHAR(50), 
ContactName VARCHAR(50),	
Address VARCHAR(50),	
City VARCHAR(20),	
PostalCode VARCHAR(15),	
Country VARCHAR(20)
);

INSERT INTO SUPPLIERS
VALUES
(1,	'Exotic Liquid', 'Charlotte Cooper', '49 Gilbert St.', 'London', 'EC1 4SD', 'UK'),
(2,	'New Orleans Cajun Delights', 'Shelley Burke', 'P.O. Box 78934', 'New Orleans',	'70117', 'USA'),
(3,	'Grandma Kelly\'s Homestead', 'Regina Murphy', '707 Oxford Rd.', 'Ann Arbor', '48104', 'USA'),
(4,	'Tokyo Traders', 'Yoshi Nagase', '9-8 Sekimai Musashino-shi', 'Tokyo', '100', 'Japan');

-- ANY, ALL, EXISTS -----------------------------------------------------------------------------------------
-- EXIST
SELECT SupplierName
FROM Suppliers
WHERE EXISTS 
(SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

-- ANY
SELECT ProductName
FROM Products
WHERE ProductId = ANY
  (SELECT ProductId
  FROM OrderDetails
  WHERE Quantity = 10);
  
-- ALL
SELECT ProductName
FROM Products
WHERE Price > ALL
  (SELECT Quantity
  FROM OrderDetails);
  
-- STRING FUNCTIONS -----------------------------------------------------------------------------------------
-- CONCAT()
SELECT CONCAT(ProductName, Unit) FROM Products where Price > 15;

-- UPPER()
SELECT UPPER(ProductName) FROM PRODUCTS WHERE ProductId IN (SELECT ProductId FROM ORDERDETAILS);

-- LOWER()
SELECT LOWER(Unit) FROM PRODUCTS WHERE ProductId IN (SELECT ProductId FROM ORDERDETAILS);

-- REVERSE()
SELECT REVERSE(ProductName) FROM PRODUCTS;

-- REPLACE()
SELECT REPLACE(Unit, 'oz', 'ml') FROM PRODUCTS WHERE ProductId IN (SELECT ProductId FROM ORDERDETAILS);

-- LEN()
SELECT LENGTH(ProductName) FROM PRODUCTS;

-- ASCII()
SELECT ASCII(ProductName) FROM PRODUCTS;

-- MATHEMATICAL FUNCTIONS -----------------------------------------------------------------------------------
-- ABS
SELECT ABS(-66);

-- SIN
SELECT SIN(1);

-- CEIL
SELECT CEIL(Price) FROM PRODUCTS;

-- EXP
SELECT EXP(5);

-- FLOOR
SELECT FLOOR(Price) FROM PRODUCTS;

-- LOG
SELECT LOG(100);


-- AGGREGATE FUNCTIONS --------------------------------------------------------------------------------------
-- SUM
SELECT SUM(Quantity) FROM OrderDetails JOIN Products ON Products.ProductId=OrderDetails.ProductId WHERE Price>20;

-- COUNT
SELECT COUNT(OrderDetailId) FROM OrderDetails JOIN Products ON Products.ProductId=OrderDetails.ProductId WHERE Price>20;

-- AVG
SELECT AVG(Quantity) FROM OrderDetails JOIN Products ON Products.ProductId=OrderDetails.ProductId WHERE Price>20;

-- MIN
SELECT MIN(Price) FROM PRODUCTS;

-- MAX
SELECT MAX(Price) FROM PRODUCTS;


-- REMAINING JOINS ------------------------------------------------------------------------------------------
-- SELF JOIN
SELECT A.ProductId, B.ProductId, b.Price FROM PRODUCTS AS A
JOIN PRODUCTS AS B ON A.ProductId<>B.ProductId;

-- CROSS JOIN
SELECT * FROM PRODUCTS 
CROSS JOIN ORDERDETAILS ON PRODUCTS.ProductId=ORDERDETAILS.ProductId;


-- OTHERS ---------------------------------------------------------------------------------------------------
-- SUBQUERY
SELECT ProductName FROM PRODUCTS WHERE ProductId IN (SELECT ProductId FROM ORDERDETAILS);

-- NESTED SUBQUERY
SELECT CategoryId, AVG(Price) FROM PRODUCTS 
GROUP BY CategoryId 
HAVING AVG(Price)<(
	SELECT MAX(Price) FROM PRODUCTS WHERE SupplierId IN (
		SELECT SupplierId FROM SUPPLIERS WHERE City='Tokyo'
	)
);
    
-- ORDER BY
SELECT * FROM PRODUCTS ORDER BY PRICE DESC;


-- DATE FUNCTIONS -------------------------------------------------------------------------------------------
CREATE TABLE ORDERS(
OrderId	INT PRIMARY KEY,
OrderDate date
);
SELECT * FROM ORDERS;
INSERT INTO ORDERS
VALUES
(1, '2023-11-11'),
(2, '2023-11-09'),
(3, '2023-11-11'),
(4, '2023-10-29');

-- GETDATE
INSERT INTO ORDERS VALUES (5, CURDATE());

-- DATEDIFF
SELECT DATEDIFF(CURDATE(), OrderDate) FROM ORDERS;

-- DAY
SELECT DAY(OrderDate) FROM ORDERS;

-- MONTH
SELECT MONTH(OrderDate) FROM ORDERS;

-- YEAR
SELECT YEAR(OrderDate) FROM ORDERS;
