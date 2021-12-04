create table tblOpenCourse(
	openCourseSeq number primary key,
	courseSeq number not null references tblCourse(courseSeq),
    classroomSeq number not null references tblClassroom(classroomSeq),
	startDate date not null,
    endDate date not null
);
select * from tblOpenCourse;
select * from tblcourse;
select * from TBLCLASSROOM;
drop table tblOpenCourse;

insert into tblOpenCourse values (1,1,1,'2018-01-02','2018-06-14');
insert into tblOpenCourse values (2,2,2,'2018-01-02','2018-06-14');
insert into tblOpenCourse values (3,3,3,'2018-01-02','2018-06-30');
insert into tblOpenCourse values (4,4,4,'2018-01-02','2018-06-30');
insert into tblOpenCourse values (5,5,5,'2018-01-02','2018-07-30');
insert into tblOpenCourse values (6,6,6,'2018-01-02','2018-07-30');

insert into tblOpenCourse values (7,7,1,'2018-08-01','2019-01-11');
insert into tblOpenCourse values (8,8,2,'2018-08-01','2019-01-11');
insert into tblOpenCourse values (9,9,3,'2018-08-01','2019-01-27');
insert into tblOpenCourse values (10,10,4,'2018-08-01','2019-01-27');
insert into tblOpenCourse values (11,11,5,'2018-08-01','2019-02-26');
insert into tblOpenCourse values (12,12,6,'2018-08-01','2019-02-26');


insert into tblOpenCourse values (13,1,1,'2019-03-01','2019-08-11');
insert into tblOpenCourse values (14,2,2,'2019-03-01','2019-08-11');
insert into tblOpenCourse values (15,3,3,'2019-03-01','2019-08-27');
insert into tblOpenCourse values (16,4,4,'2019-03-01','2019-08-27');
insert into tblOpenCourse values (17,5,5,'2019-03-01','2019-09-26');
insert into tblOpenCourse values (18,6,6,'2019-03-01','2019-09-26');


insert into tblOpenCourse values (19,7,1,'2019-10-01','2020-03-12');
insert into tblOpenCourse values (20,8,2,'2019-10-01','2020-03-12');
insert into tblOpenCourse values (21,9,3,'2019-10-01','2020-03-28');
insert into tblOpenCourse values (22,10,4,'2019-10-01','2020-03-28');
insert into tblOpenCourse values (23,11,5,'2019-10-01','2019-04-27');
insert into tblOpenCourse values (24,12,6,'2019-10-01','2020-04-27');

insert into tblOpenCourse values (25,1,1,'2020-05-01','2020-10-11');
insert into tblOpenCourse values (26,2,2,'2020-05-01','2020-10-11');
insert into tblOpenCourse values (27,3,3,'2020-05-01','2020-10-27');
insert into tblOpenCourse values (28,4,4,'2020-05-01','2020-10-27');
insert into tblOpenCourse values (29,5,5,'2020-05-01','2020-11-26');
insert into tblOpenCourse values (30,6,6,'2020-05-01','2020-11-26');

insert into tblOpenCourse values (31,7,1,'2020-12-01','2021-05-13');
insert into tblOpenCourse values (32,8,2,'2020-12-01','2021-05-13');
insert into tblOpenCourse values (33,9,3,'2020-12-01','2021-05-29');
insert into tblOpenCourse values (34,10,4,'2020-12-01','2021-05-29');
insert into tblOpenCourse values (35,11,5,'2020-12-01','2021-06-28');
insert into tblOpenCourse values (36,12,6,'2020-12-01','2021-06-28');

insert into tblOpenCourse values (37,1,1,'2021-07-01','2021-12-11');
insert into tblOpenCourse values (38,2,2,'2021-07-01','2021-12-11');
insert into tblOpenCourse values (39,3,3,'2021-07-01','2021-12-27');
insert into tblOpenCourse values (40,4,4,'2021-07-01','2021-12-27');
insert into tblOpenCourse values (41,5,5,'2021-07-01','2022-01-26');
insert into tblOpenCourse values (42,6,6,'2021-07-01','2022-01-26');

select * from tblOpenCourse;

commit;