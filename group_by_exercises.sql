use employees;

select distinct title
from titles;

select last_name
from employees
where last_name like ('e%e')
group by last_name
order by last_name;

select first_name, last_name
from employees
where last_name like ('e%e')
group by first_name, last_name
order by last_name;

select count(*), last_name
from employees
where last_name like ('%q%')
  and last_name not like ('%qu%')
group by last_name
order by last_name, count(*) desc;

select count(*), gender
from employees
where first_name in ('irena', 'vidya', 'maya')
group by gender
order by gender, count(*) desc;




