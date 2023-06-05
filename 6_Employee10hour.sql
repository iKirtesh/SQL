create database Employee;

use Employee;

create table dept
(
    deptno int primary key,
    dname  varchar(255),
    mgreno int
);

create table emp
(
    eno    int primary key,
    ename  varchar(45),
    bdate  date,
    title  varchar(20),
    salary int,
    deptno int,

    foreign key (deptno) references dept (deptno)
);



create table proj
(
    pno    int primary key,
    pname  varchar(45),
    bugdet int,
    deptno int,

    foreign key (pno) references dept (deptno)
);

create table workson
(
    eno            int,
    pno            int,

    responsibility varchar(20),
    hours          time,

    foreign key (eno) references emp (eno),
    foreign key (pno) references proj (pno)
);

show tables;



insert into dept()
values (1, 'D1', 45),
       (2, 'Production', 50);


insert into proj()
values (001, 'Lab56', 122000, 1),
       (002, 'Lab40', 30000, 1);



insert into workson()
values (1, 1, 'Manager', 10),
       (2, 1, 'Manager', 9),
       (3, 1, 'Employee', 12),
       (4, 1, 'HRA', 20),
       (5, 1, 'Manager', 6);



insert into emp()
values (1, 'Kirtesh', '2020-12-03', 'Manager', 36000, 1),
       (2, 'Shravani', '2010-05-03', 'Employee', 40000, 2),
       (3, 'Shubham', '2000-05-03', 'Employee', 50000, 2),
       (4, 'Saurabh', '2000-05-03', 'Manager', 100000, 1),
       (5, 'Pritesh', '2000-02-06', 'Manager', 56000, 1);



insert into emp()
values (6, 'Pranali', '2020-12-03', 'Manager', 36000, 2),
       (7, 'Akshada', '2010-05-03', 'Manager', 40000, 2);


select *
from emp;
select *
from dept;
select *
from proj;

select *
from workson;


# 1. SQL to find NO and Name of project who has budget is grater than 100000
select pno, pname
from proj
where bugdet > 100000;


# 2. SQL to find all works on record where hour < 10 and responsibility = manager

select *
from workson
where hours < 10
  and responsibility = 'Manager';


# 3. return all employees (number and Name) who has title 'EE - Employee' and Salary > 35000

select eno, ename
from emp
where title = 'Employee'
  and salary > 35000;

# 4. return employee name only in Department D! ordered by decreasing order
SELECT ename
FROM emp
WHERE deptno = (SELECT deptno
                FROM dept
                WHERE dname = 'D1')
ORDER BY salary DESC;


# 5. List of number who dept is 'Production'

SELECT mgreno
FROM dept
WHERE dname = 'Production';
