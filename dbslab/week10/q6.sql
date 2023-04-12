
-- 6. Write a Pl/Sql block of code that lists the highest paid Instructor in each of the Department --

CREATE or REPLACE FUNCTION dept_highest(d_name VARCHAR)
RETURN VARCHAR AS instruct_name VARCHAR(20);
BEGIN
SELECT name into instruct_name FROM instructor natural join(SELECT dept_name, max(salary) as max_sal from instructor group by dept_name) 
where dept_name=d_name and salary=max_sal;
return instruct_name;
END;
/

 

