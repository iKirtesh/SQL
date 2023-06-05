use 1_student;

show tables;

create table Suppliers
(
    sid     int not null primary key,
    sname   varchar(50),
    address varchar(60)
);

create table parts
(
    pid   int not null primary key,
    pname varchar(50),
    color varchar(20)
);

create table catalog
(
    sid  int not null,
    pid  int not null,
    cost real,

    foreign key (sid) references suppliers (sid),
    foreign key (pid) references parts (pid)
);


INSERT INTO Suppliers (sid, sname, address)
VALUES (1, 'John', '123 Main St.'),
       (2, 'Jane', '456 Elm St.'),
       (3, 'Bob', '789 Oak St.');

INSERT INTO Suppliers (sid, sname, address)
VALUES (4, 'sohn', '123 Main St.');

INSERT INTO Parts (pid, pname, color)
VALUES (1, 'Keyboard', 'Black'),
       (2, 'Mouse', 'White'),
       (3, 'Monitor', 'Silver');

INSERT INTO Catalog (sid, pid, cost)
VALUES (1, 1, 100.00),
       (2, 2, 50.00),
       (3, 3, 200.00);


# 1. Find the distinct pnames of all parts.
SELECT DISTINCT pname
FROM Parts;


# 2. Alter the data types of sname as varchar(30).
ALTER TABLE Suppliers MODIFY COLUMN sname VARCHAR(30);



# 3. Find out the supplier who is supplying part “Keyboard” whose cost is 5000.
# Here not 5000, so set as 100 rs
SELECT sname
FROM Suppliers
WHERE sid =
      (SELECT sid
       FROM Catalog
       WHERE pid =
             (SELECT pid FROM Parts WHERE pname = 'Keyboard')
         AND cost = 100);

# 4. Remove all parts whose name is “Mouse”.
DELETE
FROM Parts
WHERE pname = 'Mouse';

delete from catalog where pid = 2;

# 5. List all supplier whose name start with “S” in descending order.
SELECT *
FROM Suppliers
WHERE sname LIKE 'S%'
ORDER BY sname DESC;


