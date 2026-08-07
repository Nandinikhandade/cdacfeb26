use northwind;
show tables;
-- Q1. From customers, find all customers whose company name starts with 'A'.
select * from customers;
select * from customers where company like'A%';

-- Q2. From products, find all products whose product_name contains the word 'sauce' anywhere. (case insensitive in MySQL)
select * from products;
select * from products where product_name like '%sauce%';

-- Q3. From customers, find all customers whose last_name ends with 'n'.
select * from customers;
select * from customers where last_name like '%n';

-- Q4. From products, find all products whose product_name starts with 'Ch'.
select * from products where product_name like 'Ch%';

-- Q5. From customers, find customers whose city contains 'on' anywhere in the name.
select * from customers where city like '%on%';

-- Q6. From orders, find all orders where ship_name starts with 'A' and ends with 's'.
select * from orders where ship_name like 'A%s';
select * from orders;

-- Q7. From products, find all products whose product_code starts with 'N'. Display product_code and product_name.
select product_code,product_name from products where product_code like 'N%';

-- Q8. From customers, find all customers whose email_address ends with '.com'.
select * from customers where email_address like '%.com';

-- Q9. From products, find all products whose category contains 'beverages' OR product_name contains 'tea'. Use both conditions with OR.
select * from products where category like 'beverages' or 'tea';

-- Q10. From customers, find customers whose first_name is exactly 5 characters long. (Hint — use five underscores)
select * from customers where first_name like '_____';

-- Q11. From orders, find orders where payment_type contains 'credit' — display order id, customer id, payment type.
select * from orders;
select id, customer_id, payment_type from orders where payment_type like 'credit%';

-- Q12. From suppliers, find all suppliers whose company name contains either 'co' or 'Corp' anywhere. Use two LIKE conditions with OR.
select * from suppliers;
select * from suppliers where company like '%co%' or '%Crop%';

-- Q13. From customers, find customers where country_region starts with 'U' — display name, city, country.
select * from customers;
select concat(first_name,' ',last_name)as name,city from customers where country_region like 'U%';

-- Q14. From products, find products whose description is NOT NULL and contains the word 'organic'. (Hint — use IS NOT NULL AND LIKE together)
select * from products where description is not null and description like 'organic';

-- Q15. From customers, find customers whose last_name has exactly 4 characters and ends with 'y'.
select * from customers;
select * from customers where last_name like '___y';

-- Q16. From orders, find all orders where notes contains a phone number pattern — meaning notes contain at least one digit sequence. (Hint — LIKE '%[0-9]%' or use REGEXP '[0-9]')
select * from orders ; -- has no field containing phone no 
select * from customers ;
select * from customers where business_phone regexp '[0-9]';

-- Q17. From products, find all products where:
-- product_name starts with any letter from A to D AND
-- list_price > 20 AND
-- discontinued = 0
-- Display product name, list price, category. (Hint — use REGEXP '^[A-Da-d]' or multiple LIKE conditions)
select * from products where product_name regexp '^[A-Da-d]' and list_price > 20 and discontinued=0;

-- Q18. From employees, find all employees whose FIRST_NAME starts with 'A'.
select * from employees;
select * from employees where first_name like 'A%';
select * from employees where first_name regexp '^[Aa]';

-- Q19. From employees, find all employees whose LAST_NAME ends with 'n'.
select * from employees;
select * from employees where last_name like '%n';

-- Q20. From jobs, find all jobs whose JOB_TITLE contains the word 'Manager'.
show tables;
select * from hr.jobs;
select * from hr.jobs where JOB_TITLE like '%Manager%';

-- Q21. From employees, find employees whose EMAIL starts with 'S'.
select * from employees;
select * from employees where email_address like 's%';

-- Q22. From departments, find all departments whose DEPARTMENT_NAME contains 'IT'.
select * from hr.departments;
select * from hr.departments where DEPARTMENT_NAME like '%IT%';

-- Q23. From employees, find employees whose PHONE_NUMBER starts with '515'.
select * from hr.employees;
select * from hr.employees where PHONE_NUMBER like '515%';

