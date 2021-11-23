--ex23_pseudo.sql

/* 의사 컬럼, Pseudo Column
- 실제 컬럼이 아닌데 컬럼처럼 행동하는 객체


rownum
    - 행의 번호
    - 결과셋의 부분집합 추출 가능 (레코드의 순서를 사용해서)
    - from절이 실행될 때 할당이 된다. (************)
    - where절의 영향을 받아 reindexing 된다.
        > 서브쿼리를 사용해서 rownum을 고정시켜서 사용한다.
        > 원하는 정렬을 한 후 행번호를 사용하고 싶을 땐 > 서브쿼리로 정렬을 먼저 한 후 > 메인쿼리에서 rownum을 사용한다.
        -- 공식화
            -- 1. 첫번째 서브쿼리 > 원하는 정렬
            -- 2. 두번째 서브쿼리 > rownum(rnum)을 생성
            -- 3. 세번째 서브쿼리 > rnum 조건 + select
    
    
*/



select name, buseo, rownum from tblInsa;

select name, buseo, rownum from tblInsa where rownum <= 5;
select name, buseo, rownum from tblInsa where rownum = 1;

-- rownum이 1이니 -> 아니면 탈락 -> reindexing -> 2번행의 rownum이 1이 됨 -> .... 계속 1로 reindexing되므로 1을 포함하지 않는 where절은 만족될 수가 없음 
select name, buseo, rownum from tblInsa where rownum = 3; -- 안됨
select name, buseo, rownum from tblInsa where rownum >=2 and rownum <=5; -- 안됨

select * from (select name, buseo, rownum from tblInsa);

-- rownum은 from이 실행될 때 계산된다.
select name, buseo, rownum,rnum  from (select name, buseo, rownum as rnum from tblInsa); --rownum과 rnum은 다른 컬럼

select name, buseo, rownum from tblInsa order by basicpay desc; --뒤죽박죽

-- 원하는 정렬을 한 후 행번호를 사용하고 싶을 땐 > 서브쿼리로 정렬을 먼저 한 후 > 메인쿼리에서 rownum을 사용한다.
select name, buseo, rownum,rnum from (select name, buseo, rownum as rnum from tblInsa order by basicpay desc); --제대로 정렬됨 (rnum과 비교)

--rownum : 계산된 컬럼   (where 절의 영향을 받음)
--rnum : 고정된 정적 컬럼 (where 절의 영향을 안받음)
select name, buseo, rownum, rnum from (select name, buseo, rownum as rnum from (select name, buseo from tblInsa order by basicpay desc))
    --where rownum = 3 -- X
    --where rnum = 3 -- OK
    where rnum between 5 and 10; --OK

;
    -- 1. 첫번째 서브쿼리 > 원하는 정렬
    -- 2. 두번째 서브쿼리 > rownum(rnum)을 생성
    -- 3. 세번째 서브쿼리 > rnum 조건 + select
    
-- 끊어 보기
select * from tblAddressbook;

select *, rownum from tblAddressbook;  --rownum과 와일드카드 같이 쓰려면, 와일드카드에 테이블명 명시해야 함
select a.*, rownum from tblAddressbook a;

-- 1~20
select a.*, rownum from tblAddressbook a where rownum <=20;

-- 이름 순으로 정렬 + 1~20
select a.*, rownum from tblAddressbook a where rownum <=20 order by name asc; --X. 정렬하기 전의 rownum을 기준으로 가져옴

    -- A. 정렬
select * from tblAddressbook order by name asc;
    -- B. 서브쿼리 + rownum
select a.*, rownum as rnum from (select * from tblAddressbook order by name asc) a;
    -- C. 서브쿼리 + 조건
select * from (select a.*, rownum as rnum from (select * from tblAddressbook order by name asc) a)
    where rnum between 21 and 40;    
    
    
    
-- tblInsa
-- 급여를 많이 받는 1~10등 + 이름, 부서, 급여

select name, buseo, basicpay from tblInsa order by basicpay desc;

select a.*, rownum as rnum from (select name, buseo, basicpay from tblInsa order by basicpay desc) a;

select * from (select a.*, rownum as rnum from (select name, buseo, basicpay from tblInsa order by basicpay desc) a)
    where rnum between 1 and 10;
    
-- tblCountry 
-- 인구수가 3번쨰로 많은 나라의 이름과 인구수

select name, population from tblCountry order by population desc nulls last; -- null값은 마지막으로 보내기
select name, population from where population is not null tblCountry order by population desc; --null값 업애기

select a.*, rownum as rnum from (select name, population from tblCountry order by population desc nulls last) a;

select * from (select a.*, rownum as rnum from (select name, population from tblCountry order by population desc nulls last) a)
    where rnum = 3;

--tblComedian.
-- 체중 1~3등
select * from (select a.*, rownum as rnum from(select * from tblcomedian order by weight desc) a)where rnum <=3;
