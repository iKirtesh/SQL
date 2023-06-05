use employee3;

CREATE TABLE account
(
    aceno  INT,
    amount INT
);

CREATE TRIGGER before_update_account
    BEFORE UPDATE
    ON account
    FOR EACH ROW
BEGIN
    IF NEW.amount < 0 THEN
        SET NEW.amount = 0;
    ELSEIF NEW.amount > 100 THEN
        SET NEW.amount = 100;
    END IF;
END;


create event add_hi
    on schedule every 1 minute
    do
    begin
        insert into account()
        values (1, 100);
    end
;


call add_hi();



select *
from account;

truncate table account;

