--평가항목
create table tblQuestion(
        questionSeq number primary key,
        question varchar2(1500) not null
);
insert into tblQuestion values (1,'강의 계획서 진도에 맞춰 수업을 진행하였다.');
insert into tblQuestion values (2,'수업방식(명확한 설명, 적절한 사례제시, 학습흥미 유발)에 만족하였다.');
insert into tblQuestion values (3,'이 강의를 통해 핵심역량이 증진되었다.');
insert into tblQuestion values (4,'연습문제가 능력향상에 도움이 되었다.');
insert into tblQuestion values (5,'강의 교재나 참고자료가 수업내용을 이해하는데 적절하였다.');
insert into tblQuestion values (6,'주어진 강의 시간이 충분히 활용되었다.');
insert into tblQuestion values (7,'교육시간과 기간은 적적하였다.');
insert into tblQuestion values (8,'강사는 해당 분야의 전문적인 기술과 지식을 갖추었다.');
insert into tblQuestion values (9,'이 수업을 다른 사람에게 추천하고 싶다.');
insert into tblQuestion values (10,'전체적으로 강사/강의를 평가한다면');
commit;






