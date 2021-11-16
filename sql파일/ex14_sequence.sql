--ex14_sequence.sql


/*
오라클 -> sequence
MySQL -> identity


시퀀스, sequence 
    - 데이터베이스 객체 중 하나
    - 식별자를 만드는데 주로 사용한다 
        > PK 컬럼에 값을 넣을 때 잘 사용한다.
    - 일련 번호를 생성하는 객체
    
    
    
    
시퀀스 객체 생성하기
    -- 간단 버전
        - CREATE SEQUENCE 시퀀스명;
    
    
    -- 풀 버전
        - CREATE SEQUENCE 시퀀스명
            INCREMENT BY N
            START WITH N
            MAXVALUE N
            MINVALUE N
            CYCLE
            CACHE N
    
시퀀스 객체 삭제하기
    - DROP SEQUENCE 시퀀스명;
    
시퀀스 객체 사용하기 (일련 번호 만들기)
    - 시퀀스명.nextVal
    - 시퀀스명.currVal


*/

create sequence seqNum;

select seqNum.nextVal from dual;

select 'A'||seqNum.nextVal from dual;  --문자와 조합해서 사용 가능

select 'A'||trim(to_char(seqNum.nextVal,'000')) from dual;


create sequence seqNum2;

select 'A'||trim(to_char(seqNum.nextVal,'000'))||'B'||trim(to_char(seqNum2.nextVal,'000')) from dual; --각자 따로노는 sequence들



drop table tblMemo;

create table tblMemo
(    


    seq number(3) primary key,                   
    name varchar2(30)  ,                 
    memo varchar2(1000),     
    regdate date    
);

drop sequence seqMemo;

create sequence seqMemo;


insert into tblMemo(seq,name,memo, regdate) values (SEQMEMO.nextval,'아무개','테스트',sysdate); --실행할 때마다 sequence값이 늘어나면서 행을 추가 

select * from tblMemo;



----------------------------------

/*
현재 사용중인 시퀀스 객체(seqMemo)의 마지막 번호?

    1. currVal 
        : 가장 마지막에 생성한 숫자를 반환 (자바 큐,스택의 peek())
        : 현재 계정으로 로그인 후 최소 1번은 nextVal을 호출해야 currVal를 호출할 수 있다.

    2. nextVal
        : 번호 하나를 소비해버린다.
        : 근데 하나 비어도 어쨋든 겹칠일은 없기 때문에 primary key로서의 기능은 큰 문제 없긴 함


    
    3. max() 함수 사용 --> 추천하는 방법!
    

*/

select seqMemo.nextVal from dual; --14 >...> 22 : 큰일 X, 문제 X (기본키의 특징만 유지되면 되기 때문)
                                    -- 비정상 종료 시 이렇게 중간에 붕 뜨는 이유
                                    --      : 원래 오라클은 20개 단위로 메모리 상의 데이터를 저장함 (오라클은 20개 단위로 캐쉬를 잡음)
                                    --      : 20개를 미리 땡겨서 저장해놓음 (21개인 경우 40개로 일단 저장해놓음)
                                    --      : 다만 정상 종료되는 경우에는, 20개 단위를 채우지 못했어도 데이터를 하드에 저장함.
                                    --      : 비정상 종료되는 경우에는, 정상 종료와는 달리 메모리 상의 데이터가 날라가게 됨
                                    --              -> 더 많은 데이터를 저장한 것으로 인식 (미리 떙겨서 저장해놓으므로)

select seqMemo.currVal from dual; --ORA-08002: sequence SEQMEMO.CURRVAL is not yet defined in this session
                                    --> nextVal 호출 없이 실행한 경우
                    

select max(seq) from tblMemo;


/*
시퀀스 객체 생성하기
    
    -- 풀 버전
        - CREATE SEQUENCE 시퀀스명
            INCREMENT BY N
            START WITH N
            MAXVALUE N
            MINVALUE N
            CYCLE
            CACHE N

*/

drop sequence seqTest;

create sequence seqTest
    increment by 1 
    start with 1
    maxvalue 30 --최대값
                --ORA-08004: sequence SEQTEST.NEXTVAL exceeds MAXVALUE and cannot be instantiated
                    --값 넘으면(오버플로우 시) 발생하는 오류
                    --max값 주는 경우는 거의 없는 듯
    --minvalue -5 --최소값
    cycle    --max 넘어가면 초기값으로 돌아감
    cache 20 --하드디스크에 저장되는 단위
                -- 크면 클수록 속도는 빨라짐 (하드를 왔다갔다 할 일이 적어짐)
                    --> 그러나 한 번 비정상 종료 시 날라가는 값들이 많아짐
                    --> 디폴트값(20)을 잘 안 건드림
    ;
    
    
    
select seqTest.nextVal from dual;


---------------
select max(seq) from tblMemo;

--> 종료하고 하드에 저장된 값이 남아 있기 때문에, 이전 max값을 확인하고 start with로 시퀀스를 다시 생성해야 함!
drop sequence seqMemo;

create sequence seqMemo
    start with 5
    ;


select seqMemo.nextVal from dual;





