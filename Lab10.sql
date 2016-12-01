--Megan Makini
--1 December, 2016
--Lab 10

----------------------------------------------------------------------------------------
-- Courses and Prerequisites
-- by Alan G. Labouseur
-- Tested on Postgres 9.3.2
----------------------------------------------------------------------------------------

--
-- The table of courses.
--
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select * 
from courses
order by num ASC;


--
-- Courses and their prerequisites
--
create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites
order by courseNum DESC;


--
--
--1 function PreReqsFor(courseNum)
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   preReq      int       := $1; --value entered
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select preReqNum --returned value
      from   Prerequisites --table name with data
      where  preReq <= preReqNum; --condition
   return resultset;
end;
$$ 
language plpgsql;

select PreReqsFor(0, 'results'); --match name with create statement
Fetch all from results;

--2 function IsPreReqFor(courseNum)
create or replace function IsPreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   course      int       := $1; --value entered
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select courseNum --returned value
      from   Prerequisites --table name with data
      where  course <= coursenum; --condition  
   return resultset;
end;
$$ 
language plpgsql;

select IsPreReqsFor(0, 'results');
Fetch all from results;

--optional, thank codd
--3 takes a passed-in course number and generates all of its prerequisites
create or replace function AllPreReqs(int, REFCURSOR) returns refcursor as 
$$
declare
   course      int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select   preReqNum 
      from     p.Prerequisites inner join c.Courses on p.courseNum = c.num --i thought i was on to something
      where    course <= coursenum;
   return resultset;
end;
$$ 
language plpgsql;

select AllPreReqs(0, 'results');
Fetch all from results; --as you can tell I was not correct