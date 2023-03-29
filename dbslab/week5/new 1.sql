
SQL*Plus: Release 12.1.0.2.0 Production on Wed Mar 1 15:32:32 2023

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: d16@cgorcl
Enter password:
Last Successful login time: Wed Mar 01 2023 14:31:59 +05:30

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production

SQL> @ C:\Users\student\Desktop\LAB5\CompanyChangedForOrclSQL.sql

Table dropped.


Table dropped.


Table dropped.


Table dropped.


Table dropped.


Table dropped.


Table dropped.


Table dropped.


Table dropped.


Table dropped.


Table dropped.

drop table dependent
           *
ERROR at line 1:
ORA-00942: table or view does not exist


drop table works_on
           *
ERROR at line 1:
ORA-00942: table or view does not exist


drop table project
           *
ERROR at line 1:
ORA-00942: table or view does not exist


drop table dept_locations
           *
ERROR at line 1:
ORA-00942: table or view does not exist


drop table department1
           *
ERROR at line 1:
ORA-00942: table or view does not exist



Table dropped.


Table dropped.

drop table dept_locations
           *
ERROR at line 1:
ORA-00942: table or view does not exist



Table created.


Table created.


Table created.


Table created.


Table created.


Table created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


Table altered.


Table altered.


FNAME           M LNAME           SSN       BDATE
--------------- - --------------- --------- ---------
ADDRESS                        S     SALARY SUPER_SSN        DNO
------------------------------ - ---------- --------- ----------
Richard         K Marini          653298653 30-DEC-62
98 Oak Forest, Katy, TX        M      37000 653298653          4

John            B Smith           123456789 09-JAN-65
731 Fondren, Houston, TX       M      30000 333445555          5

Franklin        T Wong            333445555 08-DEC-65
638 Voss, Houston, TX          M      40000 888665555          5


FNAME           M LNAME           SSN       BDATE
--------------- - --------------- --------- ---------
ADDRESS                        S     SALARY SUPER_SSN        DNO
------------------------------ - ---------- --------- ----------
Alicia          J Zelaya          999887777 19-JAN-68
3321 Castle, Spring, TX        F      25000 987654321          4

Jennifer        S Wallace         987654321 20-JUN-41
291 Berry, Bellaire, TX        F      43000 888665555          4

Ramesh          K Narayan         666884444 15-SEP-62
975 Fire Oak, Humble, TX       M      38000 333445555          5


FNAME           M LNAME           SSN       BDATE
--------------- - --------------- --------- ---------
ADDRESS                        S     SALARY SUPER_SSN        DNO
------------------------------ - ---------- --------- ----------
Joyce           A English         453453453 31-JUL-72
5631 Rice, Houston, TX         F      25000 333445555          5

Ahmad           V Jabbar          987987987 29-MAR-69
980 Dallas, Houston, TX        M      25000 987654321          4

James           E Borg            888665555 10-NOV-37
450 Stone, Houston, TX         M      55000                    4


9 rows selected.


DNAME              DNUMBER MGR_SSN   MGR_START
--------------- ---------- --------- ---------
Research                 5 333445555 22-MAY-88
Administration           4 987654321 01-JAN-95
Headquarters             1 888665555 19-JUN-81


   DNUMBER DLOCATION
---------- ---------------
         1 Houston
         4 Stafford
         5 Bellaire
         5 Houston
         5 Sugarland


PNAME              PNUMBER PLOCATION             DNUM
--------------- ---------- --------------- ----------
ProductX                 1  Bellaire                5
ProductY                 2 Sugarland                5
ProductZ                 3 Houston                  5
Computerization         10 Stafford                 4
Reorganization          20 Houston                  1
Newbenefits             30 Starfford                4

6 rows selected.


ESSN             PNO      HOURS
--------- ---------- ----------
123456789          1       32.5
123456789          2        7.5
666884444          3         40
453453453          1         20
453453453          2         20
333445555          2         10
333445555          3         10
333445555         10         10
333445555         20         10
999887777         30         30
999887777         10         10

