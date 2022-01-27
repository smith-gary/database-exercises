use employees;

select distinct last_name
from employees
where last_name like ('z%')
order by last_name desc
limit 10;

select emp_no
from salaries
where salary > 1
order by salary desc
limit 5;

select emp_no
from salaries
where salary > 1
order by salary desc
limit 5 offset 45;

