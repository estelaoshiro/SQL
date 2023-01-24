-- Lab | SQL Subqueries 3.03
 use sakila;
-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id) from inventory
where film_id = (
select film_id from film
where title = 'Hunchback Impossible');

-- 2. List all films whose length is longer than the average of all the films.
select title, length from film
where length > (
select round(avg(length),2) from film);

-- 3. Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor where actor_id in
(select actor_id from film_actor where film_id in
(select film_id from film where title = 'Alone Trip' and title is not null)
);

-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from film where film_id in
(select film_id from film_category where category_id in 
(select category_id from category where name = 'Family')
);

-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
-- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

select email from customer where address_id in(
select address_id from address where city_id in (
select city_id from city where country_id in (
select country_id from country where country = 'Canada'
)
)
);

-- joins
select cus.email from country as c
left join city as ci
on c.country_id = ci.country_id
left join address as a
on ci.city_id = a.city_id
left join customer as cus
on a.address_id = cus.address_id
where c.country ='Canada' and cus.email is not null;

-- 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films.
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
CREATE VIEW prolific_actor AS (
select actor_id, count(film_id) as 'number_films' from film_actor group by actor_id);

select title from film where film_id in (
select film_id from film_actor where actor_id in (
select actor_id from prolific_actor where number_films in (
select max(number_films) from prolific_actor
)
)
);

-- 7. Films rented by most profitable customer. You can use the customer table and payment table to 
-- find the most profitable customer ie the customer that has made the largest sum of payments
CREATE VIEW customer_total_payment AS (
select customer_id, sum(amount) as 'sum_payment' from payment group by customer_id);

select title from film where film_id in (
select film_id from inventory where inventory_id in (
select inventory_id from rental where customer_id in (
select customer_id from customer_total_payment where sum_payment in  
(select max(sum_payment) from customer_total_payment)
)
)
);

-- 8. Customers who spent more than the average payments.
select first_name, last_name from customer where customer_id in (
select distinct(customer_id) from payment where amount >
(select avg(amount) from payment)
);


