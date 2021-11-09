--ex02_datatype.sql


create table tblType(
    --num number 
    --num number(3)
    num number(4,2)

);

drop table tblType;



select * from tblType;


insert into tblType (num) values (100);  --(4,2)는 소수에 두자리 준거여서, 정수부 최대값이 99. 따라서 오류 발생
insert into tblType (num) values (99);

insert into tblType (num) values (200);

insert into tblType (num) values (300);
insert into tblType (num) values (3.14);
insert into tblType (num) values (3.123456);  -- 99.99보다 작으므로, 들어가긴 하는데, 소수 둘째 자리 뒤는 짤림

commit;

select * from hr.tblType;

--

