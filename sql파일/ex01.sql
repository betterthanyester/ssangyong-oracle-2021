/*


이클립스 설정 > 영구, 전역(X) > 워크스페이스별 저장

1. 새 수업 폴더 생성
   - "D:\class\oracle"

2. 설치 파일 다운로드
   a. Oracle Express 11g
   - "OracleXE112_Win64.zip" > setup.exe > 암호(java1234)

   b. SQL Developer 21.2.1
   c. DBeaver Community
   d. DataGrip(30일 평가판)

   e. eXERD(30일 평가판)




Oracle Database 9i
Oracle Database 11g Express Edition(무료, 평가판)
		12c..
		14c..
                18c(cloud)
                21c

Oracle Database 11g Enterprise Edition > 무거움..




백그라운드 프로그램 == 서비스 프로그램
- GUI 환경을 제공하지 않는다.(= 눈에 보이는 부분이 없다.)
- 오라클

서비스
1. Server: 서비스를 제공하는 측
2. Client: 서비스를 제공받는 측

카페
1. Server: 카페직원
2. Client: 손님

웹(인터넷) 서비스
1. Server: 웹서버(SW+HW)
2. Client: 브라우저(SW)

데이터베이스 서비스
1. Server: 데이터베이스 서버(= 오라클 데이터베이스)
2. Client: 사용자(사람)

오라클(서버) <-> SQL Developer/DBeaver(클라이언트) <-> 사용자(개발자)


데이터베이스(Database) : 데이터 집합(저장소)
데이터베이스 시스템
데이터베이스 관리 시스템(Database Management System) -> DBMS

오라클 == DB + DBMS

회사? 너 DB 뭐쓰니? 너 DBMS 뭐써봤어? > 오라클



SQL, 구조화된 질의 언어



오라클 서버(컴퓨터-1,0) <-> SQL <-> 클라이언트(프로그램+사용자)
- 오라클 + SQL
p46

1. 일반 사용자 > 일반 프로그램 사용자(아빠, 엄마, 동생)

2. 응용 프로그래머(개발자, 우리) > O, X > 응용 프로그램 개발 + DB 개발자
   -> 개발팀

3. SQL 사용자 > DB 프로그래머, DB 개발자
   -> DB팀

4. 데이터베이스 관리자, DBA
   -> 3번의 진화형







오라클 서버 접속하기
1. 클라이언트 프로그램을 실행한다.
   a. SQL Developer(자동 설치 -> 평가판은 직접 설치)
   b. DBeaver
   c. DataGrip
   d. SQL Plus(자동 설치) > 콘솔 프로그램
   e. Toad

   - a,d : 오라클 전용 클라이언트 프로그램
   - b,c : 대부분의 DBMS 클라이언트 프로그램

2. 오라클 서비스에 로그인한다.
   - User Name
   - User Password
   - 관리자 계정(sys, system) + "java1234"
   - 사용자 계정
       - scott, hr 계정 > 교육용(학습용) 계정, 샘플 데이터 제공
       - hr 사용 > 인사 관리 관련 데이터 제공(직원, 부서, 급여, 회사 등)
             - hr 계정은 기본적으로 잠겨있다. > 1.해제, 2.비밀번호 설정

3. 잠겨있는 계정 활성화
   > alter user hr account unlock;

4. 암호 변경
   > alter user hr identified by java1234;

5. hr 다시 로그인하기
   > disconnect
   > connect

6. 로그인한 계정 확인하기
   > show user;




D:\class\oracle\ex01.sql

Shift + 방향키
Ctrl + Shift + 방향키
Shift + Home(End)

Ctrl + Enter //실행

*/

--alter user hr account unlock;

--alter user hr identified by java1234;

--show user;


-- select * from tabs;

-- 아주 일부 명령어 > SqlPlus와 SQL Developer에서만 실행되는 명령어가 있다.


/*

명령어 작성
- SQL 워크 시트
- Script
- SQL File

SQL 언어 > 비 절차지향 언어 > 명령어간에 순서가 없이 서로 독립적인 형태를 가진다.


실행
- 블럭 잡은 문장 > Ctrl + Enter  //*****************************************

- 블럭X > F9, Ctrl + Enter

*/


select * from tabs;

show user;


