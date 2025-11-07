drop table members;
use sqldemo;
create table members(memberid int,membername varchar(200),category varchar(20));
create table transactions(orderid int, memberid int);
insert into members values(1,'user 1','admin');
insert into members values(2,'user 2','guest');
insert into members values(3,'user 3','admin');
insert into members values(4,'user 4','admin');

insert into transactions values(101,1);
insert into transactions values(102,1);
insert into transactions values(103,2);
insert into transactions values(104,3);
insert into transactions values(105,1);

-- display all transactions
select* from transactions;

-- display the name of the guest user who performed transaction
select membername from members where category='guest';

-- display the mebername of orderid =104
select membername from members where memberid in(select memberid from transactions where orderid=104);

-- display the number of admin users who did not perform transaction

select count(memberid) from members where category='admin' and memberid not in(select memberid from transactions);

-- display the number of transactions done by user1
select count(orderid) from transactions where memberid in(select memberid from members where membername='user 1');
