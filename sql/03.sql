/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT(c.customer_id)
FROM film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN rental r on r.inventory_id=i.inventory_id
INNER JOIN customer c on c.customer_id = r.customer_id
WHERE f.title IN
(SELECT f.title
FROM film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN rental r on r.inventory_id=i.inventory_id
INNER JOIN payment p on p.rental_id = r.rental_id
GROUP BY f.title
ORDER BY SUM(p.amount) DESC
LIMIT 5)
ORDER BY c.customer_id;
