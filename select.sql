select * from tejaswi_app.users u 
where first_name like '%e';


select * from tejaswi_app.users u;


select * from tejaswi_app.payments p 
where p.payment_method  like '% %';

select concat('my fav card is ', UPPER(payment_method), '!') as yell from payments p
order by yell;

select  p.payment_method, count(payment_method) from payments p
GROUP BY p.payment_method;


select  p.payment_method, count(*) from payments p
GROUP BY p.payment_method;


select u.first_name  from users u
group by first_name
order by u.first_name;

select p.description, p.price,p.stock_quantity  from products p 
order by p.stock_quantity limit 1;

select p.description, p.price,p.stock_quantity  from products p 
where p.stock_quantity =(select min(p.stock_quantity)from products p);

select * from products p
where p.product_name like 'S%';

SELECT product_name, COUNT(*) AS total_products, AVG(price) AS avg_price
FROM tejaswi_app.products
GROUP BY product_name;

select avg(price) from products p ;


select substring('smartphone', 5, 2);






