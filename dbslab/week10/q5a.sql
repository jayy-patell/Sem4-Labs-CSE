set serveroutput on
declare
BEGIN
    DBMS_OUTPUT.PUT_LINE(square('&number'));
END;
/