--강의실
drop table tblClassroom;
create table tblClassroom (
          classroomSeq number primary key,
          classroomName varchar2(10) not null,
          personnel number not null check (personnel IN (26, 30))
);

insert into tblClassroom values (1,'801호',30);
insert into tblClassroom values (2,'802호',30);
insert into tblClassroom values (3,'803호',30);
insert into tblClassroom values (4,'804호',26);
insert into tblClassroom values (5,'805호',26);
insert into tblClassroom values (6,'806호',26);

select * from tblClassroom;