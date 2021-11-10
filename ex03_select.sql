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
