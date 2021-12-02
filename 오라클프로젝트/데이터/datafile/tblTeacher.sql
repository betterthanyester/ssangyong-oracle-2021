create table tblTeacher (
          teacherSeq number not null references tblMember(memberSeq) primary key
);

insert into tblTeacher values (4);
insert into tblTeacher values (5);
insert into tblTeacher values (6);
insert into tblTeacher values (7);
insert into tblTeacher values (8);
insert into tblTeacher values (9);
insert into tblTeacher values (10);
insert into tblTeacher values (11);
insert into tblTeacher values (12);
insert into tblTeacher values (13);



select * from tblTeacher;

