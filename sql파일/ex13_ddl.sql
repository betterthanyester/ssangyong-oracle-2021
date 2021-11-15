--ex13_ddl.sql
  
/*
ex01.sql ~ ex12.sql
- DML 기본



DDL
    - 데이터 정의어
    - 데이터베이스 담당자가 사용
    - 데이터베이스 객체를 생성,수정,삭제한다.
    - 데이터베이스 객체
        > 테이블, 뷰, 인덱스, 트리거, 프로시저, 제약사항 등.
    
    -CREATE, ALTER, DROP


테이블 생성하기
    > 스키마 정의하기
    > 속성(컬럼) 정의하기
    > 속성(컬럼)의 성격(이름)과 도메인(자료형)을 정의하기


CREATE TABLE 테이블명
( 
    컬럼 정의,
    컬럼 정의,
    컬럼 정의,
    컬럼명 자료형(길이)NULL표기 제약사항
)



교재 2장 > 제약 사항

제약 사항 (Constraint)
    - 해당 컬럼에 들어갈 데이터(값)에 대한 조건(규제)
        > 설계(=도메인)
        > 조건을 만족하지 못하면 데이터를 해당 컬럼에 넣지 못한다(에러발생). 
        > 유효성 검사 도구
    - 데이터 무결성을 보장하기 위한 도구(******)


    - 종류 : 6 가지
    
        1. NOT NULL
            - 해당 컬럼이 반드시 값을 가져야 한다
            - 해당 컬럼에 값이 없으면 에러 발생
            - 필수값
            
        2. PRIMARY KEY, PK
            - 유일하다
                > 행간의 동일한 값을 가질 수 없다 > UNIQUE
            - not null
                > 빈값을 가질 수 없다
                > NOT NULL
                > UNIQUE와 NOT NULL의 성질을 합친 형태
            - 테이블의 행들을 구분하기 위한 유일한 값을 가지는 제약사항
            - 하나 이상의 컬럼에게 할당 > 일반적으로는 1개의 컬럼
            - 기본키의 형태
                - a. 단일 기본키 > 기본키 : 1개의 컬럼이 PK 역할
                - b. 복합 기본키 > 복합키 : 2개 이상의 컬럼이 모여서 PK 역할
                    > 복합키 발생
                    > 다만 복합키는 사용이 불편
                        : 가상 키를 따로 생성해서 기본키로 사용함 (대리키) (교재p80)
        
            - 모든 테이블은 반드시 (100%) Primary Key를 가져야 한다.
            
        3. FOREIGN KEY, FK
            
        
        4. UNIQUE (UQ)
            - 유일하다. 
                > 행간의 동일한 값을 가질 수 없다
            - Primary key 에서 not null을 뺀 것
                : UNIQUE 제약은 primary key와 다르게 null값을 가질 수 있다.
            - UNIQUE는 식별자로 사용하기가 애매하다.
                    > 식별자로 사용하지 맗 것!! > 식별자는 PK를 사용한다.
                a. 값을 가지는 경우 > 식별자로 사용 가능하다.
                b. 값을 가지지 않는 경우 > 식별자로 사용 불가능하다.
            - ex) 경품
                - 고객 (번호(PK),이름,주소,당첨(UQ))
                    1. 홍길동, 서울, 1등
                    2. 아무개, 인천, NULL
                    3. 하하하, 부산, 3등
                    4. 호호호, 대전, NULL
        
            - ex) 초등학교 교실
                - 학생 (번호(PK), 이름, 직책(UQ))
                    1. 홍길동, 반장
                    2. 아무개, 부반장
                    3. 하하하, null
                    4. 호호호, null
                    5. 후후후, null
                    6. 헤헤헤, 체육부장
        
        
        5. CHECK
            - 사용자 정의 제약 조건
            - where절과 동일하다고 생각하면 굉장히 쉽다.
        
        6. DEFAULT
            - 기본값 설정
            - 해당 컬럼값을 대입하지 않으면 null 대신 미리 준비한 값을 넣어준다.
            
    

*/  


create table tblMemo
(
    --컬럼명 자료형(길이) NULL표기 제약사항
    seq number(3),                  --메모 번호
    name varchar2(30),           --작성자
    memo varchar2(1000),       --메모 내용
    regdate date                    --작성날짜
);



select * from tblMemo;

--tabs : 시스템 테이블
-- > 현재 계정(HR)이 소유하고 있는 모든 테이블 목록
select * from tabs;

-- 데이터 추가하기
insert into 테이블명(컬럼리스트) values (값리스트);




insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (2,null,null, null);
insert into tblMemo(seq,name,memo, regdate) values (null,null,null, null); --절대 생성 금지!! , 의미 없는 행.
insert into tblMemo(seq,name,memo, regdate) values (3,'아무개','공부할 것', '2021-11-14');  --암시적 형변환이 일어남 (문자열 -> 날짜) 
insert into tblMemo(seq,name,memo, regdate) values (4,'호호호','메모장', to_date('2021-11-14'));  --명시적 형변환  
insert into tblMemo(seq,name,memo, regdate) values (4,'호호호','메모장', to_date('2021-11-14 14:05:30','yyyy-mm-dd hh24:mi:ss'));  --명시적 형변환 


--처음 넣은 메모만 가져오시오.
select * from tblMemo where seq = 1;

select * from tblMemo;
select  count(*) from tblMemo; --all null인 행도 count됨

--테이블 삭제
drop table tblMemo;


--메모 테이블
create table tblMemo
(
    seq number(3) not null,    --null을 허용하지 않음              
    name varchar2(30) null,    --null을 허용          
    memo varchar2(1000) not null,       
    regdate date                    
);


insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (null,'홍길동','메모입니다', sysdate); --ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."SEQ")
insert into tblMemo(seq,name,memo, regdate) values (2,'홍길동','메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (3,'홍길동',null, sysdate); --ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."MEMO")
insert into tblMemo(seq,name,memo, regdate) values (3,'홍길동','', sysdate); --ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."MEMO")
                                                                                -->SQL에서는 빈 문자열도 null로 취급
insert into tblMemo(seq,name,memo, regdate) values (4,null,'메모입니다', null);                                                                                

select * from tblMemo;


--primary key

drop table tblMemo;

create table tblMemo
(
    
    seq number(3) primary key,                 
    name varchar2(30) null,           
    memo varchar2(1000) not null,     
    regdate date null                  
);


insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (1,'아무개','테스트', sysdate); --ORA-00001: unique constraint (HR.SYS_C007072) violated
                                                                                    --> seq가 기존 데이터와 겹치기 때문 (unique violated)
insert into tblMemo(seq,name,memo, regdate) values (2,'아무개','메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (123,'아무개','메모입니다', sysdate);


select * from tblMemo;



--unique-----------------------------


drop table tblMemo;

create table tblMemo
(
    
    seq number(3) primary key,                 
    name varchar2(30) unique,       --작성자 : 유일한 값 + NULL은 허용           
    memo varchar2(1000) not null,     
    regdate date null                  
);


insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (2,'홍길동','테스트', sysdate); --ORA-00001: unique constraint (HR.SYS_C007075) violated
insert into tblMemo(seq,name,memo, regdate) values (3,null,'메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (4,null,'메모입니다', sysdate); --null값은 중복값으로 인식되지 않음

select * from tblMemo;

---check--------
drop table tblMemo;


create table tblMemo
(
    
    seq number(3) primary key,                 
    name varchar2(30) ,                 
    memo varchar2(1000) ,     
    regdate date,
    --lv number(1) not null check (lv >=1 and lv <= 5)             --중요도(1~5) : where lv >=1 and lv <= 5
                                                                     --> where을 check로 바꾸면 됨
    lv number(1) not null check (lv between 1 and 5),
    --color varchar2(30) check (color in ('빨강','파랑','노랑')      --메모 색상 (빨강,파랑,노랑)
    --jumin varchar2(13) check (substr(jumin,7,1) = '-')           --7번째 자리에 하이픈이 들어가는지 체크                                                 
                                                        
);


insert into tblMemo(seq,name,memo, regdate,lv) values (1,'홍길동','메모입니다', sysdate,1);
insert into tblMemo(seq,name,memo, regdate,lv) values (3,'홍길동','메모입니다', sysdate,7); --ORA-02290: check constraint (HR.SYS_C007078) violated



select * from tblMemo;

---default-----

drop table tblMemo;


create table tblMemo
(    
    seq number(3) primary key,                 
    name varchar2(30) default '익명' ,                 
    memo varchar2(1000) ,     
    regdate date default sysdate                              
);


insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate);
insert into tblMemo(seq,memo) values (2,'메모입니다');  --name, regdate 안넣음



select * from tblMemo;



/*

제약 사항을 만드는 방법

1. 컬럼 수준에서 만드는 방법
    - 지금껏 수업한 방법
    - 컬럼 1개를 정의할 때 제약 사항도 같이 정의하는 방법
    ex) seq number(3) primary key
        - 컬럼명 자료형(길이) [constraint 제약조건명] 제약조건
            > [contraint 제약조건명]은 생략해도 오라클이 알아서 넣어줌 
    
    
2. 테이블 수준에서 만드는 방법
    - 컬럼 정의와 제약 사항 정의를 분리해서 정의하는 방법
    - 가독성 높임

3. 독립으로 만드는 방법
    - alter 명령어 사용
*/

drop table tblMemo;

create table tblMemo
(    
    --contraint 제약명 작성방법
    --> contraint 테이블명_컬럼명_제약명
    --> 모두 소문자로

    --tblmemo_seq_pk
    --tblmemo_name_uq
    --tblmemo_color_ck


    seq number(3) constraint tblmemo_seq_pk primary key,                   
    name varchar2(30) default '익명' ,                 
    memo varchar2(1000),     
    regdate date default sysdate                              
);

insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate);
insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate); --ORA-00001: unique constraint (HR.TBLMEMO_SEQ_PK) violated
                                                                                     --> 이젠 에러 메시지에, 프로그래머가 작성한대로 메시지가 출력됨.
                                                                                     
-- 테이블 수준에서 작성----

drop table tblMemo;

create table tblMemo
(    


    --컬럼 정의
    seq number(3),                   
    name varchar2(30) default '익명' ,                 
    memo varchar2(1000),     
    regdate date,
    
    --제약사항 정의\
        --> 뒤에 소괄호 (컬럼명) 적어줘야 함
    constraint tblmemo_seq_pk primary key(seq),
    constraint tblmemo_name_uq unique(name),
    constraint tblmemo_regdate_ck check(to_number(to_char(regdate,'hh24')) between 9 and 15)
    
    
);

insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate); --ORA-02290: check constraint (HR.TBLMEMO_REGDATE_CK) violated
insert into tblMemo(seq,name,memo, regdate) values (1,'홍길동','메모입니다', sysdate); --ORA-00001: unique constraint (HR.TBLMEMO_SEQ_PK) violated
insert into tblMemo(seq,name,memo, regdate) values (2,'홍길동','메모입니다', sysdate); --ORA-00001: unique constraint (HR.TBLMEMO_NAME_UQ) violated
insert into tblMemo(seq,name,memo, regdate) values (4,'동','메모입니다', sysdate);




