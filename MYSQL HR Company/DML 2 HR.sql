# retrieve all employee records whose salary is lower than the average salary

SELECT
*
FROM
hr.employees
WHERE
SALARY<(select avg(salary) from hr.employees);

# Retrieve all employee records with EMP_ID, SALARY, and maximum salary as MAX_SALARY in every row. 

SELECT 
EMP_ID, SALARY, (SELECT MAX(SALARY) FROM hr.EMPLOYEES) AS MAX_SALARY 
FROM hr.EMPLOYEES;

# Extract the first and last names of the oldest employee.

SELECT
F_NAME,L_NAME,B_DATE
FROM
hr.employees
WHERE
B_DATE=(select min(B_DATE) from hr.employees);

# Top 5 earners in the company.

SELECT 
avg(salary)
FROM 
(SELECT SALARY FROM hr.EMPLOYEES ORDER BY SALARY DESC LIMIT 5) AS SALARY_TABLE;