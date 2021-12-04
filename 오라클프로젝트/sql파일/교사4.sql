

select * from vwAttendanceSubject;
select * from vwAttendanceMember;



create or replace view vwScoreSubject
as
select
po.ATTENDANCEPOINT,
bo.BOOKNAME,
b .BOOKSEQ,
v.CLASSROOMNAME,
v.CLASSROOMSEQ,
v.COURSEDATE,
v.COURSEENDDATE,
v.COURSENAME,
v.COURSERECRUIT,
v.COURSESEQ,
v.COURSESTARTDATE,
v.COURSETUITION,
dr.DROPDATE,
v.OPENCOURSESEQ,
v.OPENSUBJECTSEQ,
po.POINTSEQ,
po.PRACTICALPOINT,
ps.PRACTICALSCORESEQ,
ps.PRACTICALTESTSCORE,
ps.PRACTICALTESTSEQ,
bo.PUBLISHER,
v.SUBJECTENDDATE,
v.SUBJECTSEQ,
v.SUBJECTSTARTDATE,
ps.SUGANGSEQ,
v.TEACHERSEQ,
p.TESTDATE,
p.TESTQUESTION,
w.TESTSEQ,
po.WRITTENPOINT,
ws.WRITTENSCORESEQ,
ws.WRITTENTESTSCORE,
ws.WRITTENTESTSEQ,
ats.ATTENDANCESCORESEQ,
ats.ATTENDANCESCORE
from vwattendancesubject v
    left outer join tblBooksubject b 
        on v.subjectseq = b.subjectseq
            left outer join tblBook bo
                on b.bookseq = bo.bookseq
                    left outer join tblwrittentest w
                        on v.opensubjectseq = w.opensubjectseq
                            left outer join tblpracticaltest p
                                on v.opensubjectseq = p.opensubjectseq
                                    left outer join tblpoint po
                                        on v.opensubjectseq = po.opensubjectseq
                                            left outer join tblwrittentestscore ws
                                                on w.testseq = ws.writtentestseq
                                                    left outer join tblpracticaltestscore ps
                                                        on p.practicaltestseq = ps.practicalscoreseq
                                                            left outer join tblattendancescore ats
                                                                on v.opensubjectseq = ats.opensubjectseq
                                                                    left outer join tbldrop dr
                                                                        on v.opencourseseq = dr.opencourseseq;
                            
select * from vwscoresubject order by opensubjectseq;

desc vwattendancesubject;
desc tblBooksubject;
desc tblBook;
desc tblwrittentest;
desc tblpracticaltest;
desc tblpoint;
desc tblwrittentestscore;
desc tblpracticaltestscore;
desc tbldrop;

---------------------



--create or replace view vwScoreMember
--as             
select
s.sugangseq,
m.memberseq,
m.opensubjectseq,
s.writtenscoreseq,
s.practicalscoreseq,
s.attendancescoreseq
from vwscoresubject s
    left outer join vwscoremember m
        on s.sugangseq = m.sugangseq
where m.opensubjectseq is null
order by s.opensubjectseq;
                

                
                
                
                
                
                
                
                