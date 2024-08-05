use company;
create table Employee( name varchar(45)not null , occupation varchar(30) not null, working_date date, working_hours varchar(10));
select * from Employee; 
insert into Employee values('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11); 
#before trigger
Delimiter //
create trigger before_trigger Before insert on Employee for each row 
begin if new.working_hours < 0 then set new.working_hours = 0 ;
end if;
end//
insert into employee values('Markus', 'Former', '2020-10-08', 14),('Alexander', 'Actor', '2020-10-012', -13);  
show triggers in company;
DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeLog (name, occupation) 
    VALUES (NEW.name, NEW.occupation);
END //

DELIMITER ;
INSERT INTO Employee (name, occupation, working_date, working_hours) VALUES
('Alice', 'Architect', '2021-01-01', '9');

drop trigger company.before_empolyee_update;
SELECT * FROM EmployeeLog;
drop table EmployeeLog;
CREATE TABLE EmployeeLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(10),
    name VARCHAR(45),
    occupation VARCHAR(30),
    working_date DATE,
    working_hours VARCHAR(10),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
show warnings;
show triggers;
# before update trigger
delimiter //
create trigger  before_empolyee_update before update on Employee
for each row 
begin
insert into EmployeeLog values('Before update',old.name,old.occupation, old.working_date,old.working_hours);
end//
delimiter ;

DELIMITER //
CREATE TRIGGER after_employee_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeLog (action_type, name, occupation, working_date, working_hours)
    VALUES ('AFTER UPDATE', NEW.name, NEW.occupation, NEW.working_date, NEW.working_hours);
END //

DELIMITER ;


UPDATE Employee SET working_hours = '15' WHERE name = 'Robin';
SELECT * FROM EmployeeLog WHERE action_type = 'BEFORE UPDATE' OR action_type = 'AFTER UPDATE';
select concat("karthi");
