--ex18_group_by.sql

/*

GROUP BY 
    - GROUP BY 컬럼명
    - 레코드들을 특정 컬럼값(1개 OR N개) 에 맞추어 그룹을 나누는 역할
    - 그룹을 왜 나누는지? 
        > 각각의 나눠진 그룹을 대상
        > 집계 함수를 적용하기 위해서 (************)


<작성순서>
    SELECT 컬럼리스트
    FROM 테이블
    WHERE 조건
    GROUP BY 기준
    ORDER BY 기준

<실행순서>
    1. FROM 테이블
    2. WHERE 조건
    3. GROUP BY 기준
    4. SELECT 컬럼리스트
    5. ORDER BY 기준

*/


-- tblInsa. 부서별로 평균 급여?

select * from tblInsa;

select round(avg(basicpay)) from tblInsa;

select distinct buseo from tblinsa;

select round(avg(basicpay)) from tblInsa where buseo = '총무부';
select round(avg(basicpay)) from tblInsa where buseo = '개발부';
select round(avg(basicpay)) from tblInsa where buseo = '영업부';
select round(avg(basicpay)) from tblInsa where buseo = '기획부';
select round(avg(basicpay)) from tblInsa where buseo = '인사부';
select round(avg(basicpay)) from tblInsa where buseo = '자재부';
select round(avg(basicpay)) from tblInsa where buseo = '홍보부';

-- group by 사용하면, select 컬럼 리스트를 주의해서 작성해야 한다.
--  > group by절을 사용하면 
--  > 컬럼 리스트에는
--  > 그룹으로 사용된 컬럼(정확히 그룹 뒤의 키워드)과
--  > 집계 함수만 작성할 수 있다.

select * from tblInsa group by buseo;

select buseo, round(avg(basicpay)) --3. 각 그룹에다 select를 적용해라
from tblinsa             --1. tblInsa로부터 60개의 레코드를 가져와서
group by buseo;          --2. 각 레코드를 부서별로 그룹을 나누고


--남자수, 여자수?
select 
    count(case
        when gender = 'm' then 1
    end) as 남자,    
    count(case
        when gender = 'f' then 1
    end) as 여자,
    count(decode(gender,'m',1)) as 남자,
    count(decode(gender,'f',1)) as 여자
from tblComedian;

select gender,count(*) from tblcomedian group by gender;

--남자 직원수? 여자 직원수?

select 
    --ssn, -- ORA-00979: not a GROUP BY expression
    substr(ssn, 8,1),
    count(*)
from tblInsa
    group by substr(ssn, 8,1);
    

select
    city,
    count(*) as cnt
from tblInsa
    group by city
        --order by city asc;
        --order by count(*) desc; -> alias 안치면 이렇게도 가능
        --order by cnt desc;
        order by 2 desc; --> 컬럼 인덱스로도 가능 (추천하진 않는 방법)
        
-- 대륙별 평균인원수

select
    continent,
    round(avg(population))
from tblCountry
    group by continent;
    
    
select 
    jikwi,
    count(*) as 직위별인원수,
    sum(basicpay) as 직위별급여총합,
    round(avg(basicpay)) as  직위별평균급여,
    max(ibsadate) as "직위별 막내 입사 날짜", --ORA-00972: identifier is too long
                                                --오라클의 식별자 : 30바이트 제한 (한글 1글자에 3바이트, utf-8기준)
    min(sudang) as "직위별 최저수당"
from tblInsa
    group by jikwi;


select 
    buseo,
    jikwi,
    city,
    count(*)
from tblinsa
    group by buseo, jikwi, city
        order by buseo asc, jikwi asc, count(*) desc;


--급여별(??)로 그룹 > 인원수?
--급여별(100만원 단위)로 그룹 > 인원수?
select
    basicpay,
    count(*)
from tblInsa
    group by basicpay;
    
select
    floor(basicpay/1000000)
    ,(floor(basicpay/1000000)+1)*1000000 || '미만',
    count(*)
from tblinsa
    group by floor(basicpay/1000000);

--한일의 개수? 안한일의 개수? > group by
select * from tblTodo;

select
    case
        when completedate is not null then 1
        when completedate is null then 2
    end,
    count(*)
from tblTodo
    group by
        case
            when completedate is not null then 1
            when completedate is null then 2
        end;
        

select * from tblAddressBook;

select job, count(*) from tbladdressbook group by job;
select hometown, count(*) from tbladdressbook group by hometown
    order by count(*) desc;





