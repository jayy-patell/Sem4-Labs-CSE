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

