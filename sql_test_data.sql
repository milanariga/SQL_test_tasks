--Data sets

--1+2

create table stud( id integer not null primary key, fio varchar2(50) not null unique); 
create table teach( id integer not null primary key, fio varchar2(50) not null unique); 
create table lect( 
stud integer not null references stud(id), 
teach integer not null references teach(id), 
subj varchar2(20) not null, 
lectdate timestamp not null,
lectdur integer not null, 
room varchar2(20) not null); 
insert into stud values (1, 'Jane Joe');
insert into stud values (2, 'Alex Wo');
insert into stud values (3, 'Katy Bee');
insert into stud values (4, 'Joshua Lock');
insert into stud values (5, 'Daniel Frommer');
insert into stud values (6, 'Bea Wolt');
insert into stud values (7, 'Chris Red');
insert into teach values (11, 'Lecturer 1');
insert into teach values (12, 'Lecturer 2');
insert into teach values (13, 'Lecturer 3');
insert into teach values (14, 'Lecturer 4');
insert into lect values (1, 11, 'Math', TO_TIMESTAMP('2020/03/13 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (1, 11, 'Math', TO_TIMESTAMP('2020/03/14 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (1, 11, 'Math', TO_TIMESTAMP('2020/03/15 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (2, 11, 'Math', TO_TIMESTAMP('2020/03/13 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (2, 12, 'Math', TO_TIMESTAMP('2020/03/14 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (2, 11, 'Math', TO_TIMESTAMP('2020/03/15 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (2, 13, 'Math', TO_TIMESTAMP('2020/03/16 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (2, 11, 'Math', TO_TIMESTAMP('2020/03/17 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (3, 11, 'Math', TO_TIMESTAMP('2020/03/13 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (3, 11, 'Math', TO_TIMESTAMP('2020/03/14 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (6, 11, 'Math', TO_TIMESTAMP('2020/03/13 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (6, 11, 'Math', TO_TIMESTAMP('2020/03/14 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (6, 11, 'Math', TO_TIMESTAMP('2020/03/15 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (6, 11, 'Math', TO_TIMESTAMP('2020/03/17 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (6, 11, 'Math', TO_TIMESTAMP('2020/03/18 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (7, 12, 'Math', TO_TIMESTAMP('2020/03/19 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (7, 12, 'Math', TO_TIMESTAMP('2020/03/19 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (7, 12, 'Math', TO_TIMESTAMP('2020/03/19 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (7, 12, 'Math', TO_TIMESTAMP('2020/03/19 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');
insert into lect values (7, 12, 'Math', TO_TIMESTAMP('2020/03/19 10:00:00', 'YYYY/MM/DD HH:MI:SS'), 60, '23');

--3
create table stud( id integer not null primary key, fio varchar2(50) not null unique); 
create table teach( id integer not null primary key, fio varchar2(50) not null unique); 
create table lect( 
stud integer not null references stud(id), 
teach integer not null references teach(id), 
subj varchar2(20) not null, 
lectdate timestamp not null,
lectdur integer not null, 
room varchar2(20) not null); 
insert into stud values (1, 'Jane Joe');
insert into stud values (2, 'Alex Wo');
insert into stud values (3, 'Katy Bee');
insert into stud values (4, 'Joshua Lock');
insert into stud values (5, 'Daniel Frommer');
insert into teach values (11, 'Lecturer 1');
insert into teach values (12, 'Lecturer 2');
insert into teach values (13, 'Lecturer 3');
insert into lect values (1, 11, 'Math', TO_TIMESTAMP('2020/03/02 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 90, '12');
insert into lect values (1, 13, 'Bio', TO_TIMESTAMP('2020/03/02 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '12');
insert into lect values (1, 11, 'Math', TO_TIMESTAMP('2020/03/15 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '24');
insert into lect values (2, 12, 'Math', TO_TIMESTAMP('2020/03/13 15:00:00', 'YYYY/MM/DD HH24:MI:SS'), 120, '45');
insert into lect values (2, 12, 'Data Science', TO_TIMESTAMP('2020/03/14 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (2, 13, 'Math', TO_TIMESTAMP('2020/03/01 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '55');
insert into lect values (2, 11, 'Math', TO_TIMESTAMP('2020/03/02 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (3, 11, 'Math', TO_TIMESTAMP('2020/03/13 16:30:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '45');
insert into lect values (3, 11, 'Bio', TO_TIMESTAMP('2020/03/14 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '29');
insert into lect values (4, 11, 'Math', TO_TIMESTAMP('2020/03/13 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (4, 11, 'Math', TO_TIMESTAMP('2020/03/14 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (5, 12, 'Math', TO_TIMESTAMP('2020/03/15 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (5, 11, 'Math', TO_TIMESTAMP('2020/03/17 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (4, 12, 'Math', TO_TIMESTAMP('2020/03/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (4, 12, 'Math', TO_TIMESTAMP('2020/03/19 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 90, '23');
insert into lect values (5, 12, 'Math', TO_TIMESTAMP('2020/03/19 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '11');
insert into lect values (5, 12, 'Math', TO_TIMESTAMP('2020/03/20 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '22');
insert into lect values (1, 12, 'Data Science', TO_TIMESTAMP('2020/03/01 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '55');
insert into lect values (4, 11, 'Prog', TO_TIMESTAMP('2020/03/31 17:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '42');
insert into lect values (5, 12, 'Math', TO_TIMESTAMP('2020/03/31 17:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '42');
insert into lect values (4, 13, 'Math', TO_TIMESTAMP('2020/03/05 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '29');
insert into lect values (5, 13, 'Bio', TO_TIMESTAMP('2020/03/05 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');

--5+6
create table stud( id integer not null primary key, fio varchar2(50) not null unique); 
create table teach( id integer not null primary key, fio varchar2(50) not null unique); 
create table lect( 
stud integer not null references stud(id), 
teach integer not null references teach(id), 
subj varchar2(20) not null, 
lectdate timestamp not null,
lectdur integer not null, 
room varchar2(20) not null); 
insert into stud values (1, 'Jane Joe');
insert into stud values (2, 'Alex Wo');
insert into stud values (3, 'Katy Bee');
insert into stud values (4, 'Joshua Lock');
insert into stud values (5, 'Daniel Frommer');
insert into stud values (6, 'Bea Wolt');
insert into stud values (7, 'Chris Red');
insert into teach values (11, 'Lecturer 1');
insert into teach values (12, 'Lecturer 2');
insert into teach values (13, 'Lecturer 3');
insert into teach values (14, 'Lecturer 4');
insert into lect values (1, 11, 'Math', TO_TIMESTAMP('2020/02/02 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '12');
insert into lect values (1, 13, 'Physics', TO_TIMESTAMP('2020/03/02 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '12');
insert into lect values (1, 11, 'Prog', TO_TIMESTAMP('2020/04/15 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '24');
insert into lect values (1, 13, 'Economics', TO_TIMESTAMP('2020/06/02 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '12');
insert into lect values (1, 11, 'Prog', TO_TIMESTAMP('2020/07/15 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '24');
insert into lect values (1, 14, 'Physics', TO_TIMESTAMP('2020/04/02 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '12');
insert into lect values (1, 11, 'Math', TO_TIMESTAMP('2020/04/15 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '24');
insert into lect values (1, 13, 'Physics', TO_TIMESTAMP('2020/03/02 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '12');
insert into lect values (1, 11, 'Prog', TO_TIMESTAMP('2020/04/15 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '24');
insert into lect values (2, 14, 'Economics', TO_TIMESTAMP('2020/03/13 15:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (2, 12, 'Physics', TO_TIMESTAMP('2020/06/14 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (2, 13, 'Math', TO_TIMESTAMP('2020/07/01 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (2, 11, 'Prog', TO_TIMESTAMP('2020/06/17 18:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (2, 11, 'Math', TO_TIMESTAMP('2020/07/25 15:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (2, 11, 'Prog', TO_TIMESTAMP('2020/07/24 18:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (2, 11, 'Physics', TO_TIMESTAMP('2020/03/17 18:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (2, 11, 'Economics', TO_TIMESTAMP('2020/03/17 18:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (2, 11, 'Physics', TO_TIMESTAMP('2020/03/17 18:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (3, 11, 'Math', TO_TIMESTAMP('2020/03/13 15:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (3, 11, 'Economics', TO_TIMESTAMP('2020/07/14 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '29');
insert into lect values (6, 11, 'Physics', TO_TIMESTAMP('2020/03/13 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (6, 11, 'Math', TO_TIMESTAMP('2020/03/14 16:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (6, 14, 'Economics', TO_TIMESTAMP('2020/06/15 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (6, 11, 'Math', TO_TIMESTAMP('2020/07/17 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (6, 12, 'Physics', TO_TIMESTAMP('2020/03/19 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '25');
insert into lect values (7, 12, 'Math', TO_TIMESTAMP('2020/07/19 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (7, 12, 'Physics', TO_TIMESTAMP('2020/06/19 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '11');
insert into lect values (7, 12, 'Economics', TO_TIMESTAMP('2020/05/20 10:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '22');
insert into lect values (5, 14, 'Prog', TO_TIMESTAMP('2020/03/01 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (1, 13, 'Economics', TO_TIMESTAMP('2020/03/01 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (4, 11, 'Prog', TO_TIMESTAMP('2020/03/01 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');
insert into lect values (1, 14, 'Economics', TO_TIMESTAMP('2020/03/01 12:00:00', 'YYYY/MM/DD HH24:MI:SS'), 60, '23');

