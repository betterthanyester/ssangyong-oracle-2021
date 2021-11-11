-- ex06_column.sql


/*

컬럼 리스트에서 할 수 있는 행동들... 

distinct
    - 컬럼 리스트에서 사용
    - distinct 컬럼명
    - 중복값을 제거한다.


*/ 

-- 14개 나라가 속한 대륙을 가져오시오.
select continent from tblCountry;

-- tblCountry에는 어떤 대륙들이 있습니까?
select continent from tblCountry; --중복값 포함
select distinct continent from tblcountry; --중복 제거

--tblInsa. 어떤 부서가 있어요?
select distinct buseo from tblInsa;

--tblInsa. 어떤 직위가 있어요?
select distinct jikwi from tblInsa;

--중복값이 존재하지 않을 때 distinct > 아무일도 일어나지 않음
select distinct name from tblcountry;
/*
--대륙은 중복값을 제거하고, 국가명은 그대로 가져오시오.
    > 관계형 데이터베이스에서는 말이 안되는 질문
--중복값이 존재하는 컬럼과, 중복값이 존재하지 않는 컬럼이 같이 있으면 distinct는 의미 없다;;

*/

select distinct continent, name from tblcountry;
select continent, distinct name from tblCountry;  --물리적 해석 (정답)

select distinct continent, name from tblCountry;
--> select distinc (continent, name) from tblCountry; 로 판단함. 즉 행(튜플)로 따지기 때문에 모든 속성값이 동일한 튜플만 동일하게 파악하여 distinct로 처리됨.

--중복제거를 할 마음이 없다는 뜻.. > 테이블은 반드시 기본키 존재 > 행과 행에 다른 데이터 존재
select distinct * from tblInsa;


/*
case 
    - 컬럼 리스트에서 사용
    - 조건절에서 사용
    - 자바의 조건문 역할
            > 컬럼값 조작
    - 조건을 만족하지 못하면 null을 반환함 (*********)
            > else로 처리 가능
*/

select 
    last || first as name, --유재석, 박명수
    case                   -- case ~ end는 하나의 컬럼임!
        when gender = 'm' then '남자'
        when gender = 'f' then '여자'
    end as gender          -- case ~ end가 하나의 컬림이므로, alias를 붙일 수 있음 
                            -- 해당 컬럼은 한번 쓰고 버려지는 임시적인 컬럼이므로, 원본테이블과 같은 이름 사용 가능
from tblComedian;

select 
    name,
    continent,
    case
        when continent = 'AS' then '아시아'
        when continent = 'SA' then '아메리카'
        when continent = 'EU' then '유럽'
        -- else '기타'
        -- else continent --조건 만족 X 시, 원본 데이터를 출력
        -- else capital --이렇게도 됨. 근데 사용금지...  관계형 데이터모델에서 각 속성은 같은 자료형과 같은 도메인 (의미) 을 가져야 함!!!! 
        else population -- 자료형이 다르면 처음부터 에러가 남 (ORA-00932: inconsistent datatypes: expected CHAR got NUMBER)
                        -- 자료형과 의미가 동일해야 함
        
    end as 대륙
from tblCountry;

/*
TODO 복붙

*/ 


--입사일(근무년차)
--5년 미만 : 주니어
--5년 ~ 10년 미만 : 시니어
--10년 이상 : 익스퍼트

select
    name,
    ibsadate,
    case
        when ibsadate > '2016-11-11' then '주니어'
        when ibsadate <= '2016-11-11' and ibsadate > '2011-11-11' then '시니어'
        when ibsadate <= '2011-11-11' then '익스퍼트'
    end
from tblInsa;


select * from tblTodo where completedate is null; --해야할일
select * from tblTodo where completedate is not null; --완료된일

--해야할일과 완료된일을 동시에 가져오기. 구분해서
select
    title, 
    case
        when completedate is not null then '완료된일'
        when completedate is null then '해야할일'
    end as state
from tblTodo;
        
select * from tblmen;
select * from tblwomen;


select 
    name,
    case
        when couple is not null then '여자친구 있음'
        when couple is null then '여자친구 없음'
    end as state
from tblMen;

-- 직위별 수당 + a > 부장(x2) 과장(x1.7) 대리(*1.5) 사원(*1.3)
select
    name, jikwi, sudang,
    case
        when jikwi = '부장' then sudang*2
        when jikwi = '과장' then sudang*1.7
        when jikwi = '대리' then sudang*1.5
        when jikwi = '사원' then sudang*1.3
    end as sudang2
from tblinsa;

-- 직위별 수당 + a > 부장(x2) 과장(x2) 대리(*1.5) 사원(*1.5)
select
    name, jikwi, sudang,
    case
        --when jikwi = '부장' then sudang*2
        --when jikwi = '과장' then sudang*1.7
        --when jikwi = '대리' then sudang*1.5
        --when jikwi = '사원' then sudang*1.3
        when jikwi in ('부장','과장') then sudang *2
        when jikwi in ('대리','사원') then sudang *1.5
        
    end as sudang2
from tblinsa;



