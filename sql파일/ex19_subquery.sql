--ex19_subquery.sql


/*

Main Query, 일반 쿼리
    - 하나의 SELECT(INSERT, UPDATE, DELETE)로만 되어있는 쿼리

Sub Query, 서브 쿼리, 부속 질의 p224
    - 하나의 쿼리 안에 또 다른 쿼리가 들어있는 쿼리
    - 하나의 SELECT(INSERT, UPDATE, DELETE)안에 또 다른 쿼리(SELECT)가 들어있는 쿼리
    - 삽입 위치 > SELECT절, FROM절, WHERE절, GROUP BY절, HAVING절, ORDER BY절 등...

 
 --서브쿼리 용도
    1. 조건절에 비교값으로 사용
        a. 반환값이 1행 1열
        b. 반환값이 N행 1열
        c. 반환값이 1행 N열
        d. 반환값이 N행 N열


*/


-- tblCountry. 인구수가 가장 많은 나라의 이름은?
-- tblComedian. 체중이 가장 많은 사람의 이름?
-- tblInsa. 급여가 가장 많은 직원이 소속된 부서는?

select * from tblCountry;
select max(population) from tblCountry; --120660
select name from tblCountry where population = 120660;

select name from tblCountry where population = (select max(population) from tblCountry);

select max(weight) from tblComedian;
select last || first from tblComedian where weight = (select max(weight) from tblComedian);

select max(basicpay) from tblInsa;
select buseo from tblInsa where basicpay = (select max(basicpay) from tblInsa);


-- tblInsa. 전체 평균 급여보다 더 많이 받으며, 서울인 직원을 가져오시오.
select * from tblInsa;

select * from tblInsa 
    where basicpay > (select avg(basicpay) from tblInsa)
        and city = '서울';


-- tblInsa. '홍길동'가 근무하는 부서의 직원을 가져오시오.

select * from tblInsa
    where buseo = (select buseo from tblInsa where name = '홍길동')
    ;


/*

 --서브쿼리 용도
    1. 조건절에 비교값으로 사용
        a. 반환값이 1행 1열
            > 스칼라 쿼리
            > 단일값 반환 (원자값)
            > 상수 취급
            > 비교연산자로 비교
        b. 반환값이 N행 1열
            > 열거형 비교 로 취급
            > in 연산자 사용
        c. 반환값이 1행 N열
            > 그룹으로 연산자를 비교해서 사용
            
        d. 반환값이 N행 N열
            > b + c 혼합

*/


select * from tblInsa
    where name = (select name from tblInsa where buseo = '기획부'); --ORA-01427: single-row subquery returns more than one row
    
--급여가 250만원 이상 받는 사람이 근무하는 부서의 직원 명단을 가져오시오

select * from tblInsa
    --where buseo = (select buseo from tblInsa where basicpay >= 2500000); --ORA-01427: single-row subquery returns more than one row
    where buseo in (select buseo from tblInsa where basicpay >= 2600000);


-- '홍길동'과 같은 거주지, 같은 부서인 직원 명단을 가져오시오.
select * from tblInsa where city = '서울' and buseo = '기획부';

select city, buseo from tblInsa where name = '홍길동';

select * from tblInsa where (city, buseo) = (select city, buseo from tblInsa where name = '홍길동');
    
    
    
--
select buseo, city from tblInsa where basicpay >= 2600000;
select * from tblInsa
    where (buseo,city) in (select buseo, city from tblInsa where basicpay >= 2600000);    
    
    
-- Roma 도시에 위치한 부서에 소속된 직원들 명단?
select * from employees where department_id = 70;
select department_id from departments where location_id = 2700;
select location_id  from locations where city = 'Munich';


select * from employees where department_id = (select department_id from departments where location_id = (select location_id  from locations where city = 'Munich'
));


---------------------위 까지 : where절에서 서브쿼리 쓰는 경우-----------------
---exERD
select * from tblStudy;




------------------이하 : 컬림 리스트에서 서브쿼리 쓰는 경우--------

-- 2. 컬림리스트에서 사용

