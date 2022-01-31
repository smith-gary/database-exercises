use employees;

select *
from employees
where first_name in ('irena', 'vidya', 'maya')
order by first_name, emp_no desc;

select first_name, last_name
from employees
where first_name in ('irena', 'vidya', 'maya')
order by first_name asc, last_name asc;

select first_name, last_name
from employees
where first_name in ('irena', 'vidya', 'maya')
order by last_name asc, first_name asc;

select last_name, emp_no
from employees
where last_name like ('e%')
order by emp_no desc;

select last_name, emp_no
from employees
where last_name like ('e%')
   or last_name like ('%e')
    order by emp_no desc;

select last_name, emp_no
from employees
where last_name like ('e%')
  and last_name like ('%e')
    order by emp_no desc;

select last_name, emp_no
from employees
where last_name like ('e%')
order by emp_no asc;

select last_name, emp_no
from employees
where last_name like ('e%')
   or last_name like ('%e')
    order by emp_no asc;

select last_name, emp_no
from employees
where last_name like ('e%')
  and last_name like ('%e')
    order by emp_no asc;

