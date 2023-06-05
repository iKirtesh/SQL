use employee;


# 1.procedure to check whether a number is even or odd:

CREATE PROCEDURE check_even_odd(IN num INT)
BEGIN
    IF num % 2 = 0 THEN
        SELECT 'Even Number';
    ELSE
        SELECT 'Odd Number';
    END IF;
END;


call check_even_odd(25);


# 2. function to check whether a number is even or odd:

CREATE FUNCTION check_even_odd5(num INT)
    RETURNS VARCHAR(20)
    deterministic
BEGIN
    IF num % 2 = 0 THEN
        RETURN 'Even Number';
    ELSE
        RETURN 'Odd Number';
    END IF;
END;

select check_even_odd5(22);