/*

 --서브쿼리 용도
 -- 1. 조건절에 비교값으로 사용
        a. 반환값이 1행 1열
            > 스칼라 쿼리
            > 단일값 반환 (원자값)
            > 상수 취급
            > 비교연산자로 비교
        b. 반환값이 N행 1열
            > 열거형 비교 로 취급
            > in 연산자 사용
        c. 반환값이 1행 N열
            > 그룹으로 연산자를 비교해서 사용
            
        d. 반환값이 N행 N열
            > b + c 혼합
            
-- 2. 컬럼리스트에서 사용
        - 반드시 결과값이 1행 1열이어야 한다 (*************)
            > 스칼라 쿼리
        a. 정적 쿼리
            > 모든 행에 동일한 값을 적용
            > 사용 빈도 적음
        b. 상관 서브 쿼리
            > 서브 쿼리의 값과 바깥쪽 쿼리의 값을 서로 연결
            > 사용 빈도 높음

*/

select
    name,
    buseo,
    basicpay,
    --round(avg(basicpay)) --ORA-00937: not a single-group group function  집계함수와 일반 컬럼을 같이 사용 불가
    (select round(avg(basicpay)) from tblInsa) --숮자 데이터 하나
from tblInsa;

select
    name,
    buseo,
    basicpay,
    (select capital from tblCountry where name = '미국') --문자열 데이터 하나
from tblInsa;


select
    name,
    height,
    couple,
    (select height from tblWomen where name = tblmen.couple) as height
from tblMen;

select * from tblWomen;


select
    name,
    buseo,
    (select round(avg(basicpay)) from tblinsa) as "전체 평균 급여",
    --(select round(avg(basicpay)) from tblinsa where buseo = tblInsa.buseo) as "소속부서 평균 급여" --이렇게 하면 바깥쪽 테이블이 아닌, 서브쿼리의 테이블을 지칭하게 됨
    (select round(avg(basicpay)) from tblinsa where buseo = a.buseo) as "소속부서 평균 급여"  --이런 식으로 안쪽 테이블과 바깥쪽 테이블이 구분되지 않는다면, 바깥쪽 테이블에 alias 붙여서 불러올 수 있음
from tblInsa a;   --테이블에 alisa 붙일 때는 'as' 안씀



-- 직원 명단을 가져오시오 (employee_id, last_name||first_name, department_name)


select
    employee_id, last_name||first_name, 
    department_id,
    (select department_name from departments where department_id = employees.department_id)
from employees;

select * from departments;



/*

 --서브쿼리 용도
 -- 1. 조건절에 비교값으로 사용
        a. 반환값이 1행 1열
            > 스칼라 쿼리
            > 단일값 반환 (원자값)
            > 상수 취급
            > 비교연산자로 비교
        b. 반환값이 N행 1열
            > 열거형 비교 로 취급
            > in 연산자 사용
        c. 반환값이 1행 N열
            > 그룹으로 연산자를 비교해서 사용
            
        d. 반환값이 N행 N열
            > b + c 혼합
            
-- 2. 컬럼리스트에서 사용
        - 반드시 결과값이 1행 1열이어야 한다 (*************)
            > 스칼라 쿼리
        a. 정적 쿼리
            > 모든 행에 동일한 값을 적용
            > 사용 빈도 적음
        b. 상관 서브 쿼리
            > 서브 쿼리의 값과 바깥쪽 쿼리의 값을 서로 연결
            > 사용 빈도 높음

-- 3. FROM절에서 사용
        - 서브쿼리의 결과셋을 또 하나의 테이블이라고 생각하고 사용
        - 인라인 뷰 (Inline View)

-- 4. GROUP BY, HAVING, ORDER BY 
        > X



*/

select name, buseo, jikwi from tblInsa;
select * from (select name, buseo, jikwi from tblInsa);



select
    name,
    height,
    couple,
    (select height from tblWomen where name = tblmen.couple) as height2
from tblMen
    --order by height desc --ORA-00960: ambiguous column naming in select list  --> 컬럼리스트의 height가 두개 있으므로 구분을 못함
    order by height2 desc
    ;
    
--ORA-22818: subquery expressions not allowed here
select 
    (select height from tblWomen where name = tblmen.couple) as height2
from tblmen
    group by (select height from tblWomen where name = tblmen.couple)
    ;
    
--