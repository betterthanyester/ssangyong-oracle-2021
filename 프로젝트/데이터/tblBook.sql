--교재

create table tblBook (
          bookSeq number primary key,
          bookName varchar2(90) not null,
          publisher varchar2(90) not null                                                                                                                    
);
  
drop table tblBook;


insert into tblBook values (1,'아두이노 알아보기', '참빛 출판사');
insert into tblBook values (2,'아두이노 실습하기', '우공비 출판사');
insert into tblBook values (3,'자바 기초 이론', '참빛 출판사');
insert into tblBook values (4,'자바스크립트 실습하기', '참빛 출판사');
insert into tblBook values (5,'자바스크립트 실습하기', '동아 출판사');
insert into tblBook values (6,'파이썬의 정석', '참빛 출판사');
insert into tblBook values (7,'자바스크립트의 정석', '동아 출판사');
insert into tblBook values (8,'파이썬 알아보기', '참빛 출판사');
insert into tblBook values (9,'자바스크립트 기초 이론', '동아 출판사');
insert into tblBook values (10,'파이썬의 정석', '우공비 출판사');
insert into tblBook values (11,'자바 기초 이론', '참빛 출판사');
insert into tblBook values (12,'오라클 기초 이론', '하늘샘 출판사');
insert into tblBook values (13,'자바스크립트의 정석', '우공비 출판사');
insert into tblBook values (14,'자바스크립트 기초 이론', '동아 출판사');
insert into tblBook values (15,'아두이노 실습하기', '우공비 출판사');
insert into tblBook values (16,'파이썬 알아보기', '우공비 출판사');
insert into tblBook values (17,'아두이노 기초 이론', '동아 출판사');
insert into tblBook values (18,'자바스크립트 기초 이론', '동아 출판사');
insert into tblBook values (19,'자바스크립트 실습하기', '동아 출판사');
insert into tblBook values (20,'아두이노 알아보기', '우공비 출판사');
insert into tblBook values (21,'아두이노의 정석', '우공비 출판사');
insert into tblBook values (22,'자바 실습하기', '동아 출판사');
insert into tblBook values (23,'자바 실습하기', '하늘샘 출판사');
insert into tblBook values (24,'오라클 기초 이론', '동아 출판사');
insert into tblBook values (25,'자바스크립트 실습하기', '동아 출판사');
insert into tblBook values (26,'파이썬 알아보기', '동아 출판사');
insert into tblBook values (27,'자바스크립트 알아보기', '하늘샘 출판사');
insert into tblBook values (28,'오라클 기초 이론', '우공비 출판사');
insert into tblBook values (29,'자바의 정석', '하늘샘 출판사');
insert into tblBook values (30,'아두이노 실습하기', '하늘샘 출판사');

commit;

select * from tblBook;
