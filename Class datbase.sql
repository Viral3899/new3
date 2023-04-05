show databases;
create database class;
use class;



create table students(
id int(4),
name varchar(10),
dob date,
sex char(1),
class char(2),
Mtest int(2),
Hcode char(1)
);


show tables;
select * from students;
insert into students()
values (1,"Viral","1999-08-03","M","A1",49,"Y"),
(2,"Yash","2000-09-13","M","A1",48,"G"),
(3,"Harsh","1999-09-30","M","A1",45,"P");

insert into students (id,name,sex,Mtest)
values (7,'NJNLJ','M',35);



create table Worker(
Worker_ID int(3),
First_Name varchar(10),
Last_Name varchar(50),
Salary int(10),
Joining_Date DATETIME,
Department varchar(8)
);


select * from Worker;

#Insert Value to Worker Table
insert into Worker(Worker_ID,First_Name,Last_Name,Salary,Joining_Date,Department)values
(001,"hi","Arora\,werwe",100000,"2014-02-20 09:00:00","HR"),
(002,"yes","Verma\,qwqw",80000,"2014-06-11 09:00:00","Admin"),
(003,"Viral","Singhal",300000,"2014-02-20 09:00:00","HR"),
(004,"Amitabh","Singh",500000,"2014-02-20 09:00:00","Admin"),
(005,"Vivek","Bhati",500000,"2014-06-11 09:00:00","Admin"),
(006,"Vipul","Diwan",200000,"2014-06-11 09:00:00","Account"),
(007,"Satish","Kumar",75000,"2014-01-20 09:00:00","Account"),
(008,"Geetika","Chauhan",9000,"2014-04-11 09:00:00","Admin");
select max(salary),min(salary),avg(salary),variance(salary),std(salary) from worker; 

select first_name as worker_name from worker;

select upper(first_name),lower(last_name)from worker;
select distinct (Department) from worker;
select distinct (salary) from worker;
select substring(first_name,2,3) from worker;
select substring(first_name,1,1) from worker;
drop table worker;



use class;
select * from worker ;


select substring_index(Last_Name,',',1) as First_Namepp,substring_index(Last_Name,',',-1) as First_Nameppp from worker;


select * from worker where Worker_ID in ('1','2');

select  * from worker where find_in_set(Worker_ID,'1,2,3,4,56,7'); 

select * from worker where First_Name ='Amitabh';
select instr (first_name,binary"a") from worker where First_Name ='Amitabh' ;
select ltrim(rtrim(First_Name)) from worker;
select distinct length(department),Department from worker;
select  distinct length (First_name),First_Name from worker;
select replace (First_name ,"a","A") from worker;

select replace (First_name ,"Geetika","Khooshbu") from worker;

select concat(First_name," ",Last_name," in ",Department) Complete_name from worker;
select concat(Worker_id,"-",department) WI_DEP from worker;

select * from worker order by First_Name ;
select * from WORKER where Salary >= 100000 order by Salary desc ;

select Department, salary from worker order by department , Salary asc ;
select * from worker where First_Name in ("Vipul","Satish");
select *from worker where First_name="Vipul" or  First_Name ="satish";

select * from worker where Department in ("HR","Admin") and First_Name  not in ('Amitabh','Vivek');
select * from worker where First_Name not in ("Vipul","Satish");

select * from worker ;
select * from worker where Department like "Admin%";
select * from worker where First_Name like "%a%";
select * from worker where First_Name like "_____h";


#30-11-2021
use class;

select *from worker;

select * from worker w where Salary between 100000 and 500000;

select * from worker w where Worker_ID between 3 and 5;

select * from worker w where YEAR(Joining_Date)=2014 and MONTH(Joining_Date)=2;
select * from worker w where dayofweek(Joining_Date)=5;
select * from worker w where dayNAME(Joining_Date)="THURSDAY";

select count(*) from worker w where Department ='Admin' ;

select COUNT(*) from worker w where Salary >100000;





#SUBQUERY




select *from worker w where salary between 50000 and 100000;
select * from worker w2 where Worker_ID in (select worker_id from worker w where salary between 50000 and 100000);
select * from worker w2 where Worker_ID in (select Worker_ID from worker w where Department ="admin" and Salary >300000);




#GROUPBY
# select from where group by order by limit ;



select Department ,count(*),max(Salary),min(Salary),avg(Salary) from worker w group by Department ;




select department, count(*)as cnt from worker w group by Department order by cnt desc ;


select w.Worker_ID,w.First_Name,t.worker_ref_id,t.worker_title  from worker w inner join title t
                                              on w.Worker_ID =t.worker_ref_id where t.worker_title="Manager";
                                             
                                             
use class;
show tables;
select w.First_Name , w.Last_Name ,w.Salary ,t.worker_title ,t.affected_from from worker w inner join
																			title t on w.Worker_ID =t.worker_ref_id;
																		
select w.First_Name,w.Last_Name,w.Salary  ,b.bonus_date ,b.bonus_amount from worker w inner join bonus b on w.Worker_ID =b.worker_ref_id ;
select w.First_Name,w.Last_Name,w.Salary  ,b.bonus_date ,b.bonus_amount from worker w Left join bonus b on w.Worker_ID =b.worker_ref_id ;
select w.First_Name,w.Last_Name,w.Salary  ,b.bonus_date ,b.bonus_amount from worker w right join bonus b on w.Worker_ID =b.worker_ref_id ;

#select * from bonus b ;
 select count(*),Department from worker w group by Department having count(*)>3;

