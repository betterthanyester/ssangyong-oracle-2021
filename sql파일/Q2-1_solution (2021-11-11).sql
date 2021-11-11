--Q2-1 (count) (2021-11-11)

-- 1. tblCountry. 아시아(AS)와 유럽(EU)에 속한 나라의 개수?? -> 7개
select * from tblcountry;

select 
    count(case
        when continent = 'AS' then 1
    end) as 아시아,
    count(case
        when continent = 'EU' then 1
    end) as 유럽
from tblCountry;


select count(*) from tblCountry
    where continent in ('AS','EU');



-- 2. 인구수가 7000 ~ 20000 사이인 나라의 개수?? -> 2개

select 
    count(population)
from tblcountry
where population between 7000 and 20000;

-- 3. hr.employees. job_id > 'IT_PROG' 중에서 급여가 5000불이 넘는 직원이 몇명? -> 2명
select * from employees;

select
    count(*)
from employees
where job_id = 'IT_PROG' and salary > 5000;



-- 4. tblInsa. tel. 010을 안쓰는 사람은 몇명?(연락처가 없는 사람은 제외) -> 42명
select * from tblInsa;

select
    count(tel)
    -count(case 
            when tel like '010%' then 1
            end)
from tblInsa;

--ORA-00905: missing keyword
--> then 빼먹었을 때

select count(*) from tblInsa
    where not tel like '010%';



-- 5. city. 서울, 경기, 인천 -> 그 외의 지역 인원수? -> 18명
SELECT
    COUNT(*) - COUNT(
        CASE
            WHEN city IN('서울', '경기', '인천') THEN                1
        END
    )
FROM
    tblinsa;
    
select count(*) from tblInsa
    where not city in ('서울','경기','인천');
select count(*) from tblInsa
    where city not in ('서울','경기','인천');  -- 이걸 더 많이 씀
        

-- 6. 여름태생(7~9월) + 여자 직원 총 몇명? -> ?명

select 
    count(case
            when ssn like '___7%-2%' 
                or ssn like '___8%-2%'
                or ssn like '___9%-2%'
            then 1
            end) as 답
from tblInsa;


select count(*) from tblInsa
    where  ssn like '___7%-2%' 
                or ssn like '___8%-2%'
                or ssn like '___9%-2%';
                

select count(*) from tblInsa
    where  (ssn like '___7%' or ssn like '___8%' or ssn like '___9%')
        and ssn like '%-2%';
                
                   

-- 7. 개발부 + 직위별 인원수?

select distinct jikwi from tblinsa;

select 
    count(case
            when buseo = '개발부' 
            and jikwi = '부장' then 1
            end) as 부장, 
    count(case
            when buseo = '개발부' 
            and jikwi = '과장' then 1
            end) as 과장,
    count(case
            when buseo = '개발부' 
            and jikwi = '대리' then 1
            end) as 대리, 
    count(case
            when buseo = '개발부' 
            and jikwi = '사원' then 1
            end) as 사원 
from tblInsa;
