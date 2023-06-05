use employee4;


# 1. write procedure for grade of student

CREATE PROCEDURE grade(IN a INT, IN b INT, IN c INT, IN d INT)
BEGIN
    DECLARE avg INT;
    SET avg = (a + b + c + d) / 4;
    IF avg > 90 THEN
        SELECT 'A';
    ELSEIF avg > 80 THEN
        SELECT 'B';
    ELSEIF avg > 70 THEN
        SELECT 'C';
    ELSEIF avg > 60 THEN
        SELECT 'D';
    ELSE
        SELECT 'F';
    END IF;
END;


CALL grade(10, 20, 30, 40);

CALL grade(20, 30, 40, 50);

CALL grade(30, 40, 50, 60);

CALL grade(40, 50, 60, 70);

CALL grade(50, 60, 70, 80);

CALL grade(60, 70, 80, 90);

CALL grade(70, 80, 90, 100);

CALL grade(80, 90, 100, 110);

CALL grade(90, 100, 110, 120);

CALL grade(100, 110, 120, 130);


# 2.  write function for grade of student

CREATE TABLE stud
(
    mark1 INT,
    mark2 INT,
    mark3 INT,
    mark4 INT,
    name  VARCHAR(20)
);

INSERT INTO stud
VALUES (10, 20, 30, 40, 'ABC'),
       (20, 30, 40, 50, 'BCD'),
       (30, 40, 50, 60, 'CDE'),
       (40, 50, 60, 70, 'DEF'),
       (50, 60, 70, 80, 'EFG'),
       (60, 70, 80, 90, 'FGH');



CREATE FUNCTION grading(a int, b int, c int, d int)
    returns varchar(1)
    deterministic

begin
    declare avg int;
    set avg = (a + b + c + d) / 4;

    if avg > 90 then
        return 'A';
    elseif avg > 80 then
        return 'B';
    elseif avg > 70 then
        return 'C';
    elseif avg > 60 then
        return 'D';
    else
        return 'F';
    end if;
end;


select name, grading(mark1, mark2, mark3, mark4) as Grade
from stud;