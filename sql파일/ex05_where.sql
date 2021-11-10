-- ex05_where.sql

/*

--  SQL = 

SELECT 컬럼리스트
FROM 테이블
WHERE 조건

1. SELECT 컬럼리스트
    - 가져올 컬럼을 지정한다.
    - 컬럼값, 컬럼값을 대상으로 연산
    
2. FROM 테이블
    - 데이터 소스를 지정한다
    - 테이블을 선택
    
3. WHERE 조건
    - 가져올 레코드를 지정한다.
    - 제시한 조건을 만족하는 레코드만 결과셋으로 반환
    - 셀렉션 연산
    
    
WHERE절
    - 가져올 레코드를 지정할 조건을 명시한다.
    - 주로 조건은 비교 연산자나 논리 연산자를 사용한다.
    
    
실행 순서
    1. FROM 테이블 -- FROM은 무조건 1번
    2. WHERE 조건
    3. SELECT 컬럼리스트 -- SELECT는 거의 항상 마지막
    
*/

select * from tblCountry; --FullSet
select name, area from tblCountry; --Projection > FullSet의 부분집합
select * from tblCountry where continent = 'AS'; --Selection > FullSet의 부분집합
select name from tblCountry where continent = 'AS'; -- Selection + Projection > FullSet의 부분집합

-- 직원 (60명 = 60행 + 10컬럼)
select * from tblInsa;

-- 직원의 이름, 부서, 급여만 가져오시오.
select name, buseo, basicpay from tblInsa;

-- 영업부 직원을 가져오시오.
select * from tblInsa where buseo = '영업부';

-- 영업부 직원의 이름, 부서, 급여만 가져오시오.
select name, buseo, basicPay from tblInsa where buseo = '영업부';

-- 영업부 + 서울 + (사원 or 대리)
-- and : and (O) &&(X)
select * from tblInsa where buseo = '영업부' and city = '서울' and (jikwi = '사원' or jikwi = '대리');

--급여가 150만원 이상 200만원 이하
select * from tblInsa where basicpay >- 1500000 and basicpay <=2000000;

-- '대한미디어' 출판사에서 출간한 책만 가져오시오.
select * from book where publisher = '대한미디어';


select * from tblComedian;
--1. 몸무게가 60kg이상이고, 키가 170cm미만인 사람만 가져오시오
desc tblcomedian;
select * from tblComedian where weight >= 60 and height < 170;

--이름 세글자로 가져오고자 할 때
--컬럼에 연산들어가면 무조건 별칭 쓴다고 생각하자
select last || first as name, gender, height, weight, nick   
from tblComedian 
where weight >= 60 and height < 170;


--2. 여자만 가져오시오.
select * from tblComedian where gender = 'f';


--tblInsa
--3. 부서가 '개발부'이고 급여를 150만원 이상 받는 직원을 가져오시오.
select * from tblInsa 
where buseo = '개발부' and basicpay >= 1500000;

--4. 급여(basicpay) + 수당(sudang) 금액이 200만원 이상인 직원
select * from tblInsa where basicpay + sudang >= 2000000;

select name, basicpay, sudang, (basicpay+sudang) from tblInsa 
where basicpay + sudang >= 2000000;

-- 조건절(WHERE)에서 사용되는 여러 구문들... (연산자, 함수, 절..)

/*

between ~ and
- where절에서 사용 > 조건으로 사용
                 > 범위 조건 으로 사용
- 컬럼명 between 최소값 and  최대값
- 연산자 사용보다 가독성 향상 (성능 느림)
- 최소값, 최대값 포함 (inclusive)


*/


-- tblComedian 몸무게 60~70kg 사이
select last || first as name, weight   
from tblComedian 
where weight >= 60 and weight <=70;

select last || first as name, weight   
from tblComedian 
where weight between 60 and 70;



-- 비교 연산에 사용되는 자료형
-- 1. 숫자형
select * from tblInsa where basicpay >= 1500000;
select * from tblInsa where basicpay >= 1500000 and basicpay <=2000000;
select * from tblInsa where basicpay between 1500000 and 2000000;

