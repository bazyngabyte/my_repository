select
*
from
hr.employees;

# Retrieve the first and last name of all employees who live in Elgin, IL

select
F_NAME,L_NAME,ADDRESS
from
hr.employees
where
ADDRESS like '%Elgin,IL%';

# Identify the employees who were born during the 70s.

select
F_name,L_name,B_date
from
hr.employees
where
B_date like '197%';

# Retrieve all employee records in department 5 where salary is between 60000 and 70000

select
*
from
hr.employees
where
(salary between 60000 and 70000) and DEP_ID='5';

# Retrieve all employees sorted by department

select
F_name,l_name,dep_id
from 
hr.employees
order by
dep_id;

#  For each department ID, retrieve the number of employees in the department.

select
dep_id, count(*) as total
from
hr.employees
group by
DEP_ID;

# For each department, retrieve the number of employees in the department and the average employee salary in the department.

select
dep_id,count(*) total,round(avg(salary),2) avg_salary
from
hr.employees
group by
DEP_ID;

# Sort the result of the previous query by average salary.

select
DEP_ID,count(*) total,round(avg(salary),2) avg_salary
from
hr.employees
group by
dep_id
order by
avg_salary desc;

#  Limit the previous result to departments with fewer than 4 employees

select
dep_id,count(*) total,round(avg(salary),2) avg_salary
from
hr.employees
group by
dep_id
having count(*)<4
order by
avg_salary;