use sqldemo;
drop table employee;

-- self join-------
create table employee(empid int, empname varchar(20),managerid int);

insert into employee values(1,'user1',4);    -- user 1-> manager id is 4 so user 4 is the manager
insert into employee values(2,'user2',3);
insert into employee values(3,'user3',1);
insert into employee values(4,'user4',2);

select e1.empname,e2.empname as manager from employee e1 , employee e2 where e1.managerid=e2.empid;

