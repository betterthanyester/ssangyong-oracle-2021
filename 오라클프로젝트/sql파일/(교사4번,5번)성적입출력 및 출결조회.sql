-----------------------------------교사4 : 성적 입출력-----------------------------------

/*
테스트케이스
    과목번호 : 1
    수강번호 : 1
    이름      : 엄연연
    교사번호 : 10
    필기점수 : 81
    실기점수 : 81
    출석점수 : 100
*/



--요구사항 1 : 교사가 마친 과목 목록을 출력
--------------------------------------------------------------------------------
create or replace view vwScoreSubject
as 
select
os.teacherseq as "교사번호",
os.opensubjectseq as "개설과목번호",
co.coursename as "과정명",
o.startdate as "과정시작",
o.enddate as "과정종료",
cr.classroomname as "강의실",
sub.subjectname as "과목명",
os.startdate as "과목시작",
os.enddate as "과목종료",
bo.bookname as "교재명",
po.attendancepoint as "출결배점",
po.writtenpoint as "필기배점",
po.practicalpoint as "실기배점",
(select count(writtentestscore) from tblwrittentestscore where os.opensubjectseq = opensubjectseq) as "count"
 from tblopencourse o
    left outer join tblopensubject os
        on o.opencourseseq = os.opencourseseq
            left outer join tblsugang su
                on os.opencourseseq = su.opencourseseq 
                    left outer join TBLWRITTENTEST wt
                        on os.opensubjectseq = wt.opensubjectseq
                            left outer join tblpoint po
                                on os.opensubjectseq = po.opensubjectseq
                                    left outer join tbldrop dr
                                        on o.opencourseseq = dr.opencourseseq
                                            left outer join tblClassroom cr
                                                on o.classroomseq = cr.classroomseq
                                                    left outer join tblcourse co
                                                        on co.courseseq = o.courseseq
                                                            left outer join tblsubject sub
                                                                on sub.subjectseq = os.subjectseq
                                                                    left outer join tblbooksubject bs
                                                                        on bs.subjectseq = sub.subjectseq
                                                                            left outer join tblbook bo
                                                                                on bo.bookseq = bs.bookseq
                                                                                    left outer join tblmember me
                                                                                        on me.memberseq = su.memberseq
                                                                                            left outer join tblcompletedate com
                                                                                                on com.sugangseq = su.sugangseq
                                                                                order by su.memberseq;
        


--교사번호 10의 과목목록 출력
select distinct * from vwScoreSubject where "교사번호" = 10 order by "개설과목번호";







--요구사항 2: 과목번호 선택 시 교육성 정보를 출력  (중도탈락된 경우, 그 이후 치뤄진 시험의 성적은 null로 처리)
--------------------------------------------------------------------------------
create or replace view vwScoreMember
as  
select
wt.opensubjectseq as "과목번호",
os.teacherseq as "교사번호",
tsu.SUGANGSEQ as "수강번호",
me.name as "이름",
me.tel as "전화번호",
case 
    when dr.dropdate is null then com.completedate || ' (수료)'
    else  ' (중도탈락) ' || dr.dropdate
end as "수료/탈락날짜",
case 
    when dr.dropdate < wt.testdate then null
    else tws.writtentestscore
end as "필기점수",
case 
    when dr.dropdate < pt.testdate then null
    else tps.practicaltestscore
end as "실기점수",
case 
    when dr.dropdate is not null then null
    else tas.attendancescore
end as "출석점수"
from TBLSUGANG tsu 
    inner join TBLWRITTENTESTSCORE tws 
        on tsu.SUGANGSEQ = tws.SUGANGSEQ
            inner join TBLPRACTICALTESTSCORE tps 
                on tsu.SUGANGSEQ = tps.SUGANGSEQ
                    inner join TBLATTENDANCESCORE tas 
                        on tsu.SUGANGSEQ = tas.SUGANGSEQ 
                            inner join tblmember me
                                on tsu.memberseq = me.memberseq
                                    left outer join tbldrop dr
                                        on dr.sugangseq = tsu.sugangseq
                                            left outer join tblcompletedate com
                                                on com.sugangseq = tsu.sugangseq
                                                    left outer join tblwrittentest wt
                                                        on tws.writtentestseq = wt.testseq
                                                            left outer join tblpracticaltest pt
                                                                on pt.practicaltestseq = tps.practicaltestseq
                                                                    left outer join TBLOPENSUBJECT os
                                                                        on pt.OPENSUBJECTSEQ = os.OPENSUBJECTSEQ
                                    where PRACTICALSCORESEQ=WRITTENSCORESEQ and PRACTICALSCORESEQ=ATTENDANCESCORESEQ
                                and tsu.opencourseseq = 37
                    order by tsu.SUGANGSEQ;            
    


