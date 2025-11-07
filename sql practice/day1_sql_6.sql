use sqldemo;
drop table emp;
drop table dept;
create table dept(deptid int, deptname varchar(20));
create table emp(empid int, empname varchar(20),sal int,deptid int);

insert into dept values(1,'hr');
insert into dept values(2,'testing');
insert into dept values(3,'development');
insert into dept values(4,'accounts');
insert into dept values(5,'admin');

insert into emp values(101,'john',10000,1);
insert into emp values(102,'prakash',25000,2);
insert into emp values(103,'gowri',12000,2);
insert into emp values(104,'krishnan',15000,1);
insert into emp values(101,'kumar',28000,3);


-- 1. display the dptname of prakash
select deptname from dept where deptid=(select deptid from emp where empname='prakash');
-- 2. display the number of employees working in hr
select count(empid) from emp where deptid=(select deptid from dept where deptname='hr');
--  3. display the employee who is earning more salary in testing department
select empname from emp where deptid=(select deptid from dept where deptname ='testing') and sal =(select max(sal)from emp where deptid=(select deptid from dept where deptname='testing'));
-- 4. display the dept where none of the employees are working
select deptname from dept where deptid not in(select deptid from emp);
-- 5.display the employees who are earning lesser salary than their dept avg salary
select empname from emp where sal<(select avg(sal) from emp where deptid=emp.deptid);
-- 6.display the employee name who earns more salary in every dept
select empname from emp d where sal=(select max(sal) from emp e where d.deptid = e.deptid);

 -- 7. display the deptname of krishnan and kumar
 select deptname from dept where deptid in ( select deptid from emp where empname in ('krishnan','kumar'));
 -- 8. display the employee who earns more than 12000 in hr dept
 select empname from emp where sal>12000 and deptid=(select deptid from dept where deptname ='hr');