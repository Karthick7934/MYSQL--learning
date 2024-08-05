create database joins;
use joins;
show databases;
create table Customer(customer_id int, customer_name varchar(255));
create table Orders(order_id int, amount varchar(25),customer_id int);
show tables;
desc  Customer;
desc Orders;
insert into customer values(1, "John"),(2,"Robert"),(3,"David"),(4,"john"),(5,"betty"); 
select * from customer;
insert into Orders value (1,200,10),(2,500,3),(3,300,6),(4,800,5),(5,150,6);
select * from Orders;
update orders set customer_id = 8 where order_id =5;
select customer.customer_id,customer.customer_name,orders.order_id,orders.amount from customer inner join orders on customer.customer_id = orders.customer_id;
select customer.customer_id,customer.customer_name,orders.order_id,orders.amount from customer left join orders on customer.customer_id = orders.customer_id;
select customer.customer_id,customer.customer_name,orders.order_id,orders.amount  from customer right join orders on customer.customer_id = orders.customer_id;

SELECT customer.customer_id, customer.customer_name, orders.order_id,orders.amount
FROM customer
LEFT JOIN orders ON customer.customer_id = orders.customer_id
UNION
SELECT customer.customer_id, customer.customer_name,orders.order_id,orders.amount
FROM orders
LEFT JOIN customer ON orders.customer_id = customer.customer_id;


SELECT customer_id FROM Customer
UNION ALL
SELECT customer_id FROM orders;

SELECT * FROM customer   
   WHERE customer_id IN (SELECT distinct(customer_id) FROM employees); 
       


