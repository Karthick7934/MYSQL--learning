create database Membership;
use Membership;
create table Membership(
memid int primary key ,
firstname varchar(20) , 
lastname varchar (40) ,
 Address varchar (45),
 Gender varchar (45) , moblie varchar(45) , postalcode  varchar(45), Email varchar(40), memType varchar(45));
 select * from membership;
 delete from membership;
 select * from membership where firstname Like '[%r%]';
 
 create database practiceQuestion;
 use practiceQuestion;
create table student(id int,name varchar(20),age int);
select*from student;
alter table student add column grade varchar(25);
alter table student rename column grade to FinalGrade;
insert into student(id,name,age,finalgrade) values(101,'John Doe',20,'A');
insert into student(id,name,age,finalgrade) values(102,'Jane Smith',22,'B'),(103,"Bob Johnson",19,'C'),(104,"Alice Brown",21,'A'),
(105,'Charles Davis',20,'B'),(106,"Emma Wilson",23,"A"),(107,'Michael Lee',20,'C'),(108,'Olivia Moore',19,'B'),(109,'William Turner',21,'A'),(110,'Sophia Rodriguez',22,'C');
update student set age =21 where id =101;
delete from student where id=101;
select * from student where age >=19;
select * From student where name ="William Turner" or name = "Alice Brown";
select * from student where name in("william Turner","Alice Brown");
select *from student where FinalGrade in('A','B')and age>=20; 
select *from student where age between '18' and "25";
select*from student where age<18;
select *from student where finalGrade>'B';
select count(*) As "total no.of students" from student;
select avg(age) As "Average age of the student" from student;
select avg(age) As "Average age of the student" from student where finalGrade in('A','B');

select count(name) ,finalgrade from student group by finalGrade order by finalGrade desc;
select avg (age),finalgrade from student group by finalGrade order by finalGrade;
insert into student value(111,"john",25,'C');
select count(*) ,finalGrade from student group by finalGrade order by finalGrade limit 1;
select avg(age) from  student where age >21;
select avg(age),finalgrade from student group by finalgrade having  avg(age)between 20 and 25;
select name, age from student order by age asc;
select name,age,finalgrade from student where finalgrade in('A','B')order by age desc;
select *from student order by finalgrade asc;
#=========================================================================#
create table customer(customer_id int, customer_name varchar (20),customer_address varchar(100),city varchar(100),state varchar(100),zip_code varchar(100));
select* from customer;
desc customer;
drop table customer;
insert into customer values(1,"john doe","392SunsetBivd",'New york',"NT","10059"),(2,"Mary smith","6900 Main st","San Franciso","CA",94032),(3,"RichardNewman","2040 Riverside RD","SanDiegeo","CA","92010"),(4,"cathy cook","4010Speedway","tucson","AZ","85719");
alter table customer rename column customer_address to address;
alter table customer add column mobile_number int;
alter table customer modify column mobile_number varchar(100);
insert into customer (mobile_number) values("111111"),("22222222"),("33333333"),("444444444");
delete from customer where mobile_number in("111111","22222222","33333333","444444444");
update customer set mobile_number = case customer_id
when 1 then '123-456-7890'
when 2 then '234-567-8901'
when 3 then '345-678-9012'
when 4 then '987-654-3210'
else
mobile_number
end
where customer_id in (1,2,3,4);
delete from customer where mobile_number is null;
update customer set mobile_number ="82206-1234" where customer_name = "Mary smith";
delete from customer where zip_code = "85719";
select distinct(state), customer_id, customer_name from customer where state = "CA";
alter  table  customer drop column mobile_number;
truncate table customer;
ALTER USER 'root@localhost'identified BY "Muglian@397";
select user, mysql.user;
select USER,HOST, authentication_string  from mysql.user WHERE USER ='root';

# trigger
create table Purchase(product_name varchar(200),stock int);
create table Sales(dateofsales date,product_name varchar (255), nos int);
insert into Purchase values("pipe",50);
insert into Sales values(curdate(),'pipe',20);
select * from purchase;
select * from Sales;
delete from Sales;
delete from purchase;
drop trigger membership.before_insert;
delimiter //
create trigger before_insert 
before insert on  membership.Sales 
for each row 
begin 
update purchase set stock = (stock -new.nos) where product_name = new.product_name;
end //
delimiter ;
show procedure status where db = "membership";
show triggers;
show tables in membership;
show triggers from membership where "Sales";
show processlist;
