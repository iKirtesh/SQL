use employee4;

CREATE TABLE student
(
    RollNo int,
    mark1  int,
    mark2  int,
    mark3  int,
    mark4  int
);

alter table student
    add average int;

INSERT INTO student (RollNo, mark1, mark2, mark3, mark4)
VALUES (1, 90, 80, 70, 60),
       (2, 80, 70, 60, 50),
       (3, 70, 60, 50, 40),
       (4, 60, 50, 40, 30),
       (5, 50, 40, 30, 20),
       (6, 40, 30, 20, 10);


CREATE PROCEDURE avg_Cal2()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE RollNo, mark1, mark2, mark3, mark4 INT;
    DECLARE cur CURSOR FOR
        SELECT RollNo, mark1, mark2, mark3, mark4 FROM student;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop:
    LOOP
        FETCH cur INTO RollNo, mark1, mark2, mark3, mark4;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT student.RollNo,
               (mark1 + mark2 + mark3 + mark4) / 4 AS average
        FROM student;
    END LOOP;

    CLOSE cur;

end;

call avg_Cal2();


select *
from student;