ESSN             PNO      HOURS
--------- ---------- ----------
987987987         10         35
987987987         30          5
987654321         30         20
987654321         20         15
888665555         20          0

16 rows selected.


ESSN      DEPENDENT_NAME  S BDATE     RELATION
--------- --------------- - --------- --------
333445555 Alice           F 05-APR-86 Daughter
333445555 Theodore        M 25-OCT-83 Son
333445555 Joy             F 03-MAY-58 Spouse
987654321 Abner           M 28-FEB-42 Spouse
123456789 Michael         M 04-JAN-88 Son
123456789 Alice           F 30-DEC-88 Daughter
123456789 Elizabeth       F 05-MAY-67 Spouse

7 rows selected.




SQL> select bdate,address from employee where fname='John' and minit='B' and lname='Smith';

BDATE     ADDRESS
--------- ------------------------------
09-JAN-65 731 Fondren, Houston, TX

SQL> select fname,address from employee, department where dname='Research';

FNAME           ADDRESS
--------------- ------------------------------
Richard         98 Oak Forest, Katy, TX
John            731 Fondren, Houston, TX
Franklin        638 Voss, Houston, TX
Alicia          3321 Castle, Spring, TX
Jennifer        291 Berry, Bellaire, TX
Ramesh          975 Fire Oak, Humble, TX
Joyce           5631 Rice, Houston, TX
Ahmad           980 Dallas, Houston, TX
James           450 Stone, Houston, TX

9 rows selected.

SQL> select lname,minit,fname,dnumber,bdate,address from department natural join project,employee where employee.ssn=mgr_ssn and plocation='Stafford';

LNAME           M FNAME              DNUMBER BDATE
--------------- - --------------- ---------- ---------
ADDRESS
------------------------------
Wong            T Franklin                 5 08-DEC-65
638 Voss, Houston, TX

Wallace         S Jennifer                 4 20-JUN-41
291 Berry, Bellaire, TX

Borg            E James                    1 10-NOV-37

SQL> select distinct (salary),fname from employee;

    SALARY FNAME
---------- ---------------
     30000 John
     25000 Joyce
     25000 Ahmad
     40000 Franklin
     25000 Alicia
     43000 Jennifer
     37000 Richard
     55000 James
     38000 Ramesh
	 


SQL> select e1.fname,e1.lname,e2.fname,e2.lname from employee e1,employee e2 where e1.super_ssn=e2.ssn;

FNAME           LNAME           FNAME           LNAME
--------------- --------------- --------------- ---------------
Richard         Marini          Richard         Marini
John            Smith           Franklin        Wong
Ramesh          Narayan         Franklin        Wong
Joyce           English         Franklin        Wong
Alicia          Zelaya          Jennifer        Wallace
Ahmad           Jabbar          Jennifer        Wallace
Franklin        Wong            James           Borg
Jennifer        Wallace         James           Borg

SQL> select p1.pnumber from project p1,employee e1 where p1.dnum=e1.dno and e1.lname='Smith';

   PNUMBER
----------
         1
         2
         3

SQL> select * from employee where address like '%Houston%';

FNAME           M LNAME           SSN       BDATE
--------------- - --------------- --------- ---------
ADDRESS                        S     SALARY SUPER_SSN        DNO
------------------------------ - ---------- --------- ----------
John            B Smith           123456789 09-JAN-65
731 Fondren, Houston, TX       M      30000 333445555          5

Franklin        T Wong            333445555 08-DEC-65
638 Voss, Houston, TX          M      40000 888665555          5

Joyce           A English         453453453 31-JUL-72
5631 Rice, Houston, TX         F      25000 333445555          5


FNAME           M LNAME           SSN       BDATE
--------------- - --------------- --------- ---------
ADDRESS                        S     SALARY SUPER_SSN        DNO
------------------------------ - ---------- --------- ----------
Ahmad           V Jabbar          987987987 29-MAR-69
980 Dallas, Houston, TX        M      25000 987654321          4

