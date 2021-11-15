--ex12_casting.sql

/*


null 관련 함수

--nvl(expr1, expr2)
--null value


*/

select name, population from tblCountry;


select
    name,
    case 
        when population is not null then population
        --when population is null then "미기재" --ORA-00904: "미기재": invalid identifier
                                            -- case end 내에서 when은 반드시 같은 자료형을 반환해야 함
        when population is null then -1
    end as population
from tblCountry;


select name, nvl(population, 999) from tblcountry;
--위의 case-end를 간단한 함수로 만들어 놓은 게 nvl함수


select name, nvl(tel,'연락처없음') from tblInsa;


-- nvl2 (expr1, expr2, expr3)\
-- nvl과 달리, not null case에서도 원본값과 다른 속성값 주려고 할 때 사용
select name, tel, nvl2(tel, 'AAA', 'BBB')from tblInsa;


select
    name,
    case 
        when tel is null then '연락처 없음'
        when tel is not null then '연락처 있음'
    end as tel
from tblInsa;


/*

형변환 함수


1. to_char() : 숫자 -> 문자
2. to_char() : 날짜 -> 문자 ********
3. to_number() : 문자 -> 숫자
4. to_date() : 문자 -> 날짜 ********


숫자 <-> 문자 : 숫자와 문자 간 형변환 가능
날짜 <-> 문자 : 날짜와 문자 간 형변환 가능 *****

*/

/*
1. to_char()
    - char to_char(컬럼명, 형식문자열)
    
형식문자열 구성요소  (숫자와 관련된)
a. 9 (구) : 숫자 1개를 문자 1개로 바꾸는 역할 (빈자리는 버린다) (부호자리를 확보함) 
            > 부호자리를 확보함
            > ex) 자바의 %5d
b. 0 (영) : 숫자 1개를 문자 1개로 바꾸는 역할 (빈자리는 0으로 채운다.) (부호자리를 확보함)
            > 부호자리를 확보함
            > ex) 자바의 %05d
c. $ : 통화기호 표현
d. L : 통화기호 표현(로컬) > 설정에 따른...
e. '.' (마침표) : 소수점 표시
f. ',' (쉼표) : 자릿수 표시



*/


select 
    weight,                            --우측 정렬(숫자)
    '@'||to_char(weight)||'@',         --좌측 정렬(문자)
    '@'||to_char(weight,'999')||'@',   --빈자리가 공백   
    '@'||to_char(weight,'000')||'@',   --빈자리가 0
    '@'||to_char(weight,'99')||'@'     --형식문자열을 넘어가는 자리수의 숫자는 ###표시됨.
                                       --> 처음에 자릿수 잘 파악해야함,
from tblComedian;




select 
    100,
    to_char(100, '999'),
    '$'||to_char(100, '999'),
    to_char(100, '$999'),
    '$'||to_char(-100, '999'),
    to_char(-100, '$999'),
    to_char(100, 'L999')    
from dual;



select 
    123.456,
    to_char(123.456, '999999'),  --정수만 출력 
    to_char(123.456, '999.999'),
    to_char(123.456, '9999.99')   --자릿수 모자라게 점을 찍을 경우, 반올림해줌
from dual;

select
    123456789,
    to_char(123456789),
    to_char(123456789, '999,999,999'),  --'%.d'
    to_char(123456789, '999,999,999원') --ORA-01481: invalid number format model
                                            --> 형식문자열 안에는 위의 abcdef 여섯개만 들어올 수 있음
from dual;



/*

2. to_char()
    - 날짜 -> 문자
    - char to_char(컬럼명, '형식문자열')
    - 형변환 보다는, 날짜의 일부 요소를 원하는 형태로 추출하는 역할 *****

헝식문자열 구성요소 (날짜와 관련된) 

    a. yyyy
    b. yy
    c. month
    d. mon
    e. mm
    f. day
    g. dy
    h. ddd
    i. dd
    j. d
    k. hh
    l. hh24
    m. mi
    n. ss
    o. am(pm)

*/

select sysdate from dual;
select to_char(sysdate, '') from dual; --ORA-01821: date format not recognized
                                                --> 위에 지정된 형식문자열 유형만 써야 함
                                                
select to_char(sysdate, 'yyyy') from dual; --2021 : 년(4자리) *******
select to_char(sysdate, 'yy') from dual;  -- 21 : 년(2자리)
select to_char(sysdate, 'month') from dual; --11월(풀네임)
                                                --> 영어 : november
select to_char(sysdate, 'mon') from dual;  --11월(약어)
                                                --> 영어 : nov
select to_char(sysdate, 'mm') from dual;    --11 (2자리)   ******
select to_char(sysdate, 'day') from dual;   --월요일 (풀네임)
                                                --> 영어 : monday                     
select to_char(sysdate, 'dy') from dual;    -- 월 (약어)
                                                --> 영어 : mon
select to_char(sysdate, 'ddd') from dual;   --319 : 일(올해의 며칠)
select to_char(sysdate, 'dd') from dual;    --15 : 일(이번월의 며칠) ******
select to_char(sysdate, 'd') from dual;    --2 : 일(이번주의 며칠 -> 요일)
select to_char(sysdate, 'hh') from dual;    --10 : 시(12H)
select to_char(sysdate, 'hh24') from dual;  --10 : 시(24H)   *****
select to_char(sysdate, 'mi') from dual;    --40 : 분   ******
select to_char(sysdate, 'ss') from dual;    --37 : 초   *****
select to_char(sysdate, 'am') from dual;    -- 오전
select to_char(sysdate, 'pm') from dual;    -- 오전 (am과 같음. 오전인지 오후인지 표시)




