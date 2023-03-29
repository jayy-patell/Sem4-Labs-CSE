set serveroutput on
DECLARE
    roll_no StudentTable.rollNo%TYPE;
    score StudentTable.gpa%TYPE;
BEGIN
    roll_no := 1;
while(roll_no<6)
LOOP
IF roll_no > 5 THEN
    EXIT;
END IF;
select gpa into score from StudentTable where rollNo=roll_no;
IF score between 0 and 4 THEN
    update StudentTable set LetterGrade='F' where rollNo=roll_no;
ELSIF score between 4 and 5 THEN
    update StudentTable set LetterGrade='E' where rollNo=roll_no;
ELSIF score between 5 and 6 THEN
    update StudentTable set LetterGrade='D' where rollNo=roll_no;
ELSIF score between 6 and 7 THEN
    update StudentTable set LetterGrade='C' where rollNo=roll_no;
ELSIF score between 7 and 8 THEN
    update StudentTable set LetterGrade='B' where rollNo=roll_no;
ELSIF score between 8 and 9 THEN
    update StudentTable set LetterGrade='A' where rollNo=roll_no;
ELSE
    update StudentTable set LetterGrade='A+' where rollNo=roll_no;
END IF;
roll_no := roll_no + 1;
END LOOP;
END;
/
