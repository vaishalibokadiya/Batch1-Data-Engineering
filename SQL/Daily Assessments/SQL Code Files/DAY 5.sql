-- DATA CLEANING AND TRANSFORMATION -------------------------------------------------------------------------
create database school;
use school;

create table students (
    studentId int,
    firstName varchar(50),
    lastName varchar(50),
    dateOfBirth date,
    grade int
);

insert into students(studentId,firstName,lastName,dateOfBirth,grade) 
values
    (1, 'John', 'Doe', '1995-08-15', 12),
    (2, 'Jane', null, '1998-03-22', 10),
    (3, null, 'Johnson', '2000-07-10', 11),
    (4, 'Emily', 'Williams', null, 9),
    (null, 'Alex', 'Davis', '2002-02-18', 10);
    

-- STEP-1 
-- Deleting the duplicate data if any
select firstName,count(studentId) as Actual_count from students
group by studentId
having count(studentId)>1;

WITH duplicateStudents AS (
    SELECT student_id
    FROM students
    GROUP BY student_id
    HAVING COUNT(student_id) > 1
)

delete from DuplicateStudents
where count(studentId)>1;

-- STEP-2 
-- removing the null values

delete from students
where studentId is null;

update students set firstName='' 
where firstName is null;

update students set lastName='' 
where lastName is null;

update students set dateOfBirth='1995-01-01' 
where dateOfBirth is null;

-- Capitalization of names in data
update  students
set firstName=upper(firstName);

-- CORELATED SUBQUERIES -------------------------------------------------------------------------------------
SELECT * FROM animals
  WHERE shelter = ANY (SELECT id FROM shelter
                       WHERE shelter.id = animals.shelter);
                       
-- STORED PROCEDURES-----------------------------------------------------------------------------------------
delimiter && 
create procedure select_female_animals ()  
begin
    select name from animals where gender='Female';    
end && 
call select_female_animals();


-- RANKING --------------------------------------------------------------------------------------------------
-- ROW_NUMBER()
select *,   
row_number() over(order by id) as my_rank   
from animals;

-- DENSE RANK() 
select *,
dense_rank() over (order by color) as dens_rank  
from animals;

-- RANK() 
select *,
rank() over (order by color) as ranking  
from animals;

-- NTILE()
select *,   
ntile(2) over(order by color) as ranking
from animals;  
