--tblOpenSubject

--테이블 생성
create table tblOpenSubject(
	openSubjectSeq number primary key,
	openCourseSeq number not null references tblOpenCourse(openCourseSeq),
	teacherSeq number not null references tblTeacher(teacherSeq),
	subjectSeq number not null references tblSubject(subjectSeq),
	startDate date not null,
	endDate date not null
);
drop table tblOpenSubject;
select * from tblOpenSubject;
select * from TBLSUGANG;
--데이터 생성
--openCourseSeq 37 > 과정 1 > 공통1,2,4 개별8,22

insert into tblOpenSubject values (1, 37, 10, 1, '2021-07-02', '2021-08-16');
insert into tblOpenSubject values (2, 37, 13, 2, '2021-08-17', '2021-09-05');
insert into tblOpenSubject values (3, 37, 5, 4, '2021-09-06', '2021-10-20');
insert into tblOpenSubject values (4, 37, 4, 8, '2021-10-21', '2021-11-15');
insert into tblOpenSubject values (5, 37, 8, 22, '2021-11-16', '2021-12-11');
--openCourseSeq 39 > 과정 3 > 공통1,3,4 개별9,28
insert into tblOpenSubject values (6, 39, 11, 1, '2021-07-02', '2021-07-24');
insert into tblOpenSubject values (7, 39, 12, 3, '2021-07-25', '2021-08-26');
insert into tblOpenSubject values (8, 39, 7, 4, '2021-08-27', '2021-09-25');
insert into tblOpenSubject values (9, 39, 6, 9, '2021-09-26', '2021-10-28');
insert into tblOpenSubject values (10, 39, 9, 28, '2021-10-29', '2021-12-27');
--더미용
insert into tblOpenSubject values (11, 10, 8, 19, '2020-06-05', '2020-07-09');
insert into tblOpenSubject values (12, 30, 5, 2, '2020-09-20', '2020-10-25');
insert into tblOpenSubject values (13, 11, 10, 14, '2018-12-02', '2019-01-04');
insert into tblOpenSubject values (14, 7, 7, 28, '2020-11-05', '2020-12-08');
insert into tblOpenSubject values (15, 4, 13, 23, '2018-12-02', '2019-01-02');
insert into tblOpenSubject values (16, 5, 9, 14, '2019-01-06', '2019-02-02');
insert into tblOpenSubject values (17, 24, 13, 5, '2019-12-02', '2020-01-08');
insert into tblOpenSubject values (18, 36, 7, 27, '2020-12-13', '2021-01-12');
insert into tblOpenSubject values (19, 11, 12, 22, '2019-06-02', '2019-06-25');
insert into tblOpenSubject values (20, 42, 9, 30, '2018-08-02', '2018-09-06');
insert into tblOpenSubject values (21, 9, 9, 10, '2020-01-02', '2020-02-03');
insert into tblOpenSubject values (22, 34, 13, 1, '2019-02-13', '2019-03-11');
insert into tblOpenSubject values (23, 8, 11, 22, '2018-01-02', '2018-02-02');
insert into tblOpenSubject values (24, 29, 10, 17, '2020-09-02', '2020-09-13');
insert into tblOpenSubject values (25, 6, 9, 17, '2020-04-18', '2020-05-06');
insert into tblOpenSubject values (26, 2, 10, 28, '2020-01-02', '2020-01-10');
insert into tblOpenSubject values (27, 5, 13, 6, '2019-11-15', '2019-12-09');
insert into tblOpenSubject values (28, 27, 8, 28, '2018-01-02', '2018-02-04');
insert into tblOpenSubject values (29, 8, 4, 18, '2018-11-13', '2018-12-08');
insert into tblOpenSubject values (30, 12, 11, 25, '2019-05-01', '2019-05-13');
insert into tblOpenSubject values (31, 24, 13, 22, '2020-09-03', '2020-09-18');
insert into tblOpenSubject values (32, 33, 6, 2, '2020-08-09', '2020-08-28');
insert into tblOpenSubject values (33, 1, 13, 29, '2018-06-05', '2018-07-03');
insert into tblOpenSubject values (34, 7, 7, 30, '2020-10-01', '2020-10-12');
insert into tblOpenSubject values (35, 3, 6, 14, '2018-11-05', '2018-11-19');
insert into tblOpenSubject values (36, 40, 7, 30, '2020-11-26', '2020-12-11');
insert into tblOpenSubject values (37, 4, 10, 24, '2018-07-24', '2018-08-01');
insert into tblOpenSubject values (38, 21, 8, 11, '2018-07-18', '2020-08-05');
insert into tblOpenSubject values (39, 9, 11, 26, '2020-11-02', '2020-11-18');
insert into tblOpenSubject values (40, 15, 8, 1, '2018-01-02', '2021-01-18');
insert into tblOpenSubject values (41, 12, 7, 5, '2018-01-02', '2020-10-31');
insert into tblOpenSubject values (42, 14, 10, 2, '2019-01-02', '2019-01-15');
insert into tblOpenSubject values (43, 5, 11, 23, '2018-07-15', '2018-08-16');
insert into tblOpenSubject values (44, 7, 8, 18, '2018-12-22', '2019-01-15');
insert into tblOpenSubject values (45, 8, 12, 14, '2019-05-01', '2019-05-15');
insert into tblOpenSubject values (46, 2, 10, 19, '2019-01-05', '2019-01-22');
insert into tblOpenSubject values (47, 13, 9, 4, '2018-07-27', '2018-08-10');
insert into tblOpenSubject values (48, 12, 6, 10, '2020-10-15', '2020-11-14');
insert into tblOpenSubject values (49, 10, 6, 26, '2019-06-07', '2019-07-06');
insert into tblOpenSubject values (50, 7, 9, 27, '2020-11-25', '2020-12-01');

commit;

--테이블 셀렉/삭제
select * from tblOpenSubject;
drop table tblOpenSubject;

















