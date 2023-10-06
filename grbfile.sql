
USE sample1;
SELECT * FROM sample_superstore;
SHOW tables;
SHOW DATABASES;
USE grb;
CREATE TABLE employee (
 emp_id INT PRIMARY KEY,
 f_name VARCHAR(20),
 l_name VARCHAR(20),
 dob DATE,
 sex VARCHAR(1),
 salary FLOAT,
 mng_id INT,
 branch_id INT
);
SHOW tables;

DROP TABLE employee;
DROP TABLE branch;

SELECT * FROM employee;
SELECT * FROM branch;
SELECT * FROM client;
SELECT * FROM works_with;
SELECT * FROM branch_supplier;

TRUNCATE table employee;
TRUNCATE TABLE branch;

INSERT INTO employee(emp_id,f_name,l_name,dob,sex,salary,mng_id,branch_id)
VALUES
(500,'ramya','Manju','2001-10-21','F',138000.50,null,null),
(501,'njundapagari','Gayatri','2001-01-01','F',100000.0,500,1),
(502,'nanjundapa','SUD','1999-02-08','M',60000,500,1),
(503,'jundapagari','sinchan','2003-01-01','M',26000.50,501,3),
(504,'PRIYA','janani','1986-07-01','F',55000.50,501,3),
(505,'vala','saraswa','2001-08-01','F',58000.50,501,3),
(506,'bala','bindu','2003-01-05','M',26000.50,504,2),
(507,'kotla','prema','2004-12-01','F',16000.50,504,2),
(508,'golai','yamuna','2001-04-01','F',38000.50,504,2),
(509,'matam','Gayatri','1999-12-11','M',24670.50,500,1);

UPDATE employee SET branch_id = 1 WHERE emp_id = 504;

CREATE TABLE branch(
	branch_id INT PRIMARY KEY,
	branch_name VARCHAR (10),
	mng_id INT,
	mng_start_date DATE,
	FOREIGN KEY(mng_id) REFERENCES employee (emp_id) ON DELETE SET NULL
);
INSERT INTO branch(branch_id,branch_name,mng_id,mng_start_date)VALUES
(1,'corporate',500,'2006-02-09'),(2,'Chennai',504,'1992-04-06'),(3,'Mumbai',501,'2020-02-13');

