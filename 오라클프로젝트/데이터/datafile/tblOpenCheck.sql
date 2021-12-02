create table tblOpenCheck(
    checkSeq number not null primary key,
    openCourseSeq number not null references TBLOPENCOURSE(OPENCOURSESEQ),
    checkOpen varchar2(10) not null check (checkOpen in ('등록','미등록'))
);
drop table tblOpenCheck;

insert into tblOpenCheck (checkSeq, openCourseSeq, checkOpen) VALUES (1,37,'등록');
insert into tblOpenCheck (checkSeq, openCourseSeq, checkOpen) VALUES (2,38,'등록');
insert into tblOpenCheck (checkSeq, openCourseSeq, checkOpen) VALUES (3,39,'등록');
insert into tblOpenCheck (checkSeq, openCourseSeq, checkOpen) VALUES (4,40,'등록');
insert into tblOpenCheck (checkSeq, openCourseSeq, checkOpen) VALUES (5,41,'등록');
insert into tblOpenCheck (checkSeq, openCourseSeq, checkOpen) VALUES (6,42,'등록');

commit;