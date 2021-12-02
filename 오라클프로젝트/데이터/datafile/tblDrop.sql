create table tblDrop(
	openCourseSeq number not null references tblOpenCourse(openCourseSeq),
    dropDate date not null,
    sugangSeq number not null references tblSugang(sugangSeq)
);
select * from TBLOPENCOURSE;
select * from TBLSUGANG;
insert into tblDrop (openCourseSeq, dropDate, sugangSeq) VALUES (37,'2021-08-07',4); --17번학생 중도탈락
insert into tblDrop (openCourseSeq, dropDate, sugangSeq) VALUES (38,'2021-09-07',45); --58번학생 중도탈락
insert into tblDrop (openCourseSeq, dropDate, sugangSeq) VALUES (38,'2021-07-31',50); --63번학생 중도탈락
insert into tblDrop (openCourseSeq, dropDate, sugangSeq) VALUES (39,'2021-08-02',74); --87번학생 중도탈락
insert into tblDrop (openCourseSeq, dropDate, sugangSeq) VALUES (41,'2021-08-07',137); --150번학생 중도탈락
insert into tblDrop (openCourseSeq, dropDate, sugangSeq) VALUES (42,'2021-10-02',166); --179번학생 중도탈락

