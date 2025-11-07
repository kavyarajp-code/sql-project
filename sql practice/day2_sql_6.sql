use sqldemo;

-- 1.
delimiter //
create procedure p5(in input varchar(20))
begin
select count(*) from employee where input=empname;
end //
delimiter ;
call p5('user 1');

-- 2.
delimiter //
create trigger t5
after  insert  on employee
for each row
begin
set @count= (select count(*) from employee) ;
end //
delimiter ;

insert into employee values(6,'user 6',1060,106);
select @count;

drop trigger t4;
delimiter //
create trigger t4
after update on employee
for each row
begin
set @count =(select count(*) from employee);
end //
delimiter ;

update employee set empname='user8' where empid=6;
select @count;


delimiter //
create trigger t3
after delete on employee
for each row
begin
set @count= 'record deleted' ;
end //
delimiter ;

delete from employee where empid=7;
select @count;