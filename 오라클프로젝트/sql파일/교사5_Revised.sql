----------------------------

create or replace view vwattendance
as
select
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
--      where a.OPENSUBJECTSEQ = 1
--            and a.SUGANGSEQ = 1
    order by a.SUGANGSEQ, a.ATTENDANCEDATE;

commit;

-- select
-- max("날짜")
-- from vwattendance;

-- select
--     to_date('2021-07-02','yyyy-mm-dd') + level -1 as regdate
--     from dual
--         connect by level <= (to_date('2021-12-27', 'yyyy-mm-dd') - to_date('2021-07-02','yyyy-mm-dd')+1);
--
-- select * from vwDate;
--
--
-- select
-- distinct("날짜")
-- from vwattendance
--     order by "날짜";

create or replace view vwNullDate
as
select
regdate,
case
    when to_char(v.regdate, 'd') in ('1', '7') and h.name is not null then '토, 일 & ' || h.name
    when to_char(v.regdate, 'd') in ('1', '7') and h.name is null then '토, 일'
    else h.NAME
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

commit;

--insert into tblAttendance values (seqAttendance.nextVal,'2021-07-21',1, 1, '결석', '0', '0');



/* for 수강번호
        for 개설과목번호
            if sele
 */


declare
    vnull number;
begin
    select count(distinct("과목번호")) into vnull from vwattendance where "수강번호" = 100;
    if vnull = 0 then
        return
    end if;
end;


select * from vwattendance;

select min("수강번호") from vwattendance;
select max("수강번호") from vwattendance;
select min(regdate) from vwNullDate;
select max(regdate) from vwNullDate;

select distinct("과정시작") from vwattendance where "수강번호" = 1;
select distinct("과정종료") from vwattendance where "수강번호" = 1;
select distinct("과목번호") from vwattendance where "수강번호" = 1;


declare
    vnull number;
begin
    select count(distinct("과목번호")) into vnull from vwattendance where "수강번호" = 100;
    if vnull = 0 then
        return
    end if;
end;

commit;
rollback;

select count(*) from tblattendance;

declare
    vSugangMin number;
    vSugangMax number;
    vopenSubjectSeqMin number;
    vopenSubjectSeqMax number;
    vnull number;
    vSubjectStart date;
    vSubjectEnd date;
    vDate vwNullDate.regdate%type;
    vType vwNullDate.type%type;
    cursor vcursor is select regdate, type from vwNullDate;

begin
    select min("수강번호") into vSugangMin from vwattendance;
    select max("수강번호") into vSugangMax from vwattendance;
    select min(OPENSUBJECTSEQ) into vopenSubjectSeqMin from TBLOPENSUBJECT;
    select max(OPENSUBJECTSEQ) into vopenSubjectSeqMax from TBLOPENSUBJECT;
    for suSeq in vSugangMin..vSugangMax loop
        for subSeq in vopenSubjectSeqMin..vopenSubjectSeqMax loop
            select count(distinct("과목번호")) into vnull from vwattendance where "수강번호" = suSeq and "과목번호" = subSeq;
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

select
*
from vwNullDate n
    left outer join vwattendance a on n.regdate = a.날짜;

select * from vwNullDate;

select * from vwattendance;

select * from TBLATTENDANCE order by ATTENDANCEDATE;

select * from vwNullDate where regdate in ('2021-01-01','2021-12-30') ;


select * from vwattendance where 날짜 = '2021-12-25';

begin
    if 1>=1 and 1<=1 then
        dbms_output.put_line('yes');
    end if;


end;