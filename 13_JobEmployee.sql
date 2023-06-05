create database Job;

use Job;


CREATE TABLE Location
(
    Location_Id    INT PRIMARY KEY,
    Regional_Group VARCHAR(255)
);

CREATE TABLE Department
(
    Department_Id INT PRIMARY KEY,
    Name          VARCHAR(255),
    Location_Id   INT,
    FOREIGN KEY (Location_Id) REFERENCES Location (Location_Id)
);

CREATE TABLE Jobs
(
    Job_Id    INT PRIMARY KEY,
    F_unction VARCHAR(255)
);

CREATE TABLE Employee
(
    Employee_Id   INT PRIMARY KEY,
    Lastname      VARCHAR(255),
    Firstname     VARCHAR(255),
    Middlename    VARCHAR(255),
    Job_Id        INT,
    Manager_Id    INT,
    Hiredate      DATE,
    Salary        DECIMAL(10, 2),
    Department_Id INT,
    FOREIGN KEY (Job_Id) REFERENCES Jobs (Job_Id),
    FOREIGN KEY (Manager_Id) REFERENCES Employee (Employee_Id),
    FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id)
);


INSERT INTO Location (Location_Id, Regional_Group)
VALUES (1, 'North'),
       (2, 'South'),
       (3, 'East'),
       (4, 'West');

INSERT INTO Department (Department_Id, Name, Location_Id)
VALUES (10, 'Sales', 1),
       (20, 'Marketing', 2),
       (30, 'Finance', 3),
       (40, 'Human Resources', 4);

INSERT INTO Jobs (Job_Id, F_unction)
VALUES (671, 'Sales Representative'),
       (672, 'Marketing Manager'),
       (673, 'Financial Analyst'),
       (674, 'Human Resources Manager');

INSERT INTO Employee (Employee_Id, Lastname, Firstname, Middlename, Job_Id,
                      Manager_Id, Hiredate, Salary, Department_Id)
VALUES (1001, 'Smith', 'John', '', 671, NULL, '2022-01-01', 4000.00, 10),
       (1002, 'Johnson', 'Robert', '', 672, NULL, '2022-01-02', 5000.00, 20),
       (1003, 'Williams', 'David', '', 673, NULL, '2022-01-03', 6000.00, 30),
       (1004, 'Jones', 'Michael', '', 674, NULL, '2022-01-04', 7000.00, 40);


# 1. List the details about “smith”
SELECT *
FROM Employee
WHERE Lastname = 'Smith';


#2. List out the employee whose job id is 671.
SELECT *
FROM Employee
WHERE Job_Id = 671;


#3. List out the employees who are earning salary between 3000 and 4500.
SELECT *
FROM Employee
WHERE Salary BETWEEN 3000 AND 4500;


# 4. List out the employees who are working in department 10 or 20.
SELECT *
FROM Employee
WHERE Department_Id IN (10, 20);


#5. Find out the employees who are not working in department 10 or 30.
SELECT *
FROM Employee
WHERE Department_Id NOT IN (10, 30);
