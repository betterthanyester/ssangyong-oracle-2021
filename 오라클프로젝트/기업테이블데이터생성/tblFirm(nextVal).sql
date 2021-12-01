
create table  tblFirm(
	firmSeq number not null primary key,
	size number not null,
	category varchar2(60) not null,
	name varchar2(60) not null,
	pay number not null
);



insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,148305878215,IT서비스,가비아,5324);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,145287726061,IT서비스,대보정보통신,4731);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,845658644418,IT서비스,롯데정보통신,5925);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,131919332762,IT서비스,링네트,5355);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,173138676084,IT서비스,메타넷대우정보,5926);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,10719631804166,IT서비스,삼성SDS,9889);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,456039720822,IT서비스,신세계I&C,6142);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,108259895680,IT서비스,쌍용정보통신,6126);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,464955698110,IT서비스,씨제이올리브네트웍스,6878);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,246148800696,IT서비스,아시아나IDT,6129);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,84684742183,SW,나무기술,4785);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,262663608429,SW,더존비즈온,4659);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,22944521082,SW,데이터스트림즈,4926);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,37376711760,SW,비트컴퓨터,4358);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,18371428653,SW,솔트룩스,3484);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,28486918376,SW,알서포트,4629);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,4211996503,SW,에자일소다,5223);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,34454977994,SW,엑셈,5395);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,17097021495,SW,엔쓰라엔,5411);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,19192997872,SW,엔코아,5849);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,28815881240,보안,드림시큐리티,3699);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,30443293632,보안,라온시큐어,4815);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,26166219992,보안,마크애니,5288);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,19738973639,보안,소프트캠프,5601);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,16000355926,보안,수산아이앤티,5046);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,20669069542,보안,시큐브,4547);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,119274964425,보안,시큐아이,6410);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,166992214318,보안,안랩,5931);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,45088761128,보안,SGA솔루션스,4138);
insert into tblFirm (firmSeq, size, category, name, pay) values (firmSeq.nextval,270423165497,보안,SK인포섹,4656);




commit;

select * from tblFirm;