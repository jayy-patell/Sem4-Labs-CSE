
/* 3. Write a Pl/Sql block of code that lists the most popular course for each of the departments. 
It should make use of a procedure course_popular which finds the most popular course in the given department. */

CREATE OR REPLACE PROCEDURE course_popular(d_name VARCHAR) IS
    CURSOR C(d course.dept_name%TYPE) IS SELECT course_id FROM course WHERE dept_name = d;
    courseID course.course_id%TYPE;
    m INTEGER;
    counter INTEGER;
BEGIN
    m:= -1;
    FOR I IN C(d_name)
    LOOP
        BEGIN
            SELECT COUNT(*) INTO counter FROM takes GROUP BY course_id HAVING course_id = I.course_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN counter := 0;
        END;
        IF counter > m THEN
            m := counter;
            courseID := I.course_id;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Most popular course of ' || d_name || ' is ' || courseID);
END;
/