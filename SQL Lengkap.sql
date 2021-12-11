--Select
SELECT *
FROM payment

--select distinct
SELECT 
	DISTINCT (rental_rate)
FROM film

SELECT 
	DISTINCT (rating)
FROM film

--count
SELECT 
	COUNT(DISTINCT (title))
FROM film --jadi ada 1000 title di dalam film

SELECT 
	COUNT(DISTINCT (title))
FROM film --jadi ada 1000 title di dalam film

SELECT
	COUNT(DISTINCT(amount))
FROM payment

--where
SELECT *
FROM film
WHERE 
	rental_rate > 4 AND 
	replacement_cost >= 19.99 AND
	rating = 'R'

SELECT COUNT (*)
FROM film
WHERE 
	rental_rate > 4 AND 
	replacement_cost >= 19.99 AND
	rating = 'R'

--where challenge 1
SELECT email
FROM customer
WHERE 
	first_name ILIKE '%nancy%' AND
	last_name ILIKE '%thomas%'

--where challenge 2
SELECT 
	title, 
	description
FROM film
WHERE title ILIKE '%outlaw hanky%'

--where challenge 3
SELECT 
	address,
	phone
FROM address
WHERE address ILIKE '%259 ipoh drive%'

--order by
SELECT 
	store_id,
	first_name,
	last_name
FROM customer
ORDER BY 1

--limit
SELECT *
FROM payment
WHERE amount != 0
ORDER BY payment_date DESC
LIMIT 5

--order by & limit challenge 1
SELECT *
FROM payment
ORDER BY payment_date ASC
LIMIT 10

--order by & limit challenge 2
SELECT 
	title,
	length
FROM film
ORDER BY length ASC
LIMIT 5

--order by & limit challenge 3
SELECT COUNT (*)
FROM film
WHERE length <= 50

--between
SELECT *
FROM payment
WHERE 
	payment_date BETWEEN '2007-02-01' AND
	'2007-02-15'
	
--in
SELECT *
FROM customer
WHERE 
	first_name IN ('John', 'Jake', 'Julie', 'Sam')

--like n ilike
SELECT *
FROM customer
WHERE 
	first_name ILIKE '%john%'

SELECT *
FROM customer
WHERE 
	first_name LIKE 'John'

--GENERAL CHALLENGE 1
SELECT *
FROM payment

SELECT *
FROM payment
WHERE amount > 5
ORDER BY amount ASC

--GENERAL CHALLENGE 2
SELECT COUNT(*)
FROM actor
WHERE first_name ILIKE 'p%'

--GENERAL CHALLENGE 3
SELECT COUNT(DISTINCT(district))
FROM address

--GENERAL CHALLENGE 4
SELECT DISTINCT (district)
FROM address

--GROUP BY
SELECT 
	customer_id, 
	SUM(amount)
FROM payment
GROUP BY 1
ORDER BY SUM(amount) DESC
LIMIT 10

--CHALLENGE GROUP BY 1
SELECT 
	staff_id,
	COUNT(payment_id)
FROM payment
GROUP BY 1
ORDER BY COUNT(amount) DESC
LIMIT 2

--CHALLENGE GROUP BY 2
SELECT *
FROM film

SELECT 
	rating,
	AVG(replacement_cost)
FROM film
GROUP BY 1
ORDER BY AVG(replacement_cost) DESC

--CHALLENGE GROUP BY 3
SELECT 
	customer_id,
	SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5

--HAVING
SELECT 
	customer_id,
	AVG(amount) AS avg_spent
FROM payment
GROUP BY 1
HAVING AVG(amount) > 5 --jadi posisi having itu sama kaya where tapi dibawah group by
ORDER BY 2

--HAVING CHALLENGE 01
SELECT
	customer_id,
	COUNT(*) AS num_payment
FROM payment
GROUP BY 1
HAVING COUNT(*) >= 40
ORDER BY 2

--HAVING CHALLENGE 02
SELECT
	staff_id,
	customer_id,
	SUM(amount) AS total_spent
FROM payment
GROUP BY staff_id,customer_id
HAVING SUM(amount)>100 AND staff_id=2
ORDER BY SUM(amount) DESC

--IN CLASS EXCERCISE 1
SELECT
	staff_id,
	customer_id,
	SUM(amount) AS total_spent
FROM payment
GROUP BY staff_id,customer_id
HAVING SUM(amount)>=110 AND staff_id=2
ORDER BY SUM(amount) DESC

--IN CLASS EXCERCISE 2
SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%'

--IN CLASS EXCERCISE 3
SELECT 
	first_name,
	last_name,
	customer_id
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1

--INNER JOIN
SELECT 
	payment_id,
	p.customer_id,
	first_name
FROM payment AS p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id --memunculkan customer id yang ada dan sama di payment dan customer

--OUTER JOIN
SELECT *
FROM customer AS c
FULL OUTER JOIN payment as p
ON c.customer_id = p.customer_id

SELECT *
FROM customer AS c
FULL OUTER JOIN payment as p
ON c.customer_id = p.customer_id
WHERE 
	c.customer_id IS null OR
	p.customer_id IS null

--LEFT OUTER JOIN
SELECT 
	f.film_id,
	title,
	inventory_id,
	store_id
FROM film AS f
LEFT OUTER JOIN inventory AS i
	ON f.film_id = i.film_id
WHERE i.film_id IS null

--UNION
SELECT title 
FROM film
UNION
SELECT first_name
FROM customer

--JOIN CHALLENGE 1
SELECT 
	first_name,
	last_name,
	email,
	a.district
FROM customer AS c
FULL OUTER JOIN address AS a
ON c.address_id = a.address_id
WHERE a.district ILIKE '%california%'

--JOIN CHALLENGE 2
SELECT 
	f.title, 
	first_name, 
	last_name
FROM actor AS a
LEFT OUTER JOIN film_actor AS fa
	ON a.actor_id=fa.actor_id
LEFT OUTER JOIN film AS f
	ON fa.film_id = f.film_id
WHERE 
	first_name ILIKE '%nick%' AND
	last_name ILIKE '%wahlberg%'

