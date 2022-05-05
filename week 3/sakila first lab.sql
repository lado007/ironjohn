#1 selecting specific data
use sakila;
select * from actor;
select * from film;
select * from customer;
#extractimng film titles
select title from film;
#getting the unique values for language.name and rernaming as language
select distinct language.name as language from language;
#how many stores does the company has
select count(distinct store_id) from store;
#how many employees does the company has
select count(distinct staff_id) from staff;
#return a list of employees first name only
SELECT 
    first_name
FROM
    staff;
#selecting all the actors with the first name scarlett
select * from actor
where first_name= 'scarlett';

#How many films (movies) are available for rent and how many films have been rented?
select count(distinct inventory_id) from rental
where return_date is not null; #available for rent
select count(distinct inventory_id) from rental; #number that have been rented

#What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length) as max_duration, min(length) as min_duration
from film;

#What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length)/60) as hours, round(avg(length) % 60) as minutes from film;
select *, convert(avg(length),time) as length_hm from film;

#How many distinct (different) actors' last names are there?
select count(distinct last_name) from actor;

#Since how many days has the company been operating (check DATEDIFF() function)?
select * from rental;
select max(rental_date);
select datediff(max(last_update),min(rental_date)) from rental ; 

#Show rental info with additional columns month and weekday. Get 20 results.
select * from rental;
select weekday(rental_date) as weekdays from rental;
select month(rental_date) as months from rental
order by rental_date desc
limit 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, case
when weekday(rental_date)
in ('5', '6')
then 'weekend'
else 'workday'
end as day_type
from rental;

#How many rentals were in the last month of activity?
select date(max(rental_date))-interval 30 day,date(max(rental_date)) from rental;

select count(*)
from rental where rental_date
>=(select max(rental_date)-interval 30 day from rental);