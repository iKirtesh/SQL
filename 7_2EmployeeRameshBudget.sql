use employee;

# 1. SQL query that returns the departments (all fields) ordered by ascending department name.

SELECT *
FROM dept
ORDER BY dname ASC;

# 2. SQL query that returns the employee name, department name, and employee title.
SELECT ename, dname, title
FROM emp,
     dept
WHERE emp.deptno = dept.deptno;

# 3. SQL query that returns the project name, hours worked, and project number for all works on records where hours > 10.

SELECT proj.pname, workson.hours, proj.pno
FROM workson
         JOIN proj ON workson.pno = proj.pno
WHERE workson.hours > 10;


# 4. SQL query that returns the project name, department name, and budget for all projects with a budget <Rs. 50,000.


SELECT proj.pname, dept.dname, proj.bugdet
FROM proj
         JOIN dept ON proj.deptno = dept.deptno
WHERE proj.bugdet < 50000;

# 5. Find the responsibility of the employee “Ramesh” who is working on project “Banking”.

SELECT responsibility
FROM workson
WHERE eno = (SELECT eno FROM emp WHERE ename = 'Kirtesh')
  AND pno = (SELECT pno FROM proj WHERE pname = 'Lab56');
