SQL> create table EMPLOYEE(
  2  emp_no number(5),
  3  emp_name varchar(20),
  4  emp_adress varchar(40));

Table created.

SQL> insert into EMPLOYEE values (001,'ravi',' manipal');

1 row created.

SQL> insert into EMPLOYEE values (002,'sujatha','mangalore');

1 row created.

SQL> insert into EMPLOYEE values (003,'arun',' manipal');

1 row created.

SQL> insert into EMPLOYEE values (004,'devika',' mangalore');

1 row created.

SQL> insert into EMPLOYEE values (005,'prashanth',' manipal');

1 row created.

SQL> select * from EMPLOYEE;

    EMP_NO EMP_NAME             EMP_ADRESS
---------- -------------------- ----------------------------------------
         1 ravi                 manipal
         2 sujatha              mangalore
         3 arun                 manipal
         4 devika               mangalore
         5 prashanth            manipal

SQL> select EMP_NAME from EMPLOYEE;

EMP_NAME
--------------------
ravi
sujatha
arun
devika
prashanth


SQL> update EMPLOYEE set EMP_ADRESS='MANIPAL' where EMP_NO <=006;

5 rows updated.

SQL> select * from EMPLOYEE;

    EMP_NO EMP_NAME             EMP_ADRESS
---------- -------------------- ----------------------------------------
         1 ravi                 MANIPAL
         2 sujatha              MANIPAL
         3 arun                 MANIPAL
         4 devika               MANIPAL
         5 prashanth            MANIPAL


SQL> select EMP_NAME from EMPLOYEE where EMP_ADRESS='MANIPAL';

EMP_NAME
--------------------
ravi
arun
prashanth

SQL> alter table EMPLOYEE add(SALARY number(10));

Table altered.

SQL> insert into EMPLOYEE(SALARY,EMP_NO) values(50000,001);

1 row created.

SQL> insert into EMPLOYEE(SALARY,EMP_NO) values(60000,002);

1 row created.

SQL> insert into EMPLOYEE(SALARY,EMP_NO) values(70000,003);

1 row created.

SQL> insert into EMPLOYEE(SALARY,EMP_NO) values(80000,004);

1 row created.

SQL> insert into EMPLOYEE(SALARY,EMP_NO) values(90000,005);

1 row created.

SQL> desc EMPLOYEE;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_NO                                             NUMBER(5)
 EMP_NAME                                           VARCHAR2(20)
 EMP_ADRESS                                         VARCHAR2(40)
 SALARY                                             NUMBER(10)

SQL> delete from EMPLOYEE where EMP_ADRESS='MANGLORE';

2 rows deleted.

SQL> rename EMPLOYEE to EMPLOYEE1;

Table renamed.

SQL> drop table EMPLOYEE1;

Table dropped.