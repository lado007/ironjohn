#Write a query to display for each store its store ID, city and country
select* from address;

select store_id,city,country
from store
inner join address using (address_id)
inner join city using (city_id)
inner join country using (country_id);

#Write a query to display how much benefit amount, in dollars, each store brought in.
select * from payment;

select round(sum(amount)) as benefit_amount$, store_id
from payment
inner join customer using (customer_id)
group by store_id;

#What is the average running time of films by category?
#Which film categories are longest on average?
select* from category;

select round(avg(length)over(partition by name),0) as running_length, name
from film
inner join film_category using (film_id)
inner join category using (category_id)
group by name
order by running_length desc;


#Display the most frequently rented movies in descending order.
select * from payment;

select count(rental_id), title
from rental
inner join inventory using(inventory_id)
inner join film using (film_id)
group by title
order by count(rental_id) desc;




