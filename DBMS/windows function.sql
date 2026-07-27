-- Windows function
-- 1. Find the top 3 highest paid employees in each department using RANK().
use hr1;
with Top_3 as
(SELECT first_name, salary,department_id,
RANK() OVER (PARTITION BY DEPARTMENT_ID order by SALARY DESC) As top
FROM employees)
select * from top_3
where top<=3;

-- 2. Assign a unique row number to each employee within their department using ROW_NUMBER() based on salary descending.

SELECT first_name, employee_id, salary, department_id, 
ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS_rank
FROM employees; 

-- 3. List departments where at least two employees share the same salary rank using DENSE_RANK().

select department_id, employee_id, salary,
dense_rank() OVER (partition by salary ) as_rank
from employees;

-- 4. Divide employees into 4 equal salary groups using NTILE(4) and display the group number along with employee details.
select DEPARTMENT_ID, salary,
ntile(4) over( order by salary desc) as_list
from employees;

-- Aggrigate functions

-- 5. For each employee, show their salary and the average salary of their department using AVG() as a window function.

select employee_id,salary, DEPARTMENT_ID,
AVG(salary) OVER (PARTITION BY DEPARTMENT_ID) as avgg
from employees;

-- 6. Show the running total of salaries for each department ordered by hire date using SUM() window function.
select * from employees;

select salary, hire_date,department_id,
sum(salary) OVER ( ORDER BY hire_date) AS salaries
from 
employees;

select * from employees;

-- 7 .Find the maximum salary in each department and compare it with each employee’s salary.
select EMPLOYEE_ID,salary, department_id, 
MAX(salary) OVER (partition by department_id) AS ab
FROM employees;

 -- 8. For each employee, show their salary and the average salary of their department using AVG() as a window function.

select first_name as employee, salary, department_id,
avg(salary) over( partition by department_id) as avg_salary
from employees;

-- 9. For each employee, show their salary and the salary of the employee hired just before them using LAG().
-- LAG(column_name, offset, default_value) -- picks salalry of back (past) employee
-- OVER (ORDER BY column)

select first_name as employee, salary,
lag(salary) over (order by salary)
from employees;

 -- 10. Display each employee’s salary and the salary of the next hired employee in the same department using LEAD().
 
 -- LEAD(column_name, offset, default_value) -- picks salary of next employee of the department.
--  OVER (PARTITION BY ... ORDER BY ...)

select first_name as employee, salary,department_id,
lead (salary) OVER (partition by department_id order by hire_date) As lead_salary
from employees;

-- 11 List each department and show the first and last hired employee using FIRST_VALUE() and LAST_VALUE() functions.
select first_name as employee, department_id,
first_value(first_name) OVER (partition by department_id ORDER BY hire_date) as first_hired,

last_value (first_name) OVER (partition by department_id ORDER BY hire_date 
rows between unbounded preceding and unbounded following) as last_hired

from employees;

