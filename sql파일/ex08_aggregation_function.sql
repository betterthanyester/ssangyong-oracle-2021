-- ex08_aggregation_function.sql


/*

자바
- 클래스(객체) : 멤버 변수 + 멤버 메소드
- 클래스가 소유하는 함수를 메소드라고 부른다.

오라클 
- 클래스(객체) : 존재 X
- 함수(Function) 제공 > 계정(HR)에 소속
    a. 내장형 함수 (Built-in Function)
    b. 사용자 정의 함수 (User Function) : PL/SQL
     
     
집계 함수, Aggregation Function

    - 통계값
        1. count()
            - 결과셋의 레코드 수를 반환한다.
            - number count(컬럼명)
            - 매개변수의 컬럼은 1개만 넣을 수 있다.
                > 단, *(all)은 넣을 수 있다.
            - null은 제외한다 (***)
                > * (all)의 경우 모든 컬럼이 null값이 아닌 이상 해당 튜플이 제외되지 않음
        2. sum()
        3. avg()
        4. max()
        5. min()
*/

select name from tblCountry;
select count(name) from tblCountry;
    
select name from tblInsa where city in ('서울','경기','인천');
select count(name) from tblInsa where city in ('서울','경기','인천');

select * from tblCountry;
select count(*) from tblCountry;

select name, capital from tblCountry;
select count(name,capital) from tblCountry; -- ORA-00909: invalid number of arguments
    
select population from tblCountry;
select count(population) from tblCountry;  --null제외됨
    
select * from tblTodo where completedate is null;
select * from tblTodo where completedate is not null;
select count(*) from tblTodo;

select count(*) -- 3 : 8개
from tblTodo   -- 1: 20개
where completedate is null;  --2 : 8개

select count(*) from tblTodo where completedate is not null;

select 
    count(*) as "전체 할일의 개수",
    count(completedate) as "한일의 개수",
    count(*) - count(completedate) as "안한일의 개수"
from tblTodo;


--tblInsa. 총직원수, 연락처가 있는 직원수, 연락처가 없는 직원수
select 
    count(*) as "총직원수",
    count(tel) as "연락처가 있는 직원수",
    count(*) - count(tel) as "연락처가 없는 직원수"
from tblInsa;

--tblInsa. 어떤 부서들이 있습니까?
select distinct buseo from tblInsa;

--tblInsa. 부서가 몇개나 있습니까?
select count(buseo) from tblInsa; --중복 포함
select count(distinct buseo) from tblInsa; --중복 제거

--tblComedian. 남자 수, 여자 수.
select count(*) from tblInsa where gender = 'm'; 
select count(*) from tblInsa where gender = 'f';

--총인원수, 남자수, 여자수를 하나의 결과셋으로 가져오시오. > 자주 사용하는 패턴(*************)
select
    case
        when gender = 'm' then '남자'
    end,
    case 
        when gender = 'f' then '여자'
    end
from tblComedian; 

select
    count(case
        when gender = 'm' then '남자'
    end) as 남자,
    count(case 
        when gender = 'f' then '여자'
    end) as 여자
from tblComedian; 
                --기억하자. case-end 는 컬럼 한개이다. 따라서 통째로 count 취할 수 있다.
                --count는 null을 날리므로 가능한 패턴임. (위에 꺼 실행해보셈)
                
--tblInsa 80년대생 남자수, 90년대생 남자수, 80년대생 여자수, 90년대생 여자수
select ssn from tblInsa;

select
    case --80년대생 남자
        when ssn like '8%-1%' then 1   ---then 뒤는 아무거나 써도 됨. 어차피 count할거고 count는 값의 유무만 의미있으므로
    end,
    case --90년대생 남자
        when ssn like '9%-1%' then 1   
    end,
    case --80년대생 여자
        when ssn like '8%-2%' then 1   
    end,
    case --90년대생 여자
        when ssn like '9%-2%' then 1   
    end
from tblInsa;


