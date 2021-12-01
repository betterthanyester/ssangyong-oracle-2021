create table tblPracticalTest(
        practicalTestSeq number primary key,
        openSubjectSeq number not null references tblOpenSubject(openSubjectSeq),
        testDate date not null,
        testQuestion number default 0 not null
);


insert into tblpracticalTest values(1, 1, '2021-08-16', 1);
insert into tblpracticalTest values(2, 2, '2021-09-05', 1);
insert into tblpracticalTest values(3, 3, '2021-10-20', 1);
insert into tblpracticalTest values(4, 4, '2021-11-15', 1);
insert into tblpracticalTest values(5, 5, '2021-12-11', 1);
insert into tblpracticalTest values(6, 6, '2021-07-24', 1);
insert into tblpracticalTest values(7, 7, '2021-08-26', 1);
insert into tblpracticalTest values(8, 8, '2021-09-25', 1);
insert into tblpracticalTest values(9, 9, '2021-10-28', 1);
insert into tblpracticalTest values(10, 10, '2021-12-27', 1);
insert into tblpracticalTest values(11, 11, '2021-01-01', 1);
insert into tblpracticalTest values(12, 12, '2021-01-01', 1);
insert into tblpracticalTest values(13, 13, '2021-01-01', 1);
insert into tblpracticalTest values(14, 14, '2021-01-01', 1);
insert into tblpracticalTest values(15, 15, '2021-01-01', 1);
insert into tblpracticalTest values(16, 16, '2021-01-01', 1);
insert into tblpracticalTest values(17, 17, '2021-01-01', 1);
insert into tblpracticalTest values(18, 18, '2021-01-01', 1);
insert into tblpracticalTest values(19, 19, '2021-01-01', 1);
insert into tblpracticalTest values(20, 20, '2021-01-01', 1);
insert into tblpracticalTest values(21, 21, '2021-01-01', 1);
insert into tblpracticalTest values(22, 22, '2021-01-01', 1);
insert into tblpracticalTest values(23, 23, '2021-01-01', 1);
insert into tblpracticalTest values(24, 24, '2021-01-01', 1);
insert into tblpracticalTest values(25, 25, '2021-01-01', 1);
insert into tblpracticalTest values(26, 26, '2021-01-01', 1);
insert into tblpracticalTest values(27, 27, '2021-01-01', 1);
insert into tblpracticalTest values(28, 28, '2021-01-01', 1);
insert into tblpracticalTest values(29, 29, '2021-01-01', 1);
insert into tblpracticalTest values(30, 30, '2021-01-01', 1);
insert into tblpracticalTest values(31, 31, '2021-01-01', 1);
insert into tblpracticalTest values(32, 32, '2021-01-01', 1);
insert into tblpracticalTest values(33, 33, '2021-01-01', 1);
insert into tblpracticalTest values(34, 34, '2021-01-01', 1);
insert into tblpracticalTest values(35, 35, '2021-01-01', 1);
insert into tblpracticalTest values(36, 36, '2021-01-01', 1);
insert into tblpracticalTest values(37, 37, '2021-01-01', 1);
insert into tblpracticalTest values(38, 38, '2021-01-01', 1);
insert into tblpracticalTest values(39, 39, '2021-01-01', 1);
insert into tblpracticalTest values(40, 40, '2021-01-01', 1);
insert into tblpracticalTest values(41, 41, '2021-01-01', 1);
insert into tblpracticalTest values(42, 42, '2021-01-01', 1);
insert into tblpracticalTest values(43, 43, '2021-01-01', 1);
insert into tblpracticalTest values(44, 44, '2021-01-01', 1);
insert into tblpracticalTest values(45, 45, '2021-01-01', 1);
insert into tblpracticalTest values(46, 46, '2021-01-01', 1);
insert into tblpracticalTest values(47, 47, '2021-01-01', 1);
insert into tblpracticalTest values(48, 48, '2021-01-01', 1);
insert into tblpracticalTest values(49, 49, '2021-01-01', 1);
insert into tblpracticalTest values(50, 50, '2021-01-01', 1);

commit;