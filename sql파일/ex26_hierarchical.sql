-- ex26_hierarchical.sql

/*

계층형 쿼리, Hierarchical Query
    - 레코드 간의 관계가 서로 상하 수직 구조일 경우 사용 > 그 구조를 결과셋 반영
    - 자기 참조를 테이블에서 사용한다.(ex. 셀프 조합)
    - 오라클 전용 쿼리
    - 카테고리, 답변형 게시판, 조직도, BOM 등에 사용
    
컴퓨터
    - 본체
        - 메인보드
        - 그래픽카드
        - 랜카드
        - CPU
        - 메모리
    - 모니터
        - 보호필름
        - 모니터암
    - 프린터
        - A4용지
        - 잉크 카트리지



*/

create table tblComputer (
    seq number primary key,                     --식별자(PK)
    name varchar2(50) not null,                 --부품명
    qty number not null,                        --수량
    pseq number null references tblComputer(seq) --부모부품(FK)
    
);

insert into tblComputer values (1, '컴퓨터',1 , null);
insert into tblComputer values (2, '본체', 1, 1);
insert into tblComputer values (3, '메인보드',1 , 2);
insert into tblComputer values (4, '그래픽카드', 1, 2);
insert into tblComputer values (5, '랜카드',1 ,2 );
insert into tblComputer values (6, 'CPU', 1, 2);
insert into tblComputer values (7, '메모리', 2, 2);
insert into tblComputer values (8, '모니터', 1, 1);
insert into tblComputer values (9, '보호필름',1 , 8);
insert into tblComputer values (10, '모니터암', 1, 8);
insert into tblComputer values (11, '프린터', 1, 1);
insert into tblComputer values (12, 'A4용지', 100, 11);
insert into tblComputer values (13, '잉크카트리지', 3, 11);


select * from tblSelf; --seq(직원), super(상사)
select * from employees;    -- employee_id(직원), manager_id(매니저)

select
    c1.name as 부품명,
    c2.name as 부모부품명
from tblComputer c1 --부품(Role)
    left outer join tblComputer c2 --부모부품(Role)
        on c1.pseq = c2.seq
            order by c1.seq;
            
            
            
-- 계층형 쿼리
    -- START WITH 절 + CONNECT BY 절
    -- 계층형 쿼리에서만 제공하는 의사 컬럼 사용
    --  a. prior : 부모 레코드
    --  b. level : depth
    
select 
    lpad(' ',(level-1)*5) || name as "부품명",
    prior name as "부모부품명"
from tblComputer c
    --start with seq = 1  --루트 요소 지정 : 해당 요소를 최상위 요소로 보고 거기부터 데이터를 가져옴
    --start with seq = 8
    --start with seq = (select seq from tblComputer where name = '컴퓨터')   
    start with pseq is null
        connect by prior seq = pseq; --부모와 자식을 연결짓는 조건
                                        -- prior가 위 셀프조인 예제의 c2, 즉 부모 테이블
                                        -- 부모테이블의 seq = 자식의 pseq
                                        -- 이 조건으로 부모에 접근
     

select 
    lpad(' ',(level-1)*2) || name as "직원명",
    prior name as "상사명",
    level
from tblSelf
    start with super is null
        connect by super = prior seq;
    

select 
    first_name,
    prior first_name
from employees 
    start with manager_id is null
        connect by manager_id = prior employee_id;



select 
    lpad(' ',(level-1)*5) || name as "부품명",
    prior name as "부모부품명"
from tblComputer c  
    start with pseq is null
        connect by prior seq = pseq
            --order by name asc; 
            order siblings by name asc;
        
        
        
        