-- Lab | SQL Join (Part II)
use sakila;
-- 1. Write a query to display for each store its store ID, city, and country.
select s.store_id, a.address, ci.city, c.country from store as s
left join address as a
on s.addrçss_id = a.address_id
left join city as ci
on a.city_id = ci.city_id 
left join country as c
on ci.country_id = c.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.
select  s.store_id, sum(p.amount) as 'amount'from payment as p
left join staff as s
on p.staff_id = s.staff_id
left join store as st
on s.store_id = st.store_id
group by store_id;

-- 3. Which film categories are longest?
select c.name, sum(f.length) as 'sum_duration' from film as f
left join film_category as fc
on f.film_id = fc.film_id
left join category as c
on fc.category_id = c.category_id
group by fc.category_id
order by sum(f.length) desc;

-- 4. Display the most frequently rented movies in descending order.
select f.title, count(r.rental_id) as 'rent_frequency' from rental as r
left join inventory as i
on r.inventory_id = i.inventory_id
left join film as f
on i.film_id = f.film_id
group by f.film_id 
order by count(r.rental_id) desc;

-- 5. List the top five genres in gross revenue in descending order.
select c.name, sum(p.amount) as 'revenue' from payment as p
left join rental as r
on p.rental_id = r.rental_id
left join inventory as i
on r.inventory_id = i.inventory_id
left join film_category as f
on i.film_id = f.film_id
left join category as c
on f.category_id = c.category_id
group by f.category_id
order by sum(p.amount) desc
limit 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
select f.title, i.store_id, r.rental_date, r.return_date from film as f
left join inventory as i
on f.film_id = i.film_id
left join rental as r
on i.inventory_id = r.inventory_id
where f.title = "Academy Dinosaur" and i.store_id =1
order by r.rental_date desc;

-- 7. Get all pairs of actors that worked together.
select f1.film_id, f1.actor_id as 'actor_1', f2.actor_id as 'actor_2' from film_actor as f1
join film_actor as f2
on f1.film_id = f2.film_id
where f1.film_id = f2.film_id and f1.actor_id < f2.actor_id;

-- 8. Get all pairs of customers that have rented the same film more than 3 times.
-- I couldn't do this query
select i.film_id, r1.rental_id, r1.customer_id as 'customer_1', r2.customer_id as 'customer_2' from rental as r1
join rental as r2
on r1.rental_id = r2.rental_id
left join inventory as i
on r1.inventory_id = r2.inventory_id
where r1.customer_id < r2.customer_id;

-- 9. For each film, list actor that has acted in more films.
-- I couldn't do this query
select f.film_id, fa.actor_id from film as f
left join film_actor as fa
on f.film_id = fa.film_id;

select count(film_id) as 'number_films', actor_id from film_actor
group by actor_id
order by count(film_id) desc;


