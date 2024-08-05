-- views
-- views is virtual table based on result -set of an Sql satement
-- the fields in a view are filed from one or more real tables in the database
-- they are not real table, but can be interacted with as if they were
#syntax 
#create view view_name As select column from table;
use company;
create view attendence AS select firstname,LastName from customer;
drop view attendence;
show tables;
select * from customer; 
update  customer set firstname = "kishore" where customerId = 3;
select * from attendence order by lastName asc;
alter table customer rename column customerFirstname to firstname,rename column customerlastName to LastName;
alter table customer add column email varchar(20);
alter table customer modify email varchar(75);
update customer set Email = case customerId
when 1 then "FFish@gmail.com"
when 2 then "llobsert@gmail.com"
when 3 then "BBass@gmail.com"
when 4 then "PPuff@gmail.com"
end
where customerId in (1,2,3,4);
delete from customer where customerID =5;
rollback;
desc customer;
insert into customer value(1, 'Shubham', 'Thakur', 'India','23','555555555',10,1000,"FFish@gmail.com");
create view customer_email As 
select email from customer;
select * from customer_email;
insert into customer values(5,"karthick","R", "india","24","565564444",12,20000,"karthick397r@gmail.com"); 
drop view customer_email;

-- index (btree structure)
-- indexes are used find values within a specific columns
-- Mysql normally searches sequentially through ac olumns
-- the longer the column more expensive the operation
-- update takes more time , select takes less time

show indexes from customer;
alter table customer add primary key(customerid);
CREATE INDEX LAST_NAME_IDX ON CUSTOMER(LASTNAME);#clluster index
show indexes from customer;
select * from customer where lastname = "R";
select * from customer where firstname = "Karthick";
create index last_firstname_idx on customer(lastname, firstname);#non-cluster index
alter table customer add column hourly_pay int;
alter table customer change hourly_pay  hourly_pay decimal(10,2);
update customer set hourly_pay = case customerId
when 1 then 25.50
when 2 then 15.00
when 3 then	12.50
when 4 then 12.50
when 5 then 10.00
end
where customerId in(1,2,3,4,5);
select * From customer; 
delete from customer where customerid = null;
alter table customer add column salary decimal(10,2) after hourly_pay;
update customer set salary = hourly_pay*2080;
# trigger  when the even happen do to something
# DML = insert, delete, update 
#example -- checks data, handling error,auditing table
#syntax  create trigger trigger_name befor update o table name for each row set  trigger body
create trigger before_hourly_pay before update on customer for each row set new.salary = (new.hourly_pay *2080) ;
update 	customer set hourly_pay = hourly_pay + 1;	
create trigger before_hourly_pay_insert before insert on customer for each row  set new.salary = (new.hourly_pay *2080);
insert into customer values  (6, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','222222222',13,20000,"kkk@gmail.com", 10,null);

