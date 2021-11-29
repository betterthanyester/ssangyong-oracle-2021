
select * from tblBonus;

--문제1. 직원번호(num)와 보너스배율(1.2, 1.5..)을 전달하면 tblBonus에 항목을 추가하는 프로시저를 만드시오.
    -- in > num, bonus
    -- out > result
-- a. num > select > basicpay
-- b. num + basicpay * 보너스배율 > insert
-- c. result > 확인용 out 매개변수 사용

select bonus from tblBonus where num = 1023;


create or replace procedure procBonus (
    pnum in number,
    pratio in number,
    presult out number
)
is 
begin
    insert into tblBonus (seq, num, bonus)
        values ( (select max(seq) + 1 from tblBonus), pnum, pratio * (select bonus from tblBonus where num = pnum) ); 
        presult := 1;

exception
    when others then
        presult := 0;        
        
end procBonus;



declare
    vresult number;
begin 
    procBonus (1001, 1.2, vresult);

    if vresult = 1 then
        dbms_output.put_line('성공');
    else
        dbms_output.put_line('실패');
    end if;
end;


select * from tblStaff;
select * from tblProject;
--문제2. 직원이 퇴사하는 프로시저를 만드시오.
    -- in > num
    -- out > result
--  a. 해당 직원이 담당하는 프로젝트가 있는지 확인
--  b. 다른 직원에게 프로젝트를 위임한다.
--  c. 해당 직원이 퇴사한다.
--  d. result > 확인용 out 매개변수 사용 

create or replace procedure procDeleteInsa (
    pnum number,
    presult number
)
is
begin
    
end procDeleteInsa;

