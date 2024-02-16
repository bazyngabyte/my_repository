# Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table.

SELECT 
* 
FROM 
hr.EMPLOYEES 
WHERE 
JOB_ID IN (SELECT JOB_ID FROM hr.JOBS);

# Retrieve JOB information for employees earning over $70,000.

SELECT 
JOB_TITLE, MAX_SALARY, JOB_ID
FROM 
hr.JOBS
WHERE 
JOB_ID IN (select JOB_ID from hr.EMPLOYEES where SALARY > 70000 );

# Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table.

SELECT 
*
FROM 
hr.EMPLOYEES, hr.JOBS
WHERE 
hr.EMPLOYEES.JOB_ID = hr.JOBS.JOB_ID;

# Redo the previous query using shorter aliases for table names.

SELECT 
*
FROM 
hr.EMPLOYEES E, hr.JOBS J
WHERE 
E.JOB_ID = J.JOB_ID;

# In the previous query, retrieve only the Employee ID, Name, and Job Title.

SELECT 
EMP_ID,F_NAME,L_NAME, JOB_TITLE
FROM 
hr.EMPLOYEES E, hr.JOBS J
WHERE 
E.JOB_ID = J.JOB_ID;

# Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.

SELECT 
E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
FROM 
hr.EMPLOYEES E, hr.JOBS J
WHERE 
E.JOB_ID = J.JOB_ID;

# Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.

SELECT 
*
FROM hr.EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_ID
                 FROM hr.JOBS
                 WHERE JOB_TITLE= 'Jr. Designer');

# Using Implicit Joins

SELECT 
*
FROM 
hr.EMPLOYEES E, hr.JOBS J
WHERE 
E.JOB_ID = J.JOB_ID AND J.JOB_TITLE= 'Jr. Designer';

# Retrieve JOB information and a list of employees whose birth year is after 1976.

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
                    FROM EMPLOYEES
                    WHERE YEAR(B_DATE)>1976 );

# Using implicit join

SELECT 
J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY, J.JOB_ID
FROM 
hr.JOBS J, hr.EMPLOYEES E
WHERE 
E.JOB_ID = J.JOB_ID AND YEAR(E.B_DATE)>1976;