ALTER TABLE employee
ADD FOREIGN KEY (branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (mng_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client(
	client_id INT PRIMARY KEY,
	client_name VARCHAR(20),
	branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);
INSERT INTO client (client_id,client_name,branch_id) VALUES
(51,'DMART',1),(52,'Reliancemart',2),(53,'MORE',3),(54,'Blinkit',3),(55,'BigBasket',2),(56,'Malls',3);

CREATE TABLE works_with(
	emp_id INT,
	client_id INT,
	total_sales INT,
	PRIMARY KEY(emp_id,client_id),
	FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
	FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

INSERT INTO works_with (emp_id,client_id,total_sales) VALUES
(503,51,55000),(506,51,267000),(503,52,22500),(503,53,5000),
(509,54,12000),(502,55,33000),(505,56,26000),(507,54,25000),(508,55,7000);

CREATE TABLE branch_supplier(
	branch_id INT,
	supplier_name VARCHAR(30),
	supply_type VARCHAR(30),
	PRIMARY KEY(branch_id,supplier_name),
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
INSERT INTO branch_supplier(branch_id, supplier_name,supply_type) 	VALUES
(1,'Hammer mill','paper'),
(2,'uni-ball','writing utensils'),
(2,'patriot','paper'),
(1,'H/M','custom forms')
,(3,'uni-ball','writing utensils'),(3,'Hammer mill','paper'),(3,'H/M','custom forms');


-- CORPORATE
INSERT INTO employee VALUES (100,'david','wallace','1967-11-17','M',24670.50,500,1);
INSERT INTO branch VALUES (5,'Corporate',100,'2006-02-09');
UPDATE employee SET branch_id = 5 WHERE emp_id =100;
-- Scranton 
INSERT INTO employee VALUES (102,'Michael','scott','1964-03-15','F',100000.0,500,1);
INSERT INTO branch VALUES (6,'Scranton',102,'1992-04-06');
UPDATE employee 
SET branch_id = 6
WHERE emp_id = 102;
-- Stamford
INSERT INTO employee VALUES(106,'Josh','Potter','1969-09-05','M',100324,500,1);
INSERT INTO branch VALUES (4,'Stamford',106,'1998-02-13');
UPDATE employee
SET branch_id = 4
WHERE emp_id = 106; 

-- find all employees
SELECT * FROM employee; 
--  find all client
SELECT * FROM clioent;
-- - find all employees order by salary
SELECT * FROM employee  ORDER BY salary DESC;
-- find all employees ORDERED BY SEX and then name
SELECT * FROM employee
ORDER BY SEX, f_name, l_name;
--   - find first five employees in the table
SELECT * FROM employee
limit 5; 
--   - find firstand last name of all the  employees
SELECT f_name , l_name FROM employee; 
--   - find forename and surname of all the  employees
SELECT f_name AS forename , l_name AS surname FROM employee; 
--  find out all the different genders
SELECT DISTINCT sex FROM employee; 
--  find out all the different branch ids
SELECT DISTINCT branch_id FROM employee;
-- find the no of employees
SELECT COUNT(emp_id) FROM employee;
SELECT COUNT(emp_id) FROM employee WHERE sex = 'F' AND dob < '1971-01-01';
-- find the average AVG of all the employees salaries-- 
SELECT AVG(salary) FROM employee;
SELECT AVG(salary) FROM employee WHERE sex = 'F';
-- FInd the sum of all employees salary
SELECT SUM(salary) FROM employee;
-- find out how many mqales anmd females are there
SELECT COUNT(sex) , sex FROM employee GROUP BY sex;
SELECT COUNT(SEX) FROM employee;
-- Find the total sales of each employe 
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY emp_id ;
---- Find the total sales of each client
SELECT SUM(TOTAL_SALES) , client_id FROM works_with GROUP BY client_id;

--  wildcards
select * from client;
-- find any clients -- 
-- % = ANY # CHARACTERS,       _ = ONE CHARACTER  use to derfine patterns if clinent name is like gari t etc.,
SELECT * FROM  client WHERE client_name LIKE '%art';
SELECT * FROM  branch_supplier WHERE supplier_name LIKE '%mil%';
-- find any employee  born in october
SELECT * FROM  employee WHERE dob  LIKE '____-12%';
SELECT * FROM  client WHERE client_name LIKE '%art';
-- search for anyone who have gari in their name
SELECT * FROM  client WHERE client_name LIKE '%basket';
SELECT * FROM  employee WHERE f_name LIKE '%gari';

-- UNION
-- Find a list of employee and branch name
SELECT f_name AS COMPANY_NAMES FROM  employee 
UNION
SELECT l_name FROM EMPLOYEE
UNION -- TO USE UNION THEY HAVE TO BE SAME DATA TYPE AND SMAE NO OF COLUMNS
SELECT branch_name FROM branch;

SELECT client_name,branch_id FROM CLIENT
UNION
SELECT supplier_NAME, branch_id
FROM branch_supplier;
-- all the money spent or earned by the company 
SELECT salary FROM employee
UNION
SELECT total_sales FROM works_with;

-- JOINS- a join is used to combine rows from two or more tables based on related columns
-- 4 basic types of joins inner join,left join, right join, full outer join(not in mysql)
 INSERT INTO branch VALUES(7,'giraffe',null,null);
 -- find all branches and the names of their managers
 SELECT employee.emp_id,employee.f_name,branch.branch_name
 FROM employee
 RIGHT JOIN branch
 ON employee.emp_id = branch.mng_id;
-- find names of all employees who have
-- sold over  30000 to a single client 
SELECT employee.f_name , employee.l_name
FROM employee 
WHERE employee.emp_id IN (
 SELECT works_with.emp_id
 FROM works_with
 WHERE works_with.total_sales > 30000;