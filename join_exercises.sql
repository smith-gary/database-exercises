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

select concat(r.name, ' ', count(*)) as number_of_user_roles
from users
join roles r on users.role_id = r.id
group by role_id;



