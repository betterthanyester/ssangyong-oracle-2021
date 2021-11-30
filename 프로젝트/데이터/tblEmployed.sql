create table tblEmployed (
          	firmSeq number not null references tblFirm(firmSeq),
            buseo varchar2(60) not null,
          	jikwi varchar2(60) not null,
          	ibsadate date not null,
            sugangSeq number not null references tblSugang(sugangSeq)
);

drop table tblEmployed;


insert into tblMember values (20,'모바일 개발부','과장', '2019-03-14', 21);
insert into tblMember values (19,'임베디드 개발부','대리', '2019-12-09', 3);
insert into tblMember values (26,'모바일 개발부','사원', '2019-01-27', 2);
insert into tblMember values (18,'데이터베이스 관리부','사원', '2020-11-10', 29);
insert into tblMember values (15,'임베디드 개발부','사원', '2021-04-01', 1);
insert into tblMember values (25,'웹 개발부','사원', '2020-06-07', 19);
insert into tblMember values (21,'임베디드 개발부','대리', '2019-01-03', 23);
insert into tblMember values (26,'응용소프트웨어 개발부','대리', '2020-11-02', 17);
insert into tblMember values (20,'데이터베이스 관리부','사원', '2021-05-01', 47);
insert into tblMember values (22,'모바일 개발부','과장', '2020-11-21', 31);
insert into tblMember values (9,'응용소프트웨어 개발부','대리', '2021-08-21', 31);
insert into tblMember values (17,'데이터베이스 관리부','사원', '2021-10-20', 1);
insert into tblMember values (16,'데이터베이스 관리부','대리', '2020-11-16', 10);
insert into tblMember values (24,'데이터베이스 관리부','대리', '2019-05-18', 12);
insert into tblMember values (26,'시스템소프트웨어 개발부','사원', '2019-01-06', 40);
insert into tblMember values (8,'데이터베이스 관리부','과장', '2020-04-12', 23);
insert into tblMember values (11,'시스템소프트웨어 개발부','사원', '2020-02-18', 3);
insert into tblMember values (26,'모바일 개발부','사원', '2020-09-20', 27);
insert into tblMember values (1,'데이터베이스 관리부','사원', '2020-10-01', 9);
insert into tblMember values (8,'웹 개발부','사원', '2019-09-12', 29);
insert into tblMember values (11,'웹 개발부','대리', '2021-05-06', 34);
insert into tblMember values (2,'웹 개발부','대리', '2020-03-05', 5);
insert into tblMember values (1,'모바일 개발부','대리', '2020-01-09', 29);
insert into tblMember values (3,'시스템소프트웨어 개발부','사원', '2021-09-07', 6);
insert into tblMember values (17,'데이터베이스 관리부','과장', '2021-11-01', 37);
insert into tblMember values (8,'응용소프트웨어 개발부','대리', '2020-01-23', 17);
insert into tblMember values (25,'시스템소프트웨어 개발부','대리', '2020-04-09', 7);
insert into tblMember values (29,'데이터베이스 관리부','사원', '2020-07-27', 35);
insert into tblMember values (17,'응용소프트웨어 개발부','사원', '2021-03-08', 24);
insert into tblMember values (20,'시스템소프트웨어 개발부','사원', '2021-12-15', 44);

commit;

select * from tblEmployed;

