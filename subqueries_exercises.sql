use employees;

select employees.first_name, employees.last_name
from employees
where hire_date in (
    select hire_date
    from employees
    where emp_no = '101010'
    );

select titles.title
from titles
where emp_no in (
    select emp_no
    from employees as e
        where first_name in (
            select first_name
            from employees
            where first_name = 'Aamod'
            )
    );

select first_name, last_name
from employees
where emp_no in (
    select emp_no
    from dept_manager
    where to_date in (
        select to_date
        from dept_manager
        where to_date > curdate() and gender in (
            select gender
            from employees
            where gender = 'f'
            )
        )
    );

select employees.first_name, employees.last_name
from employees
where emp_no in (
    select emp_no
    from salaries
    where salary = (select max(salary) from salaries)
    );