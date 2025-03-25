--Task 1: Create a list of all the different (distinct) replacement costs of the films.
select distinct(replacement_cost) from film;
--Question: What's the lowest replacement cost?
select distinct(replacement_cost) from film order by replacement_cost asc limit 1; --$9.99
----------------------------------------------------------------------------------------------------------------------
/* Task 2: Write a query that gives an overview of how many films have replacements costs in the following cost ranges
low: 9.99 - 19.99
medium: 20.00 - 24.99
high: 25.00 - 29.99   */
select count(*), case
when replacement_cost between 9.99 and 19.99 then 'low'
when replacement_cost between 20 and 24.99 then 'medium'
else 'high' end as cost_range
from film group by cost_range order by cost_range;
--Question: How many films have a replacement cost in the "low" group?
--514 in the low range
----------------------------------------------------------------------------------------------------------------------
/* Task 3: Create a list of the film titles including their title, length, 
and category name ordered descendingly by length. Filter the results to only 
the movies in the category 'Drama' or 'Sports'.  */
select title, length, c.name from film as f
left join film_category as fc on f.film_id = fc.film_id
left join category as c on fc.category_id = c.category_id
where c.name in ('Drama', 'Sports');
--Question: In which category is the longest film and how long is it?
select title, length, c.name from film as f
left join film_category as fc on f.film_id = fc.film_id
left join category as c on fc.category_id = c.category_id
where c.name in ('Drama', 'Sports')
order by length desc limit 1;
--The longest is a Sports movie, "SMOOCHY CONTROL", which is 184 minutes long. 
----------------------------------------------------------------------------------------------------------------------
--Task 4: Create an overview of how many movies (titles) there are in each category (name).
--Question: Which category (name) is the most common among the films?
select count(title) as number_of_films, c.name from film as f
left join film_category as fc on f.film_id = fc.film_id
left join category as c on fc.category_id = c.category_id
group by c.name order by number_of_films desc;
--The sports category is most common among these films with 74 titles.
----------------------------------------------------------------------------------------------------------------------
--Task 5: Create an overview of the actors' first and last names and in how many movies they appear in.
select first_name, last_name, count(fa.*) from actor as a
left join film_actor as fa on a.actor_id = fa.actor_id
group by first_name, last_name order by count(fa.*) desc;
--Question: Which actor is part of most movies?
-- Susan Davis has the most movie appearances with 54.
----------------------------------------------------------------------------------------------------------------------
--Task 6:  Create an overview of the addresses that are not associated to any customer.
select * from address as a
left join customer as c on a.address_id = c.address_id
where customer_id is null;
--Question: How many addresses are that?
--4
---------------------------------------------------------------------------------------------------------------------
/* Task 7:  Create the overview of the sales to determine the from which city 
(we are interested in the city in which the customer lives, not where the store is) most sales occur. */
select city, sum(amount) from payment as p
left join customer as c on p.customer_id = c.customer_id
left join address as a on a.address_id = c.address_id
left join city as ci on ci.city_id = a.city_id
group by city order by city desc;
--Question: What city is that and how much is the amount?
--The top city is Ziguinchor with total sales reaching $100.75









