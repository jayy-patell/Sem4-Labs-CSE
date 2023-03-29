set serveroutput on
DECLARE
i number := 1;
    roll_no StudentTable.rollNo%TYPE;
    score StudentTable.gpa%TYPE;
    highest StudentTable.gpa%TYPE;
BEGIN
    roll_no := 1;
select gpa into highest from StudentTable where rollNo=roll_no;
FOR i IN 1..5 LOOP
select gpa into score from StudentTable where rollNo=roll_no;
IF score>highest THEN
    highest:=score;
END IF;
roll_no := roll_no + 1;
END LOOP;
dbms_output.put_line('Max grade : ' || highest);
END;
/
