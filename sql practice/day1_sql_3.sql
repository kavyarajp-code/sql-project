create database kavya;
use kavya;

create table students(rollno int,studentname varchar(20), age int);

desc students;
alter table students add column dept varchar(20);
desc students;
alter table students change rollno id int;
insert into students values(1,'user1',22,'testing');
insert into students values(2,'user2',23,'dev');
insert into students values(3,'user3',21,'hr');

alter table students add column mobile int;
desc students;

update students set mobile=32323232 where id=1;
update students set mobile=656565656 where id=2;
update students set mobile=272727272 where id=3;
select*from students;

alter table students drop column age;
select*from students;

update students set dept='development' where  dept='dev';
