use codeup_test_db;

select * from albums;
update albums
set sales = sales * 10
where sales = sales;
-- not needed ^^
select * from albums;

select name from albums where release_date < 1980;
update albums
set release_date = release_date - 100
where release_date < 1980;
select name from albums where release_date < 1980;
select release_date from albums where release_date < 1980;

select name and artist from albums where artist = 'Michael Jackson';
update albums
set artist = 'Peter Jackson'
where artist = 'Michael Jackson';
select artist, name from albums where artist = 'Peter Jackson';
