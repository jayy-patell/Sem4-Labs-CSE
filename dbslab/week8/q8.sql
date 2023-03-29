set serveroutput on
DECLARE
    Multiple_Instructor Exception;
    inst instructor%ROWTYPE;
    inp instructor.name%TYPE;
    n number(10);
BEGIN
    inp := '&name';
select count(id) into n from instructor group by name having name=inp;
IF n>1 THEN
    RAISE Multiple_Instructor;
ELSE
    select * into inst from instructor where instructor.name = inp;
    dbms_output.put_line(inst.id ||' '|| inst.name ||' '|| inst.dept_name ||' '|| inst.salary);
END IF;
EXCEPTION
WHEN Multiple_Instructor THEN
    dbms_output.put_line('Duplicate names found!');
END;
/
