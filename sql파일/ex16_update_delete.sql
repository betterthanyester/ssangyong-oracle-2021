-- ex16_update_delete.sql

/*

Update
    - DML
    - 원하는 행의 원하는 컬럼값을 수정하는 명령어
    - UPDATE 테이블명 SET 컬럼명=값 [, 컬럼값=값] X N [WHERER절]
    - 주의점! *************
        > where이 필요한 수정 시, where절을 반드시 확인한다(뺴먹지 않는다). ********
        > 진짜 큰일남... 데이터 다 날라감... 이런 사고가 비일비재함...
        > 트랜잭션 처리 (commit, rollback)을 안하면 복구가 안됨...
        > 사고치면 바로 얘기해야 된다... 시간이 지날수록 심각해진다...


DELETE
- DML
- 원하는 행을 삭제하는 명령어
- DELETE [FROM] 테이블명 [WHERE절]


*/

commit;
rollback; --원상복구



-- 대한민국 : 서울 > 세종

update tblCountry set capital = '세종'; --다른 나라의 수도도 바꿔버림

update tblCountry set capital = '세종' 
    where name = '대한민국';


-- 1년 후 > 인구 증가 > 10% 증가 
update tblCountry set population = population * 1.1;

-- 1년 후 > 인구 증가('AS') > 5% 증가 
update tblCountry set population = population * 1.05
    where continent = 'AS';


update tblCountry set 
        capital = '부산', 
        area = area*1.2,
        population = population * 1.2
where name = '대한민국';


--delete

delete from tblcountry; -- 전체 지워버림

delete from tblcountry where name = '중국';


select * from tblCountry;

-- select, update, delete --> where절 사용 가능
-- 특정 행 검색
--  a. 1개 > 조건절에 PK를 검색 (******)
--      ex)tblCountry에서 기본키인 name을 검색해서 지워야 함.
--             > 수도인 베이징이 유일한 것처럼 보이더라도, 기본키가 아니므로 이후에도 유일하다는 보장이 없음 
--  b. N개 > 조건절에 일반컬럼을 검색



















