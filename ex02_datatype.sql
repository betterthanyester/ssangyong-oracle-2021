/*

ex02_datatype.sql


ANSI-SQL 자료형
- 오라클 자료형
- 데이터베이스 > 데이터 취급 > 자료형 존재


1. 숫자형
    - 정수, 실수
    a. number
        - (유효자리) 38자리 이하의 숫자를 표현하는 자료형
        - 5~22byte
        - 1x10^-130 ~ 9.99999x10^125
        - number
        - number(precision)
        - number(precision, scale)
            1. precision: 소수 이하를 포함한 전체 자릿수(1~38)
            2. scale: 소수점 이하 자릿수(0~127자리)
            
        ex) number: 38자리 표현 가능한 모든 숫자(정수, 실수 포함)
        ex) number(3): 3자리 정수(-999~999)
        ex) number(4,2): 전체 4자리, 소수이하 2자리, 실수(-99.99~99.99)
        ex) number(10,3): -9999999.999~9999999.999
        
        - 숫자형 리터럴(상수 표현법)
            1. 정수: 10
            2. 실수: 3.14
                            
        
    

2. 문자형
    - 문자 + 문자열
    - 자바의 String과 유사
    - char vs nchar > n의 의미?
    - char vs varchar > 차이? > 자릿수의 고정 유무
    - 문자 리터럴
        1. '문자열'
    
    a. char
        - 고정 자릿수 문자열
        - char(n): n자리 문자열, n(바이트)
        - 최소 크기: 1바이트
        - 최대 크기: 2000바이트
        - 주어진 공간을 데이터가 채우지 못하면 나머지 공간을 스페이스로 채운다.
        
        ex) char(3): 최대 3바이트짜리 문자열 저장
        ex) char(10): 최대 10바이트짜리 문자열 저장
        ex) char(10): 영어 몇글자(10자), 한글 몇글자(3자)
    
    b. nchar
    
    c. varchar2 > varchar
        - 가 자릿수 문자열
        - varchar2(n): n자리 문자열, n(바이트)
        - 주어진 공간을 데이터가 채우지 못하면 나머지 공간을 버린다. 즉 데이터의 크기만큼 공간을 차지한다.
        - 최소 크기: 1바이트
        - 최대 크기: 4000바이트
    
    d. nvarchar2 > nvarchar


3. 날짜/시간형


4. 이진 데이터형


*/


-- 테이블 선언(생성)
create table 테이블명 (
    컬럼 선언
    컬럼명 자료형(도메인) 제약사항
);

create table tblType (
    --num number
    --num number(3)
    --num number(4,2)
    --txt char(3)
    
    txt1 char(10),
    txt2 varchar2(10)
);

-- 테이블 삭제
drop table 테이블명;

drop table tblType;


-- 테이블에서 데이터 가져오기 > 결과테이블(ResultTable) or 결과셋(ResultSet)
select * from tblType; --셀렉션

-- 테이블에 데이터 추가하기
insert into tblType (num) values (100);  -- number(4,2)
insert into tblType (num) values (99);
insert into tblType (num) values (99.99);
insert into tblType (num) values (99.9999);
insert into tblType (num) values (200);
insert into tblType (num) values (300);
insert into tblType (num) values (3.14);
insert into tblType (num) values (3.123456);
insert into tblType (num) values (12345678901234567890123456789012345678);
insert into tblType (num) values (-12345678901234567890123456789012345678);
insert into tblType (num) values (123456789012345678901234567890123456789);
insert into tblType (num) values (123456789012345678901234567890123456789012345678901234567890);
                                  123456789012345678901234567890123456789000000000000000000000
                                  

insert into tblType (txt) values ('ABC');
insert into tblType (txt) values ('A');
insert into tblType (txt) values (''); -- SQL은 빈문자열 == null
insert into tblType (txt) values (null);

-- ORA-12899: value too large for column "HR"."TBLTYPE"."TXT" (actual: 4, maximum: 3)
insert into tblType (txt) values ('ABCD');

insert into tblType (txt) values ('가');
insert into tblType (txt) values ('가나');



insert into tblType (txt1, txt2) values ('ABC', 'ABC');
insert into tblType (txt1, txt2) values ('ABCDEFGHIJ', 'ABCDEFGHIJ');
insert into tblType (txt1, txt2) values ('홍길동', '홍길동');

select * from tblType;















