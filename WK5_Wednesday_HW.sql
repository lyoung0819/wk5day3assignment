-- WEEK 5: SQL JOINS & SUBQUERIES (WEDNESDAY) HOMEWORK ---

----------------------------------------------------------------------------------------
-- >> 1. List all customers with their address who live in Texas (use JOINs) << 

-- Answer: 
-- Jennifer Davis
-- Kim Cruz
-- Richard Mccrary
-- Bryan Hardison
-- Ian Still

-- Query: 
SELECT c.first_name, c.last_name 
FROM address a
JOIN customer c 
ON a.address_id = c.address_id 
WHERE district = 'Texas';

----------------------------------------------------------------------------------------
-- >> 2. List all payments of more than $7.00 with the customer’s first and last name << 
-- Anwer: 1,406 payments 

-- Query: 
SELECT c.first_name, c.last_name, p.amount 
FROM payment p 
JOIN customer c 
ON p.customer_id = c.customer_id 
WHERE p.amount > 7.00;

----------------------------------------------------------------------------------------
-- >> 3. Show all customer names who have made over $175 in payments (use subqueries) <<

-- Answer: 
-- Rhonda Kennedy
-- Clara Shaw
-- Eleanor Hunt
-- Marion Snyder
-- Tommy Collazo
-- Karl Seal

-- Query: 
SELECT first_name, last_name
FROM customer c  
WHERE customer_id IN(
	SELECT customer_id
	FROM payment p 
	GROUP BY customer_id 
	HAVING SUM(amount) > 175);



----------------------------------------------------------------------------------------
-- >> 4. List all customers that live in Argentina (use multiple joins) << 

-- Answer: 13 customers 

-- Query: 
-- join customer > to address > to city > to country 
SELECT *
FROM customer c 
JOIN address a 
ON a.address_id = c.address_id 
JOIN city ci
ON ci.city_id = a.city_id 
JOIN country c2 
ON c2.country_id = ci.country_id 
WHERE c2.country = 'Argentina';


----------------------------------------------------------------------------------------
-- >> 5. Show all the film categories with their count in descending order <<

-- Answer: 
-- Sports	74
-- Foreign	73
-- Family	69
-- Documentary	68
-- Animation	66
-- Action	64
-- New	63
-- Drama	62
-- Sci-Fi	61
-- Games	61
-- Children	60
-- Comedy	58
-- Travel	57
-- Classics	57
-- Horror	56
-- Music	51

-- Query: 
SELECT fc.category_id, c."name", COUNT(*)
FROM category c 
JOIN film_category fc 
ON fc.category_id = c.category_id 
GROUP BY fc.category_id, c."name" 
ORDER BY COUNT(*) DESC;

----------------------------------------------------------------------------------------
-- >> 6. What film had the most actors in it (show film info)? <<

-- Answer: Lambs Cincinatti

-- Query: 
SELECT f.title, COUNT(*)
FROM film_actor fa
JOIN film f
ON fa.film_id  = f.film_id 
GROUP BY f.title 
ORDER BY COUNT(*) DESC;


----------------------------------------------------------------------------------------
-- >> 7. Which actor has been in the least movies? << 

-- Answer: Emily Dee, 14 movies 

-- Query: 
SELECT a.first_name, a.last_name, COUNT(*)
FROM actor a
JOIN film_actor fa 
ON fa.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY COUNT(*);

----------------------------------------------------------------------------------------
-- >> 8. Which country has the most cities? <<

-- Answer: India

-- Query: 
SELECT co.country_id, co.country, count(*)
FROM city ci
JOIN country co
ON ci.country_id = co.country_id 
GROUP BY co.country_id 
ORDER BY count(*) DESC;


----------------------------------------------------------------------------------------
-- >> 9. List the actors who have been in between 20 and 25 films. <<

-- Answer:

-- Query: 
