use employee4;
# Write a Procedure to find the maximum number from given three numbers.

CREATE PROCEDURE greater(IN a INT, IN b INT, IN c INT)
BEGIN
    IF a > b AND a > c THEN
        SELECT a;
    ELSEIF b > a AND b > c THEN
        SELECT b;
    ELSE
        SELECT c;
    END IF;
END;


call greater(10, 20, 30);

/* CREATE TABLE studentdata (mark1, mark2, mark3 mark4,name of student)
Insert some values.
- write aFunction to calculate average of marks.
- List the average marks of each student.
 */

CREATE TABLE studentdata
(
    mark1 INT,
    mark2 INT,
    mark3 INT,
    mark4 INT,
    name  VARCHAR(20)
);

INSERT INTO studentdata
VALUES (10, 20, 30, 40, 'A'),
       (20, 30, 40, 50, 'B'),
       (30, 40, 50, 60, 'C'),
       (40, 50, 60, 70, 'D'),
       (50, 60, 70, 80, 'E'),
       (60, 70, 80, 90, 'F');



create function average(mark1 int, mark2 int, mark3 int, mark4 int)
    returns int
    deterministic

BEGIN
    declare avg int;
    set avg = (mark1 + mark2 + mark3 + mark4) / 4;
    return avg;
END;


SELECT name,
       average(mark1, mark2, mark3, mark4) AS average
FROM studentdata;