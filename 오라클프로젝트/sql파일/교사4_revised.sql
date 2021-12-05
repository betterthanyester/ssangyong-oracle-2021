-- 해야될 것 : 성적등록 여부 판단


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
--case
--    when (select count(*) from tblwrittentestscore where os.opensubjectseq = opensubjectseq) = (select count(writtentestscore) from tblwrittentestscore where writtentestscore > 0 and os.opensubjectseq = opensubjectseq) then 'O'
--    else 'X'
--end as "성적등록 여부"
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
        

select distinct * from vwScoreSubject where "교사번호" = 10 order by "개설과목번호";


select count(*) from tblwrittentestscore;

--요구사항 2: 과목번호 선택 시 교육성 정보를 출력
    -- 중도탈락된 경우, 그 이후 치뤄진 시험의 성적은 null로 처리
--------------------------------------------------------------------------------
create or replace view vwScoreMember
as  
select
wt.opensubjectseq as "과목번호",
tsu.SUGANGSEQ as "수강번호",
me.name as "이름",
me.tel as "전화번호",
case 
    when dr.dropdate is null then com.completedate
    else dr.dropdate
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
                                    where PRACTICALSCORESEQ=WRITTENSCORESEQ and PRACTICALSCORESEQ=ATTENDANCESCORESEQ
                                and tsu.opencourseseq = 37
                    order by tsu.SUGANGSEQ;            
    
    
------------------------------------------------------
select distinct * from vwscoremember 
    where "과목번호" = 1
        order by "수강번호";
        
        
        


--요구사항3 : 특정과목 및 교육생 선택하여 출결/필기/실기 시험점수 입력


commit;


set serverout on;


--프로시저


create or replace procedure procReviseScore(
    psugangseq number, 
    popensubjectseq number,
    pwrittentestscore number ,
    ppracticaltestscore number ,
    pattendancescore number
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

commit;

rollback;


--트리거



select distinct * from vwscoremember 
    where "과목번호" = 1
        order by "수강번호";


begin
    procrevisescore(1,1,null,null,null);
end;        