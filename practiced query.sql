CREATE DATABASE student;
drop database student;
use student;
CREATE TABLE empolyee_detail (
  Id INT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);
CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
      Title VARCHAR(200) NOT NULL,
     ClientId INT,
 EmployeeId INT,
     StartDate DATETIME,
     EndDate DATETIME
);
select count(*) from empolyee_detail;
select * from empolyee_detail;
drop table empolyee_detail;
#---------------------------------------------Table1 Empolyee_details table data-------------------------------------------------------------------------------------------------
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1011, 'Pramod Panda', 'IT', 45000, 'Male', 27, 'Mumbai');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1012, 'Preety Tiwary', 'HR', 55000, 'Female', 28, 'Mumbai');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1013, 'Santosh Dube', 'IT', 52000, 'Male', 28, 'Mumbai');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1014, 'Sara Talour', 'HR', 85000, 'Female', 26, 'London');
INSERT INTO empolyee_detail (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1015, 'Pamela Kar', 'Finance', 70000, 'Female', 26, 'London');

#------------------------------------------------------------stored procedure-------------------------------------------------
delimiter $$
create procedure empolyee_detail_storevalue()
begin
select * from empolyee_detail;
select * from empolyee_detail where department like '__';
select count(*) from empolyee_detail where name = "Pramod Panda";
End $$
delimiter ;
call empolyee_detail_storevalue();
#----------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------Table2 project table data------------------------------------------------------------------------------------------------- 
INSERT INTO Projects ( Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));

Select empolyee_detail.ID, Name, department, title, country , state from empolyee_detail 
inner join projects on projects.EmployeeId = empolyee_detail.Id
inner join Address on Address.EmployeeId =empolyee_detail.Id;

Select empolyee_detail.ID, Name, department, title, country , state from empolyee_detail 
left join projects on projects.EmployeeId = empolyee_detail.Id
left join Address on Address.EmployeeId =empolyee_detail.Id
union
Select empolyee_detail.ID, Name, department, title, country , state from empolyee_detail 
right join projects on projects.EmployeeId = empolyee_detail.Id
right join Address on Address.EmployeeId =empolyee_detail.Id;
CREATE TABLE Address
(
    AddressId INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeId INT,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
    #FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
);
INSERT INTO Address (EmployeeId, Country, State, City) Values (1001, 'India', 'Odisha', 'BBSR');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1002, 'India', 'Maharashtra', 'Mumbai');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1003, 'India', 'Maharashtra', 'Pune');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1004, 'India', 'Odisha', 'Cuttack');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1005, 'India', 'Maharashtra', 'Nagpur');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1006, 'India', 'Odisha', 'Cuttack');
delimiter $$
create procedure project_storevalue()
begin
select * from projects;
End $$
delimiter ;
call project_storevalue();
delimiter $$
create procedure empolyee_detail_storevalue()
begin
select * from empolyee_detail;
select * from empolyee_detail where department like '__';
select count(*) from empolyee_detail where name = "Pramod Panda";
End $$
delimiter ;
call empolyee_detail_storevalue();
show tables;
SELECT * FROM information_schema.tables WHERE table_schema = 'student' AND table_name = 'employee_detail';
select * from empolyee_detail where age = 28  or city ="London";
select * from empolyee_detail where Age = 28 or city <> "london";
select * from empolyee_detail where salary <= 350000 and city = "London" order by department;
select *from empolyee_detail where salary between 35000 and 70000;
select avg(salary) from empolyee_detail;
select name from empolyee_detail where name like 'P%' ;#starting
select * from empolyee_detail where DEPARTMENT like"%ce" and  gender = "Female";
SELECT *from empolyee_detail where name  like "%am%";
select * from empolyee_detail where city like "Mumba_";
select * from empolyee_detail where department like '__';
select * from empolyee_detail where department  not in ("HR","IT");
select * from empolyee_detail where age in(25,26);
select distinct(salary) from empolyee_detail order By salary desc ;
select salary from empolyee_detail order By salary desc limit 10 ;
select * from empolyee_detail where exists (select * from projects where empolyee_detail.Id = projects.EmployeeId);
select exists(select * from empolyee_detail where Id =1004);
update empolyee_detail set city = "banaglore" where exists(select * from  projects where ClientId = 3 and empolyee_detail.id = projects.EmployeeId);
call empolyee_detail_storevalue();
select department ,count(*) from empolyee_detail group by department;
select department ,sum(salary) from empolyee_detail group by department;
select department ,max(salary) from empolyee_detail group by department;
select department ,min(salary) from empolyee_detail group by department;
select department, avg(salary) from  empolyee_detail group by department having avg(salary)>50000;
select ID, salary , salary*1.1 as bonus from empolyee_detail; 
select(current_date + interval 1 day)as  " Worst days";	
#------------------------------------------------------------------
CREATE TABLE EmployeeUK
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(20)
);
INSERT INTO EmployeeUK VALUES(1, 'Pranaya', 'Rout', 'Male','IT');
INSERT INTO EmployeeUK VALUES(2, 'Priyanka', 'Dewangan', 'Female','IT');
INSERT INTO EmployeeUK VALUES(3, 'Preety', 'Tiwary', 'Female','HR');
INSERT INTO EmployeeUK VALUES(4, 'Subrat', 'Sahoo', 'Male','HR');
INSERT INTO EmployeeUK VALUES(5, 'Anurag', 'Mohanty', 'Male','IT');
INSERT INTO EmployeeUK VALUES(6, 'Rajesh', 'Pradhan', 'Male','HR');
INSERT INTO EmployeeUK VALUES(7, 'Hina', 'Sharma', 'Female','IT');
CREATE TABLE EmployeeUSA
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(20)
);
INSERT INTO EmployeeUSA VALUES(1, 'James', 'Pattrick', 'Male','IT');
INSERT INTO EmployeeUSA VALUES(2, 'Priyanka', 'Dewangan', 'Female','IT');
INSERT INTO EmployeeUSA VALUES(3, 'Sara', 'Taylor', 'Female','HR');
INSERT INTO EmployeeUSA VALUES(4, 'Subrat', 'Sahoo', 'Male','HR');
INSERT INTO EmployeeUSA VALUES(5, 'Sushanta', 'Jena', 'Male','HR');
INSERT INTO EmployeeUSA VALUES(6, 'Mahesh', 'Sindhey', 'Female','HR');
INSERT INTO EmployeeUSA VALUES(7, 'Hina', 'Sharma', 'Female','IT');
SELECT FirstName, LastName, Gender, Department FROM EmployeeUK
UNION 
SELECT FirstName, LastName, Gender, Department FROM EmployeeUSA;
select ucase(firstName) from EmployeeUK; 	
select mid("Karthick",7,3)as extrcted ;
select mid(name, 1,3) as middlename from empolyee_detail limit 10;
select round(50.55) as roundnumber;
show tables;
use company;
show views ;
