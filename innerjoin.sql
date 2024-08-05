create database joinconcepts;
use joinconcepts;
show tables;
create table officers(officers_id int not null,officer_name varchar(20),address varchar(20));
insert into officers values(1,'ajeet','salem'),(2,'deepak','lucknow'),(3,'vimal','faizabad'),(4,'rahul','lucknow');
select *from officers;
create table students(student_id int , student_name varchar(20),course_name varchar(20));
insert into students values(1,'aryan','java'),(2,'karthi','mysql'),(3,'kishok','mongodb');
select * from students;
#----joins-----its is used select statement, it is used to retrieve data from muliple table
# ---inner joins---return all rows from multiple table where joins conditons satifised.it is most common joins
#-----syntax---inner joins-------- select columns from table1 innerjoin table2 on table1.column = table2.column
#example:-
select officers.officers_id,officers.officer_name,students.course_name from officers inner join students on officers.officers_id = students.student_id;
#------left outerjoins----------- return all rows left hand tables on specified condtions only those rows form the other table , where the condtion is fulfullied 
#syntax ---left joins-------- select columns from table1 left join table2 on table1.column = table2.column
select officers.officers_id,officers.officer_name from officers left join students on officers.officers_id = students.student_id;
#------right joins----------- return all rows right hand tables on specified condtions only those rows form the other table , where the condtion is fulfullied 
#syntax ---right joins--------select columns from table1 right join  table2 on table1.column = table2.column
select officers.officers_id,officers.officer_name,students.course_name from officers right join students on officers.officers_id = students.student_id;
# MySQL Inner Join with Group By Clause
SELECT officers.officers_id,officers.officer_name,students.course_name FROM officers INNER JOIN students ON officers.officers_id = students.student_id GROUP BY officers.officers_id, officers.officer_name, students.course_name LIMIT 2;
