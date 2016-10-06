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

--Megan Makini
-- Lab 5 

--1) Show the cities of agents booking an order for a customer whose id is 'c006'. 
--   Use joins this time; no subqueries.

select a.city --show the cities of agents
from orders o inner join agents a on o.aid = a.aid --information from orders and agents tables
	      inner join customers c on o.cid = c.cid --information from customers table
where o.cid = 'c006'; --for a customer whose id is 'c006'

--2) Show the ids of products ordered through	any agent who makes at	least one order	for a customer	in Kyoto
--   sorted by pid from highest to lowest. Use	joins;	no subqueries.	

select distinct o.pid --product id
from orders o inner join agents a on o.aid = a.aid --information from orders and agents table
	      inner join customers c on o.cid = c.cid --inforamtion from customers table
where c.city = 'Kyoto'; --customer from Kyoto

--3) Show the names of customers who have never placed an order. 
--   Use a subquery.	

select name --name of customer
from customers
where cid in (select cid
	      from customers --cid from customers table
			except --compared unique (subtraction)
	      select cid
	      from orders --cid from orders table
	     );

--4) Show the names of customers who have never placed an order. 
--   Use an outer join.

select distinct c.name --customer
from  orders o right outer join customers c on c.cid = o.cid
where o.cid is null; --no matching value with customer table

--5) Show the names of customers who placed at	least one order	through	an agent in their own city, along with	those agent(s')	names.	

select distinct c.name,
                a.name --customer name and agent name
from orders o inner join customers c on o.cid = c.cid --informaiton from orders and customers table
	      inner join agents a on o.aid = a.aid --information from agents table
where c.city = a.city

--6) Show the names of customers and agents living in the same city, along with the name of the shared city,	regardless of whether or not the customer has ever placed an order with that agent.

select c.name,
       a.name,
       c.city --show name of customers, agents, city
from customers c inner join agents a on c.city = a.city;

--7) Show the name and city of customers who live in the city that makes the fewest different kinds of products.
--   (Hint: Use	count and group	by on the Products table.)

select count(pid), --counting the products
       p.city
from customers c inner join products p on c.city = p.city --products and customers with the same city
where c.city = p.city
group by p.city
--find the min