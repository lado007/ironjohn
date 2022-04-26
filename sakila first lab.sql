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
select first_name from staff;