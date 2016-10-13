----------------------------------------------------------------------------------------
-- Postgres create, load, and query script for CAP3.
--
-- SQL statements for the CAP3 database
-- 
-- Derived from the CAP examples in _Database Principles, Programming, and Performance_, 
--   Second Edition by Patrick O'Neil and Elizabeth O'Neil
-- 
-- Modified several times by Alan G. Labouseur
-- 
-- Tested on Postgres 9.3.2    (For earlier versions, you may need
--   to remove the "if exists" clause from the DROP TABLE commands.)
----------------------------------------------------------------------------------------

-- Connect to your Postgres server and set the active database to CAP3. Then . . .

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS agents;
DROP TABLE IF EXISTS products;


-- Customers --
CREATE TABLE customers (
  cid      char(4) not null,
  name     text,
  city     text,
  discount decimal(5,2),
 primary key(cid)
);


-- Agents --
CREATE TABLE agents (
  aid        char(3) not null,
  name       text,
  city       text,
  commission decimal(5,2),
 primary key(aid)
);        


-- Products --
CREATE TABLE products (
  pid      char(3) not null,
  name     text,
  city     text,
  quantity integer,
  priceUSD numeric(10,2),
 primary key(pid)
);


-- Orders -- 
CREATE TABLE orders (
  ordnum   integer not null,
  mon      char(3),    
  cid      char(4) not null references customers(cid),
  aid      char(3) not null references agents(aid),
  pid      char(3) not null references products(pid),
  qty      integer,
  totalUSD numeric(12,2),
 primary key(ordnum)
);



-- SQL statements for loading example data into the CAP3 database
-- Connect to your Postgres server and set the active database to CAP3. Then . . .

-- Customers --
INSERT INTO Customers( cid, name, city, discount )
  VALUES('c001', 'Tiptop', 'Duluth', 10.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c002', 'Tyrell', 'Dallas', 12.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c003', 'Allied', 'Dallas', 8.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c004' ,'ACME' ,'Duluth', 8.50);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c005' ,'Weyland', 'Acheron', 0.00);

INSERT INTO Customers( cid, name, city, discount )
  VALUES('c006' ,'ACME' ,'Kyoto' ,0.00);


-- Agents --
INSERT INTO Agents( aid, name, city, commission )
  VALUES('a01', 'Smith', 'New York', 6.50 );

INSERT INTO Agents( aid, name, city, commission )
  VALUES('a02', 'Jones', 'Newark', 6.00 );

INSERT INTO Agents( aid, name, city, commission )
  VALUES('a03', 'Perry', 'Tokyo', 7.00 );

INSERT INTO Agents( aid, name, city, commission )
  VALUES('a04', 'Grey', 'New York', 6.00 );

INSERT INTO Agents( aid, name, city, commission )
  VALUES('a05', 'Otasi', 'Duluth', 5.00 );

INSERT INTO Agents( aid, name, city, commission )
  VALUES('a06', 'Smith', 'Dallas', 5.00 );

INSERT INTO Agents( aid, name, city, commission )
  VALUES('a08', 'Bond', 'London', 7.07 );


-- Products --
INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p01', 'comb', 'Dallas', 111400, 0.50 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p02', 'brush', 'Newark', 203000, 0.50 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p03', 'razor', 'Duluth', 150600, 1.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p04', 'pen', 'Duluth', 125300, 1.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p05', 'pencil', 'Dallas', 221400, 1.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p06', 'folder','Dallas', 123100, 2.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p07', 'case', 'Newark', 100500, 1.00 );

INSERT INTO Products( pid, name, city, quantity, priceUSD )
  VALUES('p08', 'eraser', 'Newark', 200600, 1.25 );


-- Orders --
INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1011, 'jan', 'c001', 'a01', 'p01', 1000, 450.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1013, 'jan', 'c002', 'a03', 'p03', 1000, 880.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1015, 'jan', 'c003', 'a03', 'p05', 1200, 1104.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1016, 'jan', 'c006', 'a01', 'p01', 1000, 500.00);
  
INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1017, 'feb', 'c001', 'a06', 'p03',  600, 540.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1018, 'feb', 'c001', 'a03', 'p04',  600, 540.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1019, 'feb', 'c001', 'a02', 'p02',  400, 180.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1020, 'feb', 'c006', 'a03', 'p07',  600, 600.00);
  
INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1021, 'feb', 'c004', 'a06', 'p01', 1000, 460.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1022, 'mar', 'c001', 'a05', 'p06',  400, 720.00);
    
INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1023, 'mar', 'c001', 'a04', 'p05',  500, 450.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1024, 'mar', 'c006', 'a06', 'p01',  800, 400.00);
  
INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1025, 'apr', 'c001', 'a05', 'p07',  800, 720.00);

INSERT INTO Orders( ordnum, mon, cid, aid, pid, qty, totalUSD )
  VALUES(1026, 'may', 'c002', 'a05', 'p03',  800, 744.00);


-- SQL statements for displaying example data into the CAP3 database
-- Connect to your Postgres server and set the active database to CAP3. Then . . .

select *
from customers;

select *
from agents;

select *
from products;

select *
from orders;


--1) Display the name and city of customers who live in any city that makes the most different kinds of products. 
--(There are two cities that make the most different products. 
--Return the name and city of customers from either one of those.)

select c.name, --return name and city of customers
       c.city
from customers c, 
     products p
where c.city = p.city and p.city in (select p.city
				      from products p);

--2) Display the names of products whose priceUSD is strictly below the average priceUSD, 
--in reverse-alphabetical order.

select p.name --display the name of products
from products p
where priceusd < (select avg(priceusd) --below average priceUSD
		   from products)
order by p.name DESC; --reverse alphabetical order

--3) Display the customer name, pid ordered, and the total for all orders, sorted by total from low to high.

select c.name, --display customer name, pid, totalUSD
       o.pid, 
       o.totalUSD
from customers c, 
     orders o
where c.cid = o.cid
order by totalUSD Asc; --total from low to high

--4) Display all customer names (in alphabetical order) and their total ordered, and nothing more. 
--Use coalesce to avoid showing NULLs.

select c.name, 
	coalesce(sum(o.qty),0) as "total ordered"
from customers c left outer join orders o on c.cid = o.cid --information from customers & orders
group by c.name
order by c.name ASC; --alphabetical order

--5) Display the names of all customers who bought products from agents based in New York along with the 
--names of the products they ordered, and the names of the agents who sold it to them.

select distinct c.name, 
		 p.name, 
		 a.name --display customer, product, agent
from customers c, --information from customers, products, orders, agents
     products p,
     orders o,
     agents a
where a.city = 'New York'; --agents from New York

--6) Write a query to check the accuracy of the dollars column in the Orders table. 
--This means calculating Orders.totalUSD from data in other tables and comparing those values to the values 
--in Orders.totalUSD. Display all rows in Orders where Orders.totalUSD is incorrect, if any.

SELECT o.ordnum,
       o.totalUSD,
       (o.qty * p.priceUSD) AS CheckTotalUSD
FROM orders o inner join products p on o.pid = p.pid
WHERE ((o.qty * p.priceUSD) != o.totalUSD);


--7) What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? 
--Give example queries in SQL to demonstrate. (Feel free to use the CAP database to make your points here.)
--The difference between a left outer joing and a right outer join is the way in which the information from two
--tables are compared. For example:
select a.name
from agents a left outer join orders o on a.aid = o.aid
order by a.name;
-- With the left outer join the information from the agents table (the left most table) is taken and compared to the orders table.
select a.name
from agents a right outer join orders o on a.aid = o.aid
order by a.name;
--With the right outer join the information from the orders table (the right most table) is taken and compaterd to the agents table.
--The difference between the two outputs is agent 'Bond.' Because agent bond did not place any orders, the agent
--only appears when the agents table is looked at first because the agent does not exist in the orders table.
--When the orders table is looked at, 'Bond' is not an output because it is not found in the orders table
--and thus cannot be compared to the agents table.