James           E Borg            888665555 10-NOV-37
450 Stone, Houston, TX         M      55000                    4



-- 7. Show the resulting salaries if every employee working on the ‘ProductX’ project is given a 10 percent raise. --

SELECT e.salary * 1.1 AS Salary FROM Employee e, works_on w, Project p 
WHERE p.Pname = 'ProductX' AND w.Pno = p.Pnumber AND w.Essn = e.ssn; 

-- 8. Retrieve all employees in department 5 whose salary is between 30,000 and 40,000. --

SELECT Fname FROM Employee WHERE Dno = 5 AND Salary > 30000 AND Salary < 40000;

/* 9. Retrieve a list of employees and the projects they are working on, ordered by department and,
 within each department, ordered alphabetically by last name, then first name. */

SELECT e.Fname, e.Lname, e.Dno, p.Pname FROM Employee e, Project p, works_on w WHERE w.essn = e.ssn 
AND w.Pno = p.Pnumber ORDER BY Dno, Lname, Fname ASC;

-- 10. Retrieve the names of all employees who do not have supervisors. --

SELECT Fname, Lname FROM Employee WHERE Super_ssn = ssn OR Super_ssn IS NULL;

-- 11. Retrieve the name of each employee who has a dependent with the same first name and is the same sex as the employee. --

SELECT e.Fname FROM Employee e, Dependent d WHERE e.Ssn = d.Essn AND e.sex = d.sex AND e.Fname = d.Dependent_name;
-- (no rows returned. Remove the statement after the last AND for employee's who have a dependent with same gender as employee)

-- 12. Retrieve the names of employees who have no dependents. --

SELECT Fname FROM Employee WHERE Ssn NOT IN (SELECT Essn FROM DEPENDENT);

-- 13. List the names of managers who have at least one dependent. --

SELECT Fname FROM Employee WHERE ssn IN (SELECT Essn FROM Dependent) AND ssn IN (SELECT Mgr_ssn FROM Department);

-- 14. Retrieve the Social Security numbers of all employees who work on project numbers 1, 2, or 3. --

SELECT DISTINCT Ssn FROM Employee WHERE Ssn IN (SELECT Essn FROM works_on WHERE Pno = 1 OR Pno = 2 OR Pno = 3);

-- 15. Find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary. --

SELECT SUM(salary), MAX(salary), MIN(salary), AVG(salary) FROM Employee;

/* 16. Find the sum of the salaries of all employees of the ‘Research’ department, 
as well as the maximum salary, the minimum salary, and the average salary in this department. */

SELECT SUM(salary), MAX(salary), MIN(salary), AVG(salary) FROM Employee WHERE Dno = (SELECT Dnumber FROM Department WHERE Dname = 'Research');

-- 17. For each project, retrieve the project number, the project name, and the number of employees who work on that project. --

WITH w(Pno,Count) AS (SELECT Pno, COUNT(*) FROM works_on GROUP BY Pno)
SELECT w.Pno, Pname, w.Count FROM w, Project WHERE w.Pno = Pnumber;

/* 18. For each project on which more than two employees work, retrieve the project number, 
the project name, and the number of employees who work on the project. */

WITH w(Pno,Count) AS (SELECT Pno, COUNT(*) FROM works_on GROUP BY Pno HAVING COUNT(*) > 2)
SELECT w.Pno, Pname, w.Count FROM w, Project WHERE w.Pno = Pnumber;

/* 19. For each department that has more than two employees, retrieve the department number 
and the number of its employees who are making more than 40,000. */

WITH e(dno,count) AS (SELECT Dno, COUNT(*) FROM Employee WHERE salary > 40000 GROUP BY Dno)
SELECT e.dno, e.count FROM e WHERE e.dno IN (SELECT Dno FROM Employee GROUP BY Dno HAVING COUNT(*) > 2);