select 
    sysdate, -- 이 표현은 tool에 따라 다르다 (tool의 기본 환경설정)
    to_char(sysdate, 'yyyy-mm-dd')as "date", --이 표현은 모든 클라이언트(tool)에서 동일하다.
    to_char(sysdate, 'hh24:mi:ss') as "time",
    to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as time,
    to_char(sysdate, 'day am hh:mi:ss') as "가끔씩",
    to_char(sysdate, 'hh24시:mi분:ss초')as "한글"  --ORA-01821: date format not recognized 
                                                    --> 위에 제시된 표현들만 써야 됨
from dual;


/*

여러 절에서 to_char() 사용
--- 1. 컬럼 리스트에서 사용    
*/
select to_char(sysdate, 'yyyy-mm-dd') from dual;


    --평일 입사(급여 x 2)/ 주말 입사 (급여 / 2)
select 
    name, to_char(ibsadate, 'yyyy-mm-dd day'),
    basicpay,
    case
        when to_char(ibsadate, 'd') in ('1','7') then basicpay /2
        else basicpay*2
    end
from tblInsa;

select
    count(case
        when to_char(ibsadate, 'd') in ('1','7') then 1
    end) as "주말입사",
    count(case
        when to_char(ibsadate, 'd') not in ('1','7') then 1
    end) as "평일입사"
from tblInsa;



--- 2. 조건절에서 사용

select name, ibsadate from tblInsa;

    -- 2010년 입사한 직원들?
select name, ibsadate from tblInsa
    --where ibsadate >= '2010-01-01' and ibsadate <= '2010-12-13';
    where ibsadate between '2010-01-01' and '2010-12-31';


-- 시분초가 명시되어 있지 않은 날짜상수('2010-01-01')는 date로 암시적 형변환이 일어날 때, 자정(00:00:00)이 들어감.
select name, ibsadate, to_char(ibsadate, 'yyyy-mm-dd hh24:mi:ss') as 입사일 from tblInsa
    where ibsadate between '2010-01-01' and '2010-12-31';

-- 2010-01-01 00:00:00 ~ 2010-12-31 00:00:00
-- 홍길동 : 2010-12-31 14:40:00에 입사 --> 불포함
--> 제대로된 값 : 2010-01-01 00:00:00 ~ 2010-12-31 23:59:59


---SQL상에서 날짜 상수를 표현할 때
    --> 년월일만 표현 가능, 시분초는 표현 불가능!
    --> 년월일만 표현한 상수의 시분초는 무조건 자정('00:00:00')으로 할당한다.
select name, ibsadate, to_char(ibsadate, 'yyyy-mm-dd hh24:mi:ss') as 입사일 from tblInsa
    where ibsadate between '2010-01-01 00:00:00' and '2010-12-31 23:59:59';  -- ORA-01861: literal does not match format string 




select name,ibsadate, to_char(ibsadate, 'yyyy-mm-dd hh24:mi:ss') as 입사일 from tblInsa
    where to_char(ibsadate, 'yyyy') = '2010';  --완벽한 조건
                                                --> 날짜 범위를 년도라는 패턴으로 본 것. 범위가 아니라 



select name,ibsadate, to_char(ibsadate, 'yyyy-mm-dd day') as 입사일 from tblInsa
    --where to_char(ibsadate, 'day') = '월요일';  
    --where to_char(ibsadate, 'dy') = '월';  
    where to_char(ibsadate, 'd') = '2'; -- 가장 안정적 (영문 베이스 환경에서는 한글 요일은 영어로 고쳐야함...)  
    
    
-- 3.정렬

select name,ibsadate, to_char(ibsadate, 'yyyy-mm-dd day') as 입사일,
    to_char(ibsadate, 'd')
from tblInsa
    order by to_char(ibsadate, 'd');
    
    
------

--3. to_number()
    -- number to_number(컬럼명)

select 
    '123' as "aaaaaaaaaaaaaaa",   -- 문자 : 좌측 정렬 
    to_number('123') * 2 as "aaaaaaaaaaaaaaa", -- 숫자 : 우측 정렬
                                            --> 바꾸는 이유 : 산술연산하려고
    '123' * 2 as "aaaaaaaaaaaaaaa" -- 암시적 형변환 발생
                                    --> 따라서 위처럼 명시적 형변환을 잘 안씀
                                    --> 하지만 정석은 명시적 형변환이므로, 최대한 위와 같이 쓰도록 하자
from dual;


/*
4. to_date()
    - 문자 -> 날짜
    - date to_date(컬럼명, 형식문자열)

*/

-- SQL은 날짜 상수를 문자열 상수를 통해서 만든다.
    -- ex) '2021-11-15'
    
select * from tblInsa 
where ibsadate > '2010-01-01';  --날짜(date)와 비교중.. > 암시적으로 형변환

select name,'2010-01-01',sysdate from tblInsa; -- 이 때의 '2010-01-01'은 그대로 문자열. 형변환 발생 X
select name, '2020-11-15' - ibsadate from tblInsa; --ORA-00932: inconsistent datatypes: expected CHAR got DATE
                                                    --> 형변환 발생 X
                                                    
select * from tblInsa where ibsadate > '2010-01-01';                                                    
select *  from tblInsa where ibsadate > to_date('2010-01-01');

select name,'2010-01-01',sysdate from tblInsa;
select name, to_date('2010-01-01'), sysdate from tblInsa;

select name, '2020-11-15' - ibsadate from tblInsa;
select name, to_date('2020-11-15') - ibsadate from tblInsa;

select *  from tblInsa where ibsadate > to_date('2010-01-01 12:00:00'); --ORA-01861: literal does not match format string
select *  from tblInsa where ibsadate > to_date('2010-01-01 12:00:00', 'yyyy-mm-dd hh24:mi:ss'); --형식문자열을 같이 넣으면, 인식해서 시분초도 인식할 수 있게 됨




