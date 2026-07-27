use hr1;
show tables;
-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
select * from departments;
select * from locations;
select * from countries;
select l.location_id,l.street_address,l.city,l.state_province,c.country_name
from departments d
join locations l
on d.location_id=l.location_id
join countries c
on c.country_id=l.country_id;

-- 2. Write a query to find the name (first_name, last name), department ID and name of all the employees
select e.first_name,e.last_name,e.department_id,d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

-- 3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
select e.first_name,e.last_name,e.job_id,e.department_id,d.department_name
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
WHERE l.city = 'London';

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
select e.employee_id,e.last_name as employee_name,e.manager_id,m.last_name as manager_name
from employees e
left join employees m
on e.manager_id = m.employee_id;

-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
select first_name,last_name,hire_date
from employees
where hire_date > (
select hire_date
from employees
where last_name = 'Jones');

-- 6. Write a query to get the department name and number of employees in the department.
select d.department_name,count(e.employee_id) as total_employees
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_name;

-- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
select employee_id,job_id,datediff(end_date, start_date) AS days_worked
from job_history
where department_id = 90;

-- 8. Write a query to display the department ID and name and first name of manager.
select d.department_id,d.department_name,e.first_name as manager_name
from departments d
join employees e
on d.manager_id = e.employee_id;

-- 9. Write a query to display the department name, manager name, and city.
select d.department_name,e.first_name as manager_name,l.city
from departments d
join employees e on d.manager_id = e.employee_id
join locations l on d.location_id = l.location_id;

-- 10. Write a query to display the job title and average salary of employees.
select j.job_title,avg(e.salary) as avg_salary
from employees e
join jobs j on e.job_id = j.job_id
group by j.job_title;

-- 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
select j.job_title,e.first_name,e.last_name,(e.salary - j.min_salary) as salary_difference
from employees e
join jobs j on e.job_id = j.job_id;

-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
select *
from job_history
where employee_id IN (
select employee_id
from employees
where salary > 10000);

-- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
select  d.department_name,e.first_name,e.last_name,e.hire_date,e.salary
from departments d
join employees e
on d.manager_id = e.employee_id
where timestampdiff(year, e.hire_date, curdate()) > 15;