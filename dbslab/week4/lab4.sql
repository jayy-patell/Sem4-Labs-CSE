1.) Select dept_name,count(distinct ID) from student group by dept_name;

2.) Select dept_name,count(distinct ID) from (student natural join takes) group by dept_name having count(distinct id) > 10;

3.) Select dept_name,count(distinct course_id) from course group by dept_name;

4.) Select dept_name,avg(salary) from instructor group by dept_name having avg(salary) > 42000;

5.) Select sec_id,count(distinct ID) from (takes natural join section) where semester='Spring' and year=2009 group by sec_id;

6.) Select course_id,prereq_id from prereq order by course_id; 

7.) Select name,salary from instructor order by salary desc ;

8.) Select max(total_salary) from (Select sum(salary) as total_salary from instructor group by dept_name);

9.) Select dept_name,avg(salary) from (Select dept_name, avg(salary) as avg_salary from instructor group by dept_name) where avg_salary>42000; 

10.) Select max(total_student) from (Select count(distinct ID) as total_student from takes group by sec_id, semester, year having semester='Spring' and year=2010);

11.) Select distinct t.Name from Instructor t, teaches s, takes m, student n where t.id=s.id and s.course_id=m.course_id and m.id = n.id and n.dept_name = 'Comp. Sci';

12.) Select dept_name, avg(inst_salary) From instructor group by dept_name having avg(inst_salary)>50000 and count(id)>5;

13.) With max_budget(value) as (Select max(budget) from department) Select budget from department, max_budget where department.budget=max_budget.value;

14.) 

With dept_total(dept_name,value) as (Select dept_name,sum(salary) from instructor group by dept_name),dept_total_average(value) as (Select avg(value) from dept_total) Select dept_name from dept_total, dept_total_average >= dept_total_avg.value;

15.) With max_enroll(value) as(Select max(count(id)) From takes group by sec_id, year, semester having year=2009 and semester ='Fall') enrollment(sec_id, value) as (select sec_id, count(id) from takes group by sec_id, year, semester having year=2009 and semester='Fall') Select sec_id from enrollment.value;


16.) 

17.) Delete from instructor where dept_name = 'Finance';

18.) Delete from course where dept_name='Comp. Sci.';

19.) 

Update student 
set dept_name ='IT';
Where dept_name = 'Comp. Sci';

20.) 

Update instructor
set salary=case
when salary<=100000 then salary*1.05
else salary*1.03
end

(OR)

Update instructor set salary=salary*1.03 where salary>100000;
Update instructor set salary=salary*1.03 where salary<=100000;

21.) 

Insert into student 
Select ID,name,dept_name,0 from instructor;

22.) Delete from instructor where salary < (Select avg(salary) from instructor);






mera wala start hua.. swagat nahi karoge humara
SQL> select course_id, count(distinct ID) from takes group by course_id;

COURSE_I COUNT(DISTINCTID)
-------- -----------------
FIN-201                  1
CS-190                   2
MU-199                   1
CS-101                   6
HIS-351                  1
CS-319                   2
CS-347                   2
PHY-101                  1
EE-181                   1
CS-315                   2
BIO-101                  1

COURSE_I COUNT(DISTINCTID)
-------- -----------------
BIO-301                  1

SQL> Select dept_name,count(distinct ID) from (student natural join takes) group by dept_name having count(distinct id) > 3;

DEPT_NAME            COUNT(DISTINCTID)
-------------------- -----------------
Comp. Sci.                           4

SQL> Select dept_name,count(distinct course_id) from course group by dept_name;

DEPT_NAME            COUNT(DISTINCTCOURSE_ID)
-------------------- ------------------------
Comp. Sci.                                  5
Biology                                     3
History                                     1
Elec. Eng.                                  1
Finance                                     1
Music                                       1
Physics                                     1

SQL> Select dept_name,avg(salary) from instructor group by dept_name having avg(salary) > 42000;

