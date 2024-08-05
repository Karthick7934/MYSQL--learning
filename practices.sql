create database Company;
use Company;
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (Age >= 0 AND Age <= 99),
    Phone varchar(10)
);
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','xxxxxxxxxx'),
       (2, 'Aman ', 'Chopra', 'Australia','21','xxxxxxxxxx'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','xxxxxxxxxx'),
       (4, 'Aditya', 'Arpan', 'Austria','21','xxxxxxxxxx'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','xxxxxxxxxx');
select *from Customer;
set SQL_SAFE_UPDATES=0;
delete from Customer where Country = 'Sri lanka';
#re-insert
-- Re-insert the deleted row--
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, phone)
VALUES (3, 'Naveen', 'Tulasi', 'Sri Lanka', '24', 'xxxxxxxxxx');
Alter table customer rename column phone to contact;
update  customer  set customerName = "karthick" where customerID = 3;
select age As ageofCustomer from customer where age>21 or age <=20;
alter table customer Add orderId int not null after contact,Add Advanceamount int not null;
alter table customer drop primary key;
delete from customer where orderId between 10 and 14;
UPDATE Customer
SET orderId = CASE CustomerID
                WHEN 1 THEN 10
                WHEN 2 THEN 11
                WHEN 3 THEN 12
                WHEN 4 THEN 13
                WHEN 5 THEN 14
                ELSE orderId
             END,
    Advanceamount = CASE CustomerID
                      WHEN 1 THEN 10000
                      WHEN 2 THEN 2000
                      WHEN 3 THEN 3000
                      WHEN 4 THEN 5000
                      WHEN 5 THEN 65000
                      ELSE Advanceamount
                   END
WHERE CustomerID IN (1, 2, 3, 4, 5);
update customer 
set contact = case CustomerID
	when 1 then 123123123
    when 2  then 454455455
    when 3  then 4542424245
    when 4 then 788972722
    when 5 then 789456312
    end
where customerID in (1,2,3,4,5);
alter table customer rename column lastName to CustomerLastName;
alter table customer rename column CustomerName to CustomerFirstName;
select *from customer;
select * from products;
select now();
show warnings;
show create table customer;
select database();
show tables;
describe products;

create table if not exists products(
productID int not null auto_increment,
productcode char(20) not null default '', name varchar(20) not null default '',quantity  int not null  default 0,primary key(productID));
alter table products drop column prices;
alter table products add  prices decimal(7,2)not null after quantity ;
INSERT INTO products (ProductCode, Name, quantity,prices) VALUES
    ('PEN', 'Pen Red', 5000, 1.23),
    ('PEN', 'Pen Blue', 8000, 1.25),
    ('PEN', 'Pen Black', 2000, 1.25),
    ('PEC', 'Pencil 2B', 10000, 0.48),
    ('PEC', 'Pencil 2H', 8000, 0.49),
    ('PEC', 'Pencil HB', 5000, 0.50);
select name, quantity from products where prices<1.0 or quantity < 2000;
select name , quantity from products where productCode = "Pen";
select name,quantity from products where name like 'pencil%';
select * from customer;
select * from customer where customerfirstname Not like 'a%';
#Logical Operators - AND, OR, NOT, XOR
select*from products where quantity >=5000 or  name  like 'pen%';
select *from products where quantity>=5000 and prices <1.24 and name like"pen%";
select* from products where name not in ("pen Red","Pen Black");
select * from products where (prices between 1.0 and 2.0)And (quantity between 1000 and 2000);
select*from products where productcode is not null;
select * from products where name like 'pen %' order by prices , quantity desc;
select productId AS ID, productCode AS code, name as descripition ,prices as 'unitprice' from products order by ID;
select*from products;
alter table products rename column prices to pricelist;
update products set quantity =10000 where productId = 3;
select distinct pricelist from products;
# groupby
select * from products order by productID,productcode;
select productcode ,count(*) from products group by productCode;
select productcode ,count(*) as count from products group by productcode order by count desc;
select max(pricelist),min(pricelist),avg(pricelist),std(pricelist),sum(pricelist) from products;
select productcode,max(pricelist) AS highestprice , min(pricelist) As lowestprice from products group by productcode; 
set sql_safe_updates = 0;
delete from products where quantity = 5000;
rollback;
commit;
drop table 	products;
alter table products change productID ID int, change productcode code varchar(25),change name description varchar(255),change prices unitprices decimal(10,2);

