create table tblEmployed (
          	firmSeq number not null references tblFirm(firmSeq),
            buseo varchar2(60) not null,
          	jikwi varchar2(60) not null,
          	ibsadate date not null,
            sugangSeq number not null references tblSugang(sugangSeq)
);

drop table tblEmployed;


insert into tblEmployed values (20,'모바일 개발부','과장', '2019-03-14', 169);
insert into tblEmployed values (19,'임베디드 개발부','대리', '2019-12-09', 170);
insert into tblEmployed values (26,'모바일 개발부','사원', '2019-01-27', 171);
insert into tblEmployed values (18,'데이터베이스 관리부','사원', '2020-11-10', 172);
insert into tblEmployed values (15,'임베디드 개발부','사원', '2021-04-01', 173);
insert into tblEmployed values (25,'웹 개발부','사원', '2020-06-07', 174);
insert into tblEmployed values (21,'임베디드 개발부','대리', '2019-01-03', 175);
insert into tblEmployed values (26,'응용소프트웨어 개발부','대리', '2020-11-02', 176);
insert into tblEmployed values (20,'데이터베이스 관리부','사원', '2021-05-01', 177);
insert into tblEmployed values (22,'모바일 개발부','과장', '2020-11-21', 178);
insert into tblEmployed values (9,'응용소프트웨어 개발부','대리', '2021-08-21', 179);
insert into tblEmployed values (17,'데이터베이스 관리부','사원', '2021-10-20', 180);
insert into tblEmployed values (16,'데이터베이스 관리부','대리', '2020-11-16', 181);
insert into tblEmployed values (24,'데이터베이스 관리부','대리', '2019-05-18', 182);
insert into tblEmployed values (26,'시스템소프트웨어 개발부','사원', '2019-01-06', 183);
insert into tblEmployed values (8,'데이터베이스 관리부','과장', '2020-04-12', 184);
insert into tblEmployed values (11,'시스템소프트웨어 개발부','사원', '2020-02-18', 185);
insert into tblEmployed values (26,'모바일 개발부','사원', '2020-09-20', 186);
insert into tblEmployed values (1,'데이터베이스 관리부','사원', '2020-10-01', 187);


commit;

select * from tblEmployed;

