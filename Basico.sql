-- SELECCIONAR TABLAS DE BASE DE DATOS - SELECT
select * from sakila.actor;
select actor_id, first_name, last_name, last_update from sakila.actor;
-- RENOMBRAR COLUMNAS - AS
select actor_id, first_name as Nombre, last_name as Apellido , last_name from sakila.actor;
-- Seleccionar tabla de clientes
select * from sakila.city;
-- OBTENER VALORES DISTINTOS - DISTINCT 
select * from sakila.customer;
select distinct (store_id) from sakila.customer;

select * from sakila.payment;
select distinct (customer_id) from sakila.payment;

-- SENTENCIA ORDENAMIENTO - ORDER BY
select * from sakila.country;
select * from sakila.country order by country ASC;
select * from sakila.country order by (country) DESC;

select * from sakila.customer;
select * from sakila.customer order by (first_name) ASC;

-- EJERCICIOS
select store_id, first_name, last_name from sakila.customer;
select store_id as Tienda, first_name as Nombre , last_name as Apellido from sakila.customer;
select last_name as Apellido from sakila.customer order by Apellido ASC;

select * from sakila.payment;
select * from sakila.payment order by amount DESC; -- 11.9
select * from sakila.payment order by amount ASC; -- 0.00

-- Solucion
select store_id as Tienda, first_name as Nombre, last_name as Apellido from sakila.customer 
order by Apellido DESC;

select distinct amount from sakila.payment order by amount ASC; 

-- CLAUSURA WHERE
select * from sakila.actor;
select * from sakila.actor where first_name = 'DAN';

select * from sakila.city;
select * from sakila.city where city = 'London';
select * from sakila.city where country_id = 102;

select * from sakila.customer;
select * from sakila.customer where store_id = 1;

select * from sakila.inventory;
select * from sakila.inventory where film_id > 50;
select * from sakila.inventory where film_id >= 50;

select * from sakila.payment;
select * from sakila.payment where amount < 3;
select distinct amount from sakila.payment where amount < 3;

select * from sakila.staff;
select * from sakila.staff where staff_id <> 2;

select * from sakila.language;
select * from sakila.language where name <> 'German';

-- EJERCICIOS
select * from sakila.film;
select description, release_year from sakila.film;
select * from sakila.film where title = 'IMPACT ALADDIN';

select * from sakila.payment;
select * from sakila.payment where amount > 0.99;

-- SOILUCION
select description, release_year from sakila.film where title = 'IMPACT ALADDIN';

select * from sakila.payment where amount > 0.99;

-- OPERADORES OR , AND , NOT
select * from sakila.country where country = 'Algeria' and country_id = 2;

select * from sakila.country where country = 'Algeria' or country_id = 12;
select * from sakila.language where language_id = 1 or name = 'German';

select * from sakila.category where not name = 'Action';
select * from sakila.film where not rating = 'PG';
select distinct rating from sakila.film where not rating = 'R';
select distinct rating from sakila.film where rating <> 'R';

-- EJERCICIOS 
select * from sakila.payment where customer_id = 36 and amount > 0.99 and 
	staff_id = 1;

select * from sakila.rental where not staff_id = 1 and customer_id > 250
		and inventory_id < 100;

-- OPERADOR IN
select * from sakila.customer where first_name = 'MARY' and first_name = 'PATRICIA';
select * from sakila.customer where first_name = 'MARY' or first_name = 'PATRICIA';
select * from sakila.customer where first_name in ('MARY', 'PATRICIA');
 
select * from sakila.film where special_features in ('Trailers','Trailers,Deleted Scenes')
	and rating in ('G','NC-17') and length > 100;
    
select * from sakila.category where name not in ('Action', 'Animation','Children');

-- EJERCICIO
select * from sakila.film_text where title in ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');
select * from sakila.city where city in ('Chiayi','Dongying','Fukuyama', 'Kilis');

-- OPERADOR BETWEEN
select * from sakila.rental where (customer_id between 300 and 350) and staff_id = 1;
select * from sakila.payment where (amount between 3 and 5);
select * from sakila.payment where amount not between 3 and 5;

-- EJERCICIOS
select * from sakila.payment where (amount between 2.99 and 4.99) and (staff_id = 2) 
	and (customer_id in (1 , 2));

