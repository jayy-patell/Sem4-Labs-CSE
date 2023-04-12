set serveroutput on
DECLARE
    CURSOR C IS SELECT DISTINCT dept_name FROM course;
BEGIN
    FOR I IN C
    LOOP
        course_popular(I.dept_name);
    END LOOP;
END;
/