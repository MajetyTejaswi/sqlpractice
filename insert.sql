CREATE TABLE tejaswi_app.books (
		book_id SERIAL PRIMARY KEY,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT
		
);
INSERT INTO tejaswi_app.books(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
('Where I''m Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


CREATE TABLE tejaswi_app.people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt TIMESTAMP
);

INSERT INTO tejaswi_app.people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO tejaswi_app.people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO tejaswi_app.people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');


INSERT INTO tejaswi_app.people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURRENT_DATE, CURRENT_TIME, NOW());



SELECT CURRENT_DATE;
select current_timestamp;

select birthdate, extract (day from birthdate) from tejaswi_app.people;

select birthdt, TO_char(birthdate, 'dd') from tejaswi_app.people;

select birthtime, extract(hour from birthtime) from tejaswi_app.people;

select birthdate , TO_char(birthdate,'dy') from tejaswi_app.people p ;

select birthdate, age(current_date, birthdate) from tejaswi_app.people p ;

select birthdate, current_date-birthdate from tejaswi_app.people p ;

select birthdate, birthdate + Interval '7day' as revised_day from tejaswi_app.people p ;

select birthdate, birthdate-7 from tejaswi_app.people p ;

select birthtime, birthtime - Interval '10hours'  from tejaswi_app.people p ;

select now();

select to_char(current_date, 'dd');

select to_Char(current_date, 'FMday');

select to_char(current_date, 'dd-mm-yyyy');


select concat(to_char(current_date, 'FMmonth'),' ', 
to_char(current_date, 'ddth'),' at ', 
to_char(current_time::time, 'HH24:MI'));


select title, author_lname from tejaswi_app.books 
where author_lname != 'Gaiman';



select author_lname, author_fname from tejaswi_app.books b where author_fname not like 'J%'
AND author_fname like '%a%';

select title, released_year from tejaswi_app.books b  where released_year>2001
order by released_year;

select title,pages from tejaswi_app.books where char_length(title)>15 and pages >500;

select released_year from tejaswi_app.books b where released_year between 2004 and 2014;

select birthtime from tejaswi_app.people p where birthtime 
between cast('11:31:30' as time) and cast('24 :00:00' as time);

select  title, author_lname from tejaswi_app.books b where author_lname IN('Carver','Lahiri', 'Smith');

select title, released_year from tejaswi_app.books b where released_year %2=1;

select title, released_year, 
case 
	when released_year>2000 then 'modern lit'
	else '19th century list'
end as genre
from tejaswi_app.books b ;

select title, stock_quantity,
case 
	when stock_quantity between 0 and 50 then '*'
	when stock_quantity between 50 and 100 then '**'
	else  '***' 
end as indication
from tejaswi_app.books;


select released_year, count(released_year) from tejaswi_app.books b where released_year <1980
group by released_year;

select title, author_lname, count(author_lname) from tejaswi_app.books b 
where author_lname IN('Eggers', 'Chabon')
group by author_lname,title;

select string_agg(title,' , ') as title, author_lname, count(author_lname) from tejaswi_app.books b 
where author_lname IN('Eggers', 'Chabon')
group by author_lname;

select author_lname from tejaswi_app.books b where author_lname like 'C%' or  author_lname like 'S%';

select title, author_lname ,
case when title like'%Stories%' then 'short stories'
when title='Just Kids' then 'memoir'
else 'novel'
end as type
from tejaswi_app.books b ;

select author_lname, author_fname,  
case when count(*)=1 then '1 book'
else concat(count(*), 'books')
end as count
from tejaswi_app.books b 
group by author_lname, author_fname;












INSERT INTO tejaswi_app.books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

select * from tejaswi_app.books;


select concat(reverse(author_fname), author_fname)from tejaswi_app.books b ;

select pg_column_size(stock_quantity) from tejaswi_app.books b ;

select Char_LENGTH(author_fname) from tejaswi_app.books b ;

select upper(author_fname) from tejaswi_app.books b ;
select repeat(author_fname, 4) from tejaswi_app.books b ;


select TRIM(leading ':' from title) from tejaswi_app.books b ;


select reverse(upper(author_fname)) from tejaswi_app.books b ;

select replace(title,' ','->') from tejaswi_app.books b ;

select author_fname as frowards, reverse(author_fname) as backwards from tejaswi_app.books b ;

select Upper(concat(author_fname, ' ', author_lname)) from tejaswi_app.books b ;

select concat(title,' was released in' , released_year) as blurb from tejaswi_app.books b ;

select concat(left(title,10), '. . .') as shorttitle,
  concat(b.author_fname ,',', b.author_lname) as author,
  concat(stock_quantity,' instock') as quantity
  from tejaswi_app.books b ;



select concat(stock_quantity, 'instock' ) from tejaswi_app.books b 



select concat(author_fname,' ',author_lname ) from tejaswi_app.books b;


select substring(title from length(title) -4 for 3) from tejaswi_app.books b ;

select title from tejaswi_app.books b ;

select title, right(left (title , -6),3) from tejaswi_app.books b ;

select left(title, 15) from tejaswi_app.books b ;


SELECT title, 
       LEFT(RIGHT(title, 4), 3) AS substring_from_end
FROM tejaswi_app.books;

SELECT title, 
       SUBSTRING(title FROM LENGTH(title) - 5 FOR 3) AS substring_from_end
FROM tejaswi_app.books;

SELECT title, RIGHT(LEFT(title, LENGTH(title) - 5), 3) 
FROM tejaswi_app.books b;

select left(title,3) from tejaswi_app.books b ;

select substr(title, 3) from tejaswi_app.books b ;
select substr(title, 3,4) from tejaswi_app.books b ;

select title, concat(left(title,6), '...')as shortcut from tejaswi_app.books b ;

select concat(substring(author_fname,1,1), substr(author_lname,1,1)) from tejaswi_app.books b ;
select left(title,1), right(title,1) from tejaswi_app.books b ;

select substr(title,5,3) from tejaswi_app.books b ;


select author_fname, replace(author_fname, 'J','teju') 
from tejaswi_app.books b 
where title LIKE'%Name%' ;


