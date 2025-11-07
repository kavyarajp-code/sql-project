use sqldemo;

drop table books;

create table books (bookid int, bookname varchar(20),author varchar(20),price int,publisher varchar(20));
insert into books values(1,'c','balu',100,'bpb');
insert into books values(2,'c++','gowri',200,'mcgraw');
insert into books values(3,'java','mano',300,'bpb');
insert into books values(4,'peri','james',400,'bpb');
insert into books values(5,'ruby','antony',500,'bpb');

select * from books;

select bookname from books;

select count(bookid) as count from books;

select author from books where bookname='c++';

select bookname,price from books where price >200;

select bookname , price from books where price between 200 and 400;

select bookname from books where author='antony';

select bookname,price as max from books where price =(select max(price) from books);

select bookname,price from books where price=(select max(price) from books);

select count(bookid),publisher from books group by publisher;

select avg(price) from books where publisher='mcgraw';

select * from books limit 2;

select * from books order by bookid desc limit 2;







