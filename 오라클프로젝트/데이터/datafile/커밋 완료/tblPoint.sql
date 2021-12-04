create table tblPoint(
        pointSeq number primary key,
        openSubjectSeq number not null references tblOpenSubject(openSubjectSeq),
        attendancePoint number default 20 not null,
        writtenPoint number default 40 not null,
        practicalPoint number default 40 not null
);

create sequence seqPoint;

insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,1,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,2,20,30,50);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,3,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,4,30,30,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,5,20,20,50);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,6,20,30,50);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,7,20,30,50);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,8,20,30,50);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,9,20,30,50);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,10,20,30,50);
commit;

insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,11,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,12,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,13,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,14,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,15,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,16,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,17,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,18,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,19,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,20,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,21,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,22,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,23,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,24,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,25,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,26,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,27,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,28,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,29,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,30,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,31,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,32,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,33,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,34,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,35,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,36,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,37,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,38,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,39,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,40,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,41,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,42,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,43,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,44,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,45,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,46,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,47,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,48,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,49,20,40,40);
insert into tblPoint (pointSeq, openSubjectSeq, attendancePoint, writtenPoint, practicalPoint) VALUES (seqPoint.nextval,50,20,40,40);

commit;







