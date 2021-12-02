create table tblOuting(
        outingSeq number primary key,
        attendanceSeq number not null references tblAttendance(attendanceSeq),
        outringTime varchar2(10) not null,
        returnTime varchar2(10) not null
);

drop table tblOuting;

drop sequence seqOuting;
create sequence seqOuting;

select * from tblOuting;

insert into tblouting values (seqOuting.nextVal, 8,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 59,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 87,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 106,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 135,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 158,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 186,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 259,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 343,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 533,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 743,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 1004,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 1271,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 1674,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 2053,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 2357,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 2674,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 2967,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 3639,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 3865,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 4212,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 4588,'10:00','14:00');
insert into tblouting values (seqOuting.nextVal, 6000,'10:00','14:00');

commit;

select * from tblouting;