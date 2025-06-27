use Grocery_store;
select * from categories;
select * from customers;
select * from employee;
select * from order_details;
select * from orders;
select* from products;
select * from supplier;

--  Which of the following SQL clauses can contain a subquery? 
describe products;
describe supplier;

select *
from products
where sup_id in (
    select sup_id
    from supplier
    where address like '%Madhya Pradesh%'
);

-- What does the following query return?
SELECT emp_id, first_name, last_name 
    FROM employee WHERE salary > (SELECT AVG(salary) FROM employee);
SELECT emp_id, emp_name
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);


select ord_detid, prod_id, quantity, total_price, ord_id,
       (select avg(total_price)
        from order_details
        where ord_id = od.ord_id) as avg_price
from order_details od
where total_price > (
    select avg(total_price)
    from order_details
    where ord_id = od.ord_id
);


SELECT e.emp_id, ed.first_name, ed.last_name
FROM employees e
JOIN employee ed ON e.employee_id = ed.emp_id
WHERE e.salary > (
    SELECT AVG(salary) FROM employee
);

select 
    emp_name,
    substring_index(emp_name, ' ', 1) as first_name, -- extracts the first word as first_name
    trim(substring(emp_name, locate(' ', emp_name) + 1)) as last_name -- extracts everything after the first space as last_name
from employees;