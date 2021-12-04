-- tblWrittenTest.sql


create table tblWrittenTest (
    testSeq number primary key,
    openSubjectSeq number not null references tblOpenSubject(openSubjectSeq),
    testDate date not null,
    testQuestion number default 0 not null
);



insert into tblWrittenTest values (1, 1, '2021-08-15', 1);
insert into tblWrittenTest values (2, 2, '2021-09-04', 1);
update tblWrittenTest set testDate ='2021-09-03' where TestSeq =2;

insert into tblWrittenTest values (3, 3, '2021-10-19', 1);
insert into tblWrittenTest values (4, 4, '2021-11-14', 1);
update tblWrittenTest set testDate ='2021-11-12' where TestSeq =4;

insert into tblWrittenTest values (5, 5, '2021-12-10', 1);
update tblWrittenTest set testDate ='2021-12-06' where TestSeq =5;


insert into tblWrittenTest values (6, 6, '2021-07-23', 1);
update tblWrittenTest set testDate ='2021-07-19' where TestSeq =6;

insert into tblWrittenTest values (7, 7, '2021-08-25', 1);


insert into tblWrittenTest values (8, 8, '2021-09-24', 1);
update tblWrittenTest set testDate ='2021-09-22' where TestSeq =8;

insert into tblWrittenTest values (9, 9, '2021-10-27', 1);
insert into tblWrittenTest values (10, 10, '2021-12-26', 1);


insert into tblWrittenTest values (11, 11, '2020-04-27', 1);
insert into tblWrittenTest values (12, 12, '2019-06-24', 0);
insert into tblWrittenTest values (13, 13, '2018-07-14', 0);
insert into tblWrittenTest values (14, 14, '2020-03-29', 1);
insert into tblWrittenTest values (15, 15, '2020-12-21', 1);
insert into tblWrittenTest values (16, 16, '2019-04-01', 0);
insert into tblWrittenTest values (17, 17, '2021-11-08', 0);
insert into tblWrittenTest values (18, 18, '2020-05-19', 0);
insert into tblWrittenTest values (19, 19, '2020-08-19', 0);
insert into tblWrittenTest values (20, 20, '2019-01-07', 0);
insert into tblWrittenTest values (21, 21, '2021-06-24', 1);
insert into tblWrittenTest values (22, 22, '2018-10-01', 0);
insert into tblWrittenTest values (23, 23, '2021-12-10', 0);
insert into tblWrittenTest values (24, 24, '2019-03-22', 1);
insert into tblWrittenTest values (25, 25, '2019-06-18', 0);
insert into tblWrittenTest values (26, 26, '2020-07-22', 0);
insert into tblWrittenTest values (27, 27, '2021-06-02', 1);
insert into tblWrittenTest values (28, 28, '2019-01-09', 0);
insert into tblWrittenTest values (29, 29, '2019-12-10', 1);
insert into tblWrittenTest values (30, 30, '2019-07-20', 1);
insert into tblWrittenTest values (31, 31, '2020-10-09', 1);
insert into tblWrittenTest values (32, 32, '2020-03-15', 0);
insert into tblWrittenTest values (33, 33, '2020-09-22', 0);
insert into tblWrittenTest values (34, 34, '2019-06-10', 0);
insert into tblWrittenTest values (35, 35, '2019-11-03', 0);
insert into tblWrittenTest values (36, 36, '2018-09-24', 0);
insert into tblWrittenTest values (37, 37, '2019-05-28', 0);
insert into tblWrittenTest values (38, 38, '2019-07-14', 1);
insert into tblWrittenTest values (39, 39, '2020-05-13', 0);
insert into tblWrittenTest values (40, 40, '2020-12-28', 0);
insert into tblWrittenTest values (41, 41, '2019-05-20', 0);
insert into tblWrittenTest values (42, 42, '2021-01-23', 0);
insert into tblWrittenTest values (43, 43, '2019-06-19', 1);
insert into tblWrittenTest values (44, 44, '2018-07-22', 0);
insert into tblWrittenTest values (45, 45, '2020-05-11', 0);
insert into tblWrittenTest values (46, 46, '2021-10-15', 0);
insert into tblWrittenTest values (47, 47, '2018-11-02', 1);
insert into tblWrittenTest values (48, 48, '2021-03-13', 0);
insert into tblWrittenTest values (49, 49, '2021-10-21', 1);
insert into tblWrittenTest values (50, 50, '2019-06-09', 0);


commit;


select * from tblWrittenTest;
drop table tblWrittenTest;



