-- Q24. From locations, find all locations whose CITY starts with 'S'.
select * from hr.locations;
select * from hr.locations where city regexp '^[Ss]';

-- Q25. From employees, find employees whose FIRST_NAME has exactly 4 characters. (Hint — four underscores)
select * from employees where first_name like '____';

-- Q26. From jobs, find all jobs whose JOB_ID starts with 'IT' or starts with 'FI'. Use two LIKE conditions.
select * from hr.jobs;
select * from hr.jobs where JOB_ID like 'IT' or JOB_ID like 'FI';

-- Q27. From employees, find employees whose LAST_NAME contains 'an' anywhere.
select * from employees where last_name like '%an%';

-- Q28. From locations, find all locations where STREET_ADDRESS contains a number at the start. (Hint — LIKE '[0-9]%' or REGEXP '^[0-9]')
select * from hr.locations;
select * from hr.locations where STREET_ADDRESS regexp '^[0-9]';

-- Q29. From employees, find employees whose JOB_ID ends with 'MGR' or 'MAN'. (managers and senior roles)
select * from hr.employees;
select * from hr.employees where JOB_ID like '%MGR%' or JOB_ID like '%MAN%' ;

-- Q30. From countries, find all countries whose COUNTRY_NAME contains 'ia' anywhere — display country name and region id.
select * from hr.countries;
select COUNTRY_NAME,REGION_ID from hr.countries where COUNTRY_NAME like '%ia%';

-- Q31. From employees, find employees where FIRST_NAME starts with 'A' AND LAST_NAME starts with 'K' — display full name, department, salary.
select * from hr1.employees;
select concat(first_name,' ',last_name)as name,department_id,salary from hr1.employees where first_name like 'A%' and last_name like 'K%';

-- Q32. From employees, find employees whose FIRST_NAME is exactly 5 characters and the 3rd character is 'l'. (Hint — _ _ l _ _)
select * from employees where first_name like '__l__';

-- Q33. From jobs, find jobs where JOB_TITLE contains either 'Representative' or 'Assistant' — display job title, min salary, max salary.
select * from hr.jobs;
select job_title, min_salary, max_salary from hr.jobs where JOB_TITLE like '%Representative%' or JOB_TITLE like '%Assistant%' ;

-- Q34. From employees, find employees whose EMAIL contains their LAST_NAME — meaning the email starts with the first letter of the last name. (Hint — use LIKE with CONCAT and SUBSTR)
select * from employees;
select * from employees where email_address like concat(substr(last_name,1,1),'%');

-- Q35. From locations, find locations where STATE_PROVINCE is NOT NULL, NOT empty, and contains at least one space in it. (Hint — LIKE '% %')
select * from hr.locations;
select * from hr.locations where STATE_PROVINCE is not null and STATE_PROVINCE like '% %';

-- Q36. From employees, find all employees whose phone number follows the pattern '515..__' — meaning starts with 515, then dot, then any 3 digits, then dot, then any digits. 
-- Use LIKE with underscores to match the pattern.
select * from hr.employees;
select * from hr.employees where PHONE_NUMBER like '515.___.%';

-- Q37. From employees, find how many employees exist per department whose FIRST_NAME starts with any vowel (A, E, I, O, U). Use multiple LIKE with OR.
select * from hr.employees;
select DEPARTMENT_ID,count(*)as no_of_emp from hr.employees where FIRST_NAME regexp '^[aeiou]' group by DEPARTMENT_ID;

-- Q38. From products, count how many products per category have names containing 'e' anywhere. Show only categories with more than 2 such products.
select * from products;
select category,count(*)as total from products where category like '%e%' group by category having total > 2;

-- Q39. From employees, find departments where more than 2 employees have a JOB_ID ending with 'CLERK'. Show department id and count.
select * from hr.employees;
select DEPARTMENT_ID,count(*)as total_emp from hr.employees where job_id like '%CLERK%' group by DEPARTMENT_ID having total_emp > 2;

-- Q40. From customers, count how many customers per country_region have an email ending with '.com'. Show only countries with at least 2 such customers.
select * from customers;
select country_region,count(*)as total_cust from customers where email_address like '%.com' group by country_region having total_cust>=2;
