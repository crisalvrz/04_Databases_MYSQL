-- Actores que tienen de primer nombre ‘Scarlett’
select concat_ws(" ",first_name, last_name), actor_id from actor where first_name like 'Scarlett';

-- Actores que contengan una ‘O’ en su nombre y en una ‘A’ en su apellido.
select concat_ws(" ",first_name, last_name), actor_id from actor where first_name like upper('%O%') and last_name like upper('%A%');

-- 5. Actores que contengan dos ‘O’ en su nombre y en una ‘A’ en su apellido.
select concat_ws(" ",first_name, last_name), actor_id from actor where first_name like upper('%O%O%') and last_name like upper('%A%');
 
-- Media de películas alquiladas por clientes:
select avg(cuenta)from(select count(inventory_id)as cuenta, customer_id from rental group by customer_id) as media;

-- Actores que no hayan trabajado en películas de rating ‘R’ con exists
select first_name, last_name from actor where not exists(select actor_id from film_actor where film_id in(select film_id from film where rating like 'R'));

select first_name, last_name from actor a where not exists(select f.film_id from film f join film_actor fa where f.rating like 'R' and a.actor_id=fa.actor_id);

-- en la web:
select distinct first_name, last_name from actor a
where not exists 
(SELECT film_id FROM sakila.film join film_actor fa using(film_id)
where rating='R' and a.actor_id=fa.actor_id);

use sakila;
-- 41. Películas con duración mayor al promedio.
select title from film where length > (select avg(length) from film);

-- 42. Clientes que han pagado más del promedio.
select customer_id from payment group by customer_id having sum(amount)>(select avg(amount) from payment); -- having porque agrupo, where se puede usar antes
select customer_id from payment where customer_id>10 group by customer_id having amount>(select avg(amount) from payment);

-- 43. Películas con tarifa igual a la máxima.
select * from film where rental_rate= (select max(rental_rate) from film); -- where porque no agrupo

-- 44. Clientes sin pagos.
select * from customer where customer_id not in (select customer_id from payment);


-- 45. Actores que aparecen en más de 20 películas.
select * from actor where actor_id in(select actor_id from film_actor group by actor_id having count(film_id)>20 );


-- 46. 10 Películas más alquiladas.
select inventory_id, count(rental_id) from rental group by inventory_id order by count(rental_id) desc limit 10;

-- 47. Países con más de 10 clientes.

