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
from film
group by cost_range order by cost_range;
--Question: How many films have a replacement cost in the "low" group?
--514 in the low range
----------------------------------------------------------------------------------------------------------------------























