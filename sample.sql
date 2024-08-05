# syntax -   create database databasename
create database sudhar;
use sudhar;
# ---- create table table_name(columns);
create table students(id int not null, student_name varchar(20),address varchar(20));
show tables;
desc student_details;
insert into students values(1,'sudharasn','bangalore'),(2,'karthi', 'salem');
select count(*) as details from students;
select * from student;
ALTER TABLE student_details RENAME TO student;
alter table student change details student_name varchar(255); 
alter table student add student_mark int;
set sql_safe_updates = 0;
update student set student_mark =80 where id in(1,2);
insert into students value(3,'kishok','erode');
update student set student_mark = 75 where id = 2;
delete from student where id=2;
rollback;
update student set is_deleted = 0 where id =2;
insert into student values(2,'karthi', 'salem',75);
show variables  like'%log_bin';
SHOW BINLOG EVENTS;
show index from student from sudhar;
show variables like '%autocommit';
show variables like '%sql_safe_updates';
show processlist;
kill id;
set autocommit = 0;
delete from students;
commit;
rollback;
select * from students;
drop database sudhar;
select * from students where address = "bangalore"  and  id = 1;
#-------------------------------------------------------------------------------------------------------------------------------------#
CREATE DATABASE Companydetails;
USE Companydetails;
CREATE DATABASE Company;
USE Company;
CREATE TABLE Employeedetails (
  Id INT PRIMARY KEY,
  FirstName VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);