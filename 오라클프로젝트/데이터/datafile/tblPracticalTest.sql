create table tblPracticalTest(
        practicalTestSeq number primary key,
        openSubjectSeq number not null references tblOpenSubject(openSubjectSeq),
        testDate date not null,
        testQuestion number default 0 not null
);

commit;
select * from tblPracticalTest;

insert into tblPracticalTest values(1, 1, '2021-08-16', 1);
insert into tblPracticalTest values(2, 2, '2021-09-05', 1);
update tblPracticalTest set testDate ='2021-09-03' where practicalTestSeq =2;
insert into tblPracticalTest values(3, 3, '2021-10-20', 1);
insert into tblPracticalTest values(4, 4, '2021-11-15', 1);
insert into tblPracticalTest values(5, 5, '2021-12-11', 1);
update tblPracticalTest set testDate ='2021-12-10' where practicalTestSeq =5;

insert into tblPracticalTest values(6, 6, '2021-07-24', 1);
update tblPracticalTest set testDate ='2021-07-23' where practicalTestSeq =6;

insert into tblPracticalTest values(7, 7, '2021-08-26', 1);
insert into tblPracticalTest values(8, 8, '2021-09-25', 1);
update tblPracticalTest set testDate ='2021-09-24' where practicalTestSeq =8;

insert into tblPracticalTest values(9, 9, '2021-10-28', 1);
insert into tblPracticalTest values(10, 10, '2021-12-27', 1);

insert into tblPracticalTest values(11, 11, '2021-01-01', 1);
insert into tblPracticalTest values(12, 12, '2021-01-01', 1);
insert into tblPracticalTest values(13, 13, '2021-01-01', 1);
insert into tblPracticalTest values(14, 14, '2021-01-01', 1);
insert into tblPracticalTest values(15, 15, '2021-01-01', 1);
insert into tblPracticalTest values(16, 16, '2021-01-01', 1);
insert into tblPracticalTest values(17, 17, '2021-01-01', 1);
insert into tblPracticalTest values(18, 18, '2021-01-01', 1);
insert into tblPracticalTest values(19, 19, '2021-01-01', 1);
insert into tblPracticalTest values(20, 20, '2021-01-01', 1);
insert into tblPracticalTest values(21, 21, '2021-01-01', 1);
insert into tblPracticalTest values(22, 22, '2021-01-01', 1);
insert into tblPracticalTest values(23, 23, '2021-01-01', 1);
insert into tblPracticalTest values(24, 24, '2021-01-01', 1);
insert into tblPracticalTest values(25, 25, '2021-01-01', 1);
insert into tblPracticalTest values(26, 26, '2021-01-01', 1);
insert into tblPracticalTest values(27, 27, '2021-01-01', 1);
insert into tblPracticalTest values(28, 28, '2021-01-01', 1);
insert into tblPracticalTest values(29, 29, '2021-01-01', 1);
insert into tblPracticalTest values(30, 30, '2021-01-01', 1);
insert into tblPracticalTest values(31, 31, '2021-01-01', 1);
insert into tblPracticalTest values(32, 32, '2021-01-01', 1);
insert into tblPracticalTest values(33, 33, '2021-01-01', 1);
insert into tblPracticalTest values(34, 34, '2021-01-01', 1);
insert into tblPracticalTest values(35, 35, '2021-01-01', 1);
insert into tblPracticalTest values(36, 36, '2021-01-01', 1);
insert into tblPracticalTest values(37, 37, '2021-01-01', 1);
insert into tblPracticalTest values(38, 38, '2021-01-01', 1);
insert into tblPracticalTest values(39, 39, '2021-01-01', 1);
insert into tblPracticalTest values(40, 40, '2021-01-01', 1);
insert into tblPracticalTest values(41, 41, '2021-01-01', 1);
insert into tblPracticalTest values(42, 42, '2021-01-01', 1);
insert into tblPracticalTest values(43, 43, '2021-01-01', 1);
insert into tblPracticalTest values(44, 44, '2021-01-01', 1);
insert into tblPracticalTest values(45, 45, '2021-01-01', 1);
insert into tblPracticalTest values(46, 46, '2021-01-01', 1);
insert into tblPracticalTest values(47, 47, '2021-01-01', 1);
insert into tblPracticalTest values(48, 48, '2021-01-01', 1);
insert into tblPracticalTest values(49, 49, '2021-01-01', 1);
insert into tblPracticalTest values(50, 50, '2021-01-01', 1);