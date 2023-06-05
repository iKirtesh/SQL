create database Employee2;


use Employee2;

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
       ('Jane Smith', '456 Oak St', 'Portland'),
       ('Bob Johnson', '789 Elm St', 'Seattle'),
       ('Sue Davis', '101 Maple St', 'Portland');

INSERT INTO Company (company_name, city)
VALUES ('Acme Corporation', 'Seattle'),
       ('Widget Inc.', 'Portland'),
       ('Globex Corporation', 'Seattle');

INSERT INTO Works (employee_name, company_name, salary)
VALUES ('John Doe', 'Acme Corporation', 30000),
       ('Jane Smith', 'Widget Inc.', 25000),
       ('Bob Johnson', 'Acme Corporation', 35000),
       ('Sue Davis', 'Widget Inc.', 40000);

INSERT INTO Manages (employee_name, manager_name)
VALUES ('John Doe', 'Jane Smith'),
       ('Bob Johnson', 'Jane Smith');


# 1. Count employees company wise where salary greater than 25000.

SELECT Company.company_name, COUNT(Employee.employee_name) AS 'Number of Employees'
FROM Employee
         JOIN Works ON Employee.employee_name = Works.employee_name
         JOIN Company ON Works.company_name = Company.company_name
WHERE Works.salary > 25000
GROUP BY Company.company_name;


# 2 . Delete column salary from Works
ALTER TABLE Works
    DROP COLUMN salary;

# 3. Display the structure of manager table

DESCRIBE Manages;

# 4. Update data type of employee-name in Manager from varchar(30) to varchar(50)

ALTER TABLE Manages
    MODIFY COLUMN employee_name VARCHAR(50);

# 5. Find the employees whose salary ranges 25000 to 50000

SELECT Employee.employee_name, Works.salary
FROM Employee
         JOIN Works ON Employee.employee_name = Works.employee_name
WHERE Works.salary BETWEEN 25000 AND 50000;