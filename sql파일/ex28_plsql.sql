--ex28_plsql.sql

/*

PL/SQL
    - Oracle's Procedural Language extension to SQL
    - 기존의 ANSI-SQL에 절차 지향 언어의 기능을 추가한 SQL

ANSI-SQL
    - 비절차 지향 언어. 순서가 없고 연속적이지 않다.- 


프로시저, Procedure
    - 메소드, 함수 등...
    - 순서가 있는 명령어의 집합
    - PL/SQL 명령어는 반드시 프로시저 내에서만 작성, 동작이 된다.

1. 익명 프로시저
    - 1회용 코드 작성용

2. 실명 프로시저
    - 데이터베이스 객체
    - 저장용
    - 재호출



PL/SQL 프로시저 블럭 구조

1. 4개의 키워드(블럭)으로 구성
    - DECLARE
    - BEGIN
    - EXCEPTION
    - END


2. DECLARE
    - 선언부
    - 프로시저 내에서 사용할 변수, 객체 등을 선언하는 영역
    - 생략 가능



3. BEGIN
    - 실행부, 구현부
    - BEGIN ~ END
    - 구현된 코드를 가지는 영역 (메소드의 body와 동일)
    - 생략 불가능
    - ANSI-SQL 작성 + 연산 + 제어 등...
    
4. EXCEPTION
    - 예외처리부
    - catch 역할
    - 예외 처리 코드를 작성
    - 생략 가능

5. END
    - BEGIN 블럭의 종료 역할 
    - 생략 불가능


자료형 + 변수

PL/SQL 자료형
    - 이전 자료형과 동일

변수 선언하기
    - 변수명 자료형 [not null] [default 값];
    - 주로 질의(select)의 결과값을 저장하는 용도
    
PL/SQL 연산자
    - ANSI-SQL 과 동일
    
대입 연산자
    - ANSI-SQL의 대입 연산자
        ex) update table set column = '값';
        
    - PL/SQL의 대입 연산자
        ex) 변수 := '값';

*/

set serverout on; -- 값이 보이게 설정
set serverout off; -- 값이 안 보이게 설정

declare 
    num number;
    name varchar2(30);
    today date;
begin
    num :=10;
    dbms_output.put_line(num);
    
    name := '홍길동';
    dbms_output.put_line(name);
    
    today := sysdate;
    dbms_output.put_line(today);
end; 


declare 
    num number;
    num2 number;
    num3 number := 300; --선언과 동시에 초기화
    num4 number default 400;
    num5 number not null;
    num5 number not null default 500; --됨
begin

    dbms_output.put_line(num); --null
    
    num2 := 200;
    dbms_output.put_line(num2);
    
    dbms_output.put_line(num3);
    
    dbms_output.put_line(num4);
    dbms_output.put_line(num5); --PLS-00218: a variable declared NOT NULL must have an initialization assignment
                                --초기화 필요
                                
    -- 구현부에서 초기화
        -- num5 :=500; -- 안됨
        -- not null : 선언부에서 초기화해야 함
end; 



/*

변수를 만드는 목적
    > 테이블 select 결과를 담는 용도
    > select into 절 사용

*/


declare 
    vbuseo varchar2(15);
    vname varchar2(15);
begin
    --select문은 반드시 결과를 PL/SQL 변수에 전달해야 한다(************)
    --그래서 항상 SELECT INTO 절이 사용된다
    select buseo into vbuseo from tblInsa where name = '홍길동'; -- 내부에 ANSI-SQL 넣어도 됨
    dbms_output.put_line(vbuseo);
    
    --select name from tblInsa where buseo = '기획부' and jikwi = '대리' and rownum = 1;
    
    select name into vname from tblInsa where buseo = vbuseo and jikwi = '대리' and rownum = 1;
    dbms_output.put_line(vname);
    
end;

-----------------------------------------
create table tblName(
    name varchar2(15)
);

declare 
    vname varchar2(15);
begin
    select name into vname from tblInsa where buseo = '개발부' and jikwi = '부장';
    insert into tblName (name) values (vname);
end;

select * from tblName;


declare 
    vname varchar2(15);
    vbuseo varchar2(15);
    vjikwi varchar2(15);
begin
    --select name,buseo,jikwi from tblInsa where num = '1001';
    --select name into vname,buseo into vbuseo,jikwi into vjikwi from tblInsa where num = '1001'; -- 에러
    
    -- into 사용시
        -- 1. 컬럼의 개수와 변수의 개수 일치!!
        -- 2. 컬럼의 순서와 변수의 순서 일치!!
        -- 3. 컬럼과 변수의 자료형 일치!!
    select name,buseo, jikwi into vname, vbuseo, vjikwi from tblInsa where num = '1001';
    dbms_output.put_line(vname);
    dbms_output.put_line(vbuseo);
    dbms_output.put_line(vjikwi);
end;

/*

타입 참조

1. %type
    - 사용하는 테이블의 특정 컬럼값의 스키마를 알아내서 변수에 그대로 적용
    - 테이블의 컬럼을 확인해서 동일한 타입과 길이로 변수를 생성한다.
    - 복사되는 정보
        a.  자료형
        b.  길이

*/

declare 
    --vbuseo varchar2(5); -- 오류
                        -- 변수 만들때마다 테이블 찾아가서 자료형과 길이 확인해야 할까?
    vbuseo tblInsa.buseo%type;

begin
    select buseo into vbuseo from tblInsa where name = '홍길동';
    dbms_output.put_line(vbuseo);

end;



