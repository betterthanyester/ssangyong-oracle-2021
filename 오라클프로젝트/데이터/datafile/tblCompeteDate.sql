create table tblCompleteDate(
    completeSeq number primary key,
    sugangSeq number not null references TBLSUGANG(SUGANGSEQ),
    completeDate date null
);
select * from TBLOPENCOURSE;
drop table tblCompleteDate;
select * from TBLSUGANG;
insert into tblCompleteDate values (1,169,'2018-06-14');
insert into tblCompleteDate values (2,170,'2018-06-14');
insert into tblCompleteDate values (3,171,'2018-06-14'); --1번과정
insert into tblCompleteDate values (4,172,'2020-10-11'); --25번과정
insert into tblCompleteDate values (5,173,'2020-11-26'); --30번
insert into tblCompleteDate values (6,174,'2020-04-27'); --24번
insert into tblCompleteDate values (7,175,'2019-01-11'); --7번
insert into tblCompleteDate values (8,176,'2020-10-27'); --28번
insert into tblCompleteDate values (9,177,'2021-05-13'); --31번
insert into tblCompleteDate values (10,178,'2020-10-27'); --28번
insert into tblCompleteDate values (11,179,'2021-05-29'); --34번
insert into tblCompleteDate values (12,180,'2021-06-28'); --36번
insert into tblCompleteDate values (13,181,'2020-10-11'); --25번
insert into tblCompleteDate values (14,182,'2019-02-26'); --11번
insert into tblCompleteDate values (15,183,'2018-07-30'); --6번
insert into tblCompleteDate values (16,184,'2018-06-14'); --1번
insert into tblCompleteDate values (17,185,'2019-09-26'); --18번
insert into tblCompleteDate values (18,186,'2020-03-28'); --22번과정
insert into tblCompleteDate values (19,187,'2020-03-28');

drop sequence seqComplete;
create sequence seqComplete start with 20;
commit;