select * from sakila.address where city_id between 300 and 350;

select * from sakila.film where (rental_rate between 0.99 and 2.99) and
	(length <= 50) and (replacement_cost < 20); 
    
-- OPERADOR LIKE
select * from sakila.actor where first_name like 'A%' and last_name like 'B%';
select * from sakila.actor where  first_name like '%A' and last_name like '%N';
select * from sakila.actor where first_name like '%NE%' and last_name like '%RO%';
select * from sakila.actor where first_name like 'C%N' and last_name like 'G%';

-- EJERCICIOS
select * from sakila.film where (release_year = 2006) and title like 'ALI%';

-- INNER JOIN, LEFT JOIN, RIGHT JOIN
select * from sakila.film;
select * from sakila.language;

-- INNER
select f.title, f.description, f.release_year, f.language_id, l.name
from sakila.film f 
inner join sakila.language l on (f.language_id = l.language_id);

select f.title, f.description, f.release_year, l.name 
from sakila.film f
inner join sakila.language l on (f.language_id = l.language_id);

select * from sakila.address;
select * from sakila.city;

select a.address as Direccion, c.city as Ciudad 
from sakila.address a 
inner join sakila.city c on (a.city_id = c.city_id);

-- RIGHT JOIN
select 
c.customer_id,
c.first_name,
c.last_name,
a.first_name,
a.last_name
from sakila.customer c
right join sakila.actor a on (c.last_name = a.last_name);

-- LEFT JOIN
select 
c.customer_id,
c.first_name,
c.last_name,
a.actor_id,
a.first_name,
a.last_name
from sakila.customer c 
left join sakila.actor a on (c.last_name = a.last_name);

-- EJERCICIOS
select * from sakila.address;
select * from sakila.city;
select * from sakila.country; 
select a.address, c.city, co.country
from sakila.address a
inner join sakila.city c on (a.city_id = c.city_id)
inner join sakila.country co on (c.country_id = co.country_id);

select * from sakila.customer;
select * from sakila.store;
select * from sakila.address;
select c.first_name , a.address, s.store_id
from sakila.customer c
left join sakila.address a on (c.address_id = a.address_id)
left join sakila.store s on (c.address_id = s.address_id);

select * from sakila.rental;
select * from sakila.staff;
select r.rental_id, s.first_name
from sakila.rental r
inner join sakila.staff s on (r.staff_id = s.staff_id); 
-- SOLO MIKE ?? .-.

-- SUM
select * from sakila.payment;
select sum(amount) from sakila.payment;

select * from sakila.inventory;
select inventory_id + film_id + store_id from sakila.inventory;

-- COUNT
select * from sakila.actor;
select count(*) from sakila.actor;
select count(first_name) from sakila.actor;

-- AVERAGE
select * from sakila.payment;
select avg(amount) from sakila.payment;

select * from sakila.film;
select avg(rental_duration) from sakila.film;

-- MAX - MIN
select * from sakila.film; 
select max(length) from sakila.film;
select min(length) from sakila.film;

select max(replacement_cost) from sakila.film;
select min(replacement_cost) from sakila.film;
 
-- EJERCICIOS
select * from sakila.rental;
select count(rental_id) from sakila.rental;
select count(*) from sakila.rental;

select * from sakila.payment;
select max(amount) from sakila.payment;

-- GROUP BY
select last_name ,count(*) from sakila.actor
group by last_name;

select * from sakila.payment;
select * from sakila.customer;

select 
c.customer_id,
c.first_name,
c.last_name,
sum(p.amount)
from sakila.payment p 
inner join sakila.customer c on (p.customer_id = c.customer_id)
group by 1,2,3;

select
c.customer_id,
c.first_name,
c.last_name,
sum(p.amount)
from sakila.payment p
inner join sakila.customer c on (p.customer_id = c.customer_id)
group by c.customer_id, c.first_name,c.last_name;

-- EJERCICIOS
select * from sakila.rental;
select customer_id, max(rental_date) from sakila.rental
group by customer_id;

-- CLAUSULA HAVING 
select last_name, count(*) from sakila.actor
group by 1
having count(*)>3;