DEPT_NAME            AVG(SALARY)
-------------------- -----------
Comp. Sci.            77333.3333
Biology                    72000
History                    61000
Finance                    85000
Elec. Eng.                 80000
Physics                    91000

SQL> Select sec_id,course_id,semester,year,count(distinct course_id) from section where semester='Spring' and year=2009 group by sec_id,course_id,semester,year;

SEC_ID   COURSE_I SEMEST       YEAR COUNT(DISTINCTCOURSE_ID)
-------- -------- ------ ---------- ------------------------
2        CS-190   Spring       2009                        1
1        CS-190   Spring       2009                        1
1        EE-181   Spring       2009                        1

SQL> Select course_id,prereq_id from prereq order by course_id;

COURSE_I PREREQ_I
-------- --------
BIO-301  BIO-101
BIO-399  BIO-101
CS-190   CS-101
CS-315   CS-101
CS-319   CS-101
CS-347   CS-101
EE-181   PHY-101


SQL> Select name,salary from instructor order by salary desc ;

NAME                     SALARY
-------------------- ----------
Einstein                  95000
Brandt                    92000
Wu                        90000
Gold                      87000
Kim                       80000
Singh                     80000
Katz                      75000
Crick                     72000
Srinivasan                65000
Califieri                 62000
El Said                   60000

NAME                     SALARY
-------------------- ----------
Mozart                    40000

SQL> Select max(total_salary) from (Select dept_name,sum(salary) as total_salary from instructor group by dept_name);

MAX(TOTAL_SALARY)
-----------------
           232000

SQL> Select dept_name,max(total_salary) from (Select dept_name,sum(salary) as total_salary from instructor group by dept_name) group by dept_name;

DEPT_NAME            MAX(TOTAL_SALARY)
-------------------- -----------------
Comp. Sci.                      232000
Biology                          72000
History                         122000
Finance                         170000
Elec. Eng.                       80000
Music                            40000
Physics                         182000

SQL> Select dept_name,avg_salary from (Select dept_name, avg(salary) as avg_salary from instructor group by dept_name) where avg_salary>42000;

DEPT_NAME            AVG_SALARY
-------------------- ----------
Comp. Sci.           77333.3333
Biology                   72000
History                   61000
Finance                   85000
Elec. Eng.                80000
Physics                   91000


10.


11.
SQL> Select distinct t.Name from Instructor t, teaches s, takes m, student n where t.id=s.id and s.course_id=m.course_id and m.id = n.id and n.dept_name = 'Music';

NAME
--------------------
Mozart

12.
SQL> select dept_name,total,average_salary from (select dept_name, count(*) as total,avg(salary) as average_salary from instructor group by dept_name having count(id)>2 and avg(salary)>5000);

DEPT_NAME                 TOTAL AVERAGE_SALARY
-------------------- ---------- --------------
Comp. Sci.                    3     77333.3333

13.
SQL> with budg(val) as (select max(budget) from department)
  2  select dept_name,budget from budg,department where budg.val=department.budget;

DEPT_NAME                BUDGET
-------------------- ----------
Finance                  120000

14.
SQL> with tot(dept_name,total) as (select dept_name,sum(salary) as tot from instructor group by dept_name), averg(val) as (select avg(total) from tot)
  2  select dept_name, total from tot, averg where total>val;

DEPT_NAME                 TOTAL
-------------------- ----------
Finance                  170000
Physics                  182000
Comp. Sci.               232000

15.
SQL> WITH S(SEC_ID, TOTAL) AS (SELECT SEC_ID, COUNT(DISTINCT ID) AS TOTAL FROM TAKES WHERE SEMESTER = 'Fall' AND YEAR=2009 GROUP BY SEC_ID) 
		SELECT S.SEC_ID, S.TOTAL FROM S WHERE S.TOTAL = (SELECT MAX(TOTAL) FROM S);

SEC_ID        TOTAL
-------- ----------
1                 7

