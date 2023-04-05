create database assignment_3;
show databases;
use assignment_3;

#import tabale
show tables ;
select *from employee e ;


#Q1. List the last name, first name and employee number of all programmers 
	#who were hired on or before 21 May 1991 sorted in ascending order of last name.
select Last_Name,First_Name ,Employee_No,Hire_Date from employee e where Hire_Date <='1991-05-21' order by Last_Name ;



#Q2. List the department number, last name and salary of all employees 
	#who were hired between 16/09/87 and 12/05/96 sorted in ascending order of last name within department number.
select Department_No ,Last_Name ,Annual_Salary,Hire_Date  from employee e where Hire_Date between '1987-09-16' and '1996-05-12' order by Department_No ,Last_Name; 


#Q3. List all the data for each job where the average salary is 
	#greater than 15000 sorted in descending order of the average salary.
select Job_Title ,avg(Annual_Salary) as avg_sal from employee e group by Job_Title  having avg_sal>15000 order by avg_sal desc ;


select * from employee e ;

#Q4. List the last name, first name, job id and commission of employees who 
	#earn commission sorted in ascending order of first name. (Commision=Annual_Salary* Commission_Percent)
select Last_Name ,First_Name,Job_ID,(Annual_Salary*Commission_Percent/100) as com  from employee e order by First_Name ;



#Q5. Which Job Title are found in the IT and Sales departments?
select Job_Title,Department_Name  from employee e where Department_Name  in ('IT','Sales')


#Q6. List the last name of all employees in department no 10 and 40 together 
	#with their monthly salaries (rounded to 2 decimal places), sorted in ascending order of last name.
select Last_Name,round((Annual_Salary/12),2) as monthly_salary  from employee e where Department_No in (10,40) order by Last_Name ; 




#Q7. Show the Annual Salary salaries displayed with no decimal places.
select round(Annual_Salary)  from employee e; 



#Q8. Show the total number of employees.
select count(*) from employee e ; 


 select  Department_No ,Department_Name ,count(*) from employee e group by Department_Name; having count(*)>2;  
 

#Q9.  List the department number, department name and the number of employees for each department 
	#that has more than 2 employees grouping by department number anddepartment name.
 select  Department_No ,Department_Name  from employee e group by Department_Name having count(*)>2;  



#Q10. List the department number, department name and the number of employees for the 
	#department that has the highest number of employees using appropriate grouping.
select Department_No ,Department_Name ,count(*)  from employee e  group by Department_Name order by count(*) desc limit 1;

select * from  employee e ;

#Q11. List the department number and name for all departments where no programmers work
select Department_No,Department_Name ,Job_Title  from employee e where Job_Title  != 'Programmer';


#Q12. Update all the Annual salaries for jobs with an increase of 1000.
select *,(Annual_Salary+1000) as ans_sal_ins  from employee e 

#Q13.List all the data for jobs sorted in ascending order of job id.
select * from employee e order by Job_ID ;


#Q14. The job history for employee number 102 is no longer required. Delete this record
delete from employee where Employee_No =102;


#Q15. Prepare a table with percentage raises, employee numbers and old and new salaries. 
		#Employees in departments 20 and 10 are given a 5% rise, employees in departments 
		#50, 90 and 30 are given a 10% rise and employees in other departments are not given a rise.
create view Rise_table4 as select Employee_No ,Department_No,Department_Name,Annual_Salary as old_sal,
if(Department_No in (20,10),5,if (Department_No in (30,50,90),10,0))as per_rais,
Annual_Salary * (1+if(Department_No in (20,10),0.05,if (Department_No in (30,50,90),0.10,0))) 
as new_sal from employee e ;
select * from Rise_table4 ;


create view update_table as select Employee_No, Annual_Salary as old_salary,
if(Department_No in(20,10),5,if(Department_No in(50,90,30),10,0)) as percent_raises,
round (Annual_Salary *(1+if(Department_No in(20,10),0.05,if(Department_No in(50,90,30),0.10,0))),2) as new_salary
from employee e ;
select * from update_table;



#Q16. Create a new view for manager’s details only using all the fields from the employee table.
create view manager as select *from employee e where Job_Title like 'manager';






select * from manager ;

#Q17. Show all the fields and all the
select * from manager m order by Employee_No asc ;








