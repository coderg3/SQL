-- create Data base
create Database Practice;
-- Use data base practice
use Practice;
-- create Table
Create table Customer (
	customerid int auto_increment primary key,
	Customernumber int not null unique check (customernumber > 0),
	lastname varchar(30) not null,
	firstname varchar(30) not null,
	areacode int default 71001, 
	address varchar(50),
	country varchar(50) default 'Malaysia'
);
-- Insert values into the table


-- Insert values into the table
INSERT INTO Customer (Customernumber, Lastname, Firstname, Areacode, Address, Country) VALUES
(100, 'Fang', 'Ying', 418999, 'Kacheguda', DEFAULT),
(200, 'Lasya', 'Priya', 560076, 'Whitefield', 'India'),
(300, 'Albert', 'John', DEFAULT, 'USA', DEFAULT);

-- Display record from table
-- Display all records
select * from customer; 
-- Display particualr columns
select  customerid, Customernumber, Lastname, Firstname from customer;

-- add new column to table-- 
alter table customer 
add phonenumber varchar(20);

-- add values to newly added column/update table
update customer set phonenumber = "888888888" where customerid = 1;
update customer set phonenumber = "777777777" where customerid = 2;
update customer set phonenumber ='666666666' where customerid =3;

alter table customer
add uselesscolumn varchar(10);

-- Delete a column
alter table customer
drop column uselesscolumn;


alter table customer;
update customer set country = 'Thailand' where customerid = 1;

-- delete record from table 
-- if not put 'WHERE' will delete all records 
delete from customer where country='Thailand'; 

-- change data type

ALTER TABLE Customer MODIFY COLUMN phonenumber VARCHAR(12);
-- Delete table
drop table customer;