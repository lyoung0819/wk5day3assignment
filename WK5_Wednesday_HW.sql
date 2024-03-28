-- WEDNESDAY HOMEWORK ---

-- 1. List all customers with their address who live in Texas (use JOINs)

-- Query: 
SELECT *
FROM address a
JOIN customer c 
ON a.address_id = c.address_id 
WHERE district = 'Texas'


-- 2. List all payments of more than $7.00 with the customer’s first and last name
SELECT c.first_name, c.last_name, p.amount 
FROM payment p 
JOIN customer c 
ON p.customer_id = c.customer_id 
WHERE p.amount > 7.00


-- 3. Show all customer names who have made over $175 in payments (use subqueries)

SELECT first_name, last_name
FROM customer c  
WHERE customer_id IN(
	SELECT customer_id
	FROM payment p 
	GROUP BY customer_id 
	HAVING SUM(amount) > 175);



-- 4. List all customers that live in Argentina (use multiple joins)




-- 5. Show all the film categories with their count in descending order
-- 6. What film had the most actors in it (show film info)?
-- 7. Which actor has been in the least movies?
-- 8. Which country has the most cities? INDIA 
	SELECT co.country_id, co.country, count(*)
	FROM city ci
	JOIN country co
	ON ci.country_id = co.country_id 
	GROUP BY co.country_id 
	ORDER BY count(*) DESC;
-- 9. List the actors who have been in between 20 and 25 films.



