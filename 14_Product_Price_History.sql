create database Product;

use Product;


CREATE TABLE product
(
    product_id    INT,
    product_name  VARCHAR(255),
    supplier_name VARCHAR(255),
    unit_price    DECIMAL(10, 2)
);

CREATE TABLE product_price_history
(
    product_id    INT,
    product_name  VARCHAR(255),
    supplier_name VARCHAR(255),
    unit_price    DECIMAL(10, 2)
);



CREATE TRIGGER update_product_price_history
    AFTER UPDATE
    ON product
    FOR EACH ROW
BEGIN
    INSERT INTO product_price_history (product_id, product_name, supplier_name, unit_price)
    VALUES (OLD.product_id, OLD.product_name, OLD.supplier_name, OLD.unit_price);
END;



insert into product_price_history()
values (3, 'Mouse', 'Pirtesh', 20.3);


insert into product()
values (2, 'KeYNod', 'Minal', 40.0);


# Updating the value in PRODUCT table it automatically reflect on product_price_history

update product
set product_id = 5
where product_id = 2;

select *
from product;


select *
from product_price_history;


SELECT *
FROM product_price_history
WHERE product_id = 2;