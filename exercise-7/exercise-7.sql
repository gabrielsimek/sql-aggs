-- customer ranking by total film time watched
-- similar to exercise 6
SELECT
	EXTRACT(YEAR FROM payment_date) AS y,
    EXTRACT(MONTH FROM payment_date) AS m,
    EXTRACT(DAY FROM payment_date) AS d,
    film.rating,
	SUM(payment.amount)
FROM
	payment
INNER JOIN rental ON payment.rental_id = rental.rental_id
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
INNER JOIN film ON film.film_id = inventory.film_id
GROUP BY 
	
    CUBE (y, m, d, rating)


