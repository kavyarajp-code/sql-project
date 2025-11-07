use sqldemo;
drop table students;

create table students(rollno int, studentname varchar(20));
create table courses(courseno varchar(20), coursename varchar(20), fee int);
create table courseenrolled(rollno int,courseno varchar(20));

insert into students value(1,'john');
insert into students value(2,'prakash');
insert into students value(3,'mano');
insert into students value(4,'raghav');
insert into students value(5,'kumar');

insert into courses values( 'c001','dos',1500);
insert into courses values( 'c002','wswindows',2000);
insert into courses values( 'c003','c++',3000);
insert into courses values( 'c004','c',2000);
insert into courses values( 'c005','java',3000);
insert into courses values( 'c006','oracle',4000);

insert into courseenrolled values(1,'c001');
insert into courseenrolled values(1,'c004');
insert into courseenrolled values(2,'c003');
insert into courseenrolled values(5,'c006');

-- display the course name joined by john
select coursename from courses where courseno in (select courseno from courseenrolled where rollno=(select rollno from students where studentname='john'));

-- display the coursename where the fee is above 3500
select coursename from courses where fee>3500;

-- display the courses where none of them joined
select coursename from courses where courseno not in (select courseno from courseenrolled);

-- display the course fee of c004
select fee from courses where courseno='c004';

-- display the number of courses joined by prakash
select count(courseno) from courses where courseno in(select courseno from courseenrolled where rollno =(select rollno from students where studentname='prakash'));

-- display the coursenames atleast there is one enrollement
select coursename from courses where courseno in( select courseno from courseenrolled );

-- display the student who joined more than one courses
select studentname from students where rollno =(select rollno from courseenrolled group by rollno having count(rollno)>1);

-- display the student name who joined in oracle course
select studentname from students where rollno in(select rollno from courseenrolled where courseno=(select courseno from courses where coursename='oracle'));
