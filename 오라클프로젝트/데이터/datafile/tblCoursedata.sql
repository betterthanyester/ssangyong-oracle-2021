create table tblCourse(
	courseSeq number primary key,
	courseName varchar2(200) not null,
	courseDate varchar2(10) not null check(courseDate in ('5.5','6','7')),
	courseTuition number not null,
	courseRecruit number not null
);


drop table tblCourse;

insert into tblCourse values (1,'자바(JAVA)를 활용한 풀스택 융합 SW개발자 양성과정', 5.5, 300, 30);
insert into tblCourse values (2,'Java언어 기반의 스마트 웹 Full-Stack 개발자 양성 과정',5.5,300,30);
insert into tblCourse values (3,'Java and Python 기반 응용SW 개발자 양성과정',6,400,30);
insert into tblCourse values (4,'Java기반 멀티 플랫폼 응용 SW개발자 양성 과정',6,300,26);
insert into tblCourse values (5,'자바 기반 모바일 융합 SW 개발자 양성 과정',7,350,26);
insert into tblCourse values (6,'Framework 기반의 빅데이터 활용 응용프로그래머 양성과정',7,450,26);


insert into tblCourse values (7,'웹기반 빅데이터 분석 응용SW개발자 양성과정',5.5,400,30);
insert into tblCourse values (8,'Java를 활용한 웹 응용SW개발자 양성과정',5.5,300,30);
insert into tblCourse values (9,'JAVA기반 Web Platform Service 구축 Web,App 개발자 양성과정',6,400,30);
insert into tblCourse values (10,'데이터 융합 자바(JAVA),코틀린(Kotlin) 웹 and 앱 개발자 양성과정',6,300,26);
insert into tblCourse values (11,'자바(Java) and 스프링(Spring) 프레임워크 개발자 양성과정',7,300,26);
insert into tblCourse values (12,'증강현실(AR) SW개발자(자바(JAVA) and 코틀린 활용) 양성과정',7,550,26);
commit;

select * from tblCourse;