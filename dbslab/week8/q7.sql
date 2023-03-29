set serveroutput on
DECLARE
    g char(2);
    roll_no StudentTable.rollNo%TYPE;
    score StudentTable.gpa%TYPE;
BEGIN
    roll_no := 1;
<<loopbegin>>
select gpa into score from StudentTable where rollNo=roll_no;
IF score between 0 and 4 THEN
    g := 'F';
ELSIF score between 4 and 5 THEN
    g := 'E';
ELSIF score between 5 and 6 THEN
    g := 'D';
ELSIF score between 6 and 7 THEN
    g := 'C';
ELSIF score between 7 and 8 THEN
    g := 'B';
ELSIF score between 8 and 9 THEN
    g := 'A';
ELSE
    g := 'A+';
END IF;
dbms_output.put_line('Roll no : '||roll_no||' Grade : '||g);
roll_no := roll_no + 1;
IF roll_no<6 THEN
    GOTO loopbegin;
END IF;
END;
/
