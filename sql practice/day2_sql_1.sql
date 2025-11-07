use sqldemo;
drop table books;
drop table transactions;

create table books(bookid int, bookname varchar(20),price int);
create table transactions(transactionid int,bookid int);

insert into books values(1,'c',100);
insert into books values(2,'c++',200);
insert into books values(3,'java',300);

insert into transactions values(101,1);
insert into transactions values(102,2);
insert into transactions values(103,1);

select*from books;
select* from transactions;

select books.bookid,books.bookname from books inner join transactions on books.bookid=transactions.bookid;

