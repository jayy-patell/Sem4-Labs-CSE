set serveroutput on
DECLARE
CURSOR C is select distinct(dept_name) from department;
BEGIN
FOR d_name in C LOOP
DBMS_OUTPUT.PUT_LINE(d_name.dept_name || '->' ||dept_highest(d_name.dept_name) );
END LOOP;
END;
/
