--ex18_group_by.sql

/*

GROUP BY 
    - GROUP BY 컬럼명
    - 레코드들을 특정 컬럼값(1개 OR N개) 에 맞추어 그룹을 나누는 역할
    - 그룹을 왜 나누는지? 
        > 각각의 나눠진 그룹을 대상
        > 집계 함수를 적용하기 위해서 (************)
    -  GROUP BY + HAVING + ROLLUP/CUBE

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



select 
    decode(gender,'m','남자','f','여자') as gender,
    count(*) as cnt,
    avg(weight) as "평균 몸무게",
    avg(height) as "평균 키"
from tblComedian
group by gender;



/*

HAVING
    - 조건절


<작성순서>
    SELECT 컬럼리스트
    FROM 테이블
    WHERE 조건
    GROUP BY 기준
    HAVING 조건
    ORDER BY 기준

<실행순서>
    1. FROM 테이블
    2. WHERE 조건
    3. GROUP BY 기준
    4. HAVING 조건
    5. SELECT 컬럼리스트 > 그룹별
    6. ORDER BY 기준 > 그룹별
    
FROM절 -> WHERE절
    : 개인에 대한 조건 (행 1개씩 각각에 대해서 조사한다.)

GROUP BY절 -> HAVING절
    : 그룹에 대한 조건 (집계 함수의 결과에 대해서 조사한다.)


*/

select
    buseo,
    count(*) as cnt
from tblInsa
    --where count(*) > 10 --ORA-00934: group function is not allowed here
                        --where절에는 집계함수를 넣을 수 없다
                        --from절은 각 데이터에 대해서 적용되는 것이므로
    group by buseo
        having count(*) > 10;

select
    buseo,
    count(*)
from tblInsa
    --where count(*) > 10 --ORA-00934: group function is not allowed here
                        --where절에는 집계함수를 넣을 수 없다
                        --from절은 각 데이터에 대해서 적용되는 것이므로
    group by buseo
        having count(*) > 10;



select
    buseo,
    count(*)
from tblInsa
    where jikwi in ('부장','과장')
    group by  buseo
        having count(*) >=3;


select
    buseo,
    round(avg(basicpay))
from tblInsa
    --where basicpay >= 1500000
    group by  buseo;
        --having avg(basicpay) >= 1500000;
/*
--1. where절, having절 둘다 없을 때
    : 부서별 평균급여
    
--2. where절만 있을 때
    : 150만원 이상인 직원들만을 대상으로 (150미만인 직원들이 탈락됨), 부서별로 평균급여를 구했을 때

--3. having절만 있을 떄
    : 부서별 평균급여를 구하고, 평균급여가 150만원 미만인 부서를 탈락시킴

--4. 둘다 있을떄
    : 150만원 이상인 직원들만을 대상으로 부서별 평균급여를 구하고, 평균급여가 150만원 미만인 부서를 탈락시킴
    
*/




--tblCountry. 대륙별 최대 인구수, 최소 인구수, 평균 인구수를 가져오시오.

select * from tblcountry;

select
    continent,
    max(population),
    min(population),
    avg(population)
from tblCountry
    group by continent;
    
    

--employees. 직업별(job_id) 직원수를 가져오시오.


select
    job_id,
    count(*)
from employees
    group by job_id
;


--tblAddressBook. 시도별 인원수를 가져오시오. 시도별(address컬럼 첫번째 토큰) (instr, substr)

select
    substr(address,1,instr(address,' ')),    
    count(*)
from tblAddressBook
    group by substr(address,1,instr(address,' '))
;

--tblInsa. 부서별 직원들의 급여 총합, 부서인원수, 최고급여, 최저급여, 평균급여
select
    buseo,
    sum(basicpay),
    count(*),
    max(basicpay),
    min(basicpay),
    avg(basicpay)
from tblInsa
    group by buseo
;


--tblInsa. 부서별 직급의 인원수를 가져오시오.
-- [부서명]    [총인원]   [부장]  [과장]  [대리]    [사원]
-- 기획부      6           1


select
    buseo as "[부서명]",
    count(*) as "[총인원]",
    count(decode(jikwi, '부장', 1)) as "[부장]",
    count(decode(jikwi, '과장', 1)) as "[과장]",
    count(decode(jikwi, '대리', 1)) as "[대리]",
    count(decode(jikwi, '사원', 1)) as "[사원]"
from tblInsa
    group by buseo
;

--사실 아래가 더 좋은 쿼리임
--위의 쿼리는 직급의 종류를 알아야 하고, 직접 수정해줘야 하지만
--아래 쿼리는 직급 체계가 달라져도 자동 반영됨
select 
    buseo,jikwi,count(*)
from tblInsa
    group by ROLLUP(buseo, jikwi) --부서별 직급별 
        order by buseo, jikwi;
    
/*
ROLL UP
    - group by한 결과의 집계를 해줌
    - 결과에 대한 해당 집계함수를 한번 더 해줌
        : avg라면 결과에 대한 avg를 해주고, max면 결과에 대한 max를 한번 더 해줌
    
    
*/
    
select 
    buseo,
    count(*),
    sum(basicpay),
    round(avg(basicpay)),
    max(basicpay),
    min(basicpay),
    max(ibsadate)
from tblInsa
    group by rollup(buseo)
    ;
    
    
--다중 그룹
-- > 그룹의 차원 수에 따라 각각 중간집계를 해줌.
select 
    buseo,
    jikwi,
    count(*)
from tblInsa
    group by rollup(buseo,jikwi);
    


/*

cube()
    - group by의 결과에서 집계 결과를 좀 더 자세하게 반환한다.
    - 그룹별 중간 통계를 내고 싶을 때 사용

*/


select
    buseo,
    jikwi,
    count(*)
from tblInsa
    group by cube(buseo, jikwi);

--rollup : 다중 그룹이 수직 관계 (상하 존재)
--cube : 다중 그룹이 수평관계 (동등). 하위 그룹에 대한 집계도 해줌

