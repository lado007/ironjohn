#Using the rental table, find out how many rentals were processed by each employee.
select * from rental;
select  max(rental_id) from rental;
select count(rental_id),staff_id from rental
group by staff_id;

#Using the film table, find out how many films were released.
select * from film;
select max(film_id) from film;

#Using the film table, find out how many films there are of each rating. Sort the results in descending order of the number of films.
select count(film_id) as number_of_films, rating from film
group by rating 
order by number_of_films desc;

#Which kind of movies (rating) have a mean duration of more than two hours?
select avg(length) from film;
select avg(length), rating
from film
group by rating 
where avg(length)>120;

