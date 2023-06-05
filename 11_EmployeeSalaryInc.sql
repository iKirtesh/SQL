CREATE DATABASE Employee5;

use Employee5;


CREATE TABLE Employee
(
    Employee_Id   INT,
    Lastname      VARCHAR(255),
    Firstname     VARCHAR(255),
    Middlename    VARCHAR(255),
    Job_Id        INT,
    Manager_id    INT,
    Hiredate      DATE,
    Salary        DECIMAL(10, 2),
    Department_id INT
);



INSERT INTO Employee (Employee_Id, Lastname, Firstname, Middlename, Job_Id, Manager_id, Hiredate, Salary, Department_id)
VALUES (7369, 'Smith', 'Jon', 'Q', 667, 7902, '1984-12-17', 800.00, 10),
       (7499, 'Allen', 'Kevin', 'J', 670, 7698, '1985-02-20', 1600.00, 20),
       (7521, 'Wark', 'Cynthia', 'D', 670, 1250, '1985-02-22', 1259, 10),
       (7505, 'Doyle', 'Jean', 'K', 671, 7839, '1985-04-04', 2850.00, 20),
       (7506, 'Dennis', 'Lynn', 'S', 671, 7839, '1985-05-15', 2750.00, 30),
       (7507, 'Baker', 'Leslie', 'D', 671, 7839, '1985-05-15', 2200.00, 40);



select *
from employee;


# 1. Create a view for all columns of Employee table.

CREATE VIEW all_columns AS
SELECT *
FROM Employee;


select *
from all_columns;


desc all_columns;


# 2. Create a view of last name, firstname and middlename of Employee table.
CREATE VIEW name_view AS
SELECT Lastname   AS Last_Name,
       Firstname  AS First_Name,
       Middlename AS Middle_Name
FROM Employee;

select *
from name_view;


desc name_view;


# 3. Create a view of all employees whose last name starts from “S” and middle name is “Q”.
CREATE VIEW employees_view AS
SELECT *
FROM Employee
WHERE Lastname LIKE 'S%'
  AND Middlename = 'Q';

select *
from employees_view;

desc employees_view;


# 4.Create a view of all employees with salary incremented by 10%.


CREATE VIEW salary_view AS
SELECT Employee_Id,
       Lastname,
       Firstname,
       Middlename,
       Job_Id,
       Manager_id,
       Hiredate,
       Salary * 1.1 AS Incremented_Salary,
       Department_id
FROM Employee;


select *
from salary_view;


# 5. Delete view for all columns of Employee.

SELECT *
FROM all_columns;


DROP VIEW all_columns;

SELECT *
FROM all_columns;