-- 과목번호 1에 대한 수강생들의 성적정보 출력  (교사번호 10이 확인 중이라고 가정)
------------------------------------------------------
select distinct * from vwscoremember 
    where "과목번호" = 1
        order by "수강번호";
        
        
--요구사항4 : 성적 미등록 학생 출력 (과목번호, 수강번호, 학생명, 필기/실기/출결 점수 등록/미등록 여부)
select distinct * from vwscoremember
    where "교사번호" = 10
    and ("필기점수" is null or "실기점수" is null or "출석점수" is null)
        order by "수강번호";






--요구사항4 : 특정과목 및 교육생 선택하여 출결/필기/실기 시험점수 입력

create or replace procedure procReviseScore(
    psugangseq number,              --수강번호
    popensubjectseq number,         --개설과목번호
    pwrittentestscore number ,      --필기점수
    ppracticaltestscore number ,    --실기점수
    pattendancescore number         --출결점수
)
is 
begin
     
    update tblwrittentestscore set writtentestscore = pwrittentestscore
        where writtentestseq = (select testseq from tblwrittentest where opensubjectseq = popensubjectseq)
        and sugangseq = psugangseq;
        
    update TBLPRACTICALTESTSCORE set PRACTICALTESTSCORE = ppracticaltestscore
        where PRACTICALTESTSEQ = (select PRACTICALTESTSEQ from TBLPRACTICALTEST where opensubjectseq = popensubjectseq)
        and sugangseq = psugangseq;
        
    update TBLATTENDANCESCORE set ATTENDANCESCORE = pattendancescore
        where OPENSUBJECTSEQ = popensubjectseq
        and sugangseq = psugangseq;
end procReviseScore;        





-- 과목번호 1번을 수강한 수강번호 1번 학생의 필기/실기/출결 점수를 null로 수정 (미등록 상황을 가정하기 위함)
begin
    procrevisescore(1,1,null,null,null);
end;


-- 과목번호 1번을 수강한 수강번호 1번 학생의 필기/실기/출결 점수를 70,80,100으로 수정
begin
    procrevisescore(1,1,70,80,100);
end;


-- 수정되었는지 확인
select distinct * from vwscoremember 
    where "과목번호" = 1 and "수강번호" = 1;


-----------------------------------교사5 : 출결조회-----------------------------------


create or replace view vwattendance
as
select
os.TEACHERSEQ as "교사번호",
a.OPENSUBJECTSEQ as "과목번호",
SUBJECTNAME as "과목명",
a.SUGANGSEQ as "수강번호",
ATTENDANCEDATE as "날짜",
type as "근태유형",
STARTTIME as "출근시간",
ENDTIME as "퇴근시간",
case
    when outingseq is null then 'X'
    else 'O, ' || outringtime || ' ~ ' || returntime
end as "외출여부 및 시간",
oc.OPENCOURSESEQ as "과정번호",
oc.STARTDATE as "과정시작",
oc.ENDDATE as "과정종료"
--count(*)
from TBLATTENDANCE a
    left outer join TBLSUGANG su on a.SUGANGSEQ = su.SUGANGSEQ
        left outer join TBLSTUDENT stu on su.MEMBERSEQ = stu.MEMBERSEQ
            left outer join TBLMEMBER me on stu.MEMBERSEQ = me.MEMBERSEQ
                left outer join TBLOPENSUBJECT os on a.OPENSUBJECTSEQ = os.OPENSUBJECTSEQ
                    left outer join TBLSUBJECT sub on os.SUBJECTSEQ = sub.SUBJECTSEQ
                        left outer join TBLOPENCOURSE oc on os.OPENCOURSESEQ = oc.OPENCOURSESEQ
                            left outer join TBLCOURSE co on oc.COURSESEQ = co.COURSESEQ
                                left outer join TBLCLASSROOM cl on oc.CLASSROOMSEQ = cl.CLASSROOMSEQ
                                    left outer join TBLOUTING ou on a.ATTENDANCESEQ = ou.ATTENDANCESEQ
    order by a.SUGANGSEQ, a.ATTENDANCEDATE;



