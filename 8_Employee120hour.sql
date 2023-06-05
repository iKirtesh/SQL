create database Employee8;

use Employee8;

CREATE TABLE emp
(
    eno    INT PRIMARY KEY,
    ename  VARCHAR(50),
    bdate  DATE,
    title  VARCHAR(50),
    salary DECIMAL(10, 2),
    dno    INT
);

CREATE TABLE dept
(
    dno    INT PRIMARY KEY,
    dname  VARCHAR(50),
    mgreno INT
);

CREATE TABLE proj
(
    pno    INT PRIMARY KEY,
    poame  VARCHAR(50),
    budget DECIMAL(10, 2),
    dno    INT,
    FOREIGN KEY (dno) REFERENCES dept (dno)
);



CREATE TABLE workson
(
    eno        INT,
    pno        INT,
    resp_hours DECIMAL(10, 2),
    FOREIGN KEY (eno) REFERENCES emp (eno),
    FOREIGN KEY (pno) REFERENCES proj (pno)
);



INSERT INTO emp (eno, ename, bdate, title, salary, dno)
VALUES (1, 'John', '1990-01-01', 'Manager', 5000.00, 1),
       (2, 'Jane', '1995-02-02', 'Consultant', 4000.00, 2),
       (3, 'Bob', '2000-03-03', 'Analyst', 3000.00, 3),
       (4, 'Alice', '2005-04-04', 'Developer', 2000.00, 4),
       (5, 'Tom', '2010-05-05', 'Intern', 1000.00, 5);



INSERT INTO dept (dno, dname, mgreno)
VALUES (1, 'Consulting', 1),
       (2, 'Finance', 2),
       (3, 'Marketing', 3),
       (4, 'Engineering', 4),
       (5, 'Human Resources', 5);

INSERT INTO proj (pno, poame, budget, dno)
VALUES (1, 'Banking', 100000.00, 1),
       (2, 'Insurance', 200000.00, 2),
       (3, 'Retail', 300000.00, 3),
       (4, 'Manufacturing', 400000.00, 4),
       (5, 'Healthcare', 500000.00, 5);

INSERT INTO workson (eno, pno, resp_hours)
VALUES (1, 1, 140),
       (2, 2, 30),
       (3, 3, 120),
       (4, 4, 10),
       (5, 5, 155);


# 1. SQL query that returns the employee numbers and salaries of all employees in the Consulting department ordered by descending salary:


SELECT emp.eno, emp.salary
FROM emp
         JOIN dept ON emp.dno = dept.dno
WHERE dept.dname = 'Consulting'
ORDER BY emp.salary DESC;


# 2. SQL query that returns the employee name, project name, employee title, and hours for all works on records:


SELECT emp.ename, proj.poame, emp.title, workson.resp_hours
FROM emp
         JOIN workson ON emp.eno = workson.eno
         JOIN proj ON workson.pno = proj.pno;


# 3. SQL query that finds the entire employee whose salary is between 1000 and 8000:


SELECT *
FROM emp
WHERE salary BETWEEN 1000 AND 8000;


# 4. SQL query that lists the entire projects name:


SELECT poame
FROM proj;


# 5. SQL query that finds the employee who is working on project "Banking" of "Production" department Justin 120 hours:


SELECT emp.ename
FROM emp
         JOIN workson ON emp.eno = workson.eno
         JOIN proj ON workson.pno = proj.pno AND proj.poame = 'Banking'
         JOIN dept ON proj.dno = dept.dno AND dept.dname = 'Consultant'
WHERE workson.resp_hours = 140;
