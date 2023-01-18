-- Lab | SQL Queries - Lesson 2.5

USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor WHERE (first_name = 'Scarlett');

-- 2.How many films (movies) are available for rent and how many films have been rented?
SELECT count(distinct(film_id)) FROM film;
SELECT count(return_date) FROM rental;

-- 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT max(length) AS 'max_duration', min(length) AS 'min_duration' FROM film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(AVG(length)*60) FROM film;

-- 5.How many distinct (different) actors' last names are there?
SELECT count(distinct(last_name)) FROM actor;

-- 6.Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date),MIN(rental_date)) FROM rental;

-- 7.Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(CONVERT(left(rental_date,10),date), '%M') AS 'month', weekday(CONVERT(left(rental_date,10),date)) AS 'weekday' FROM rental LIMIT 20;

-- 8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN (weekday(CONVERT(left(rental_date,10),date)) = 5 or weekday(CONVERT(left(rental_date,10),date)) = 6) then 'Weekend'
ELSE 'Workday'
END AS 'day_type'
FROM rental;

-- 9.Get release years.
SELECT distinct(release_year) FROM film;

-- 10.Get all films with ARMAGEDDON in the title.
SELECT * FROM film WHERE (title like '%ARMAGEDDON%');

-- 11.Get all films which title ends with APOLLO.
SELECT * FROM film WHERE (title like '%APOLLO');

-- 12.Get 10 the longest films.
SELECT title, length FROM film ORDER BY length DESC LIMIT 10;

-- 13.How many films include Behind the Scenes content?
SELECT count(special_features like '%Behind the Scenes%') AS 'Behind the Scenes' FROM film;

