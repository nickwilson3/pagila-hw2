/*
 * Management wants to purchase new films that they don't already have.
 * Select a list of all films in the film table that are not in the inventory table.
 *
 * HINT:
 * This can be done by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 */

SELECT title
FROM film
WHERE title NOT IN
(SELECT f.title
FROM film f
INNER JOIN inventory i on f.film_id = i.film_id)
ORDER BY title;

