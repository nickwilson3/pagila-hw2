/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT t.special as special_features, COUNT(t.special)
FROM(SELECT * FROM film
CROSS JOIN UNNEST(special_features) as special) t
GROUP BY t.special
ORDER BY t.special
LIMIT 4;