-- 2. 문자형
select * from tblInsa where name > '박';
select * from tblInsa where name >= '박' and name <= '유' ;
select * from tblInsa where name between '박' and '유' ;

-- 3. 날짜형
--- 문자열로 쓰면, 알아서 형변환을 해줌 (자바와 달리)
select * from tblInsa where ibsadate > '2010-01-01'; -- 2010년 이후에 입사한 사람들
select * from tblInsa where ibsadate >= '2010-01-01' and ibsadate <= '2010-12-31'; -- 2010년도에 입사한 사람들
select * from tblInsa where ibsadate between '2010-01-01' and '2010-12-31'; -- 2010년도에 입사한 사람들


/*
in
- where절에서 사용
        > 조건으로 사용
        > 열거형 조건
        > 제시된 값 중 하나라도 만족
- 컬럼명 in (값, 값, 값, ...) 

*/

--tblInsa. 홍보부 + 개발부 + 총무부
select * from tblInsa where buseo = '홍보부';
select * from tblInsa where buseo = '홍보부' or buseo = '개발부' or buseo = '총무부';
select * from tblInsa where buseo in ('홍보부', '개발부', '총무부');

---tblInsa. (부장, 과장) + (서울, 인천) + 급여가 250과 260만원 사이
select * from tblInsa
    where jikwi in ('부장','과장')
        and city in ('서울', '인천')
        and basicpay between 2500000 and 2600000;

/*

like
- where절에서 사용 
        > 조건으로 사용
- 패턴 비교
        > 정규 표현식의 동작과 유사
- 컬럼명 like '패턴 문자열'
- 문자형에만 사용 가능(숫자, 날짜 적용 불가능)

패턴 문자열 구성 요소
1. _: 임의의 문자 1개
2. %: 임의의 문자 N개 (0~무한대)

*/

select name from tblInsa;
select name from tblInsa where name like '___';
select name from tblInsa where name like '김__';
select name from tblInsa where name like '__수';

select * from employees where first_name like '_____';
select * from employees where first_name like 'A____';
select * from employees where first_name like '____a';

select * from tblInsa where tel like '010-____-____';

-- tblInsa. 남자 직원만
-- tblInsa. 여자 직원만

select * from tblInsa where ssn like '______-1______';
select * from tblInsa where ssn like '______-2______';

-- 김 씨만
select * from tblInsa where name like '김%';

-- A로 시작
select * from employees where first_name like 'A%';

--A로시작하고, 중간에 뭐가 와도 상관 없고, a로 끝나는
select * from employees where first_name like 'A%a';

--a로 끝나는
select * from employees where first_name like '%a';

--a를 포함하는 (a로 시작하든, a로 끝나든, a가 중간에 있든)
select * from employees where first_name like '%a%';

-- 남자만
select * from tblInsa where ssn like '%-1%';

/*
RDBMS에서의 null
    - 자바의 null과 유사
    - 컬럼값(셀)이 비어있는 상태
    - null 상수 제공
    - 대다수의 언어에서 null은 연산의 대상이 될 수 없다.


null 조건
    - WHERE 절 사용
    - 컬럼명 is null
            : null은 연산의 대상이 되지 않으므로 다른 방법을 제공한 것임

*/

-- 인구수가 미기재된 나라는?
select * from tblCountry where population = null; --X
select * from tblCountry where population is null; --O

-- 인구수가 기재된 나라?
select * from tblCountry where population <> null; --X
select * from tblCountry where not population is null; --O
select * from tblCountry where population is not null; --O (더 많이 사용)

-- 연락처가 없는 직원?
select * from tblInsa where tel is null;

-- 연락처가 있는 직원?
select * from tblInsa where tel is not null;

select * from tblTodo;

-- 아직 실행하지 않은 할일?
select *  from tblTodo where completedate is null;

-- 완료한 할일?
select *  from tblTodo where completedate is not null;



-- 도서관 > 도서 대여 테이블 (대여날짜, 반납날짜)
-- 아직 반납 안된 대여 기록?
select * from 도서대여 where 반납날짜 is null;

반납이 완료된 대여 기록?
select * from 도서대여 where 반납날짜 is not null;