/*

cmd > "services.msc"

서비스 > OracleXXX

1. OracleServiceXE > 오라클 서버
2. OracleXETNSListener > 오라클 서버가 클라이언트의 요청을 받을 수 있게 하는 서비스





오라클
- 데이터베이스, DB
    - 관계형 데이터베이스, Relational Database, RDB
    
- 데이터베이스 관리 시스템, DBMS
- 관계형 데이터베이스 관리 시스템, RDBMS


관계형 데이터베이스
- 데이터를 표형식으로 저장/관리한다.
- SQL를 사용하여 조작한다.



Java 언어 > SUN(Oracle)
JDK 실행 도구 > SUN(Oracle)
JRE 실행 환경 > SUN(Oracle)


SQL
- 사용자가 관계형 데이터베이스와 대화를 할 때 사용하는 언어
- 자바에 비해 자연어에 가깝다.
- ANSI

1. DBMS 제작사와 독립적이다.
   - SQL은 모든 DBMS 제작자와 독립적으로 개발된다. > 버전업된 SQL을 모든 제작자에게 공개한다. 
    > DBMS 제작자는 변경된 SQL 문법을 자신의 DBMS에 반영한다.
    
2. 표준 SQL, ANSI-SQL
   - 어떤 DBMS을 사용하던지 공통이다.
   - 계속 발전중..
   ex) SQL-86, SQL89, SQL92, SQL99.. SQL2011..
   
3. 대화식 언어이다.
   - 비절차지향
   - 질문 > 답변 > 질문 > 답변 > 질문 > 답변 x 반복



SQL
1. 표준 SQL, ANSI-SQL
    - 공통 > 여러분 DBMS 바뀌어도 공부 안함

2. 각 DBMS 제작사별 SQL > 확장 SQL
    - 각각 개별 > 여러분 DBMS 바뀔때마다 공부를 따로
    - PL/SQL(오라클)


오라클(DB, 100%) = ANSI-SQL(70%) + PL/SQL(30%) + 설계(기타)





ANSI SQL 종류

1. DDL
    - Data Definition Language
    - 데이터 정의어
    - 테이블, 뷰, 사용자, 인덱스 등의 객체를 생성/수정/삭제 명령어
    - 구조를 생성/관리할 때 사용한다.
    a. CREATE: 생성
    b. DROP: 삭제
    c. ALTER: 수정
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 프로그래머(일부)
    

2. DML
    - Data Manipulation Language
    - 데이터 조작어
    - 데이터베이스의 데이터를 추가/수정/삭제/조회 명령어
    - 사용 빈도 > 가장 높음 > CRUD
    a. SELECT: 조회(읽기), Read(***************************************************************)
    b. INSERT: 추가, Create
    c. UPDATE: 수정, Update
    d. DELETE: 삭제, Delete
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 프로그래머(***************************************************************)
    

3. DCL
    - Data Control Language
    - 데이터 제어어
    - 계정 관리, 보안 통제, 트랜잭션 처리 등..
    a. COMMIT
    b. ROLLBACK
    c. GRANT
    d. REVOKE
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 프로그래머(일부)
     
4. DQL
    - Data Query Language
    - 데이터 질의어
    - DML 중에 SELECT만 이렇게 부른다.

5. TCL
    - Transaction Control Language
    - DCL 중에 COMMIT, ROLLBACK만 이렇게 부른다.



오라클 서버 기본 인코딩
- 변경 가능
- ~ 8i: EUC-KR
- 9i ~ 현재: UTF-8

*/

-- Shift + HOME,END
-- SQL의 키워드(명령어)는 대소문자 구분을 하지 않는다.
-- 데이터의 대소문자는 구분을 한다.
SELECT * FROM tabs;
SELECT * FROM tabs;

SELECT * FROM tabs WHERE table_name = 'JOBS';
SELECT * FROM tabs WHERE table_name = 'jobs';


-- 관습화된 패턴
-- 1. 키워드(명령어) > 대문자
-- 2. 사용자 식별자 > 소문자
SELECT * FROM employees;

SELECT * FROM employees; --Alt + '

-- 개발(개인 작업) > 다 소문자로 작성..
-- 공유 + 팀작업 > 코드 컨벤션 > 다 소문자로 작성 > 툴 기능




-- 사용자 식별자 주의점!!!
-- 1. 명명법 > 캐멀표기법 베이스 + 헝가리언 표기법 or 모두 소문자
-- 2. 식별자 30바이트 이하만 가능

select * from tblStudent;
select * from tblstudent;
select * from student;

create table aaa (
    num number
);


create table aaaaaaaaaaaaaaa (
    num number
);

create table aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa (
    num number
);

create table 테이블 (
    num number
);



-- 프로젝트 산출물 > 마무리


-- 1장(대충~) > 다시 읽어보고
-- 2장(중요) > 정독하고~(특히 그림이나 표 설명을 집중해서 보고~)



/*


관계형 데이터베이스 모델

- 테이블(Table) == 릴레이션(Relation)


테이블
- 스키마(Scheme) > 클래스(Class)
- 인스턴스(Instance) > 인스턴스, 객체

제품 테이블(쇼핑몰)
- 제품(번호,제품명,가격)
- 1,마우스,20000
- A001,마우스,20000
- ABC,마우스,20000

속성(셀)은 단일값(원자값,스칼라(Scalar))을 가진다.


집합 2개 > 카티션 곱(= 데카르트 곱) > A집합 x B집합 > 결과 릴레이션



*/



























