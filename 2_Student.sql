# We already created a table of student which have same values in it
# We are going to use student

# Use from it 1_student database

use 1_student;

show tables;


desc student;

select *
from student;


# 1. Delete the record of RAM from student table

delete
from student
where name = 'Ram';


select *
from student;


# 2. SQL Query to show ALL records which starts with name 'R'
select *
from student
where name like 'R%';


# Not found bcz We already delete the record of Ram
# Lets find with 'P'

select *
from student
where name like 'P%';


# 3.Update from Pradeep to Pradeep Kumar

update student
set name = 'Pradeep Kumar'
where name = 'Pradeep';

select *
from student;


# 4. add ADDRESS column in student table and update all address
# you can check previous 1_student.sql file where we added

update student
set address = 'Pune'
where regd_no = 2;

update student
set address = 'Mumbai'
where regd_no = 3;



update student
set address = 'Chennai'
where regd_no = 4;


select *
from student;


# 5. Total number of registration of each branch

select branch, count(*)
from student
group by branch;