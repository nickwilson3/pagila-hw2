/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title
FROM film
WHERE rating = 'G' AND title IN
(
SELECT title from film
CROSS JOIN UNNEST(special_features) as special
WHERE special = 'Trailers'
)
ORDER BY title;

