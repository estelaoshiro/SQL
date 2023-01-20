Lab | SQL Join (Part I)
USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select count(f.film_id) as 'number_films', f.category_id, c.name from sakila.film_category as f
left join sakila.category as c
on f.category_id = c.category_id
group by f.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
select sum(p.amount) as 'amount', s.first_name, s.last_name from payment as p
left join staff as s
on p.staff_id = s.staff_id
where p.payment_date like ('2005-08%')
group by p.staff_id;

-- 3. Which actor has appeared in the most films?
select count(f.film_id) as 'number_films', f.actor_id, a.first_name, a.last_name from film_actor as f
left join actor as a
on f.actor_id = a.actor_id
group by f.actor_id
order by number_films desc;

-- 4. Most active customer (the customer that has rented the most number of films)
select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as 'films_rented' from rental as r
left join customer as c
on c.customer_id = r.customer_id
group by c.customer_id
order by films_rented desc;

-- 5. Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address from staff as s
left join address as a
on s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
select f.film_id, f.title, count(fa.actor_id) as 'number_actors' from film as f
left join film_actor as fa
on f.film_id = fa.film_id
group by f.film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select sum(p.amount) as 'amount_paid', p.customer_id, c.first_name, c.last_name from payment as p
left join customer as c
on p.customer_id = c.customer_id
group by p.customer_id
order by c.first_name asc;

-- 8. List number of films per category.
select count(f.film_id) as 'number_films', c.name from film_category as f
left join category as c
on f.category_id = c.category_id
group by f.category_id;
