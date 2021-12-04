-- 해야될 것 : 주말 공휴일 행 다 지우고, 프로시저 조건문/반복문으로 구현.


--출결관리 및 출결조회
--제대로 된 opencourse = 37번, 39번


select * from tblAttendance order by attendancedate;


create or replace view vwAttendanceSubject
as
select 
c.courseseq,
c.coursename,
c.coursedate,
c.coursetuition,
c.courserecruit,
o.opencourseseq,
o.classroomseq,
r.classroomname,
o.startdate as courseStartDate,
o.enddate as courseEndDate,
osub.opensubjectseq,
osub.subjectseq,
osub.teacherseq,
osub.startdate as subjectStartDate,
osub.enddate as subjectEndDate
from tblCourse c
    left outer join tblopencourse o
        on c.courseseq = o.courseseq
            left outer join tblClassroom r
                on o.classroomseq = r.classroomseq --
                    left outer join tblopensubject osub
                        on o.opencourseseq = osub.opencourseseq
                            left outer join tblsubject sub
                                on osub.subjectseq = sub.subjectseq
                                    order by o.opencourseseq asc, osub.startdate asc;
                                    
select * from vwAttendanceSubject;
                                    

create or replace view vwAttendanceMember
as
select
m.memberseq,
m.name,
m.jumin,
m.tel,
m.email,
t.teacherseq,
su.sugangseq,
s.joindate,
su.opencourseseq
from tblMember m
    left outer join tblTeacher t
        on m.memberSeq = t.teacherSeq
            left outer join tblStudent s
                on m.memberseq = s.memberseq
                    left outer join tblSugang su
                        on s.memberseq = su.memberseq
                            left outer join tblOpencourse o
                                on su.opencourseseq = o.opencourseseq;


select * from vwAttendanceMember;

create or replace view vwattendance
as
select
a.ATTENDANCEDATE,
a.ATTENDANCESEQ,
s.CLASSROOMNAME,
s.CLASSROOMSEQ,
s.COURSEDATE,
s.COURSEENDDATE,
s.COURSENAME,
s.COURSERECRUIT,
s.COURSESEQ,
s.COURSESTARTDATE,
s.COURSETUITION,
m.EMAIL,
a.ENDTIME,
m.JOINDATE,
m.JUMIN,
m.MEMBERSEQ,
m.NAME,
s.OPENCOURSESEQ,
s.OPENSUBJECTSEQ,
ou.OUTINGSEQ,
ou.OUTRINGTIME,
ou.RETURNTIME,
a.STARTTIME,
s.SUBJECTENDDATE,
s.SUBJECTSEQ,
s.SUBJECTSTARTDATE,
m.SUGANGSEQ,
s.TEACHERSEQ,
m.TEL,
a.TYPE
from vwattendancemember m
    left outer join tblattendance a
        on m.sugangseq = a.sugangseq
            left outer join vwattendancesubject s
                on a.opensubjectseq = s.opensubjectseq
                    left outer join tblouting ou
                        on a.attendanceseq = ou.attendanceseq;
                

desc vwattendancemember;
desc tblattendance;
desc vwattendancesubject;
desc tblouting;


select * from tblHoliday;
select * from vwattendance;
select* from vwdate;

create or replace view vwattendanceComplete
as
select  
    v.regdate,
    t.ATTENDANCESEQ,
    t.CLASSROOMNAME,
    t.CLASSROOMSEQ,
    t.COURSEDATE,
    t.COURSEENDDATE,
    t.COURSENAME,
    t.COURSERECRUIT,
    t.COURSESEQ,
    t.COURSESTARTDATE,
    t.COURSETUITION,
    t.EMAIL,
    t.ENDTIME,
    t.JOINDATE,
    t.JUMIN,
    t.MEMBERSEQ,
    t.NAME,
    t.OPENCOURSESEQ,
    t.OPENSUBJECTSEQ,
    t.OUTINGSEQ,
    t.OUTRINGTIME,
    t.RETURNTIME,
    t.STARTTIME,
    t.SUBJECTENDDATE,
    t.SUBJECTSEQ,
    t.SUBJECTSTARTDATE,
    t.SUGANGSEQ,
    t.TEACHERSEQ,
    t.TEL,
    case 
        when to_char(v.regdate, 'd') in ('1', '7') then '토,일'
        when to_char(v.regdate, 'd') not in ('1', '7') and h.name is not null then h.name
        else t.type
    end as type
from vwDate v
    left outer join vwattendance t
        on v.regdate = t.attendancedate
            left outer join tblHoliday h
                on v.regdate = h.holiday;
                


--입력값 : 교사번호 

--첫화면 - (해당교사가 강의한) 개설과목코드 - 과목명 - 과목시작일 - 과목종료일


--(기간별) 출결현황 유형
-- 기간 = 프레임 : 아래 유형의 전체 정보를 어떤 프레임으로 잘라서 볼 것인지
    -- 1. 전체 과목 + 전체 학생
    -- 2. 전체 과목 + 특정 학생
    -- 3. 특정 과목 + 전체 학생
    -- 4. 특정 과목 + 특정 학생
 

    
select
    opencourseseq as "개설과정코드",
    opensubjectseq as "개설과목코드",
    (select subjectname from tblsubject s where s.subjectseq = v.subjectseq) as "과목명",
    regdate as "날짜",
    teacherseq as "교사번호",
    (select name from tblMember where teacherseq = memberseq) as "교사이름",
    memberseq as "회원번호",
    name as "이름",
    starttime as "출근시간",
    endtime as "퇴근시간",
    type as "근태구분",
    case 
        when outingseq is null then 'X'
        else 'O, ' || outringtime || ' ~ ' || returntime
    end as "외출여부 및 시간"
from vwattendanceComplete v
    where teacherseq = 10 -- 전체 과목, 전체 학생
        --and regdate between to_date('2021-07-02', 'yyyy-mm-dd') and to_date('2021-07-05', 'yyyy-mm-dd') --특정 기간
        --and opensubjectseq = 1 -- 특정 과목, 전체 학생
        --and memberseq = 14 -- 전체 과목, 특정 학생
        --and opensubjectseq = 1 and memberseq = 14 --특정 과목, 특정 학생
    order by memberseq, regdate;    

    







