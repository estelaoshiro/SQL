-- Lab | SQL Queries - Lesson 2.6
USE sakila;
/* 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name,
you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
hence we would want this in our output list.
*/
select distinct(last_name) from actor;

/* 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include 
the last names of the actors where the last name was present more than once.
*/
select last_name, count(*) 'repeated_name' from actor
group by last_name
having repeated_name > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
select count(rental_id) as rentals, staff_id from rental
group by staff_id;

-- 4. Using the film table, find out how many films were released each year.
select count(film_id) as 'number_film', release_year from film
group by release_year;

-- 5. Using the film table, find out for each rating how many films were there.
select count(film_id) as 'number_film', rental_rate from film
group by rental_rate;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select round(avg(length),2) as 'film_mean_length', rental_rate from film
group by rental_rate;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
select avg(length) as 'mean', rating from film
group by rating
having mean>120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select title, length,
dense_rank() OVER (ORDER BY length asc) as 'Rank_Ranking'
from film
where (length is not null) and (length != 0);

