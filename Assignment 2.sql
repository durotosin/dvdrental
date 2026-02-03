
--Assignment 2
--1. Retrieve all unique customer first names from the customer table.

Select DISTINCT(first_name)
From customer;


-- 2. Find the top 5 customers who have spent the most money.

Select customer_id,sum(amount) as total
From payment
Group by customer_id
Order By total desc
Limit 5;

--3. List all films with a rental rate greater than 4.00.

Select * from film
Where rental_rate > 4;


--4. Count the number of payments per customer and display only customers with more than 15 payments.

Select customer_id, count(payment_id) as payment_count
From payment
Group By Customer_id
Having count(payment_id) > 15;

--5. Retrieve the first 10 films alphabetically using FETCH.

Select film_id,title 
from film
Order By title asc
Fetch first 10 rows only;

--6. Find the total amount paid per staff member.

Select staff_id, round(avg(amount),2) as avg_total
From payment
Group By staff_id;

--7. List customers whose email ends with .org.

Select *
From customer
Where email like '%org'

--8. Using DISTINCT ON, retrieve the latest payment record per customer.

Select DISTINCT ON(customer_id)customer_id,
                   payment_id,
                   staff_id,
				   rental_id,
				   sum(amount) as total
from payment
Group By customer_id
Order By total  asc;

--9. Display the average payment amount per customer, ordered from highest to lowest.

Select customer_id,round(avg(amount),2) as avg_total
From payment
Group By customer_id
Order By avg_total desc;

--10. Retrieve all payments made between $2.99 and $5.99.

Select * 
From payment
Where amount BETWEEN 2.99 AND 5.99;

-- 11. Identify the top 3 cities with the highest number of customers.

Select  c.city, count(cc.customer_id) as customer_count
From customer as cc
inner join city as c on c.last_update = cc.last_update
Group By city,customer_id
Order By customer_count desc
Limit 3;

