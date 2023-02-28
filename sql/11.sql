/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT(a.first_name || ' '|| a.last_name) as "Actor Name"
FROM (
SELECT * from film
CROSS JOIN UNNEST(special_features) as special) f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a on a.actor_id = fa.actor_id
WHERE special = 'Trailers'
ORDER BY "Actor Name";
