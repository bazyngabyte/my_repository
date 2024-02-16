create database HR;
use HR;
CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
 CREATE TABLE JOBS (
                            JOB_ID CHAR(9) NOT NULL,
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_ID));
                            
create table LOCATIONS (
LOC_ID char(9) NOT NULL,
DEP_ID_LOC CHAR(9) NOT NULL,
PRIMARY KEY (LOC_ID));
                            
CREATE TABLE DEPARTMENTS (
                            DEP_ID CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEP_ID),
                            foreign key (LOC_ID) references LOCATIONS(LOC_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMP_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOB_ID CHAR(9) NOT NULL,
                            DEP_ID CHAR(9),
                            PRIMARY KEY (EMP_ID,JOB_ID),
                            foreign key (EMP_ID) references employees(EMP_ID),
                            foreign key (JOB_ID) references JOBS(JOB_ID),
                            FOREIGN KEY (DEP_ID) REFERENCES DEPARTMENTS(DEP_ID));