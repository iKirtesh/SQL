create database Animal;

use Animal;


# 1. To create a table Animal (id, name) with auto increment id field and insert value in animal table, you can use the following SQL query:


CREATE TABLE Animal
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

INSERT INTO Animal (name)
VALUES ('Lion'),
       ('Tiger'),
       ('Bear');


# 2.  To create table Location as follows Location (Location_Id, Reginal Group) with an auto-increment field starting with 100, you can use the following SQL query:


CREATE TABLE Location
(
    Location_Id   INT PRIMARY KEY AUTO_INCREMENT,
    Reginal_Group VARCHAR(255)
) AUTO_INCREMENT = 100;

desc Location;


# 3. To rename Location table with "Location_of_india" and display Location of india table content, you can use the following SQL query:


RENAME TABLE Location TO Location_of_india;

desc Location_of_india;

desc location;

#NoT EXist Location Table

SELECT *
FROM Location_of_india;


INSERT INTO Location_of_india (Reginal_Group)
VALUES ('North'),
       ('South'),
       ('East'),
       ('West');


# 4.  To create a view of all location whose location_id=101, you can use the following SQL query:


CREATE VIEW location_101 AS
SELECT *
FROM Location_of_india
WHERE Location_Id = 01;

desc location_101;


# 5. To alter table Location to add column "Location Name", you can use the following SQL query:


ALTER TABLE Location_of_india
    ADD COLUMN `Location Name` VARCHAR(255);


desc location_of_india;