select * from sakila.payment;
select * from sakila.customer;

select 
c.customer_id,
c.last_name,
c.first_name,
sum(p.amount)
from sakila.payment p
inner join sakila.customer c on (p.customer_id =  c.customer_id)
group by 1,2,3 
having sum(p.amount) < 60
order by sum(p.amount) desc;

-- EJERCICIO
select * from sakila.actor;
select last_name, count(*) from sakila.actor
group by last_name
having count(*) >2;

-- EJERCICIOS FINALES

-- 1
select * from sakila.actor;
select first_name as Nombre, last_name as Apellido from sakila.actor
where first_name = 'Scarlett';
-- 2
select first_name as Nombre, last_name as Apellido from sakila.actor
where last_name = 'Johansson';
   -- last_name like 'Johansson';
-- 3 
select count(distinct(last_name)) from sakila.actor;
-- 4
select last_name, count(*) from sakila.actor
group by last_name
having count(*) = 1;

select last_name from sakila.actor
group by last_name
having count(*) = 1;
-- 5
select * from sakila.actor;
select * from sakila.film_actor;

select f.actor_id as ID, a.first_name as Nombre, A.last_name as Apellido, count(f.film_id)  from sakila.actor a
inner join sakila.film_actor f on (a.actor_id = f.actor_id) group by a.actor_id order by count(f.film_id) desc;

-- 6
select * from sakila.inventory;
select * from sakila.store;
select * from sakila.film;

select film.film_id, film.title, store.store_id, inventory.inventory_id
from sakila.inventory join sakila.store using (store_id) join sakila.film using(film_id)
where film.title = 'ACADEMY DINOSAUR' and store.store_id = 1;

select f.film_id, f.title, s.store_id, i.inventory_id from sakila.inventory i
inner join sakila.store s on (i.store_id = s.store_id)
inner join sakila.film f on (i.film_id = f.film_id)
where f.title = 'ACADEMY DINOSAUR' and s.store_id = 1;

-- FUNCIONES UTILES 

-- CHAR LENGTH
select * from sakila.category;
select name , char_length(name) as LongitudCadena
from sakila.category;

select * from sakila.city;
select city, char_length(city) as LongitudCiudad
from sakila.city;

-- CONCAT()
select * from sakila.customer;
select first_name, last_name, concat(first_name, ' ', last_name) as 'Nombre Completo'
from sakila.customer;

-- CONCAT_WS()
select * from sakila.film;
select title, description, release_year, concat_ws(' - ',title, description, release_year)
from sakila.film;
  
-- ROUND()
select * from sakila.payment;
select * , round(amount, 0) as Redondeo from sakila.payment;

-- LCASE , UCASE
select * from sakila.actor;
select first_name, last_name, lcase(concat(first_name, ' ', last_name)) as 'Nombre Completo' 
from sakila.actor; 

-- EJERCICIOS
select * from sakila.customer;
-- 1
select email, char_length(email) as longitud from sakila.customer;
-- 2 
select first_name, last_name, email, concat(first_name,' - ', last_name,' - ', email)
from sakila.customer;
-- 3 
select * from sakila.film;
select concat_ws(' - ', film_id, title, description, release_year, language_id, original_language_id, rental_duration,
rental_rate, length, replacement_cost, rating, special_features, last_update) 
from sakila.film; 
-- 4
select * from sakila.payment;
select *, round(avg(amount),0) from sakila.payment
group by customer_id;

-- 5 
select * from sakila.city;
select *, ucase(city) from sakila.city;

-- CASE
select * from sakila.address;

select address, address2,
case
	when address2 is null then "Sin direccion"
	else "Con direccion"
end as Comentario
from sakila.address;
    
select * from payment;
select payment_id , amount,
case 
	when amount < 1 then 'Precio Minimo'
    when amount between 1 and 3 then 'Precio Intermedio'
    else 'Precio Maximo'
end as Comentario
from sakila.payment;

-- EJERCICIOS
select * from sakila.film;
select film_id, title, rental_rate,
case
	when rental_rate < 1 then 'Pelicula Mala'
    when rental_rate between 1 and 3 then 'Pelicula Buena'
    else 'Pelicula Excelente'
end as Puntuacion
from sakila.film;

