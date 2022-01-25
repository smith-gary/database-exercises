use codeup_test_db;

select 'Albums after 91' as 'After 91';
delete from albums where release_date > 1991;

select 'Albums of genre disco' as 'Disco Baby';
delete from albums where genre = 'disco';


select 'Whitney Houstons Albums' as 'Whitney Houston';
delete from albums where artist = 'Whitney Houston';