create or replace view vwNullDate
as
select
regdate,
case
    when to_char(v.regdate, 'd') in ('1', '7') and h.name is not null then '토, 일'
    when to_char(v.regdate, 'd') in ('1', '7') and h.name is null then '토, 일'
    else '공휴일'
end as type
from
((select
    to_date('2021-07-02','yyyy-mm-dd') + level -1 as regdate
    from dual
        connect by level <= (to_date('2021-12-27', 'yyyy-mm-dd') - to_date('2021-07-02','yyyy-mm-dd')+1)
            minus select distinct(ATTENDANCEDATE) from TBLATTENDANCE) v
                left outer join TBLHOLIDAY h on v.regdate = h.HOLIDAY)
                     order by v.regdate;



create table tblNullDate(
        regdate date primary key,
        type varchar2(60) not null
);



declare
    vregdate tblNullDate.regdate%type;
    vtype tblNullDate.type%type;
    cursor vcursor is select regdate, type from vwNullDate;
begin
    open vcursor;
        loop
            fetch vcursor into vregdate,vtype;
            exit when vcursor%notfound; --boolean
            insert into tblNullDate values (vregdate,vtype);
        end loop;
    close vcursor;
end;




declare
    vSugangMin number;
    vSugangMax number;
    vopenSubjectSeqMin number;
    vopenSubjectSeqMax number;
    vnull number;
    vSubjectStart date;
    vSubjectEnd date;
    vDate tblNullDate.regdate%type;
    vType tblNullDate.type%type;
    cursor vcursor is select regdate, type from tblNullDate;

begin
    select min(SUGANGSEQ) into vSugangMin from tblattendance;
    select max(SUGANGSEQ) into vSugangMax from tblattendance;
    select min(OPENSUBJECTSEQ) into vopenSubjectSeqMin from TBLOPENSUBJECT;
    select max(OPENSUBJECTSEQ) into vopenSubjectSeqMax from TBLOPENSUBJECT;
    for suSeq in vSugangMin..vSugangMax loop
        for subSeq in vopenSubjectSeqMin..vopenSubjectSeqMax loop
            select count(distinct(OPENSUBJECTSEQ)) into vnull from tblattendance where SUGANGSEQ = suSeq and OPENSUBJECTSEQ = subSeq;
            if vnull > 0 then
                select STARTDATE into vSubjectStart from TBLOPENSUBJECT where OPENSUBJECTSEQ = subSeq;
                select ENDDATE into vSubjectEnd from TBLOPENSUBJECT where OPENSUBJECTSEQ = subSeq;
                open vcursor;
                    loop
                        fetch vcursor into vDate, vType;
                        exit when vcursor%notfound;
                        if (vDate >= vSubjectStart and vDate <= vSubjectEnd) then
                             insert into tblAttendance values (seqAttendance.nextVal,vDate,subSeq, suSeq, vType , '0', '0');
                        end if;
                    end loop;
                close vcursor;
            end if;
        end loop;
    end loop;
end;





-- 요구사항 : 교사가 자신이 강의한 과목들에 대해서 전체 또는 특정 인원의 출결을 확인할 수 있어야 한다.
    -- 한 교사가 가르치는 과목이 여러개일 수 있다고 전제
    -- 조회할 날짜 구간을 설정 가능해야 함
    -- 4가지 경우 각각에 대해 조회 가능해야 함
        -- 전체 과목, 전체 학생
        -- 전체 과목, 특정 학생
        -- 특정 과목, 전체 학생
        -- 특정 과목, 특정 학생
        
        
        
select
*
from vwattendance
        where "교사번호" = 10                                   -- 전체 과목, 전체 학생
        and "날짜" between to_date('2021-07-02', 'yyyy-mm-dd') and to_date('2021-07-05', 'yyyy-mm-dd') --특정 기간
--         and "과목번호" = 1                                     -- 특정 과목, 전체 학생
--         and "수강번호" = 14                                   -- 전체 과목, 특정 학생
--         and "과목번호" = 1 and "수강번호" = 14          --특정 과목, 특정 학생
            order by "수강번호", "날짜";








