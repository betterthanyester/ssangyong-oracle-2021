-- ex21_view.sql

/*

View, 뷰
    - DB Object 중 하나(테이블, 시퀀스, 제약사항, 뷰) > CREATE, DROP
    - 가상 테이블, 테이블의 복사본, 뷰  테이블 등...
    - 취급 : 테이블처럼 사용하면 된다 (********)
    - 정의 : select문 자체를 저장한 객체이다.
    
    
    - 목적(효과)
        1. 자주 반복되는 쿼리나, 긴 문장의 쿼리를 식별자로 붙여 저장한 뒤 간편하게 사용하기 위해서
        2. 보안 > 접근 권한 통제
        
    - 뷰 사용 시
        1. SELECT > 실행됨 : 뷰는 읽기 전용으로 사용한다. 읽기 전용 테이블이다.
        2. INSERT > 될때도 안될때도 있음 : 절대 사용금지
        3. UPDATE > 될때도 안될때도 있음 : 절대 사용금지
        4. DELETE > 될때도 안될때도 있음 : 절대 사용금지
                    -->온전한 1대1의 뷰 (원본 그대로인 뷰)에서는 가능
                    -->이런 경우는 거의 없음
CREATE VIEW 뷰이름
AS
SELECT문

CREATE [OR REPLACE] VIEW 뷰이름
AS
SELECT문


*/

create view vwInsa
as 
select * from tblInsa;

select * from vwInsa;


create view vwInsa2
as 
select * from tblInsa where buseo = '영업부';

select * from vwInsa2; --쿼리가 짧아졌다

drop view vwInsa2; --거의 안쓴다. replace 사용

create or replace view vwInsa2 -- replace는 항상 붙여주자. 편하므로
as 
select * from tblInsa where buseo = '홍보부';

select * from vwInsa2; --쿼리가 짧아졌다



create or replace view vwVideo
as
select
    r.seq as rseq,
    m.name as mname,
    v.name as vname,
    to_char(r.rentdate, 'yyyy-mm-dd') as rentdate
from tblRent r
    inner join tblVideo v
        on v.seq = r.video
            inner join tblMember m
                on m.seq = r.member;

select * from vwvideo; --쿼리가 짧아졌다.
select seq from vwvideo; -- 찾지 못함. 개명했으므로
select rseq from vwvideo; --ok



select * from tblInsa where city = '서울'; --쿼리를 쓰고

create or replace view vwSeoul
as
select * from tblInsa where city = '서울';  --이렇게 위에 붙여써주면 편하다.

select * from vwSeoul;


select * from (select * from tblInsa where city = '서울'); -- 인라인 뷰(Inline View)
        -- 즉 from절에 적용된 서브쿼리는 뷰를 사용한 결과와 똑같으므로, 한 쿼리 내에서 이렇게 from절 서브쿼리 쓰는 걸 인라인뷰라고 함.


--------------------------
create or replace view vwComedian
as
select * from tblComedian;

-- 뷰를 생성한 후에 원본 테이블에 행 1개 추가
insert into tblComedian values ('나미','오','f',165,60,'오나미');

-- 뷰의 정의 : select문 자체를 저장한 객체이다.
--          : 원본을 select하므로, 항상 원본과 동기화된 결과를 출력함

select * from tblComedian; --11명
select * from vwComedian; --11몀

delete from tblComedian where first = '나미' or first = '민상';

select * from tblComedian; --9명
select * from vwComedian; --9몀

--뷰에 insert하는 경우 : 잘 들어감.
insert into vwComedian values ('나미','오','f',165,60,'오나미');

select * from tblComedian; --9명
select * from vwComedian; --9몀

--뷰에 update하는 경우 : 잘됨
update vwComedian set first = '나비' where first = '나미';

select * from tblComedian; 
select * from vwComedian; 

--뷰에서 delete하는 경우 : 온전한 1대1의 뷰 (원본 그대로인 뷰)에서는 가능
delete from tblComedian where first = '나미';

select * from tblComedian; 
select * from vwComedian; 

--------------------뷰에서 insert, update, delete 안되는 경우
create or replace view vwSales
as
select name, item from tblCustomer c
    inner join tblSales s
        on c.seq = s.cseq;
    
select * from vwSales;

insert into vwSales (name,item) values ('유재석', '마우스패드');  --ORA-01779: cannot modify a column which maps to a non key-preserved table
                                                                --위의 select문이 실행이 안됨. tblcustomer,tblsales 두 테이블 구조를 만족시켜야 함. 
                                                                --뷰는 새로운 테이블을 생성한 게 아니고,  select문 그 자체이므로...
    