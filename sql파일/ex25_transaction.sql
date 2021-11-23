--ex25_transaction.sql 

/*

트랜잭션, Transaction
    - 데이터를 조작하는 업무의 물리적(시간적) 단위
    - 작업 영역(시간) = 작업 기간
    - 오라클에서 발생하는 1개 이상의 명령어들을 하나의 논리집합으로 묶어 놓는 단위
    - 트랜잭션에 포함되는 명령어 > DML > INSERT, UPDATE, DELETE > DB(데이터) 변경 조작
    
수업 목적 > 오라클에서 트랜잭션을 제어하는 방법 > 트랜잭션 명령어
    - DCL 
        > TCL : DCL안에서 트랜잭션 명령어만 뽑아낸 것
    - 하나의 트랜잭션으로 묶여있는 DML을 감시하다가 전체가 성공하면 DB에 반영 처리를 하고,
      일부 실패하면 이전에 성공한 DML을 일괄 취소 처리..
      
      1. COMMIT
      2. ROLLBACK
      3. SAVEPOINT




*/

create table tblTrans
as 
select name, buseo, jikwi from tblInsa where city = '서울';

select * from tblTrans;




-- 트랜잭션은 이미 시작되었음


delete from tblTrans where name = '한석봉';

select * from tblTrans; --이것도 임시 결과를 보여주므로, 커밋 여부를 확인할 수 없음. 강의에서는 Dbeaver로 확인함

commit; -- 여태 트랜잭션에 누적된 모든 명령어 (임시 결과)를 실제 DB에 적용해라..

-- 새로운 트랜잭션이 시작됨...

delete from tblTrans where name = '김인수';

select * from tblTrans;

rollback; --현재 트랜잭션의 모든 작업을 없었던 일로 처리 (폐기)

-- 새로운 트랜잭션이 시작됨...
select * from tblTrans;

--트랜잭션을 생성하는 방식
    -- 시간대별로 묶기
    -- 업무별로 묶기
    -- 작업별로 묶기
        --insert 
        --commit
        
        --delete
        --rollbakc
        
        --delete
        --commit
        
        --update 
        --commit


/*
트랜잭션이 언제 시작하고? 언제 끝나는지?

새로운 트랜잭션이 시작하는 경우
    1. 클라이언트 접속 직후
    2. commit 실행 직후
    3. rollback 실행 직후
    
현재 트랜잭션이 종료되는 겨우
    1. commit 실행 직후 
        > 현재 트랜잭션을 DB에 반영함
    2. rollback 실행 직후
        > 현재 트랜잭션을 DB에 반영 안함
    3. 클라이언트 접속 종료
        a. 정상적인 접속 종료
            - 현재 트랜잭션에 아직 반영안된 명령어가 남아 있으면 사용자에게 질문을 함
                
        b. 비정상적인 접속 종료
            - 무조건 rollback 처리

    4. DDL 실행
        - CREATE, ALTER, DROP 
            > DB의 구조 변경
            > 데이터 안정화를 위해 자동 COMMIT이 됨.
        - 자동으로 commit이 된다. (**********************)

*/


select * from tblTrans;

delete from tblTrans;


rollback;
drop table tblTest;

create table tblTest (
    seq number primary key
); -- delete된 tblTrans를 rollback 할 수 없다...

commit;

--- 새로운 트랜잭션 시작

select * from tblTrans;

insert into tblTrans values ('가가가', '영업부', '부장');
insert into tblTrans values ('나나나', '영업부', '과장');

savepoint a;

delete from tblTrans where name = '나나나';

select * from tblTrans;

savepoint b;

delete from tblTrans where name = '가가가';

select * from tblTrans;

rollback; --commit 한 때로 돌아감
select * from tblTrans;

-------------

insert into tblTrans values ('가가가', '영업부', '부장');
insert into tblTrans values ('나나나', '영업부', '과장');

savepoint a;

delete from tblTrans where name = '나나나';

savepoint b;

delete from tblTrans where name = '가가가';

rollback to a;
rollback to b;
select * from tblTrans;

-- savepoint는 헷갈려서 강사의 경우, 그냥 통쨰로 transaction 처리함.

commit;



