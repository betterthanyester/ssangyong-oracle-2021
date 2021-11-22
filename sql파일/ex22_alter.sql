-- ex22_alter.sql

/*
객체생성 : CREATE
객체삭제 : DROP
객체수정 : ALTER

데이터생성 : INSERT 
데이터삭제 : DELETE
데이터수정 : UPDATE

수정 대상 : 테이블, 시퀀스, 제약사항


테이블 수정하기, ALTER TABLE
    - 테이블 스키마 수정 > 테이블 구조 수정 > 컬럼의 정의를 수정 + 제약사항 정의를 수정
    - 되도록 테이블을 수정하는 상황을 발생하면 안된다.. (***********)
        > 설계를 올바르게!!!
        
        
방식
    - 1. 테이블 삭제 > 테이블 DDL(CREATE) 수정 > 수정 DDL로 새롭게 테이블 생성
        a. 기존 테이블에 데이터가 없었을 경우
            : 아무일 없음
        b. 기존 테이블에 데이터가 있었을 경우 
            : 미리 데이터 백업 > 테이블 삭제 > 수정 후 생성 > 데이터 복구
        - 개발(공부) 중에 사용 가능한 방법
        - 서비스 운영 중에는 거의 불가능한 방법
        
    - 2. ALTER 명령어 사용 > 기존 테이블의 구조를 변경
        a. 기존 테이블에 데이터가 없었을 경우
            : 아무일 없음
        b. 기존 테이블에 데이터가 있었을 경우
            : 동반되는 추가 조치 필요!!!
        
        

*/

drop table tblEdit;

create table tblEdit(
    seq number primary key,
    data varchar2(20) not null
);

insert into tblEdit values (1, '마우스');
insert into tblEdit values (2, '키보드');
insert into tblEdit values (3, '모니터');

select * from tblEdit;

-- 1. 새로운 컬럼 추가하기
alter table tblEdit
    add (price number(5) null);


alter table tblEdit
    add (memo varchar2(100) not null); --ORA-01758: table must be empty to add mandatory (NOT NULL) column

delete from tblEdit; --not null 컬럼을 추가하려면 기존 데이터를 모두 삭제해야 한다.

select * from tblEdit;

alter table tblEdit
    add (memo varchar2(100) default '임시' not null);

select * from tblEdit;


-- 2. 컬럼 삭제하기 > 삭제해도 되는 컬럼인지 충분히 확인하고 지우기..!!
alter table tblEdit
    drop column memo;

alter table tblEdit
    drop column seq;  --PK 컬럼 삭제 > 절대 금지.!!

    
select * from tblEdit;


-- 3. 컬럼 수정하기 : 자료형, 길이, 이름, 제약사항

insert into tblEdit values (4, '2021년 출시된 최신형 노트북'); --ORA-12899: value too large for column "HR"."TBLEDIT"."DATA" (actual: 37, maximum: 20)ㄴ
    --3.1 컬럼의 길이 수정하기 : 확장, 축소
alter table tblEdit
    modify (data varchar2(100));
    insert into tblEdit values (4, '2021년 출시된 최신형 노트북');
    
alter table tblEdit
    modify (data varchar2(20)); --ORA-01441: cannot decrease column length because some value is too big : 기존의 값 중에 넘는게 있으면 축소 못함.
    
    --3.2 컬럼의 제약사항 수정하기
alter table tblEdit
    modify (data varchar2(100) null);
    
alter table tblEdit
    modify (data varchar2(100) not null);
    
    --3.3 컬럼의 자료형 바꾸기
alter table tblEdit
    modify (seq varchar2(100));    --ORA-01439: column to be modified must be empty to change datatype
                                   --01439. 00000 -  "column to be modified must be empty to change datatype"
    
    --3.4 컬럼명 바꾸기
alter table tblEdit
    rename column data to name;     

select * from tblEdit;


----------------------------------------------------------테이블 구조 수정


------------------------------------------------------------제약사항 수정

--제약사항 수정 
--      > 추가 & 삭제


drop table tblEdit;

create table tblEdit(
    seq number,
    data varchar2(20),
    color varchar2(30)
    --seq number primary key 
);
--제약을 외부에서 추가
alter table tblEdit
    add constraint tbledit_seq_pk primary key (seq);  --제약의 이름 + 제약사항(primary key)
                                                        --위 주석처리된 것처럼 추가시킴
                                                        
alter table tblEdit
    add constraint tbledit_color_ck check (color in ('red', 'yellow', 'blue'));                                                        
    
insert into tblEdit values (1, '마우스','red');
insert into tblEdit values (1, '키보드', 'blue'); --ORA-02290: check constraint (HR.TBLEDIT_COLOR_CK) violated
insert into tblEdit values (3, '모니터', 'green'); --ORA-02290: check constraint (HR.TBLEDIT_COLOR_CK) violated

--제약을 외부에서 삭제
alter table tblEdit
    drop constraint tbledit_color_ck;  