select * from worker w ;
select First_name,Salary,Department,Count(*) from worker w group by Department,Salary having count(*)>1;

select Department ,avg(salary) A_S from worker w group by Department;

select Department ,avg(salary) A_S from worker w group by Department having A_S >150000;

select * from worker w where mod (Worker_ID,2) !=0;

select * from worker w where mod (Worker_ID,2) =0;
drop tables worker2;	
create table worker2 select * from worker w ;
select * from worker2;
show tables;



select first_name,datediff(now(),joining_date)/365 from worker w ;
select round(datediff(now(),"1999-08-03")/365);

select * from worker w order by Salary asc limit 1;

select * from worker w order by Salary desc limit 5;

select * from worker w order by Salary desc limit 4,1;
select * from worker w order by Salary desc limit 1,1;
select * from worker w order by Worker_ID limit 4,4;




alter table bonus change worker_ref_id Worker_rid int;
select * from bonus b ;

select w.First_Name ,w.Salary from worker w,worker w1 where w.Salary =w1.Salary and w.Worker_ID !=w1.Worker_ID; 



select max(Salary) from worker where Salary<(select max(Salary) from worker where Salary not in (select max(salary) from worker w ));

select min(Salary) from worker where Salary>(select min(Salary) from worker where Salary not in (select min(salary) from worker w ));

select * from worker w union select * from worker4;

select First_Name ,Salary from worker where Salary =(select max(salary) from worker w); 
select First_Name ,Salary  from worker where Salary >(select avg (salary) from worker w );

select * from worker w where Worker_ID <=(select count(Worker_ID)/2 from worker );

select Department ,count(*) from worker w group by Department having count(*)<3 ;
select Department ,count(*) from worker w group by Department ;#having count(*)<3 ;

select * from worker where Worker_ID = (select max(Worker_ID) from worker );
select * from worker where Worker_ID = (select min(Worker_ID) from worker );

alter table worker drop column joining_date;
select * from worker ;
 

update worker set Last_Name="Bhatt" where Worker_ID =5;

update worker set salary=600000 where Worker_ID =4;
update worker set salary=100000 where First_Name in ("satish","monika");

update worker set department ="Mktng" where  Department = "admin";

delete  from worker where Worker_ID =3;

#update worker set Salary=Salary +1000 where Salary > (select avg(salary) from worker w );

select Department ,sum(Salary)from worker w group by Department ;

alter table worker add column new_col int;

#insert into worker (new)

select * ,if(salary>100000,"A","B") from worker w ;

select * ,if(salary>200000,"A",if(Salary > 100000,"B","C")) from worker w ;

select w.First_Name ,t.worker_title ,b.bonus_amount from worker2 w join title t on w.Worker_ID = t.worker_ref_id join bonus b on w.Worker_ID =b.Worker_rid; 

create view Join_table as select w.First_Name ,t.worker_title ,b.bonus_amount from worker2 w join title t on w.Worker_ID = t.worker_ref_id join bonus b on w.Worker_ID =b.Worker_rid; 






select t1.Ch_name,t3.Sn_Name from table1 t1 join table2 t2 on t1.ch_id=t2.ch_id join table3 t3 on t2.sn_id = t3.sn_id;







select * from worker2 w; 
select * from title t ;
select * from bonus b ;




use class;
create  table bonus(
worker_ref_id int(1),
bonus_date datetime,
bonus_amount int(4));
show tables;
insert into bonus
values (1,"2016-02-20 00:00:00",5000),
(2,"2016-06-11 00:00:00",3000),
(3,"2016-02-20 00:00:00",4000),
(1,"2016-06-11 00:00:00",4500),
(2,"2016-02-20 00:00:00",3500);
select * from bonus ;

create  table title(
worker_ref_id int(1),
worker_title varchar(15),
affected_from datetime);

insert into title 
values (1,"Manager","2016-02-20 00:00:00"),
(2,"Executive","2016-06-11 00:00:00"),
(8,"Executive","2016-06-11 00:00:00"),
(5,"Manager","2016-06-11 00:00:00"),
(4,"Asst.Manager","2016-06-11 00:00:00"),
(7,"Executive","2016-06-11 00:00:00"),
(6,"Lead","2016-06-11 00:00:00"),
(3,"Lead","2016-06-11 00:00:00");
select * from title ;
show tables;



show tables;
create table student(
Roll_no int(3),
Name varchar(20),
Address varchar(20),
Age int(3)
);
insert into student(Roll_no,Name,Address,Age)values
(1,"harsh","Delhi",18),
(2,"Pratik","Bihar",19),
(3,"Riyanka","Siliguri",20),
(4,"Deep","Ramnagar",18),
(5,"Saptrathi","Kolkata",19),
(6,"Dhanraj","Barabajar",20),
(7,"Rohit","Balurghat",18),
(8,"Niraj","Alipur",19);

select * from student;



create table Student_course(
Course_ID int (2),
Roll_no int (3)
);
insert into student_course(Course_ID,Roll_no)values
(1,1),
(2,2),
(2,3),
(3,4),
(1,5),
(4,9),
(5,10),
(4,11);

select * from student_course;


select ss.name,sc.Course_ID,ss.age from student ss inner join student_course sc on ss.Roll_no=sc.Roll_no; #where age>=19; #order by age desc 
select ss.Name,sc.course_ID from student ss left join student_course sc on ss.Roll_no=sc.Roll_no;
select ss.Name,sc.course_ID from student ss  right join student_course sc on ss.Roll_no=sc.Roll_no;


use class;