-- SUBCONSULTAS
select * from sakila.film;
select * from sakila.language;

select title
from sakila.film
where (title like 'K%' or title like'Q%')
and title in 
(
select title from sakila.film where language_id in
	(
    select language_id from sakila.language where name = 'English'
    )
);

select * from sakila.actor;
select * from sakila.film_actor;
select * from sakila.film;

select *
from sakila.actor
where actor_id in 
	(
	select actor_id from sakila.film_actor where film_id in
		(
        select film_id from sakila.film where title = 'Alone Trip'
        )
	);

select * from sakila.category;
select * from sakila.film_category;
select * from sakila.film;

select title from sakila.film
where film_id in 
	(
	select film_id from sakila.film_category where category_id in
		(
        select category_id from sakila.category where name = 'Family'
        )
	);

-- EJERCICIO
select * from sakila.category;
select * from sakila.film_category;
select * from sakila.inventory;
select * from sakila.rental;
select * from sakila.customer;

select concat(first_name, ' ' , last_name) as 'Nombre_Completo', email
from sakila.customer
where customer_id in
	(
    select customer_id from sakila.rental where inventory_id in
		(
        select inventory_id from sakila.inventory where film_id in
			(
            select film_id from sakila.film_category where category_id in 
				(
                select category_id from sakila.category where name = 'Action'
				)
            )
        )
    );

-- VIEWS
create view ingresos_por_genero as
select name, sum(amount)
from category
inner join film_category
on category.category_id = film_category.category_id
inner join inventory
on film_category.film_id = inventory.film_id
inner join rental
on inventory.inventory_id = rental.inventory_id
inner join payment
on rental.rental_id = payment.rental_id
group by name
order by sum(amount) desc limit 5;

select * from ingresos_por_genero;

drop view ingresos_por_genero;

-- Ejercicio
select * from sakila.customer;
select * from sakila.address;
select * from sakila.city;
select * from sakila.country;

create view lista_clientes as
select concat_ws(' ', first_name, last_name) as 'Nombre' ,
concat_ws(' - ', address, city, country) 
from customer 
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id
inner join country
on city.country_id = country.country_id; 

select * from lista_clientes;

drop view lista_clientes;

-- CONSULTAS MULTITABLA

-- Quien ha vendido mas del staff en agosto de 2005
select * from staff;
select * from payment;

select staff.first_name, staff.last_name, sum(payment.amount) as 'Total' 
from staff 
inner join payment
on staff.staff_id = payment.staff_id
where payment.payment_date like '2005-08%'
group by staff.first_name , staff.last_name
order by sum(payment.amount) desc;

-- Haga una lista de cada pelicula y el numero de actores que figuran en esa pelicula
select * from film;
select * from film_actor;

select film.title, count(film.film_id) as Actores
from film
inner join film_actor
on film.film_id = film_actor.film_id
group by film.title
order by Actores desc;

-- Cuantas copias de la pelicula 'Hunchback Impossible' existen en el sistema de inventario
select * from inventory;
select * from film;

select film.title, count(film.title) as Copias_disponibles
from film 
inner join inventory
on film.film_id = inventory.film_id
where film.title = 'Hunchback Impossible'
group by film.title;
 
-- Anote el total pagado por cada cliente. Listar los clientes alfabeticamente por apellido
select first_name, last_name, sum(amount) as Total_Pago
from customer
inner join payment
on customer.customer_id = payment.customer_id
group by first_name, last_name
order by last_name asc;

-- Ejercicio

-- Para crear una lista de este tipo, busque películas en la tabla de alquiler 
-- con una fecha de retorno NULA y donde la fecha de alquiler sea más antigua 
-- que la duración del alquiler especificada en la tabla de películas. Si es así,
-- la película está atrasada y debemos producir el nombre de la película junto con el nombre 
-- del cliente y el número de teléfono.
select * from sakila.customer;
select * from sakila.address;
select * from sakila.rental;
select * from sakila.inventory;
select * from sakila.film;


