SQL> @ C:\Users\student\Desktop\dbslab\week2\university.sql

SQL> @ C:\Users\student\Desktop\dbslab\week2\smallRelations.sql

SQL> select name,dept_name from student;

NAME                 DEPT_NAME
-------------------- --------------------
Zhang                Comp. Sci.
Shankar              Comp. Sci.
Brandt               History
Chavez               Finance
Peltier              Physics
Levy                 Physics
Williams             Comp. Sci.
Sanchez              Music
Snow                 Physics
Brown                Comp. Sci.
Aoi                  Elec. Eng.

NAME                 DEPT_NAME
-------------------- --------------------
Bourikas             Elec. Eng.
Tanaka               Biology

13 rows selected.

SQL> select name,id from Instructor where dept_name='Comp. Sci.';

NAME                 ID
-------------------- -----
Srinivasan           10101
Katz                 45565
Brandt               83821

SQL> select title,course_id from Course where credits=3;

TITLE                                              COURSE_I
-------------------------------------------------- --------
Computational Biology                              BIO-399
Robotics                                           CS-315
Image Processing                                   CS-319
Database System Concepts                           CS-347
Intro. to Digital Systems                          EE-181
Investment Banking                                 FIN-201
World History                                      HIS-351
Music Video Production                             MU-199

SQL> select course_id,title from Takes natural join Course where id=12345;

COURSE_I TITLE
-------- --------------------------------------------------
CS-101   Intro. to Computer Science
CS-190   Game Design
CS-315   Robotics
CS-347   Database System Concepts

SQL> select id,name,salary from Instructor where salary>=40000 and salary<=90000;

ID    NAME                     SALARY
----- -------------------- ----------
10101 Srinivasan                65000
12121 Wu                        90000
15151 Mozart                    40000
32343 El Said                   60000
33456 Gold                      87000
45565 Katz                      75000
58583 Califieri                 62000
76543 Singh                     80000
76766 Crick                     72000
98345 Kim                       80000

/* 12. For the student with ID 12345 (or any other value), show all course-id and title of all
courses registered for by the student. */

SELECT course_id,title FROM course WHERE course_id IN (SELECT course_id FROM takes WHERE ID = 12345);

-- 13. List all the instructors whose salary is in between 40000 and 90000. -- 

SELECT * FROM instructor WHERE salary > 40000 AND salary < 90000;

-- 14. Display the IDs of all instructors who have never taught a course. -- 

SELECT ID FROM instructor WHERE ID NOT IN (SELECT ID FROM teaches);

15.) Select name, title, takes.year FROM student, section, course, takes WHERE 
	(room_number=3128 and course.course_id = section.course_id and course.course_id = takes.course_id and takes.id = student.id and takes.year = section.year and takes.sec_id = section.sec_id and section.semester = takes.semester);

16.) Select name,course_id,title as c_name from (student natural join takes) join course using(course_id) join student using (id) where year=2010 ;

17.) Select distinct T.name from instructor as T, instructor as S where T.salary > S.salary and S.dept_name='Comp. Sci. ';

-- 18. Find the names of all instructors whose department name includes the substring ‘ic’. --

SELECT name FROM instructor WHERE dept_name LIKE '%ic%';

-- 19. List the student names along with the length of the student names. --

SELECT name, LENGTH(name) AS length FROM student;

-- 20. List the department names and 3 characters from 3rd position of each department name --

SELECT dept_name, SUBSTR(dept_name,3,3) AS SUBSTRING FROM department;

-- 21. List the instructor names in upper case. --

SELECT UPPER(name) FROM instructor;

-- 22. Replace NULL with value1(say 0) for a column in any of the table --

SELECT ID, NVL(grade,'No-grade') FROM takes WHERE year=2010;

-- 23. Display the salary and salary/3 rounded to nearest hundred from Instructor. --

SELECT salary, ROUND(salary/3,-2) AS salaryby3 FROM instructor;

24.)
Select emp_name, to_char(DOB,'DD-MON-YYYY') from employee;
Select emp_name, to_char(DOB,'DD-MON-YY') from employee;
Select emp_name, to_char(DOB,'DD-MM-YY') from employee;

25.)
Select emp_name,dob from EMPLOYEE;
Select emp_name, TO_CHAR(DOB, 'YYYY') from EMPLOYEE;


26.) Select emp_name, TO_CHAR(DOB, 'DD') from EMPLOYEE;

27.)  Select emp_name, TO_CHAR(DOB, 'MON') from EMPLOYEE;deop

28.) Select emp_name, LAST_DAY(DOB) from EMPLOYEE;

29.) Select emp_name, DAYNAME(DOB) from EMPLOYEE;

30.) Select Next_day(Add_Months(DOB, 720), 'Saturday') from employee;

31.) Select emp_name from employee where extract(year from dob) = 1998;

32.) Select emp_name from employee where extract(year from dob) between 1997 AND 1999;

33.) Select emp_name from employee where (extract(year from dob)+60) = 2058;