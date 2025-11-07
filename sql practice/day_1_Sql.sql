-- create database sqldemo;
use sqldemo;
create table emp(empid int, empname varchar(20),sal int, city varchar(20));
insert into emp values(1,'user 1',1000,'hyd');
insert into emp values(2,'user 2',2000,'chn');
insert into emp values(3,'user 3',2500,'pun');
insert into emp values(4,'user 4',4000,'tvm');
insert into emp values(5,'user 5',1500,'coc');

select* from emp;
select * from emp where sal>3000;
update emp set sal=sal+1000 where city='tvm';
select sum(sal) from emp;

rename table emp to newemp;

alter table newemp add column deptname varchar(20);
select* from newemp;

alter table newemp drop deptname;
select*from newemp;

show tables;

desc newemp; -- showing the structure of the table
show databases;

drop table newemp;
 show tables;