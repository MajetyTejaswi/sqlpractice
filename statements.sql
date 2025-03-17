select count(author_fname) from tejaswi_app.books b ;

select count (distinct author_fname) from tejaswi_app.books b ;

select count(title) from tejaswi_app.books b 
where title ilike '%the%';

select  author_lname from tejaswi_app.books b 
group by author_lname ;

select author_lname, count(*) as bookswritten from tejaswi_app.books b 
group by author_lname 
order by 1;


select released_year, count(released_year) from tejaswi_app.books b 
group by released_year;

select released_year from tejaswi_app.books b 
order by 1 limit 1;

select min(released_year) from tejaswi_app.books b ;

select  pages, title from tejaswi_app.books b 
order by pages desc limit 1 ;

select title, pages from tejaswi_app.books b 
where pages=(select min(pages) from  tejaswi_app.books b);

select released_year from tejaswi_app.books b 
order by 1 desc limit 1;

select title, released_year from tejaswi_app.books b 
where released_year=(select max(released_year) from tejaswi_app.books b );

select author_lname,sum(pages) from tejaswi_app.books b
group by author_lname;

select author_lname,count(*) from tejaswi_app.books b 
group by author_lname;

select b.released_year, avg(stock_quantity), count(*) from tejaswi_app.books b 
group by b.released_year;
 

select count(*) from tejaswi_app.books b ;

select released_year, count(released_year) from tejaswi_app.books b 
group by released_year;

select sum(stock_quantity) from tejaswi_app.books b ;

select concat(author_fname, author_lname),avg(released_year)
 from tejaswi_app.books b 
group by author_fname, author_lname;

select concat(author_fname, author_lname), pages from tejaswi_app.books b 
order by pages desc
limit 1;

select concat(author_lname, author_fname), pages from tejaswi_app.books 
where pages=(select max(pages) from tejaswi_app.books);


select released_year, count(*), avg(pages) from tejaswi_app.books b 
group by released_year
order by b.released_year ;



SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'tejaswi_app' AND table_name = 'books';


select distinct author_lname from tejaswi_app.books b ;

select distinct concat(author_fname,'',author_lname) from tejaswi_app.books b ;

select book_id, author_fname, author_lname from tejaswi_app.books b 
order by  author_lname ASC ;

select title, pages, released_year  from tejaswi_app.books b 
order by 2;

select released_year from tejaswi_app.books b ;

select book_id, author_fname, author_lname, released_year from tejaswi_app.books b 
order by 3 desc, released_year desc
limit 2 offset 5;

select title   from tejaswi_app.books b
where title ilike '%co%';

select author_fname from tejaswi_app.books b 
where b.author_fname LIKE '%';
select author_fname from tejaswi_app.books b 
where author_fname ilike 'Da%';

select title from tejaswi_app.books b 
where title ilike '%\%%' escape '\';

SELECT title 
FROM tejaswi_app.books 
WHERE title  ~ ' [[:punct:]] ';

select title from tejaswi_app.books b 
where title ~* '^a';

SELECT title 
FROM tejaswi_app.books 
WHERE title ~* '%';

select title from tejaswi_app.books b 
where title ~* '_';

select title from tejaswi_app.books b 
where title ilike '%stories%';

select title, pages from tejaswi_app.books b 
order by 2 desc limit 1;

select concat(title,'_', released_year) from tejaswi_app.books b 
order by released_year desc limit 3;

select title, author_lname from tejaswi_app.books b 
where author_lname like '% %';
select title, author_lname from tejaswi_app.books b 
where author_lname ~* ' ';

select title, released_year, stock_quantity from tejaswi_app.books b 
order by 3,2 desc limit 3;

select title, author_lname from tejaswi_app.books b 
order by 2,1;

select UPPER(concat('My fav author is ', author_fname , ' ', author_lname,' !')) from tejaswi_app.books b 
order by author_lname;

select substr(title, 1,5) from tejaswi_app.books b ;


