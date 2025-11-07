use sqldemo;


-- primary key

create table emp(empid int primary key,empname varchar(20), sal int);
insert into emp values(1,'user 1',1000);
insert into emp values(3,'user 3',3000);
insert into emp values(2,'user 2',2000);
select*from emp;

drop table emp;

-- check

create table emp(empid int, empname varchar(20),age int check(age>0));
select*from emp;

insert into emp values(1, 'kavya',23);
-- insert into emp values(2,'user 2',-999);

drop table emp;

-- default

create table emp(empid int, empname varchar(20),country varchar(20) default 'india');
insert into emp (empid,empname) values (1,'user 1');
insert into emp values(2,'user 2','usa');
select*from emp;
drop table emp;

-- unique

create table emp(empid int, empname varchar(30),mobile varchar(20) unique);
insert into emp values(1,'user 1','8921634989');
-- insert into emp values(2,'user 2','8921634989'); //errroooorrrrrrrrrrrrrrr
insert into emp values(3,'user 3','6767634989'); -- no error

drop table emp;

-- not null

create table emp(empid int, empname varchar(30),mobile varchar(20) not null);
insert into emp values(1,'user 1','8921634989');
-- insert into emp (empid,empname) values(2,'user 2'); //errroooorrrrrrrrrrrrrrr
insert into emp values(3,'user 3','6767634989'); -- no error
select*from emp;
drop table emp;

-- foreign key

create table dept(deptid int primary key, deptname varchar(20));
create table emp(empid int,empname varchar(20),deptid int, foreign key(deptid) references dept(deptid));
select*from emp;

insert into dept values(1,'hr');
insert into dept values(2,'testing');
insert into dept values(3,'development');

insert into emp values(101,'user 1',2);
insert into emp values(102,'user 2',3);
-- insert into emp values(103,'user 3',4); //errorrrrr
drop table emp;

-- group by

create table emp(empid int,empname varchar(20),sal int,deptname varchar(20));
insert into emp values(1,'user 1',1000,'hr');
insert into emp values(2,'user 2',2000,'testing');
insert into emp values(3,'user 3',3000,'testing');
insert into emp values(4,'user 4',1500,'testing');
insert into emp values(5,'user 5',5000,'development');
insert into emp values(6,'user 6',6000,'hr');
insert into emp values(7,'user 7',3000,'developemnt');

select deptname,max(sal) from emp group by deptname;
select deptname,max(sal) from emp group by deptname having max(sal)>4000;

-- in / not in

select empid,empname,deptname from emp where deptname in('testing','development');
select empid,empname,deptname from emp where deptname not in('testing','development');

select empid as "employee id",empname as "employee name" from emp;
select * from emp;

create table emp(empid int,empname varchar(20),sal int,deptname varchar(20));
insert into emp values(1,'user 1',1000,'hr');
insert into emp values(2,'user 2',2000,'testing');
insert into emp values(3,'user 3',3000,'testing');
insert into emp values(4,'user 4',1500,'testing');
insert into emp values(5,'user 5',5000,'development');
insert into emp values(6,'user 6',6000,'hr');
insert into emp values(7,'user 7',3000,'developemnt');

select empid as "employee id",empname as "employee name" from emp;

select * from emp where deptname ='testing' and  sal>400;
select * from emp where deptname='testing' or sal>3000;
select* from emp where sal between 4000 and 6000;

insert into emp values(8,'user 8', 3000,null);
select * from emp where deptname is null;

select * from emp where deptname like 'd%';
select * from emp where deptname like '_e%';
