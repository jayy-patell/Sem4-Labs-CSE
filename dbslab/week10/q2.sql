
/* 2. Write a procedure which takes the dept_name as input parameter and lists all the instructors 
associated with the department as well as list all the courses offered by the department. */

CREATE OR REPLACE PROCEDURE listInst (deptName Instructor.dept_name%type) IS
CURSOR curseInst (deptName Instructor.dept_name%type) IS
SELECT name FROM Instructor WHERE dept_name = deptName;
CURSOR curseCourses (deptName Instructor.dept_name%type) IS
SELECT course_id FROM Course WHERE dept_name = deptName;
BEGIN
    dbms_output.put_line('-- DEPARTMENTs INSTRUCTORS --');
    FOR row IN curseInst (deptName)
    LOOP
        dbms_output.put_line(' '||row.name);
    END LOOP;
    dbms_output.put_line('-- COURSES --');
    FOR row IN curseCourses (deptName) LOOP
        dbms_output.put_line(' ' || row.course_id);
    END LOOP;
END;
/

