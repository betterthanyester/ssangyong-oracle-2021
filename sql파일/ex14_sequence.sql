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
    - CREATE SEQUENCE 시퀀스명;
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

select seqMemo.currVal from dual; --ORA-08002: sequence SEQMEMO.CURRVAL is not yet defined in this session
                                    --> nextVal 호출 없이 실행한 경우
                    

select max(seq) from tblMemo;











