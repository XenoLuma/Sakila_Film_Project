-- Fixing grammer in the title column 
SELECT CONCAT(CONCAT(UPPER(LEFT(SUBSTRING_INDEX(title, ' ', 1), 1)), LOWER(RIGHT(SUBSTRING_INDEX(title, ' ', 1),LENGTH(SUBSTRING_INDEX(title, ' ', 1))-1))), ' ',
CONCAT(UPPER(LEFT(SUBSTRING_INDEX(title, ' ', -1), 1)), LOWER(RIGHT(SUBSTRING_INDEX(title, ' ', -1),LENGTH(SUBSTRING_INDEX(title, ' ', -1))-1))))
FROM film;

UPDATE film 
SET title = CONCAT(CONCAT(UPPER(LEFT(SUBSTRING_INDEX(title, ' ', 1), 1)), LOWER(RIGHT(SUBSTRING_INDEX(title, ' ', 1),LENGTH(SUBSTRING_INDEX(title, ' ', 1))-1))), ' ',
CONCAT(UPPER(LEFT(SUBSTRING_INDEX(title, ' ', -1), 1)), LOWER(RIGHT(SUBSTRING_INDEX(title, ' ', -1),LENGTH(SUBSTRING_INDEX(title, ' ', -1))-1))));

-- Fixing grammar in the first name and last name column in the actors table 
SELECT CONCAT(LEFT(first_name, 1),LOWER(SUBSTRING(first_name, 2))),
CONCAT(LEFT(last_name, 1),LOWER(SUBSTRING(last_name, 2)))
FROM actor;

UPDATE actor
SET first_name = CONCAT(LEFT(first_name, 1),LOWER(SUBSTRING(first_name, 2)));

UPDATE actor
SET last_name = CONCAT(LEFT(last_name, 1),LOWER(SUBSTRING(last_name, 2)));

-- Joining tables to extract what I want

SELECT fil.film_id, title, `name` as category, rating, length, rental_duration, rental_rate, replacement_cost, CONCAT(first_name, ' ', last_name) AS stars
FROM film fil
JOIN film_category filcat
	ON fil.film_id = filcat.film_id
JOIN category cat 
	ON filcat.category_id = cat.category_id
JOIN film_actor filact
	ON fil.film_id = filact.film_id
JOIN actor act 
	ON filact.actor_id = act.actor_id
ORDER BY fil.film_id;



