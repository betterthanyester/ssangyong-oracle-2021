create table tblSubjectOrder(
    courseSeq number not null references tblCourse(courseSeq),
	subjectSeq number not null references tblSubject(subjectSeq),
	subjectOrder number not null
);

drop table tblSubjectOrder;

insert into tblSubjectOrder values(1, 1, 1);
insert into tblSubjectOrder values(1, 2, 2);
insert into tblSubjectOrder values(1, 4, 3);
insert into tblSubjectOrder values(1, 8, 4);
insert into tblSubjectOrder values(1, 22, 5);
insert into tblSubjectOrder values(2, 2, 1);
insert into tblSubjectOrder values(2, 1, 2);
insert into tblSubjectOrder values(2, 4, 3);
insert into tblSubjectOrder values(2, 10, 4);
insert into tblSubjectOrder values(2, 13, 5);
insert into tblSubjectOrder values(3, 1, 1);
insert into tblSubjectOrder values(3, 3, 2);
insert into tblSubjectOrder values(3, 4, 3);
insert into tblSubjectOrder values(3, 9, 4);
insert into tblSubjectOrder values(3, 28, 5);
insert into tblSubjectOrder values(4, 3, 1);
insert into tblSubjectOrder values(4, 5, 2);
insert into tblSubjectOrder values(4, 4, 3);
insert into tblSubjectOrder values(4, 30, 4);
insert into tblSubjectOrder values(4, 29, 5);
insert into tblSubjectOrder values(5, 4, 1);
insert into tblSubjectOrder values(5, 2, 2);
insert into tblSubjectOrder values(5, 1, 3);
insert into tblSubjectOrder values(5, 21, 4);
insert into tblSubjectOrder values(5, 20, 5);
insert into tblSubjectOrder values(6, 2, 1);
insert into tblSubjectOrder values(6, 5, 2);
insert into tblSubjectOrder values(6, 4, 3);
insert into tblSubjectOrder values(6, 30, 4);
insert into tblSubjectOrder values(6, 19, 5);
insert into tblSubjectOrder values(7, 5, 1);
insert into tblSubjectOrder values(7, 1, 2);
insert into tblSubjectOrder values(7, 3, 3);
insert into tblSubjectOrder values(7, 17, 4);
insert into tblSubjectOrder values(7, 26, 5);
insert into tblSubjectOrder values(8, 2, 1);
insert into tblSubjectOrder values(8, 3, 2);
insert into tblSubjectOrder values(8, 1, 3);
insert into tblSubjectOrder values(8, 27, 4);
insert into tblSubjectOrder values(8, 26, 5);
insert into tblSubjectOrder values(9, 1, 1);
insert into tblSubjectOrder values(9, 3, 2);
insert into tblSubjectOrder values(9, 5, 3);
insert into tblSubjectOrder values(9, 6, 4);
insert into tblSubjectOrder values(9, 30, 5);
insert into tblSubjectOrder values(10, 5, 1);
insert into tblSubjectOrder values(10, 2, 2);
insert into tblSubjectOrder values(10, 4, 3);
insert into tblSubjectOrder values(10, 12, 4);
insert into tblSubjectOrder values(10, 21, 5);
insert into tblSubjectOrder values(11, 2, 1);
insert into tblSubjectOrder values(11, 3, 2);
insert into tblSubjectOrder values(11, 1, 3);
insert into tblSubjectOrder values(11, 14, 4);
insert into tblSubjectOrder values(11, 19, 5);
insert into tblSubjectOrder values(12, 3, 1);
insert into tblSubjectOrder values(12, 1, 2);
insert into tblSubjectOrder values(12, 4, 3);
insert into tblSubjectOrder values(12, 12, 4);
insert into tblSubjectOrder values(12, 7, 5);

commit;

select * from tblSubjectOrder;
