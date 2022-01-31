use employees;

describe employees;
describe salaries;

use codeup_test_db;

alter table albums
add unique (name, artist);

describe albums;

insert into albums (artist, name, release_date, sales, genre)
values ('Michael Jackson', 'Thriller', 1982, 49.2, 'Pop, post-disco, funk, rock');