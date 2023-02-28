/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT f.title
FROM film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN rental r on r.inventory_id=i.inventory_id
WHERE r.customer_id = 1
GROUP BY f.title
HAVING COUNT(r.customer_id) > 1
ORDER BY title;
