use sqldemo;
drop table employee;

create table employee(empid int, empname varchar(20),sal int, deptid int);
create table dept(deptid int, deptname varchar(20));

insert into employee values(1,'user 1',1000,101);
insert into employee values(2,'user 2',2000,101);
insert into employee values(3,'user 3',3000,102);
insert into employee values(4,'user 4',4000,102);

insert into dept values(101,'hr');
insert into dept values(102,'testing');
insert into dept values(103,'dev');

-- display the employees who earn more than the avg salary
select deptid,avg(sal) as average from employee group by deptid;

-- display the employees who earn more than the avg salary            //wrong
select empname from employee where sal>all(select deptid,avg(sal) from employee group by deptid);

-- any 
select empid,empname,deptid from employee where deptid=any(select deptid from dept where deptnmae ='testing' or deptnmae ='hr');


