create database Employee3;
use Employee3;

CREATE TABLE Employee
(
    employee_name VARCHAR(255) primary key,
    street        VARCHAR(255),
    city          VARCHAR(255)
);

CREATE TABLE Company
(
    company_name VARCHAR(255) primary key,
    city         VARCHAR(255)
);

CREATE TABLE Works
(
    employee_name VARCHAR(255),
    company_name  VARCHAR(255),
    salary        INT
);

CREATE TABLE Manages
(
    employee_name VARCHAR(255),
    manager_name  VARCHAR(255)
);



INSERT INTO Employee (employee_name, street, city)
VALUES ('John Doe', '123 Main St', 'Seattle'),
       ('Jane Smith', '456 Oak St', 'Pune'),
       ('Bob Johnson', '789 Elm St', 'New York');

INSERT INTO Company (company_name, city)
VALUES ('First Bank Corporation', 'Seattle'),
       ('Small Bank Corporation', 'Pune'),
       ('Big Bank Corporation', 'New York');


INSERT INTO Manages (employee_name, manager_name)
VALUES ('John Doe', 'Jane Smith'),
       ('Bob Johnson', 'Jane Smith');

INSERT INTO Works (employee_name, company_name, salary)
VALUES ('John Doe', 'First Bank Corporation', 30000),
       ('Jane Smith', 'Small Bank Corporation', 25000),
       ('Bob Johnson', 'First Bank Corporation', 35000),
       ('Sue Davis', 'Small Bank Corporation', 40000);

INSERT INTO Works (employee_name, company_name, salary)
VALUES ('John Rob', 'First Bank Corporation', 50000),
       ('Hollan Smh', 'Small Bank Corporation', 60000)
;


# 1) Find the names, street address, and cities of residence for all employees
SELECT employee_name, street, city
FROM Employee;


# 2.  Find the names of all employees in the database who live in the city "Pune"


SELECT employee_name
FROM Employee
WHERE city = 'Pune';


# 3) Find the names of all employees in the database who do not work for 'First Bank Corporation'.


SELECT employee_name
FROM Employee
WHERE employee_name NOT IN (SELECT employee_name FROM Works WHERE company_name = 'First Bank Corporation');


# 4. Find the names of all employees in the database who earn more than every employee of 'Small Bank Corporation'.


SELECT employee_name
FROM Employee
WHERE NOT EXISTS
          (SELECT *
           FROM Works
           WHERE company_name = 'Small Bank Corporation'
             AND salary >= ALL (SELECT salary
                                FROM Works
                                WHERE company_name = 'Small Bank Corporation'));


# 5. Find all the managers.
SELECT DISTINCT manager_name
FROM Manages;
