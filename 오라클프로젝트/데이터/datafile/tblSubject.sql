--과목 테이블 생성
create table tblSubject (
          --컬럼정의
          subjectSeq number,
          subjectName varchar2(90) not null,
          subjectType varchar2(10) not null CHECK (subjectType in ('공통', '개별')),
         
         --제약사항 정의
          CONSTRAINT tblSubject_subjectSeq_pk primary key(subjectSeq)
);

--데이터 생성
--공통과목
insert into tblSubject values (1, '클라우드 개발을 위한 자바 기초 프로그래밍', '공통');
insert into tblSubject values (2, '데이터베이스 구조설계 및 활용', '공통');
insert into tblSubject values (3, 'Front-end 화면 설계 및 인터랙티브 UI 구현', '공통');
insert into tblSubject values (4, 'SpringFramework 기반 백엔드 설계 및 구축', '공통');
insert into tblSubject values (5, 'AWS 클라우드 등록 설정 및 구축', '공통');

--개별과목
insert into tblSubject values (6, '프로젝트 기획 및 설계', '개별');
insert into tblSubject values (7, '프로젝트 구현 및 발표', '개별');
insert into tblSubject values (8, 'SQL활용', '개별');
insert into tblSubject values (9, '웹 응용 프로그래밍', '개별');
insert into tblSubject values (10, 'UI/UX 설계 및 구현', '개별');
insert into tblSubject values (11, '스마트웹 구현', '개별');
insert into tblSubject values (12, '빅데이터 데이터 구축', '개별');
insert into tblSubject values (13, '빅데이터 화면설계, 구현', '개별');
insert into tblSubject values (14, '빅데이터 UI 구현', '개별');
insert into tblSubject values (15, '빅데이터 기획', '개별');
insert into tblSubject values (16, '빅데이터 UI/UX 기획 및 설계', '개별');
insert into tblSubject values (17, '웹 UI/UX 기획,설계', '개별');
insert into tblSubject values (18, '웹 UI 디자인', '개별');
insert into tblSubject values (19, '2D그래픽디자인(기초)', '개별');
insert into tblSubject values (20, '웹 UI 구현 및 테스트', '개별');
insert into tblSubject values (21, '클라우드 서비스 기술 및 활용사례(이론)', '개별');
insert into tblSubject values (22, 'Oracle DBMS', '개별');
insert into tblSubject values (23, 'Web Back-end 구현', '개별');
insert into tblSubject values (24, 'Web Front-end 구현', '개별');
insert into tblSubject values (25, 'AWS 클라우드 환경 융합프로젝트(실기)', '개별');
insert into tblSubject values (26, 'DB 운영관리', '개별');
insert into tblSubject values (27, 'OpenStack 클라우드 시스템 구축', '개별');
insert into tblSubject values (28, '파이썬을 활용 실무향상', '개별');
insert into tblSubject values (29, '빅데이터 분석시스템개발', '개별');
insert into tblSubject values (30, '머신러닝 기반 데이터 분석', '개별');

commit;

--테이블 셀렉/삭제
select * from tblSubject;
drop table tblSubject;