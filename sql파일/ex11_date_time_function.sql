--ex11_date_time_function.sql



/* 

날짜 시간 함수
    - 현재 시스템의 시간을 반환
    -date sysdate
    -자바의 caledar.getInstance()

*/


select sysdate from dual; --21/11/12
select name, ibsadate from tblInsa;


/*

날짜 연산
    - +,-
    1. 시각 - 시각 = 일 (day)
    2. 시각 + 시간(일, day)
    3. 시각 - 시간(일, day)

*/ 

--현재시각 - 입사일
select 
    name,
    ibsadate,
    round(sysdate - ibsadate) as 근무일수,
    round((sysdate-ibsadate)/365) as 근무년수, --year, 물론 윤년도 있어서 정확한 건 아님
    round((sysdate - ibsadate)*24) as 근무시수,
    round((sysdate - ibsadate)*24*60) as 근무분수,
    round((sysdate - ibsadate)*24*60*60) as 근무초수
from tblInsa;


select 
    title,
    adddate,
    completedate,
    round(completedate - adddate)
from tblTodo
    where (completedate-adddate) <3 --3일 이내 끝낸 일들
        order by (completedate - adddate) asc;
        

--2. 시각 + 시간
--3. 시각 - 시간
select sysdate, sysdate +100 from dual; --100일 뒤
select sysdate, sysdate -100 from dual; --100일 전

--2시간 뒤
select sysdate + (2/24) from dual;

--3시간 전
select sysdate - (3/24) from dual;

--30분 뒤
select sysdate + (30/24/60) from dual;


/*
last_day()
-date last_day(date)
-해당 컬럼값이 포함된 달의 마지막 날짜

*/

select sysdate, last_day(sysdate) from dual;

/*

months_between()
    - number months_between(date, date)
    - 시각 - 시각   (단위: 월)
add_months()
    - date add_months(date,number)
    - 시각 + 시간   (단위: 월)

*/

select 
    name,
    round(sysdate - ibsadate) as "근무시간(일)",
    round((sysdate-ibsadate)/30) as "근무시간(월)", --절대 하면 안됨... 정확하지 않음... 한달이 30일로 일정하지 않기 때문
    round(months_between(sysdate,ibsadate)) as "근무시간(월)",  -- 정확
    round(months_between(sysdate,ibsadate)/12) as "근무시간(년)"  -- 정확 (역시 365나누는 짓은 하면 안됨)
from tblInsa;


-- 시각 - 시각
--  1. 일, 시, 분, 초 -> 연산
--  2. 월, 년 -> months_between()


select 
    sysdate,
    sysdate + 100,          --100일 후
    sysdate - 100,          --100일 전
    add_months(sysdate,1),  --한달 후
    add_months(sysdate,-1),  --한달 전
    add_months(sysdate, 1*12), --1년 뒤
    add_months(sysdate, -3*12) --3년 전
from dual;


--정리
--시각 +- 시간
--  1. 일,시,분,초 -> +,-  연산
--  2. 월,년      -> add_months()
