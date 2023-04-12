-- 5. Write a function to return the Square of a given number and call it from an anonymous block. --

CREATE OR REPLACE FUNCTION square(n INTEGER)
RETURN INTEGER AS
BEGIN
    RETURN n * n;
END;
/
