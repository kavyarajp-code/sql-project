use sqldemo;
drop table employee;
drop table dept;

create table employee(empid int,empname varchar(20),deptid int, salary int);
create table dept(deptid int, deptname varchar(20));

insert into employee values(1,'john',101,1000);
insert into employee values(2,'mano',102,2000);
insert into employee values(3,'prakash',101,3000);
insert into employee values(4,'venu',102,4500);
insert into employee values(5,'abirami',101,5000);

insert into dept values(101,'hr');
insert into dept values(102,'testing');
insert into dept values(103,'development');
insert into dept values(104,'accounts');

-- employee names who are working in testing dept
select empname from employee where deptid in(select deptid from dept where deptname='testing');

-- number of employees who are working in"accounts"
select count(empid) from employee where deptid in(select deptid from dept where deptname='accounts');

-- dept name of employee john
select deptname from dept where deptid in(select deptid from employee where empname='john');

-- dept name where higher salary is paid
select deptname from dept where deptid in(select deptid from employee where salary=(select max(salary) from employee));

-- dept name where lowest salary is paid
select deptname from dept where deptid in(select deptid from employee where salary=(select min(salary) from employee));

-- display the dept name where most number of employees are working
select deptname from dept where deptid in(select deptid from employee where deptid=(select max(deptid) from employee)); -- ///////////wrong
select deptname from dept where deptid in(select deptid from employee group by deptid order by max(empid)  );

-- dept name where none of the employees are working
select deptname from dept where deptid not in(select deptid from employee);

-- employee names who are not working in hr dept
select empname from employee where deptid not in(select deptid from dept where deptname ='hr');

-- the employee who earns sec highest salary
select empname from employee order by salary desc limit 1 offset 1; 

-- employee who earns more than 'mano'
select empname from employee where salary>(select salary from employee where empname='mano');

-- employee name who earns highest salary in testing
select empname from employee where deptid in(select deptid from dept where deptname='testing') and salary=(select max(salary) from employee where deptid in(select deptid from dept where deptname='testing'));

-- empid,empname and dept of all the employee
select empid,empname,deptname from employee join dept where employee.deptid=dept.deptid;

-- deptid and name of all the dept where no employee is working
select deptname,deptid from dept where deptid not in(select deptid from employee);