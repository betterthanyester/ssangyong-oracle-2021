-- ex03_selsect.sql

-- tblCountry

-- desc 테이블명;  : 테이블 구조를 확인하는 명령어
desc tblCountry;  --sql Developer에서만 쓰이는 명령어

-- 논리 다이어그램 : 사람이 보고 즉시 파악하기 쉬움
-- 물리 다이어그램 : 개발자가 보고 데이터를 파악

/*

SELECT 문
    - DML, DQL
    - 관계대수 연산 중 셀렉션 작업을 구현한 명령어
    - 대상 테이블로부터 원하는 행(튜플)을 추출하는 작업 > 데이터 주세요.
    - 사용빈도 : TOP 1
    - 교재 p145
    
    
-- 대괄호 : 생략가능한 구문

[WITH <Sub Query>]
SELECT column_list
FROM table_name
[WHERE search_condition]
[GROUP BY group_by_expression]
[HAVING search_condition]
[ORDER BY order_expression [ASC|DESC]


-- SELECT를 구성하는 절의 실행 순서 (***)
1. FROM
2. SELECT




FROM 테이블 - 데이터를 가져올 테이블을 지정한다.
SELECT 컬럼리스트 - 가져올 특정 컬럼을 지정한다.


-- 기본 SELECT
SELECT 컬럼리스트
FROM 테이블
    -> 테이블로부터 행을 가져오세요 (+ 적어놓은 컬럼리스트를 포함해서) 



SELECT 컬럼리스트
FROM 테이블
WHERE 조건


*/


select name
from tblCountry; 

/*
SQL이 구현한 Projection 연산
행의 개수 = 원본과 동일한 14개
컬럼의 개수 = 1개 = select에 적어놓은 name

*/


select capital from tblCountry;


select population from tblCountry;




desc book; -- 데이터 구조 파악

select bookname from book; -- 책이름 컬럼만 가져오기

/*
select      -- from절을 먼저 적으면, select에 인텔리센스가 뜬다!!! 그래서 from절부터 먼저 쓰기도 한다. 
from book;
*/


select name from tblCountry;
select name,capital from tblCountry;

select name, capital, population, continent, area
from tblCountry;   -- * 과 같은 의미여도, 가독성이 높아서 많이 씀


select * from tblcountry;  -- *(와일드카드) : 다 가져옴

-- 식별자가 틀린 경우
-- ORA-00904: "NAME2": invalid identifier
select name2 from tblCountry;

-- 테이블명이 틀린 경우
-- ORA-00942: table or view does not exist
select name from tblCountry2;


-- 컬럼 리스트의 순서는 원본 테이블의 컬럼 순서와 무관하다. (개발자가 순서를 재정의할 수 있음)
select name, capital from tblCountry;
select capital, name from tblCountry; 

-- 동일한 컬럼을 여러번 가져와도 된다.
select name, name from tblCountry;

-- 다만, 보통 가공 처리를 해서 가져온다.
-- SQL에서 문자열 더할 때는 '||' (OR)을 쓴다.
select name, name || '@' from tblCountry;



-- 여러가지 시스템 정보를 보고 싶을 때...
-- 우선 관리자로 바꾸고

-- 1. 사용자 정보 보기
select * from sys.dba_users;

-- 2. 특정 사용자의 테이블 정보
select * from sys.dba_tables;  -- 오라클에 설치된 모든 테이블

select * from sys.dba_tables where owner = 'HR';  -- HR이라는 사용자가 가진 모든 테이블

-- 3. 특정 테이블의 컬럼 정보 > 스키마
select * from sys.dba_tab_columns where owner = 'HR' and table_name = 'TBLCOUNTRY';

-- 오라클은 객체 식별자(계정, 테이블이름, 컬럼명 등)는 대문자로 저장한다.
    -- 그래서 위 처럼 이름 자체로 데이터를 접근할 때는 대문자로 접근해야 함
-- 사용자가 SQL에서 객체 식별자를 사용할 때는 대소문자를 구분하지 않는다.
