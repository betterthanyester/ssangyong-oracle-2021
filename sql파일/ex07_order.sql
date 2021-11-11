--ex07_order.sql

/*
정렬, Sort
- order by절

SELECT 컬럼리스트
FROM 테이블
WHERE 조건
ORDER BY 기준  ---> 무조건 마지막!



실행 순서
    1. FROM 테이블 -- FROM은 무조건 1번
    2. WHERE 조건
    3. SELECT 컬럼리스트 -- SELECT는 거의 항상 마지막
    4. ORBER BY 기준

*/

-- 오라클에 들어간 데이터의 순서에 연연해하지 말 것!!

-- name + 오름차순

--생략 or asc : 오름차순
--desc : 내림차순


SELECT
    *
FROM
    tblcountry
ORDER BY
    name ASC;

SELECT
    *
FROM
    tblcountry
ORDER BY
    name DESC;

SELECT
    *
FROM
    tblcountry
ORDER BY
    area ASC;

SELECT
    *
FROM
    tblcountry
ORDER BY
    area DESC;

                       --실행순서
SELECT
    name,
    jikwi         ---3
FROM
    tblinsa            ---1
WHERE
    buseo = '기획부'    ---2
ORDER BY
    name ASC;          ---4
    
    
-- 다중 정렬

SELECT
    name,
    buseo,
    jikwi,
    basicpay
FROM
    tblinsa
ORDER BY
    buseo; --- 1차 정렬
    
SELECT
    name,
    buseo,
    jikwi,
    basicpay
FROM
    tblinsa
ORDER BY
    buseo asc, jikwi asc, basicpay asc; --- 3차 정렬
    
SELECT
    name,
    buseo,
    jikwi,
    basicpay
FROM
    tblinsa
ORDER BY 2 asc;   --- 부서 기준 정렬
                    --- select된 컬럼리스트에서의 index 기준
                    --- 다만 쓰지 말 것!!  > 가독성이 너무 떨어짐
                        
SELECT
    name,
    buseo,
    jikwi,
    basicpay
FROM
    tblinsa
ORDER BY 2 asc, 3 asc, 4 asc;   --- 3차 정렬

-- 급여 + 수당 > 정렬
-- 응용 : 단일 컬럼만이 정렬 기준이 될 수 있는 게 아니라, 가공된 값도 가능하다(*******)
select * from tblInsa 
order by basicpay + sudang desc;



--직위별로 정렬 : 부장 > 과장 > 대리 > 사원 순으로


select 
    name, jikwi, 
    case 
        when jikwi = '부장' then 4
        when jikwi = '과장' then 3
        when jikwi = '대리' then 2
        when jikwi = '사원' then 1
    end as jikwiseq
from tblInsa
order by jikwiseq desc;

--별칭을 안주는 경우
select 
    name, jikwi, 
    case 
        when jikwi = '부장' then 4
        when jikwi = '과장' then 3
        when jikwi = '대리' then 2
        when jikwi = '사원' then 1
    end
from tblInsa
order by 3 desc;


-- 정렬에 쓰인 컬럼을 지우는 방법
    -- case~end는 컬럼이 들어가는 모든 곳에 쓰일 수 있음
    -- 기준컬럼에다가 써버리면 됨

SELECT
    name,
    jikwi
FROM
    tblinsa
ORDER BY
        CASE
            WHEN jikwi = '부장' THEN
                4
            WHEN jikwi = '과장' THEN
                3
            WHEN jikwi = '대리' THEN
                2
            WHEN jikwi = '사원' THEN
                1
        END
    DESC;
    
    
-- 기획부 : 남자직원 > 여자직원

select * from tblInsa where buseo = '기획부' 
order by
    case
        when ssn like '%-1%' then 1 
        when ssn like '%-2%' then 2
    end asc;
