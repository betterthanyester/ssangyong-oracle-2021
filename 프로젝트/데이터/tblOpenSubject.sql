--tblOpenSubject

--테이블 생성
create table tblOpenSubject(
	openSubjectSeq number primary key,
	openCounreSeq number not null references tblOpenCourse(openCourseSeq),
    teacherSeq number not null references tblTeacher(teacherSeq),
    subjectSeq number not null references tblSubject(subjectSeq),
    startDate date not null,
    endDate date not null
);

--데이터 생성
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (1, 5, 13, 27, '2018-06-11', '2019-04-14');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (2, 6, 9, 10, '2018-02-23', '2020-04-02');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (3, 9, 9, 22, '2018-05-04', '2020-04-11');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (4, 1, 7, 22, '2018-04-04', '2018-04-25');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (5, 12, 8, 19, '2018-02-24', '2020-10-22');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (6, 12, 10, 10, '2018-02-26', '2018-10-18');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (7, 6, 5, 15, '2018-01-23', '2019-01-27');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (8, 4, 9, 14, '2018-01-13', '2021-05-08');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (9, 4, 12, 16, '2018-05-15', '2019-08-13');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (10, 6, 9, 10, '2018-02-13', '2020-04-14');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (11, 3, 13, 28, '2018-03-30', '2018-04-15');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (12, 4, 7, 22, '2018-01-20', '2021-07-09');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (13, 12, 13, 25, '2018-06-13', '2021-07-06');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (14, 1, 10, 13, '2018-01-31', '2020-03-31');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (15, 3, 6, 17, '2018-03-09', '2018-09-25');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (16, 11, 10, 11, '2018-03-20', '2020-09-24');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (17, 8, 7, 8, '2018-04-11', '2018-08-14');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (18, 11, 8, 7, '2018-03-14', '2019-05-21');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (19, 3, 12, 27, '2018-05-20', '2021-06-04');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (20, 12, 11, 4, '2018-04-12', '2018-06-22');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (21, 4, 9, 17, '2018-03-15', '2021-06-22');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (22, 4, 5, 1, '2018-04-17', '2021-06-18');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (23, 8, 13, 20, '2018-03-19', '2018-10-27');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (24, 10, 6, 23, '2018-02-23', '2021-11-04');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (25, 3, 13, 20, '2018-02-06', '2019-09-29');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (26, 7, 7, 9, '2018-05-18', '2019-07-30');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (27, 3, 7, 12, '2018-04-19', '2020-02-18');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (28, 12, 6, 24, '2018-05-07', '2021-05-08');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (29, 2, 11, 22, '2018-04-15', '2018-11-21');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (30, 10, 13, 27, '2018-03-22', '2018-08-16');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (31, 2, 7, 10, '2018-02-23', '2020-06-05');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (32, 4, 11, 4, '2018-02-21', '2020-12-12');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (33, 5, 13, 23, '2018-06-01', '2020-12-01');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (34, 9, 10, 7, '2018-03-03', '2020-08-05');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (35, 5, 4, 5, '2018-04-24', '2021-08-25');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (36, 7, 5, 21, '2018-03-06', '2018-11-17');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (37, 9, 10, 25, '2018-05-29', '2021-06-07');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (38, 11, 7, 22, '2018-03-21', '2020-06-04');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (39, 3, 12, 24, '2018-03-10', '2019-03-12');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (40, 2, 11, 25, '2018-02-23', '2021-01-24');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (41, 9, 4, 20, '2018-01-17', '2021-12-27');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (42, 12, 7, 4, '2018-04-10', '2018-08-27');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (43, 11, 7, 13, '2018-01-25', '2019-03-16');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (44, 6, 9, 17, '2018-01-28', '2021-02-09');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (45, 7, 12, 18, '2018-06-06', '2020-08-09');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (46, 7, 13, 13, '2018-03-23', '2020-04-13');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (47, 2, 12, 19, '2018-02-17', '2019-10-30');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (48, 9, 9, 28, '2018-01-31', '2018-07-28');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (49, 2, 6, 26, '2018-05-08', '2021-06-09');
insert into tblOpenSubject (openSubjectSeq, openCourseSeq, teacherSeq, subjectSeq, startDate, endDate) values (50, 1, 12, 14, '2018-01-07', '2019-07-17');

commit;

--테이블 셀렉/삭제
select * from tblOpenSubject;
drop table tblOpenSubject;

















