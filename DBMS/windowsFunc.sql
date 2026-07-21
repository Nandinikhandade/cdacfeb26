use northwind2;
show tables;

select * from order_details;  -- unit price
select * from products;  -- products details

-- find all products where unit_price < recorded level
-- show product name, stock, how many units short they have 

select 
    product_name,
    units_in_stock as stock,
    (reorder_level - units_in_stock) as units_short
from products
where units_in_stock < reorder_level;

with product_data as (
	select id,product_name,category,reorder_level
    from products
),
order_quantity as(select unit_price, products_id, quantity from order_details)
select distinct p.id,p.product_name,p.reorder_level,
o.unit_price,o.quantity,(o.quantity-p.reorder_level) as shortage
from ord_quantity o join 
where o.unit_price<p.reorder_level
order by p.id;

-- compute total revenue/ month and then compute each month to previous month, flag the month when the revenue decline
-- group month --sum

select * from employees;

with emp as(
	select employee_id,first_name,
    salary,d.department_id,department_name,job_id,location_id from employees 
    join departments d
    on e.department_id= d.department_id)
select department_id,department_name,location_id from emp;


use hr;
with emp as(
	select employee_id,first_name,
    salary, department_id from employees
)
select (select count(*) as no_of_emp from emp )as no_emp,
(select avg(salary) as avg_sal from emp) as avg_sal,
(select sum(salary) as tol_sal from emp) as sum_sal;



use northwind;
WITH RECURSIVE rec AS (
    -- Start date (min date from orders)
    SELECT MIN(DATE(order_date)) AS dt
    FROM orders

    UNION ALL

    -- Generate next dates
    SELECT dt + INTERVAL 1 DAY
    FROM rec
    WHERE dt < (SELECT MAX(DATE(order_date)) FROM orders)
),

order_day AS (
    SELECT DATE(o.order_date) AS od_da, COUNT(*) AS no_od_od
    FROM order_details od
    join orders o
    on o.id=od.id
    WHERE YEAR(order_date) = 2006
    GROUP BY DATE(order_date)
)

SELECT 
    r.dt,
    DAYNAME(r.dt) AS day_name,
    COALESCE(od.no_od_od, 0) AS total_orders
FROM rec r
LEFT JOIN order_day od 
    ON r.dt = od.od_da
ORDER BY total_orders desc;


-- --------------------------------------------     WINDOWS FUNCITON      ----------------------------------------------------------------------
# WINDOWS AGGREGATE FUNCTION

select employee_id, first_name,department_id,salary,
sum(salary) over(partition by department_id) as_dept 
from employees;

select employee_id, first_name,department_id,salary,
avg(salary) over(partition by department_id) as_dept 
from employees;

select employee_id, first_name,department_id,salary,
min(salary) over(partition by department_id) as_dept 
from employees;

select employee_id, first_name,department_id,salary,
max(salary) over(partition by department_id) as_dept 
from employees;


select employee_id, first_name,department_id,salary,
min(salary) over(order by salary) as_dept 
from employees;


select employee_id, first_name,department_id,salary,
count(*) over(partition by department_id order by salary) as_dept 
from employees;

select employee_id,first_name,department_id,salary,
row_number() over(order by salary) as_row
from employees
limit 5;

select employee_id,first_name,department_id,salary,
row_number() over(partition by department_id) as_row
from employees;


with snd_hi as(
select employee_id,first_name,department_id,salary,
row_number() over(partition by department_id order by salary desc) as_salary
from employees
)
select * from snd_hi where as_salary<=2;



-- where you need to find or lasted joined  employees
-- each dept
with lst_join as(
select employee_id,first_name,department_id,hire_date,
row_number() over(partition by department_id order by hire_date  desc) as_hire
from employees
)
select * from lst_join where as_hire=1;

--  remove employee + department - duplicated

with mid_join as(
select employee_id,first_name,department_id,
row_number() over(partition by department_id order by first_name  desc) as_empname
from employees
)
select * from mid_join where as_empname=1;

with mid_join as(
select employee_id,first_name,department_id,
row_number() over(partition by first_name,department_id ) as_empname
from employees
)
select * from mid_join where as_empname>=2;

-- 	ROW NUMBER , RANK , DENSE RANK------------------------------------------
use hr;
select employee_id,first_name,department_id,salary,
row_number() over (partition by department_id  order by salary desc) 
as_row_num,
rank() over (partition by department_id  order by salary desc)
as_rank,
dense_rank() over(partition by department_id  order by salary desc) 
as_dense_rank
from employees;
-- --------------------------------------------------------------------------
select employee_id,first_name,department_id,salary,
rank() over ( order by salary desc) 
as_rank
from employees
limit 5;

-- to 3 uniques salaries emp
with top_3 as(
select employee_id,first_name,department_id,salary,
rank() over ( order by salary desc) 
as_rank
from employees)
select distinct as_rank, employee_id,first_name,salary from top_3;

-- ---------------------------------------------------------------------------
select employee_id, first_name,salary,
last_value(salary) over(partition by department_id) as_last_value
from employees;

select employee_id, first_name,salary,
first_value(salary) over(partition by department_id) as_first_value
from employees;

-- -----------------------------  LAG ,LEAD ---------------------------------------------

select employee_id, first_name,department_id,salary,
lag(salary) over(order by salary) as_last_value
from employees;

select employee_id, first_name,department_id,salary,
lead(salary) over(order by salary) as_next_value
from employees;

with lag_ex as(
select employee_id, first_name,department_id,salary,
lag(salary) over(order by salary) as_last_emp_sal
from employees
)
select *, (salary - as_last_emp_sal)






