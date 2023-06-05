show databases;

create database 1_student;
use 1_student;

CREATE TABLE student
(
    regd_no INT          NOT NULL,
    name    VARCHAR(255) NOT NULL,
    branch  VARCHAR(255) NOT NULL,
    PRIMARY KEY (regd_no)
);


desc student;


insert into student(regd_no, name, branch)
values (0001, 'Ram', 'CSE'),
       (0002, 'Hari', 'MECH'),
       (0003, 'Pradeep', 'EEE'),
       (0004, 'Deepak', 'ETC');


select *
from student;


# 1. SQL Command to find REGD_NO of Pradeep

select regd_no as Pradeep_REGD_NO
from student
where name = 'Pradeep';


# 2. To dispaly name and branch of REGD_NO 0002

select name, branch
from student
where regd_no = 0002;


# 3. No of rows in student table

select count(*) as 'Number of Rows in Student Table'
from student;

# 4. Add address column in Student table

alter table student
    add column address varchar(255);

desc student;

select *
from student;

# 5. Change branch of Ram to ETC from CSE

update student
set branch = 'ETC'
where name = 'Ram';


select *
from student;