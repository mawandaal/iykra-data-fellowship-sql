--1
select count(title) from film
where description like '%Astronaut%';

SELECT count(title) FROM film
WHERE fulltext @@ to_tsquery('astronaut')

--2
select count(title) from film
where rating = 'R' and (replacement_cost between 5 and 15);

--3
select staff_id, count(payment_id), sum(amount) from payment
group by staff_id
order by count(payment_id) desc;

--4
select inventory.store_id, film.rating, avg(film.replacement_cost) from inventory
join film on inventory.film_id = film.film_id
group by inventory.store_id, film.rating
order by inventory.store_id, film.rating;

--5
select concat(customer.first_name, ' ', customer.last_name) as full_name, customer.email, sum(payment.amount) from customer
join payment on customer.customer_id = payment.customer_id
group by customer.customer_id
order by sum(payment.amount) desc limit 5;

--6
select inventory.store_id, film.title, count(inventory.film_id) from inventory
join film on inventory.film_id = film.film_id
group by inventory.store_id, film.title
order by inventory.store_id, film.title asc;

--7
select concat(first_name, ' ', last_name), email, count(payment_id) from customer
join payment on customer.customer_id = payment.customer_id
group by customer.customer_id
having count(payment_id) >= 40
order by count(payment_id) desc;
