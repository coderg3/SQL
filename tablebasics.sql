SHOW DATABASES;
 USE student;
 drop table sttable1;
 truncate sttable2;
 show tables;
 
 SELECT * FROM student;
 CREATE TABLE sttable(
	stdent_id INT, 
	name VARCHAR(10) NOT NULL,
	major VARCHAR(10) UNIQUE
);

INSERT INTO sttable VALUES(1,'Jack', 'Social');
INSERT INTO sttable VALUES(2,'Kate','Biology');
INSERT INTO sttable(stdent_id,name) VALUES (3,'claire');
INSERT INTO sttable VALUES(4,'Kate','Biology'); 
INSERT INTO sttable VALUES(5,'Sweety','cScience');
SELECT * FROM sttable;

 CREATE TABLE sttable1(
	stdent_id INT PRIMARY KEY,
	name VARCHAR(10),
	major VARCHAR(10) DEFAULT 'undecided'
);
INSERT INTO sttable1 VALUES(1,'Jack', 'Social');
INSERT INTO sttable1 VALUES(2,'Kate','Biology');
INSERT INTO sttable1(stdent_id,name) VALUES (3,'claire');
INSERT INTO sttable1 VALUES(4,'Kate','Biology'); 
INSERT INTO sttable1 VALUES(5,'Sweety','cScience');
SELECT * FROM sttable1;
 CREATE TABLE sttable2(
	student_id INT, 
	name VARCHAR(10),
	major VARCHAR(10),
    PRIMARY KEY(student_id)
);
DESCRIBE sttable2;
DROP sttable;
ALTER TABLE sttable1 ADD gpa DECIMAL;
ALTER TABLE sttable2 ADD gpa DECIMAL(3,2);
ALTER TABLE sttable1 DROP COLUMN gpa; 
INSERT INTO sttable2 VALUES(1,'Jack', 'Social',1.1);
INSERT INTO sttable2 VALUES(2,'Kate','Biology',9);
INSERT INTO sttable2(student_id,name,major) VALUES (3,'claire','sql');
INSERT INTO sttable2 VALUES(4,'Kate','Biology',9); 
INSERT INTO sttable2 VALUES(5,'Sweety','cScience',3.2);
SELECT * FROM sttable2;
DESCRIBE sttable1;
drop table student;
CREATE TABLE student(
 student_id INT AUTO_INCREMENT,
 name VARCHAR(20),
 major VARCHAR(20),
 primary key(student_id)
);

SHOW tables;


INSERT INTO student(name,major) VALUES('Jack','Biology');
INSERT INTO student(name,major) VALUES('anuradha','physics');
INSERT INTO student(name,major) VALUES('mahalakshmi','chemistry');
INSERT INTO student(name,major) VALUES('seeta','computers');
INSERT INTO student(name,major) VALUES('Janaki','mathematics');
INSERT INTO student(name,major) VALUES('Joe','arts');
INSERT INTO student(name,major) VALUES('krish','science');
INSERT INTO student(name,major) VALUES('Jack','biochemistry');
INSERT INTO student(name,major) VALUES('sam','criminology');
INSERT INTO student(name,major) VALUES('ram','Biology');

drop table stu;
CREATE TABLE stu(
 student_id INT AUTO_INCREMENT,
 name VARCHAR(20),
 major VARCHAR(20),
 primary key(student_id)
);
SELECT * FROM stu;
INSERT INTO stu(name,major) VALUES('Jack','Biology'),('anuradha','physics'),
('mahalakshmi','chemistry'),('seeta','computers'),('Janaki','mathematics'),
('Joe','arts'),('krish','science'),('Jack','biochemistry'),
('sam','criminology'),('ram','Biology');


UPDATE student SET major = 'Biochem' WHERE  major = 'Biochemistry';

UPDATE student
SET major = 'Bio engg'
WHERE  student_id = 10;

SELECT * FROM student;
 
UPDATE student
SET major = 'scie arts'
WHERE  major = 'arts' OR major = 'science';

UPDATE student
SET name = 'Joe', major = 'undecided'
WHERE  student_id = 1;
DELETE FROM student WHERE student_id = 5;
SELECT NAME FROM student;
SELECT STU.NAME FROM STU;
SELECT student.name, student.major FROM student
ORDER BY name;
SELECT student.name, student.major FROM student
ORDER BY name DESC;
SELECT * FROM student
ORDER BY student_id DESC;
SELECT * FROM student ORDER BY student_id ASC;
SELECT * FROM student ORDER BY major, student_id DESC; -- ordered by major first then student id
SELECT * FROM student LIMIT 2;-- LIMITS TO 2
SELECT * FROM student ORDER BY student_id DESC LIMIT 2;
SELECT name, major FROM student WHERE major = 'Chemistry';-- FILTERING
SELECT name, major FROM student WHERE major = 'Chemistry' OR major = 'scie arts';
SELECT name, major FROM student WHERE major = 'Chemistry' OR name = 'joe';
SELECT name, major FROM student WHERE major = 'Chemistry' AND name = 'mahalakshmi';-- = , <,>,<>,and, or,<=,>=
SELECT * FROM student WHERE major <> 'Chemistry';
SELECT * FROM student WHERE name IN ('seeta','krish','anuradha');
