use sqldemo;

-- 1.
delimiter //
create procedure p1()
begin
select 'hi user';
end //
delimiter ;

call p1();

-- 2.
delimiter //
create procedure p2(a int,b int)
begin
select 'sum is' +(a+b);
end //
delimiter ;

call p2(5,5);

-- 3.
delimiter //
create procedure p3(a int,b int, out c int)
begin
set c=a+b;
end //
delimiter ;

call p3(5,2,@output);
select @output;

-- 4.
delimiter //
create procedure p4(in id int)
begin
select count(*) from employee where empid=id;
end //
delimiter ;
call p4(1)

-- 5.
delimiter //
create trigger t1 after insert on employee for each row
begin
select * from employee;
end //
delimiter ;

select * from employee;


delimiter //
create trigger t4
after insert on employee
for each row
begin
set @count='record added';
end //
delimiter ;

insert into employee values(5,'user5',1000,102);
select @count;

delimiter //
create trigger t7
after delete on employee
for each row 
begin 
set @count ='record deleted';
end //
delimiter ;
insert into employee values(6,'user6',1000,102);
select @count;
delete from employee where empid=6;
select @count;


drop trigger t2;
drop trigger t3;
drop trigger t4;
drop trigger t5;
drop trigger t6;
drop trigger t7;
