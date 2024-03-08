CREATE DATABASE CodingAssessment;
USE CodingAssessment;

CREATE TABLE shelters (
id INT PRIMARY KEY, 
name VARCHAR(30), 
location VARCHAR(30)
);

CREATE TABLE animals (
	id INT PRIMARY KEY, 
	animalName VARCHAR(20), 
	breed VARCHAR(20), 
	color VARCHAR(20), 
    shelter INT,
	gender VARCHAR(20), 
	status BOOLEAN,
    FOREIGN KEY (shelter) REFERENCES shelters(id)
);

CREATE TABLE adoptions (
	animal_id INT PRIMARY KEY, 
    name VARCHAR(30), 
    contact VARCHAR(50), 
    date TIMESTAMP,
    FOREIGN KEY (animal_id) REFERENCES animals(id)
);

INSERT INTO shelters
VALUES
(1, 'Animals 4 Homes', 'Red City'),
(2, 'Adopt A Buddy', 'Green Town'),
(3, 'Fluffy Animals', 'Blue Hills');

INSERT INTO animals 
 VALUES 
(1, 'Bellyflop', 'Beagle', 'Brown',1, 'Male', 0),
(2, 'Snowy', 'Husky', 'White',1, 'Female', 0),
(3, 'Princess', 'Pomeranian', 'Black',2, 'Female', 0),
(4, 'Cricket', 'Chihuahua', 'Brown',2, 'Male', 0),
(5, 'Princess', 'Poodle', 'Purple',1, 'Female', 0),
(6, 'Spot', 'Dalmation', 'Black and White',2, 'Male', 0);

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

-- PARTITION BY AND OVER
SELECT *, 
COUNT(animalName) OVER () AS TotalAnimals, 
COUNT(animalName) OVER (PARTITION BY gender ORDER BY animalName) as GenderCount 
FROM animals;

-- SUBTOTAL USING SQL QUERIES
SELECT shelter, gender, COUNT(id) AS Count
FROM animals
GROUP BY
ROLLUP(shelter, gender);


-- TOTAL AGGREGATION USING SQL QUERIES
-- AVG
SELECT gender, AVG(LENGTH(animalName)) as AvgNameLength
FROM animals
GROUP BY gender;

-- SUM
SELECT breed, SUM(LENGTH(breed)) AS TotalNameLength
FROM animals
GROUP BY breed;

-- COUNT
SELECT gender, COUNT(id) as AnimalCount
FROM animals
GROUP BY gender;

-- MIN
SELECT MIN(LENGTH(animalName)) as ShortestName
FROM animals;

-- MAX
SELECT MAX(LENGTH(animalName)) as LongestName
FROM animals;

-- JOINS
-- EQUI JOIN
SELECT * FROM animals 
JOIN shelters ON animals.shelter=shelters.id;

-- NON EQUI JOIN
SELECT * FROM animals 
JOIN shelters ON animals.shelter<>shelters.id;

-- SELF JOIN
SELECT * FROM animals as a
JOIN animals as b ON a.id<>b.id;

-- CROSS JOIN
SELECT * FROM animals
CROSS JOIN Shelters;

-- INNER JOIN
SELECT * FROM animals 
JOIN shelters ON animals.shelter=shelters.id;

-- LEFT JOIN
SELECT * FROM shelters 
LEFT JOIN animals ON animals.shelter=shelters.id;

-- RIGHT JOIN
SELECT * FROM adoptions 
RIGHT JOIN animals ON animals.id=adoptions.animal_id;

-- FULL OUTER JOIN
SELECT * FROM adoptions 
LEFT JOIN animals ON animals.id=adoptions.animal_id
UNION
SELECT * FROM adoptions 
RIGHT JOIN animals ON animals.id=adoptions.animal_id;



