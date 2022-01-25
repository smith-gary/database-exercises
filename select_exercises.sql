use codeup_test_db;

select 'The name of all albums by Pink Floyd.' as 'Album Names';
select name from albums where artist = 'Pink Floyd';

select 'The year Sgt. Pepper''s Lonely Hearts Club Band was released.' as 'Year Released';
select release_date from albums where name = 'Sgt. Pepper''s Lonely Hearts Club Band';

select 'The genre for Nevermind.' as 'Genre Nevermind';
select genre from albums where name = 'Nevermind';

select 'Which albums were released in the 1990s.' as '90''s Jams';
select name from albums where release_date between 1990 and 2000;

select 'Which albums had less than 20 million certified sales.' as 'Less than 20 mil sold';
select name from albums where sales < 20;

select 'All the albums with a genre of "Rock".' as 'Genre Rock';
select name from albums where genre = 'Rock';
