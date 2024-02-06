CREATE DATABASE CUSTOMER_DATABASE;

USE CUSTOMER_DATABASE;

CREATE TABLE CUSTOMERS (
CustomerId INT PRIMARY KEY NOT NULL,
CustomerName VARCHAR(50) NOT NULL,
ContactName VARCHAR(50),
Address VARCHAR(50),
City VARCHAR(20),
PostalCode VARCHAR(10),
Country VARCHAR(20)
);

INSERT INTO CUSTOMERS
(CustomerId, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
(101, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany' ),
(102, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(103, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(104, 'Around the Horn',	'Thomas Hardy',	'120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(105, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå',	'S-958 22',	'Sweden');

COMMIT;

-- SELECT
SELECT CustomerName, Country FROM CUSTOMERS;
SELECT * FROM Customers;

-- SELECT DISTINCT
SELECT DISTINCT Country FROM Customers;

-- GROPI BY
SELECT COUNT(CustomerName) AS NoOfCustomers FROM CUSTOMERS
GROUP BY COUNTRY;

SET TRANSACTION READ ONLY;

-- HAVING
SELECT COUNT(CustomerName) AS NoOfCustomers FROM CUSTOMERS
GROUP BY COUNTRY
HAVING Country='Mexico';

-- DELETE
DELETE FROM CUSTOMERS WHERE Country = 'UK';
ROLLBACK;

-- UPDATE
UPDATE CUSTOMERS 
SET ContactName='Maria Anderson'
WHERE CustomerId=101;

SAVEPOINT SavePoint1;

ROLLBACK TO SavePoint1;

RELEASE SAVEPOINT SavePoint1;

CREATE TABLE CUSTOMERS2 (
CustomerId INT PRIMARY KEY NOT NULL,
CustomerName VARCHAR(50) NOT NULL,
ContactName VARCHAR(50),
Address VARCHAR(50),
City VARCHAR(20),
PostalCode VARCHAR(10),
Country VARCHAR(20)
);

INSERT INTO CUSTOMERS2
(CustomerId, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
(201, 'John Doe', 'Jane Smith', '123 Main St', 'Anytown', '12345', 'USA'),
(202, 'Alice Johnson', 'Bob Miller', '456 Oak Ave', 'Somewhere', '67890', 'Canada'),
(203, 'Eva Brown', 'Michael White', '789 Pine Ln', 'Nowhere', '54321', 'Australia'),
(105, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

-- RENAME
RENAME TABLE CUSTOMERS TO CUSTOMERS1;

-- UNION
SELECT * FROM CUSTOMERS1 UNION SELECT * FROM CUSTOMERS2;

-- UNION ALL
SELECT * FROM CUSTOMERS1 UNION ALL SELECT * FROM CUSTOMERS2;

-- EXCEPT
-- SELECT * FROM CUSTOMERS1 EXCEPT SELECT * FROM CUSTOMERS2;

-- INTERSECT
-- SELECT * FROM CUSTOMERS1 INTERSECT SELECT * FROM CUSTOMERS2;


-------------------------------------------------------------------------------------------------------------

CREATE DATABASE pet_adoption;

USE pet_adoption;

CREATE TABLE animals (
	id INT PRIMARY KEY, 
	name VARCHAR(20), 
	breed VARCHAR(20), 
	color VARCHAR(20), 
	gender VARCHAR(20), 
	status BOOLEAN
);

CREATE TABLE adoptions (
	animal_id INT PRIMARY KEY, 
    name VARCHAR(30), 
    contact VARCHAR(50), 
    date TIMESTAMP
);

-- SHOW TABLES
SHOW TABLES;

-- SHOW COLUMNS
SHOW COLUMNS FROM animals;
SHOW COLUMNS FROM adoptions;

-- INSERT INTO
INSERT INTO animals (id, name, breed, color, gender, status)
 VALUES 
 (1, 'Bellyflop', 'Beagle', 'Brown', 'Male', 0);
 
INSERT INTO animals (id, name, breed, color, gender, status) 
VALUES 
(2, 'Snowy', 'Husky', 'White', 'Female', 0),
(3, 'Princess', 'Pomeranian', 'Black', 'Female', 0),
(4, 'Cricket', 'Chihuahua', 'Brown', 'Male', 0),
(5, 'Princess', 'Poodle', 'Purple', 'Female', 0),
(6, 'Spot', 'Dalmation', 'Black and White', 'Male', 0);

-- SELECT
SELECT * FROM animals;
SELECT breed FROM animals;

-- WHERE
SELECT name FROM animals WHERE gender = 'Female';
SELECT id FROM animals WHERE status = 0;

-- UPDATE
UPDATE animals SET color = 'Brown' WHERE id = 5;
UPDATE animals SET color = 'Brown' WHERE name = 'Princess';
UPDATE animals SET color = 'Brown' WHERE color = 'Purple';

-- DELETE
DELETE FROM animals WHERE id = 1;

UPDATE animals SET status = 1 WHERE id = 4;
INSERT INTO adoptions (animal_id, name, contact, date) 
VALUES 
(4, 'Pinocchio', 'realboy@cockroachlabs.com', NOW());

UPDATE animals SET status = 1 WHERE id = 5;
INSERT INTO adoptions (animal_id, name, contact, date) 
VALUES 
(5, 'Patalie', 'poodlequeen@cockroachlabs.com', NOW());

UPDATE animals SET status = 1 WHERE id = 6;
INSERT INTO adoptions (animal_id, name, contact, date) 
VALUES 
(6, 'Ella', 'ellacrew@cockroachlabs.com', NOW());

SELECT * FROM adoptions;

-- ORDER BY
SELECT * FROM adoptions ORDER BY date DESC;

SELECT * FROM animals WHERE status = 1;

-- ALTER TABLE
ALTER TABLE animals ADD COLUMN species VARCHAR(20);
SHOW COLUMNS FROM animals;

SET sql_safe_updates = FALSE;
UPDATE animals SET species = 'Dog';
SELECT * FROM animals;

INSERT INTO animals (id, name, species, breed, color, gender, status) 
VALUES 
(7,'Meowmix', 'Cat', 'Munchkin', 'Yellow', 'Female', 0),
(8,'Ash', 'Cat', 'Persian', 'Gray', 'Female', 0),
(9,'Tiger', 'Cat', 'Bengal', 'Brown', 'Male', 0);

SELECT * FROM animals;

CREATE TABLE shelters (
id INT PRIMARY KEY, 
name VARCHAR(30), 
location VARCHAR(30)
);

INSERT INTO shelters
VALUES 
(1, 'Animals 4 Homes', 'Red City');

ALTER TABLE animals ADD COLUMN shelter INT;
UPDATE animals SET shelter = 1;

INSERT INTO shelters VALUES 
(2, 'Adopt A Buddy', 'Green Town'),
(3, 'Fluffy Animals', 'Blue Hills');

INSERT INTO animals (id, name, shelter, species, breed, color, gender, status) 
VALUES 
(10, 'Snoops', 2, 'Dog', 'Beagle', 'Brown', 'Male', 0),
(11, 'Salt', 2, 'Cat', 'Turkish Angora', 'White', 'Female', 0),
(12, 'Fuzz', 3, 'Dog', 'Papillon', 'Gray', 'Male', 0);

CREATE INDEX animal_shelter ON animals (shelter);

SELECT * FROM animals 
JOIN shelters ON animals.shelter = shelters.id;

SELECT * FROM adoptions 
JOIN animals ON adoptions.animal_id = animals.id 
WHERE animals.shelter = 1;

-- AND
SELECT * FROM Animals 
WHERE species = 'Dog' AND shelter = 1;

-- IN
SELECT * FROM Animals 
WHERE species IN ('Cat', 'Dog');

-- LIKE
SELECT * FROM Animals 
WHERE breed LIKE 'B%';

-- OR
SELECT * FROM Animals 
WHERE color = 'White' OR color = 'Brown';

-- NOT LIKE
SELECT * FROM Animals 
WHERE breed NOT LIKE 'B%';

-- BETWEEN
SELECT * FROM Animals 
WHERE id BETWEEN 5 AND 10;

-- ALL
SELECT * FROM Animals WHERE shelter = ALL 
	(SELECT id FROM shelters WHERE location = 'Blue Hills');

-- ANY
SELECT * FROM Animals WHERE shelter = ANY 
	(SELECT id FROM shelterS WHERE location = 'Blue Hills');
    
-- EXISTS
SELECT * FROM Animals WHERE EXISTS
	(SELECT name FROM Animals WHERE shelter = 1);
    
-- SOME
SELECT * FROM Animals WHERE id < SOME 
	(SELECT id FROM Animals WHERE species = 'Dog');
    
SELECT DISTINCT species FROM Animals;
SELECT COUNT(DISTINCT species) FROM Animals;

-----------------------------------------------------------------------------------------------------------
-- EQUI JOIN
SELECT * FROM Animals
JOIN Shelters ON Animals.shelter = Shelters.id;

-- NON EQUI JOIN
SELECT * FROM Animals
JOIN Shelters ON Animals.id < Shelters.id;

------------------------------------------------------------------------------------------------------------

-- INNER JOIN
SELECT * FROM Animals
INNER JOIN Shelters ON Animals.shelter = Shelters.id;

-- LEFT JOIN
SELECT * FROM Animals
LEFT JOIN Adoptions ON Animals.id = Adoptions.Animal_id;

-- RIGHT JOIN
SELECT * FROM Animals
RIGHT JOIN Adoptions ON Animals.id = Adoptions.Animal_id;

-- FULL JOIN
SELECT * FROM Animals
FULL JOIN Adoptions ON Adoptions.animal_id = Animals.animal_id;

ALTER TABLE Animals
CHANGE COLUMN Animal_id animal_id INT;

SELECT * FROM Animals
NATURAL JOIN Adoptions;
