-- Lab | SQL - Lab 3.01

-- Activity 1
use sakila;
-- 1. Drop column picture from staff.
alter table staff
drop column picture;

select * from staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer where first_name = 'TAMMY' and last_name='SANDERS';

insert into staff (staff_id, first_name, last_name, address_id, email, store_id, active, username)
values
(3,'TAMMY','SANDERS', 79,'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy');

select * from staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Use similar method to get inventory_id, film_id, and staff_id.

-- rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update

select * from rental
order by rental_date desc; -- rental_date = 2006-02-14 15:16:03

select * from rental
order by rental_id desc; -- rental_id = 16050

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- customer_id = 130

select film_id from film
where title = 'Academy Dinosaur'; -- film_id = 1

select * from staff
where first_name = 'Mike'; -- staff_id = 1

select * from inventory
where film_id = 1 and store_id =1; -- inventory_id = 1,2,3,4

insert into rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values
(16050, '2006-02-14 15:16:03', 1, 130, '2005-08-30 01:01:12', 1, '2006-02-15 21:30:53');

select * from rental
order by rental_id desc;
