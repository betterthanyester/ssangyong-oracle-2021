-- tblPossibleSubject.sql

select * from tblPossibleSubject;


create table tblPossibleSubject (
    teacherSeq number not null references tblTeacher(teacherSeq),
    subjectSeq number not null references tblSubject(subjectSeq)
);



insert into tblPossibleSubject values (4, 1);
insert into tblPossibleSubject values (4, 2);
insert into tblPossibleSubject values (4, 3);
insert into tblPossibleSubject values (4, 4);
insert into tblPossibleSubject values (4, 5);
insert into tblPossibleSubject values (5, 1);
insert into tblPossibleSubject values (5, 2);
insert into tblPossibleSubject values (5, 3);
insert into tblPossibleSubject values (5, 4);
insert into tblPossibleSubject values (5, 5);
insert into tblPossibleSubject values (6, 1);
insert into tblPossibleSubject values (6, 2);
insert into tblPossibleSubject values (6, 3);
insert into tblPossibleSubject values (6, 4);
insert into tblPossibleSubject values (6, 5);
insert into tblPossibleSubject values (7, 1);
insert into tblPossibleSubject values (7, 2);
insert into tblPossibleSubject values (7, 3);
insert into tblPossibleSubject values (7, 4);
insert into tblPossibleSubject values (7, 5);
insert into tblPossibleSubject values (8, 1);
insert into tblPossibleSubject values (8, 2);
insert into tblPossibleSubject values (8, 3);
insert into tblPossibleSubject values (8, 4);
insert into tblPossibleSubject values (8, 5);
insert into tblPossibleSubject values (9, 1);
insert into tblPossibleSubject values (9, 2);
insert into tblPossibleSubject values (9, 3);
insert into tblPossibleSubject values (9, 4);
insert into tblPossibleSubject values (9, 5);
insert into tblPossibleSubject values (10, 1);
insert into tblPossibleSubject values (10, 2);
insert into tblPossibleSubject values (10, 3);
insert into tblPossibleSubject values (10, 4);
insert into tblPossibleSubject values (10, 5);
insert into tblPossibleSubject values (11, 1);
insert into tblPossibleSubject values (11, 2);
insert into tblPossibleSubject values (11, 3);
insert into tblPossibleSubject values (11, 4);
insert into tblPossibleSubject values (11, 5);
insert into tblPossibleSubject values (12, 1);
insert into tblPossibleSubject values (12, 2);
insert into tblPossibleSubject values (12, 3);
insert into tblPossibleSubject values (12, 4);
insert into tblPossibleSubject values (12, 5);
insert into tblPossibleSubject values (13, 1);
insert into tblPossibleSubject values (13, 2);
insert into tblPossibleSubject values (13, 3);
insert into tblPossibleSubject values (13, 4);
insert into tblPossibleSubject values (13, 5);
------------------------------------------------------- 공통
insert into tblPossibleSubject values (13, 12);
insert into tblPossibleSubject values (10, 19);
insert into tblPossibleSubject values (4, 29);
insert into tblPossibleSubject values (6, 24);
insert into tblPossibleSubject values (4, 19);
insert into tblPossibleSubject values (6, 10);
insert into tblPossibleSubject values (10, 27);
insert into tblPossibleSubject values (6, 18);
insert into tblPossibleSubject values (12, 30);
insert into tblPossibleSubject values (11, 24);
insert into tblPossibleSubject values (7, 30);
insert into tblPossibleSubject values (13, 18);
insert into tblPossibleSubject values (9, 11);
insert into tblPossibleSubject values (7, 9);
insert into tblPossibleSubject values (9, 30);
insert into tblPossibleSubject values (13, 19);
insert into tblPossibleSubject values (10, 17);
insert into tblPossibleSubject values (9, 9);
insert into tblPossibleSubject values (4, 18);
insert into tblPossibleSubject values (5, 27);
insert into tblPossibleSubject values (13, 9);
insert into tblPossibleSubject values (6, 27);
insert into tblPossibleSubject values (7, 18);
insert into tblPossibleSubject values (13, 7);
insert into tblPossibleSubject values (5, 12);
insert into tblPossibleSubject values (4, 22);
insert into tblPossibleSubject values (4, 17);
insert into tblPossibleSubject values (5, 26);
insert into tblPossibleSubject values (6, 26);
insert into tblPossibleSubject values (10, 16);
insert into tblPossibleSubject values (11, 24);
insert into tblPossibleSubject values (10, 27);
insert into tblPossibleSubject values (9, 16);
insert into tblPossibleSubject values (12, 11);
insert into tblPossibleSubject values (6, 23);
insert into tblPossibleSubject values (10, 28);
insert into tblPossibleSubject values (8, 29);
insert into tblPossibleSubject values (6, 24);
insert into tblPossibleSubject values (4, 25);
insert into tblPossibleSubject values (9, 10);
insert into tblPossibleSubject values (12, 20);
insert into tblPossibleSubject values (10, 25);
insert into tblPossibleSubject values (12, 25);
insert into tblPossibleSubject values (6, 16);
insert into tblPossibleSubject values (7, 27);
insert into tblPossibleSubject values (8, 18);
insert into tblPossibleSubject values (13, 8);
insert into tblPossibleSubject values (6, 19);
insert into tblPossibleSubject values (8, 25);
insert into tblPossibleSubject values (6, 22);
------------------------------------------------------- 더미, 개별

--insert into tblPossibleSubject values (10, 1);
--insert into tblPossibleSubject values (13, 2);
--insert into tblPossibleSubject values (5, 4);
insert into tblPossibleSubject values (4, 8);
insert into tblPossibleSubject values (8, 22);
--insert into tblPossibleSubject values (11, 1);
--insert into tblPossibleSubject values (12, 3);
--insert into tblPossibleSubject values (7, 4);
insert into tblPossibleSubject values (6, 9);
insert into tblPossibleSubject values (9, 28);
------------------------------------------------------- 실제

commit;

rollback;
























