show databases;
use assignment_2;
show tables;

create table employee (
ID int,
name varchar(20),
last_name varchar(20),
department int
);

insert into employee (ID,name,last_name,department) values
(123234877,"Michael","Rogers",14),
(152934485,"Anand","Manikutty",14),
(222364883,"Carol","Smith",37),
(326587417,"Joe","Stevens",37),
(332154719,"Mary-Anne","Foster",14),
(332569843,"George","ODonnell",77),
(546523478,"John","Doe",59),
(631231482,"Devid","Smith",77),
(654873219,"Zacary","Efron",59),
(745685214,"Eric","Goldsmith",59),
(845657245,"Elizabeth","Doe",14),
(845657246,"Kumar","Swamy",14);

select *from employee;

create table department(
code int,
name varchar(20),
budget int
);

insert into department (code,name,budget) values
(14,"IT",6500),
(37,"Accounting",15000),
(59,"Human Resources",240000),
(77,"Research",55000);

select *from department;

#1. Select the last name of all employees, without duplicates
select distinct last_name from employee e ;

#2. Select all the data of employees whose last name is "Smith".
select*from employee e where last_name='smith';

#3. Select all the data of employees whose last name is "Smith" or "Doe".
select *from employee e where last_name in ('smith','doe');

#4. Select all the data of employees that work in department 14
select*from employee e where department =14;

#5. Select all the data of employees that work in department 37 or department 77.
select *from employee e where department in (37,77);

#6. Select all the data of employees whose last name begins with an "S".
select*from employee e where last_name like 's%';

#7. Select the sum of all the departments' budgets.
select sum(Budget) as sum_budget from department;

#8. Select the number of employees in each department (you only need to show the department code and the number of employees).
select count(*), department from employee e group by department ;

#9. Select all the data of employees, including each employee's department's data.
select *from employee e join department d on e.department =d.code ;

#10. Select the name and last name of each employee, along with the name and budget of the employee's department
select e.name ,e.last_name ,d.name ,d.budget 
from employee e join department d 
on e.department =d.code ;

#11. Select the name and last name of employees working for departments with a budget greater than $60,000.
select e.name ,e.last_name ,d.budget 
from employee e join department d 
on e.department =d.code where d.budget>60000;

#12. Select the departments with a budget larger than the average budget of all the departments.
select*from department where budget>(select avg(budget) from department);

#13. Select the names of departments with more than two employees.
select * from department where code in 
(select department from employee group by department having count(*)>2);

#14. Very Important - Select the name and last name of employees working for departments with second lowest budget
select e.name ,e.last_name , d2.budget from employee e 
join department d2 on e.department =d2.code 
where d2.budget =(select d.budget from department d group by d.budget limit 1,1);


#15. Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11.
insert into department (code,name,budget) values
(11,'quality_assurance',40000);

select *from department d ;

#16. And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into employee (ID,name,last_name,department) values
(847219811,'Mary','Moore',11);

select *from department d ;

#17. Reduce the budget of all departments by 10%.
select *, budget*0.9 as red_budget from department d ;

#18. Reassign all employees from the Research department (code 77) to the IT department (code 14)
update employee 
set department=14 
where Department =77;

select * from employee;

#19. Delete from the table all employees in the IT department (code 14)
delete from employee where department=14;

#20. Delete from the table a7zzll employees who work in departments with a budget greater than or equal to $60,000.7

delete from employee where department in (select code from department where budget>=60000);

delete employee from  employee  join department on employee.department =department.code where department.budget >=60000;


#21. Delete from the table all employees.
delete from employee;




