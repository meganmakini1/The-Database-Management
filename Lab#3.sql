--Megan Makini
--September 15
--Lab #3
--1) List the order number and total dollars of all orders.
select ordnum, totalusd
from orders;

--2)List the name and city of agents named Smith
select name, city
from agents
where name = 'Smith';

--3)List the id, name, and priceUSD of products with quantity more than 201,000.
Select pid, name, priceUSD
From products
Where quantity > 201000;

--4)List the names and cities of customers in Duluth	
select name, city
from customers
where city = 'Duluth';

--5) List the names of agents not in New York and not in Duluth
select name
from agents
where city != 'New York'
and city != 'Duluth';

--6)List all data for products in neither Dallas nor Duluth that cost US$1 or more.
Select *
From products
where city != 'Dallas'
and city != 'Duluth'
and priceUSD >= 1.00;

--7) List all data for orders in February or March
select *
From orders
where mon = 'feb'
or mon = 'mar';

--8)List all data for orders in February of US$600 or more
Select *
from orders
where mon = 'feb'
and totalUSD >= 600.00;

--9) List all orders from the customer whose cid is c005
select *
from orders
where cid = 'c005';