----------------------------
-- tblAttendance 자료형 제약사항 수정
--  tblOuting drop 후에 drop 가능


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

commit;

select * from vwattendance;

-------------------------------------------------

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

select * from vwNullDate;


create table tblNullDate(
        regdate date primary key,
        type varchar2(60) not null
);

drop table tblNullDate;

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


select * from tblNullDate;



commit;
rollback;


select count(*) from tblattendance; -- 6930

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

    --수강생
    for suSeq in vSugangMin..vSugangMax loop
--         sys.dbms_output.put_line(suSeq);
        --개설과목
        for subSeq in vopenSubjectSeqMin..vopenSubjectSeqMax loop
--             sys.dbms_output.put_line(suSeq || ', ' || subseq);

            select count(distinct(OPENSUBJECTSEQ)) into vnull from tblattendance where SUGANGSEQ = suSeq and OPENSUBJECTSEQ = subSeq;
            if vnull > 0 then
                select STARTDATE into vSubjectStart from TBLOPENSUBJECT where OPENSUBJECTSEQ = subSeq;
                select ENDDATE into vSubjectEnd from TBLOPENSUBJECT where OPENSUBJECTSEQ = subSeq;
--                 sys.dbms_output.put_line(vnull|| ', ' || vSubjectStart|| ', ' || vSubjectEnd);
                open vcursor;
                    loop
                        fetch vcursor into vDate, vType;
                        exit when vcursor%notfound;
                        if (vDate >= vSubjectStart and vDate <= vSubjectEnd) then
--                             sys.dbms_output.put_line(suSeq|| ', ' ||subSeq|| ', ' ||vSubjectStart|| ', ' || vDate|| ', ' || vSubjectEnd);
                             insert into tblAttendance values (seqAttendance.nextVal,vDate,subSeq, suSeq, vType , '0', '0');
                        end if;
                    end loop;
                close vcursor;
            end if;
        end loop;
    end loop;
end;



select count(*) from tblattendance; -- 6930  --10260


select * from vwattendance;




-- 요구사항 : 교사가 자신이 강의한 과목들에 대해서 전체 또는 특정 인원의 출결을 확인할 수 있어야 한다.
    -- 과목이 여러개라고 가정
    -- 날짜 구간 설정
    -- 4가지 경우
        -- 전체 과목, 전체 학생
        -- 전체 과목, 특정 학생
        -- 특정 과목, 전체 학생
        -- 특정 과목, 특정 학생
select
*
from vwattendance
        where "교사번호" = 10 -- 전체 과목, 전체 학생
        and "날짜" between to_date('2021-07-02', 'yyyy-mm-dd') and to_date('2021-07-25', 'yyyy-mm-dd') --특정 기간
--         and "과목번호" = 1 -- 특정 과목, 전체 학생
--         and "수강번호" = 14 -- 전체 과목, 특정 학생
--         and "과목번호" = 1 and "수강번호" = 14 --특정 과목, 특정 학생
            order by "수강번호", "날짜";

 alter table TBLWRITTENTEST drop constraint SYS_C007675;
  alter table TBLATTENDANCE drop constraint SYS_C007681;
   alter table TBLATTENDANCE drop constraint SYS_C007644;
    alter table TBLATTENDANCE drop constraint SYS_C007669;
     alter table TBLATTENDANCE drop constraint SYS_C007719;




rollback;
