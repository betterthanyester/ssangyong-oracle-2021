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










