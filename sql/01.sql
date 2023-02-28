/*
 * Use a subquery to select the film_id and title columns
 * for all films whose rental_rate is greater than the average.
 * Use the film table and order by title.
 *
 * HINT:
 * The postgresqltutorial.com website has a solution for this problem.
 */

SELECT a.film_id, a.title
FROM film a
WHERE a.rental_rate > (SELECT AVG(rental_rate) FROM film)
ORDER By title;
