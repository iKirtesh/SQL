use `1_student`;

show tables;



create table salesperson
(
    SID    int          not null primary key,
    Name   varchar(255) not null,
    Age    int          not null,
    salary int          not null
);


CREATE table product
(
    PID  int          not null PRIMARY KEY,
    SID  int          not null,
    Name varchar(255) not null,
    City varchar(255) not null,

    foreign key product (SID) references salesperson (SID)
);

desc salesperson;

desc product;


insert into salesperson()
values (1, 'Abe', 61, 140000),
       (2, 'Bob', 34, 44000),
       (5, 'Chris', 34, 40000),
       (7, 'Dan', 41, 52000),
       (8, 'Ken', 57, 115000),
       (11, 'Joe', 38, 38000);

insert into product ()
values (1, 1, 'Samsonic', 'pleasant'),
       (2, 5, 'Panasonic', 'oaktown'),
       (3, 7, 'Samony', 'jackson'),
       (4, 8, 'Orange', 'jackson');

select *
from salesperson;


select *
from product;


# 1. Find all salesperson which have order with 'Samsonic'

SELECT *
FROM salesperson
WHERE SID IN (SELECT product.SID
              FROM product
              where Name = 'Samsonic');

#2. Find all salesperson which not have order with 'Samsonic'

SELECT Name
FROM salesperson
WHERE SID NOT IN (SELECT product.SID
                  FROM product
                  where Name = 'Samsonic');


# 3. Name of all salesperson who has more than 2 orders

SELECT Name
FROM salesperson s
WHERE 2 <= (SELECT count(*)
            FROM product
            where SID = s.SID);
# there is no more than two orders of one salesperson

# if 1 or more have

SELECT Name
FROM salesperson s
WHERE 1 <= (SELECT count(*)
            FROM product
            where SID = s.SID);


# 4. name of all salesperson who age is less than 40

select *
from salesperson
where age < 40;


# 5. Find ID and NAME of salesperson which have order with 'Panasonic'
SELECT SID, Name
FROM salesperson
WHERE Name IN (SELECT salesperson.Name
               FROM product
                        INNER JOIN salesperson ON product.SID = salesperson.SID AND product.Name = 'Panasonic');