
create table tblFirm (
	firmSeq number not null primary key,
	revenue number not null,
	category varchar2(60) not null,
	name varchar2(60) not null,
	pay number not null
);


`
drop table tblFirm;

insert into tblFirm (firmSeq, revenue, category, name, pay) values (1,1483,'IT서비스','가비아',5324);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (2,1452,'IT서비스','대보정보통신',4731);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (3,8456,'IT서비스','롯데정보통신',5925);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (4,1319,'IT서비스','링네트',5355);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (5,1731,'IT서비스','메타넷대우정보',5926);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (6,107196,'IT서비스','삼성SDS',9889);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (7,4560,'IT서비스','신세계I',6142);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (8,1082,'IT서비스','쌍용정보통신',6126);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (9,4649,'IT서비스','씨제이올리브네트웍스',6878);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (10,2461,'IT서비스','아시아나IDT',6129);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (11,846,'SW','나무기술',4785);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (12,2626,'SW','더존비즈온',4659);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (13,229,'SW','데이터스트림즈',4926);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (14,373,'SW','비트컴퓨터',4358);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (15,183,'SW','솔트룩스',3484);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (16,284,'SW','알서포트',4629);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (17,42,'SW','에자일소다',5223);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (18,344,'SW','엑셈',5395);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (19,170,'SW','엔쓰라엔',5411);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (20,191,'SW','엔코아',5849);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (21,288,'보안','드림시큐리티',3699);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (22,304,'보안','라온시큐어',4815);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (23,261,'보안','마크애니',5288);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (24,197,'보안','소프트캠프',5601);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (25,160,'보안','수산아이앤티',5046);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (26,206,'보안','시큐브',4547);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (27,1192,'보안','시큐아이',6410);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (28,1669,'보안','안랩',5931);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (29,450,'보안','SGA솔루션스',4138);
insert into tblFirm (firmSeq, revenue, category, name, pay) values (30,2704,'보안','SK인포섹',4656);



commit;

select * from tblFirm;