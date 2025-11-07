use sqldemo;
create table testindex(id int primary key,fname varchar(20));
insert into testindex values(1,'user1');
insert into testindex values(3,'user3');
insert into testindex values(2,'user2');

select * from testindex;

show index from testindex;

create index myindex on testindex(fname);