select
    count(case --80년대생 남자
        when ssn like '8%-1%' then 1   ---then 뒤는 아무거나 써도 됨. 어차피 count할거고 count는 값의 유무만 의미있으므로
    end) as "80년대 남자",
    count(case --90년대생 남자
        when ssn like '9%-1%' then 1   
    end) as "90년대 남자",
    count(case --80년대생 여자
        when ssn like '8%-2%' then 1   
    end) as "80년대 여자",
    count(case --90년대생 여자
        when ssn like '9%-2%' then 1   
    end) as "90년대 여자"
from tblInsa;

/*
2. sum()
    - number sum(컬럼명)
    - 해당 칼럼값의 합을 구한다.
    - 숫자형 컬럼에 적용한다. (문자형X, 날짜형X)


*/ 


select sum(area) from tblCountry;
select sum(population) from tblCountry;
select sum(name) from tblCountry; -- ORA-01722: invalid number

select
    sum(basicpay), sum(sudang),
    sum(basicpay) + sum(sudang),
    sum(basicpay + sudang)
from tblInsa;

select sum(ibsadate) from tblInsa; --ORA-00932: inconsistent datatypes: expected NUMBER got DATE

select sum(basicpay) from tblInsa where buseo = '기획부';
select sum(basicpay) from tblInsa where jikwi = '부장';

/*

3. avg
    - number avg(컬럼명)
    - 해당 컬럼값의 평균을 구한다.
    - 숫자형 컬럼에 적용한다.
    - null인 레코드는 몫에서 제외한다 (*****)
*/

-- 급여 평균?
select sum(basicpay)/60 from tblInsa;
select sum(basicpay)/? from tblInsa;  --직원수는 항상 바뀜
select sum(basicpay)/count(*) from tblInsa;  --위에 보단 안정적
select avg(basicpay) from tblInsa;  --avg로 한번에

--- 주의 : avg는 평균을 하는 속성값이 null인 튜플은 제외하고 평균을 구한다.

select 
    avg(population),                    --15588.6153846153846153846153846153846154
    sum(population)/count(*),           --14475.1428571428571428571428571428571429
    sum(population)/count(population),  --15588.6153846153846153846153846153846154

from tblCountry;

select
    count(*),
    count(population) --케냐(null) > count()함수는 null을 제외한다.
from tblCountry;


-- 회사 성과급 지급
--  : 실적 발생 > 지급
--  1. 균등 지급 : 총지급액 / 모든 팀원수 = sum()/count(*)
--  2. 차등 지급 : 총지급액 / 참여 팀원수 = sum()/count(참여팀원)


/*

4. max()
5. min()
    - object max(컬럼명) : 최대값 반환
    - object min(컬럼명) : 최소값 반환
    - 숫자형, 문자형, 날짜형 모두 적용한다.

*/

select max(height), min(height), max(weight), min(weight) from tblComedian;

select max(name),min(name), max(ibsadate), min(ibsadate) from tblInsa;

select 
    count(*) as "영업부 직원수",
    sum(basicpay) as "영업부 총급여 합",
    avg(basicpay) as "영업부 평균 급여",
    max(basicpay) as "영업부 최고 급여",
    min(basicpay) as "영업부 최소 급여"
from tblInsa
    where buseo = '영업부';



-- 집계 함수 사용 시 주의점!! ***********************

-- 1.ORA-00937: not a single-group group function
-- 컬럼 리스트에 집계 함수와 단일 컬럼은 동시에 사용할 수 없다.
--  > 성질이 다르다
--  > 집계 함수 (집합값), 단일 컬럼(개인값)
select count(*) from tblInsa;
select name from tblInsa;
select count(name) from tblInsa;

select name, count(name) from tblInsa; --ORA-00937: not a single-group group function



-- 2. ORA-00934: group function is not allowed here
--  where절에는 집계 함수를 사용할 수 없다.
--  where절은 개개인에 대한 조건을 다루는 영역
select avg(basicpay) from tblInsa;
select * from tblInsa where basicpay > avg(basicpay); --ORA-00934: group function is not allowed here

