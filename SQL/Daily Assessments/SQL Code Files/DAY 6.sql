CREATE DATABASE CARS;
USE CARS;

CREATE TABLE CARS(
	id INT PRIMARY KEY,
    model VARCHAR(50),
    make VARCHAR(50),
    makingYear INT,
    price decimal(10,2)
);
INSERT INTO CARS (id, model, make, makingYear, price)
VALUES
(1, 'Sedan', 'Toyota', 2020, 500000.00),
(2, 'SUV', 'Honda', 2018,  650000.00),
(3, 'Hatchback', 'Ford', 2020, 400000.75),
(4, 'Truck', 'Chevrolet', 2020,  750000.25),
(5, 'Convertible', 'BMW', 2018, 900000.00);

-- PARTITION 
SELECT *, 
AVG(price) OVER () AS totalAvg, 
AVG(price) OVER (PARTITION BY makingYear ORDER BY makingYear) as yearlyAvg 
FROM CARS;

-- MATERIALIZED VIEWS
CREATE VIEW expensiveCarsList AS
SELECT * FROM CARS
WHERE price>(SELECT AVG(price) FROM CARS);

SELECT * FROM expensiveCarsList;

-- REGEX
SELECT * FROM CARS
WHERE make REGEXP 'o[rnt]';

SELECT * FROM CARS
WHERE make REGEXP '^Toy';

SELECT * FROM CARS
WHERE makingYear REGEXP '^201';

-- ROLL UP
SELECT  model, makingYear, SUM(price) AS totalPrice FROM CARS
GROUP BY ROLLUP(model, makingYear);

-- GROUPING
SELECT makingYear, 
SUM(price) AS totalPrice ,
GROUPING(make) AS make
FROM CARS
GROUP BY ROLLUP(makingYear);

-- CTE
WITH CTE AS (
SELECT model, price , 
ROW_NUMBER() OVER(ORDER BY NEWID())
AS RowNumber FROM cars 
)
 
SELECT model, makingYear, SUM(price) AS totalPrice 
FROM CTE 
GROUP BY ROLLUP(model, RowNumber);

-- GROUPING SET
SELECT  
model,makingYear,
SUM(price) AS totalPrice 
FROM CARS
GROUP BY GROUPING SETS(model,makingYear)

-- SNOWFLAKE SCHEMA
create database snowflake;
use snowflake;

create table salestable(
product_id int not null primary key, 
order_id int not null, 
customer_id int not null, 
employeer_id int not null, 
total int not null, 
Quantity int not null, 
discount int 
);

INSERT INTO salestable (product_id, order_id, customer_id, employeer_id, total, Quantity, discount)
VALUES
    (1, 1001, 101, 201, 500, 2, 10),
    (2, 1002, 102, 202, 750, 3, 15),
    (3, 1003, 103, 203, 1000, 1, 5);

create table time_dimension(
order_id int not null primary key,
order_date date not null
);

INSERT INTO time_dimension (order_id, order_date)
VALUES
    (1001, '2024-01-26'),
    (1002, '2024-01-27'),
    (1003, '2024-01-28');

create table customer_dimension(
customer_id int not null primary key, 
city_id int not null, 
customer_name char(30) not null, 
address varchar(50) not null, 
city char(25) not null, 
zip int not null
);

INSERT INTO customer_dimension (customer_id, city_id, customer_name, address, city, zip)
VALUES
    (101, 1, 'John Doe', '123 Main St', 'Anytown', 12345),
    (102, 2, 'Jane Smith', '456 Oak St', 'Othercity', 67890),
    (103, 1, 'Bob Johnson', '789 Maple St', 'Anytown', 54321);

create table product_dimension(
product_id int not null primary key, 
Product_name varchar(50) not null, 
product_prize decimal not null
);

INSERT INTO product_dimension (product_id, Product_name, product_prize)
VALUES
    (1, 'Widget A', 19.99),
    (2, 'Gadget B', 29.99),
    (3, 'Thingamajig C', 39.99);

create table emp_dimension(
employeer_id int not null primary key, 
emp_name varchar(30) not null, 
department varchar(25) not null, 
department_id int not null
);

INSERT INTO emp_dimension (employeer_id, emp_name, department, department_id)
VALUES
    (201, 'John Manager', 'Sales', 1),
    (202, 'Jane Developer', 'Engineering', 2),
    (203, 'Bob Analyst', 'Finance', 3);

create table city_dimension(
city_id int not null primary key,
city_name char(30) not null, 
state char(25), 
country char(20)
);

INSERT INTO city_dimension (city_id, city_name, state, country)
VALUES
    (1, 'Anytown', 'California', 'USA'),
    (2, 'Othercity', 'New York', 'USA'),
    (3, 'Someplace', 'Texas', 'USA');

create table Product_category_dimension(
product_id int not null primary key, 
name varchar(50) not null, 
pro_description varchar(50) not null, 
unit_prize int not null ,
FOREIGN KEY (product_id) REFERENCES product_dimension(product_id)
);

INSERT INTO Product_category_dimension (product_id, name, pro_description, unit_prize)
VALUES
    (1, 'Electronics', 'Electronic gadgets', 500),
    (2, 'Home Appliances', 'Household appliances', 300),
    (3, 'Clothing', 'Apparel and clothing items', 50);

create table department_dimension(department_id int, 
department varchar(25) not null, 
location varchar(25) not null
);

INSERT INTO department_dimension (department_id, department, location)
VALUES
    (1, 'Sales', 'New York'),
    (2, 'Engineering', 'San Francisco'),
    (3, 'Finance', 'Chicago');

select * from salestable;
select * from time_dimension;
select * from customer_dimension;
select * from product_dimension;

select * from emp_dimension;
select * from city_dimension;
select * from Product_category_dimension;
select * from department_dimension;