declare
    vname tblInsa.name%type;
    vcity tblInsa.city%type;
    vbasicpay tblInsa.basicpay%type;
    vibsadate tblInsa.ibsadate%type;
begin
    --select name,city,basicpay,ibsadate from tblInsa where num = '1001';
    select name,city,basicpay,ibsadate into vname, vcity,vbasicpay,vibsadate from tblInsa where num = '1001';
    
    dbms_output.put_line(vname);
    dbms_output.put_line(vcity);
    dbms_output.put_line(vbasicpay);
    dbms_output.put_line(vibsadate);
end;


--직원 중 일부에게 보너스 지급 > 내역 저장
create table tblBonus(
    seq number primary key,
    num number(5) not null references tblInsa(num), --직원번호(FK)
    bonus number not null

);


select * from tblInsa where city = '서울' and jikwi = '부장' and buseo = '영업부';

insert into tblBonus (seq,num,bonus) values (...)



declare
    vnum tblInsa.num%type;
    vbasicpay tblInsa.basicpay%type;
begin
    select num,basicpay into vnum,vbasicpay from tblInsa where city = '서울' and jikwi = '부장' and buseo = '영업부';

    insert into tblBonus (seq,num,bonus) values (1,vnum, vbasicpay * 1.5);
end;


select s.name,s.city,s.buseo,s.basicpay,b.bonus from tblBonus b inner join tblInsa s on s.num = b.num;


select * from tblMen;
select * from tblWomen;


-- 무명씨 > 성전환 수술 > tblMen -> tblWomen 옮기기
--  1. tblMen > select > 정보
--  2. tblWomen > insert
--  3. tblMen > delete



declare 
--    vname tblMen.name%type;
--    vage tblMen.age%type;
--    vheight tblMen.height%type;
--    vweight tblMen.weight%type;
--    vcouple tblMen.couple%type;
    vrow tblMen%rowtype; --레코드 1개를 모두 저장할 수 있는 변수
begin
    
--    1. 정보 가져오기
    select * into vrow from tblMen where name = '무명씨';
--    dbms_output.put_line(vrow);
    dbms_output.put_line(vrow.name);
    dbms_output.put_line(vrow.age);
    dbms_output.put_line(vrow.height);
    dbms_output.put_line(vrow.weight);
    dbms_output.put_line(vrow.couple);
--    2. 집어넣기
    
    insert into tblWomen values (vrow.name, vrow.age,vrow.height,vrow.weight,vrow.couple);

--    3. 기존 데이터 지우기
    delete from tblMen where name = vrow.name;
    
    
end;

select * from tblMen;
select * from tblwoMen;

-----------------------

----제어문
--  1. 조건문
--  2. 반복문
    
declare 
    vnum number := 10;
begin 
    if vnum > 0 then 
        dbms_output.put_line('양수');
    end if;
end;


declare 
    vnum number := -10;
begin 
    if vnum > 0 then 
        dbms_output.put_line('양수');
    else 
        dbms_output.put_line('음수');
    end if;
end;


declare 
    vnum number := 0;
begin 
    if vnum > 0 then 
        dbms_output.put_line('양수');
    elsif vnum < 0 then    --else if 구문 주의
        dbms_output.put_line('음수');
    else 
        dbms_output.put_line('0');
    end if;
end;


declare 
    vgender char(1);
begin 
    select substr(ssn, 8,1) into vgender from tblInsa where num = '1003';
    
    if  vgender = '1' then
        dbms_output.put_line('남자 업무 진행');
    elsif vgender = '2' then
        dbms_output.put_line('여자 업무 진행');
    end if;
end;

--직원 1명 선택 > 보너스 지급 > 간부(1.5배), 사원(2배)


declare 
    --vrow tblInsa%rowtype; --너무 과함. 가져올 컬럼이 얼마 안되므로
    vnum tblInsa.num%type;
    vbasicpay tblInsa.basicpay%type;
    vjikwi tblInsa.jikwi%type;
    vbonus number;
begin 
    select num, basicpay,jikwi into vnum,vbasicpay,vjikwi from tblInsa where name = '홍길동';
    
    if vjikwi in ('부장','과장') then
        vbonus := vbasicpay*1.5;
    elsif vjikwi = '대리' or vjikwi = '사원' then --in이 편함
        vbonus := vbasicpay*2;
    end if;
    
    insert into tblBonus values (2, vnum, vbonus);
end;

select * from tblBonus;
select * from tblInsa;


/*

case문 
    - ANSI-SQL case와  유사
    - 자바의 switch, 다중if문과 유사

*/

declare 
    vcontinent tblCountry.continent%type;
    vresult varchar2(30);

begin
    select continent into vcontinent from tblCountry where name = '영국';
    
    if vcontinent = 'AS' then
        vresult := '아시아';
    elsif vcontinent = 'EU' then
        vresult := '유럽';
    else
        vresult := '기타';
       
    end if;
    dbms_output.put_line(vresult); 
    
    
    case vcontinent
        when 'AS' then vresult := '아시아';
        when 'EU' then vresult := '유럽';
        else vresult := '기타';
    end case;
    dbms_output.put_line(vresult); 



    case 
        when vcontinent = 'AS' then vresult := '아시아';
        when vcontinent = 'EU' then vresult := '유럽';
        else vresult := '기타';
    end case;
    dbms_output.put_line(vresult); 

    
end;

--ANSI
select
    case continent
        when 'AS' then '아시아'
        when 'EU' then '유럽'
        else '기타'
    end
from tblCountry;
        

