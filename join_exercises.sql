use join_test_db;

CREATE TABLE roles (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE users (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   role_id INT UNSIGNED DEFAULT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
     ('bob', 'bob@example.com', 1),
     ('joe', 'joe@example.com', 2),
     ('sally', 'sally@example.com', 3),
     ('adam', 'adam@example.com', 3),
     ('jane', 'jane@example.com', null),
     ('mike', 'mike@example.com', null);

insert into users(name, email, role_id) values
    ('tom', 'tom@example.com', 2),
    ('richard', 'richard@example.com', 2),
    ('harry', 'harry@example.com', 2),
    ('jim', 'jim@example.com', null);

select concat(u.name, ', ', u.email, ', ', r.name) as user_info
from users as u
join roles r on u.role_id = r.id;

select concat(u.name, ', ', u.email, ', ', r.name) as user_info
from users as u
         left join roles r on u.role_id = r.id;

select concat(u.name, ', ', u.email, ', ', r.name) as user_info
from users as u
         right join roles r on u.role_id = r.id;

select concat(roles.name, ' ', count(*)) as number_of_user_roles
from roles
left join users u on roles.id = u.role_id
group by roles.name;

use employees;

# query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name as Department_Name,
        concat(e.first_name, ' ', e.last_name) as Department_Manager
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
# WHERE de.to_date > curdate()
order by Department_Name;

SELECT d.dept_name as Department_Name,
       concat(e.first_name, ' ', e.last_name) as Department_Manager
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' and e.gender = 'f';

SELECT concat(t.title) as title,
    count(t.emp_no) as Total
FROM titles as t
         JOIN dept_emp as de
              ON t.emp_no = de.emp_no
         JOIN departments as ds
              ON de.dept_no = ds.dept_no
WHERE ds.dept_name in ('Customer Service') and t.to_date in ('9999-01-01') and de.to_date > curdate()
group by title;


SELECT d.dept_name as Department_Name,
       concat(e.first_name, ' ', e.last_name) as Department_Manager,
       s.salary as Salary
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         join departments as d
              ON d.dept_no = de.dept_no
         join salaries s
            on e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01' and de.to_date = '9999-01-01'
order by Department_Name;

# BONUS

CREATE TABLE IF NOT EXISTS emp_manager
(
    dept_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_no),
    FOREIGN KEY (position_id) REFERENCES dept_manager(dept_no)
);

SELECT concat(e.first_name, ' ', e.last_name) as Employee,
       d.dept_name as Department,
       concat(e.first_name, ' ', e.last_name) as Manager
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         join departments as d
                   ON d.dept_no = de.dept_no
         join dept_emp s
              on e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01' and de.to_date = '9999-01-01';
# order by department_manager desc;




