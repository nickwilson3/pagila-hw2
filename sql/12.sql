/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT title
FROM (
SELECT title
FROM film
CROSS JOIN UNNEST(special_features) as special
WHERE special = 'Trailers'
) f1

INNER JOIN

(
SELECT title as title1 from film
CROSS JOIN UNNEST(special_features) AS special
WHERE special = 'Behind the Scenes') f2
ON f1.title = f2.title1
ORDER BY title;
