-- Analysis 
SELECT *
FROM films_project;

-- What is the number of movives each actor has been by genre and there total movies in general?
SELECT fp.stars, category, COUNT(*) AS Num_of_Movies, total_movies
FROM films_project fp
JOIN ( SELECT stars, COUNT(*) AS total_movies
	FROM films_project
	GROUP BY stars
	ORDER BY stars ) AS totmov
		ON fp.stars = totmov.stars
GROUP BY stars, category
ORDER BY stars;

-- What is the average rental rate and replacement_cost by category?
SELECT category, ROUND(AVG(rental_rate), 2) AS avg_rental_rate, ROUND(AVG(replacement_cost), 2) AS avg_replace_cost 
FROM films_project
GROUP BY category;

-- What is the total length an actor has been on the big screen?
SELECT stars, SUM(length) AS total_length 
FROM films_project
GROUP BY stars;

-- Which actor would have the most income?
SELECT stars, ROUND(SUM(rental_rate),2) AS Income 
FROM films_project
GROUP BY stars;

-- How many movies are in each category 
SELECT category, COUNT(*) AS Count_of_Movies
FROM films_project
GROUP BY category;