select film.title, 
customer.first_name,
customer.last_name,
address.phone,
rental.rental_date,
rental.return_date,
film.rental_duration,
timestampdiff(day, rental_date, return_date) as Dias_rentados,
(case
	when timestampdiff(day, rental.rental_date, rental.return_date) > film.rental_duration
    then 'Irregular'
    else 'Activo'
end) as ESTADO
from customer
inner join address
on customer.address_id = address.address_id
inner join rental 
on customer.customer_id = rental.customer_id
inner join inventory
on inventory.inventory_id = rental.inventory_id
inner join film
on inventory.film_id = film.film_id
where return_date is null 
or timestampdiff(day, rental_date, return_date) > rental_duration; 

-- INSERT INTO
select * from sakila.city;
insert into sakila.city(city,country_id)
values ('Prueba','100');

select * from sakila.actor;
insert into sakila.actor(first_name, last_name)
values ('CARLOS', 'BERNAL');

select * from sakila.category;
insert into sakila.category(name)
values ('CIENCIA FICCION');

select * from sakila.actor;
insert into sakila.actor(first_name, last_name)
values ('Yishen','Con');

select * from sakila.address;
insert into sakila.address(address, district, city_id, postal_code, phone)
values ('69 Te amo Yishen', 'Sueño', '100',null, 445515246);

select * from sakila.category;
insert into sakila.category(name)
values ('Amor');

select * from sakila.customer;
insert into sakila.customer(store_id,first_name,last_name,email,address_id,active)
values (2,'YISHEN','CON','teamoyishen@gmail.com',369,1);

select * from sakila.film_text
order by film_id desc;
insert into sakila.film_text(film_id,title, description)
values (1001,'Te amo Yishen', 'La quiero mucho :c');

-- UPDATE
select * from city;
select * from sakila.city where country_id = 87;
update sakila.city
set city = 'NEW YORK'
where country_id = 87;

select * from sakila.actor;
update sakila.actor
set first_name = 'YISHEN' , last_name = 'CON'
where actor_id = 1;

select * from sakila.actor;
select * from sakila.actor where last_name = 'CHASE';
update sakila.actor
set first_name = 'LIZ'
where last_name = 'CHASE';

select * from sakila.staff;
update sakila.staff
set first_name = 'Yishen'
where staff_id = 2;

select * from sakila.actor;
update sakila.actor
set first_name = 'LIZ', last_name = 'MERCADO'
where actor_id = 2;

select * from sakila.address;
update sakila.address
set postal_code = 45213, phone = 1255524
where address_id = 1;

select * from sakila.category;
update sakila.category
set name = 'Cumbia'
where category_id = 3;

select * from sakila.customer;
update sakila.customer
set first_name = 'TZUYU'
where last_name = 'BROWN';

select * from sakila.film_text;
update sakila.film_text
set title = 'Data Science', description = 'Mi sueño'
where film_id = 1;

-- ALTER TABLE
select * from sakila.actor;

alter table sakila.actor
add column genero_actor char(1);

alter table sakila.actor
drop column genero_actor;

select * from sakila.actor;
alter table sakila.actor
add column genero_actor char (1);
update sakila.actor
set genero_actor = 'F'
where actor_id = 1 or actor_id = 2;
update sakila.actor
set genero_actor = 'M'
where actor_id = 3;

select * from sakila.film_text;
alter table sakila.film_text
add column categoria  char(10);
update sakila.film_text
set categoria = 'LOVE'
where film_id between 0 and 10;

-- Ejercicios Finales
select * from sakila.actor where first_name = 'Scarlett';

select * from sakila.actor where last_name like 'Johansson%';

select count(distinct(last_name)) from sakila.actor;

select last_name, count(last_name) as Repeticiones from sakila.actor
group by last_name
having repeticiones = 1;

select * from sakila.actor;
select * from sakila.film_actor;
select actor.actor_id, actor.first_name, actor.last_name, count(actor.actor_id) as Apariciones
from actor
inner join film_actor 
on (actor.actor_id = film_actor.actor_id)
group by actor.actor_id
order by Apariciones desc
limit 1;

select * from film;
select * from inventory;
select * from store;

select film.film_id, film.title, store.store_id, inventory.inventory_id 
from film 
inner join inventory
on (film.film_id = inventory.film_id)
inner join store
on (store.store_id = inventory.store_id)
where film.title = 'ACADEMY DINOSAUR'
and store.store_id = 1; 
