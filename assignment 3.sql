create database assignment_3;
show databases;
use assignment_3;
show tables;

create table employee (
employee_no int,
first_Name varchar(10),
Last_Name varchar(10),
Job_Id varchar(10),
Job_Title varchar(20),
department_No int,
Department_name varchar(10),
Hire_date date,
Annual_salary decimal(8,3),
Commission_Percent int
);

insert into employee (employee_no,First_name,last_name,job_id,job_title,department_no,department_name,hire_date,annual_salary,commission_percent) values
(101,'Ravi','Sharma',200101,'Manager',20,'Sales','1987-09-16',12000.76,0),
(102,'Kapil','Shah',200105,'Programmer',50,'Marketing','1996-05-12',15000.55,1),
(103,'Niharika','Soni',200107,'Programmer',10,'IT','1988-06-11',17000,0),
(104,'Richa','Sharma',200187,'Executive',40,'Admin','1994-08-17',55000,2),
(105,'Tejas','Patel',200976,'Manager',30,'HR','1990-01-27',30000,0),
(106,'Kanika','Kapoor',200765,'Accountant',0,'Finance','1992-05-21',33000.887,3),
(107,'Rohan','Seth',200234,'Programmer',10,'IT','1989-11-13',26000,6),
(108,'Zainab','Kapasi',200546,'Executive',40,'Admin','1989-11-12',20000.76,7),
(109,'MIttal','Bajaj',200123,'Account Executive',90,'Finance','1992-06-21',10000,1),
(110,'Tina','Rai','200548','Support Assistant',10,'IT','1992-04-21',18000,2);


select *from employee;
drop table employee;

select first_name,Last_name,employee_no from 















