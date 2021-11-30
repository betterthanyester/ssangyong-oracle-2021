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
        


/*

반복문
    1. loop
        - 단순 반복
        
    2. for loop
        - 횟수 반복 (자바 for)
        - loop 기반
        
    3. while loop
        - 조건 반복 (자바 while)
        - loop 기반

*/

set serverout on;

declare
    vnum number := 1;
begin
    loop
        dbms_output.put_line(to_char(sysdate, 'hh24:mi:ss'));
        vnum := vnum + 1;
        exit when vnum > 10; --탈출조건 : 없으면 무한루프
    end loop;
end;



create table tblLoop (
    seq number primary key,
    data varchar2(30) not null
);

create sequence seqLoop;


declare
    vnum number :=1;
begin
    loop
        insert into tblLoop values (seqLoop.nextVal, '데이터' ||vnum);
        vnum := vnum +1;
        exit when vnum > 10000;
    end loop;
end;

select count(*) from tblLoop;

--  2. for loop

begin 
    for i in 1..10 loop
        dbms_output.put_line(i);
    end loop;
end;

---구구단

    -- 복합키 만드는 방법
create table tblGugudan (
    dan number not null primary key,
    num number not null primary key, --ORA-02260: table can have only one primary key
    result number not null

);

create table tblGugudan (
    dan number not null,
    num number not null, --ORA-02260: table can have only one primary key
    result number not null,

    constraint tblgugudan_dan_num_pk primary key(dan, num) --복합키 선언 방법
);

alter table tblGugudan
    add constraint tblgugudan_dan_num_pk primary key(dan,num);  --복합키 선언 방법2 : 테이블 수정으로 하는 방법


begin
    for dan in 2..9 loop
        for num in 1..9 loop
            insert into tblGugudan (dan,num, result)
                values (dan, num, dan*num);
        end loop;
    end loop;

end;

select * from tblGugudan;


--  3. while loop

declare 
    vnum number := 1;
begin
    while vnum <= 10 loop
        dbms_output.put_line(vnum);
        vnum := vnum +1;
    end loop;
end;

/*

select > 결과셋 > PL/SQL 변수 대입

1. select into
    - 결과셋의 레코드가 1개일 때만 사용이 가능하다.
    
2. cursor
    - 결과셋의 레코드가 N개일 때 사용한다.

DECLARE 
    변수 선언;
    커서 선언; --결과셋 참조 객체
BEGIN
    커서 열기;
        LOOP
            데이터 접근(레코드 마다) <- 커서 사용
        END LOOP;
    커서 닫기;
END;
    

*/ 

declare 
    vname tblInsa.name%type;
begin
    select name into vname from tblInsa; --ORA-01422: exact fetch returns more than requested number of rows
    dbms_output.put_line(vname);
end;


-- 다중행 + 단일컬럼
-- 직원명 60개 가져오기

declare 
    vname tblInsa.name%type;
    --cursor vcusor is select문;
    cursor vcursor is select name from tblInsa order by name asc;
begin
    open vcursor; --커서 열기 > select 실행 > 결과셋에 커서가 연결(참조)
--        fetch vcursor into vname; --select into의 역할
--        dbms_output.put_line(vname);
--        
--        fetch vcursor into vname; --select into의 역할
--        dbms_output.put_line(vname);
        loop
            fetch vcursor into vname;
            
            exit when vcursor%notfound; --boolean
            dbms_output.put_line(vname);
            
        end loop;
    close vcursor;
end;

-- '기획부' 이름, 직위, 급여

declare 
    cursor vcursor
        is select name, jikwi, basicpay from tblInsa where buseo = '기획부' order by num asc;
    vname tblInsa.name%type;
    vjikwi tblInsa.jikwi%type;
    vbasicpay tblInsa.basicpay%type;
begin
    open vcursor;
    
    loop
        --fetch vcursor into 변수;
        fetch vcursor into vname, vjikwi, vbasicpay;
        exit when vcursor%notfound;
        dbms_output.put_line(vname || '-' || vjikwi || '-' || vbasicpay);
        
    end loop;
    
    close vcursor;
    
end;


-- 모든 직원에게 보너스 지급, 간부(1.5), 사원(2)

select * from tblBonus;

create sequence seqBonus start with 4;



declare
    cursor vcursor is 
        select * from tblInsa;
    vrow tblInsa%rowtype;
begin
    open vcursor;
    loop
        --fetch vcursor into 변수;
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    
        if vrow.jikwi in ('과장','부장') then 
            insert into tblBonus values (seqBonus.nextVal, vrow.num, vrow.basicpay*1.5);
        elsif vrow.jikwi in ('사원','대리') then 
            insert into tblBonus values (seqBonus.nextVal, vrow.num, vrow.basicpay*2);
        end if;
        
    end loop;
    close vcursor;

end;

select s.name,s.basicpay,b.bonus from tblBonus b inner join tblInsa s on s.num = b.num;

--직원당 보너스 총 얼마? 총 몇번?
select 
    s.name,
    count(*),
    sum(b.bonus)
from tblBonus b 
    inner join tblInsa s 
        on s.num = b.num 
            group by name;
            
            
-- 커서 탐색
-- 1. 커서 + loop
-- 2. 커서 + for loop
--        > 극단적으로 간단해지는 표현 (아래의 주석처리 구문들이 다 사라짐)

declare 
    cursor vcursor
        is select * from tblInsa;
begin  
    --open vcursor;
    --loop
    for vrow in vcursor loop --loop + fetch into + vrow + exit when
        --fetch vcursor into vrow;
        --exit when vcursor%notfound
        dbms_output.put_line(vrow.name);
    end loop;
    --end loop;
    --close vcursor;
end;


--주석 제거하면
declare 
    cursor vcursor
        is select * from tblInsa;
begin  

    for vrow in vcursor loop
        dbms_output.put_line(vrow.name);
    end loop;
end;

-- 예외 처리
--  : 실행부에서 (begin-end) 발생하는 예외를 처리하는 블럭

declare
    --vname number; --오류가 나게 설정 (자료형이 varchar2인데 number로 설정)
    vname varchar2(15);
begin
    dbms_output.put_line('시작');
    select name into vname from tblInsa where num = '1001';
    dbms_output.put_line('끝');
    
exception
    when others then
        dbms_output.put_line('예외 처리');    
end;



--DB 계층 > 오류 발생 > 기록 남긴다.
create table tblLog(
    seq number primary key,                                                            --PK
    code varchar2(7) not null check (code in ('A001', 'B001', 'B002', 'C001')),        --에러 상태 코드
    message varchar2(1000) not null,                                                   --에러 메시지
    regdate date default sysdate not null                                              --에러 발생 시간
);

create sequence seqLog;



commit;
rollback;

delete from tblCountry;
select * from tblCountry;

declare 
    vcnt number;
    vname tblInsa.name%type;
begin
    select count(*) into vcnt from tblCountry;
    select name into vname from tblInsa where num = '1000'; --ORA-01403: no data found
    
    
    dbms_output.put_line(100/vcnt);  --ORA-06512: at line 8
                                     --01476. 00000 -  "divisor is equal to zero"
    dbms_output.put_line(vname); 
                                     
exception
    when NO_DATA_FOUND then
        insert into tblLog values (seqLog.nextVal, 'B001', '선택한 이름이 null입니다.', default);
        
    when ZERO_DIVIDE then            --https://docs.oracle.com/cd/E11882_01/timesten.112/e21639/exceptions.htm#TTPLS196 에서 검색
        insert into tblLog values (seqLog.nextVal, 'A001', 'tblCountry가 비어있습니다.', default);
    
    when others then 
        dbms_output.put_line('예외');
end;

select * from tblLog;  --관리자가 매일 확인...


-- 익명 프로시저 끝

-- 실명 프로시저 시작


/*

저장 프로시저
    1. 저장 프로시저, Stored Procedure
    2. 저장 함수, Stored Function

1. 저장 프로시저, Stored Procedure

[DECLARE
    변수선언;
    커서선언;]
BEGIN
    구현부;
[EXCEPTION
    예외처리;]
END;


CREATE [OR REPLACE] PROCEDURE 프로시저명
IS(AS)
[DECLARE
    변수선언;
    커서선언;]
BEGIN
    구현부;
[EXCEPTION
    예외처리;]
END;

*/ 


set serveroutput on;


--PL/SQL 프로시저가 성공적으로 완료되었습니다. > 실행했습니다.
declare
    vnum number;
begin
    vnum := 200;
    dbms_output.put_line('num:'|| vnum);
end;

--Procedure PROCTEST이(가) 컴파일되었습니다. > 오라클 서버에 저장했습니다.
create or replace procedure procNum
is
    vnum number;
begin
    vnum := 200;
    dbms_output.put_line('num:'|| vnum);
end procNum;

select vnum from dual;




-- 저장 프로시저 호출하는 방법
--  1.PL/SQL 블럭에서 호출하기 > 권장
--  2. 스크립트 환경에서 호출하기(ANSI-SQL 환경) > 비권장



--1.PL/SQL 블럭에서 호출하기 > 권장


-- 프로시저는 메서드다.
begin
procNum; --다른 프로시저 호출(메소드 -> 다른 메소드 호출)
procNum;
procNum;
end;

--다른 pl sql에서도 메서드처럼 불러올 수 있다.
create or replace procedure procTest
is 
begin
    procNum;
end;


begin
    procTest;
end;


--  2. 스크립트 환경에서 호출하기(ANSI-SQL 환경) > 비권장 > 프로시저 연계된 연속 작업 불가능;;

execute procNum;
exec procNum;
call procNum(); -- 뒤에 수업할 때 다시 사용(JDBC)


-- 프로시저 (=메소드)
--  1. 매개변수
--  2. 반환값

--  매개변수가 있는 프로시저
set serveroutput on;

create or replace procedure procTest(pnum number)
is 
    vsum number := 0;
begin
    vsum := pnum + 100;
    dbms_output.put_line(vsum);
end procTest;

begin
    procTest(100);
end;



create or replace procedure procTest (
    pwidth number, 
    pheight number  --매개변수 선언 (parameter)
)
is
    varea number;  --멤버변수 선언 (variable)
begin  
    varea := pwidth * pheight;
    dbms_output.put_line(varea);
end procTest;

begin
    procTest(100,200);
end;

-- 80~120컬럼

/*
매개변수 모드
    - 매개변수의 값을 전달하는 방법

1. in > 기본
2. out
3. in out

*/


create or replace procedure procTest(
    pnum1 in number, -- in 역할 : 매개변수 역할
    pnum2 in number,  --원래 in이 있는데, 안쓰면 생략된 것임   
    presult out number -- out 역할 : 반환값의 역할 > return과 유사
)   
is -- 변수가 없어도 생략 불가 
    -- 익명 프로시저에서는 declare 생략 가능했던 것과 비교됨
begin
    
    presult := pnum1 + pnum2;
    
end procTest;

declare 
    vresult number;
begin
    --procTest(10,20); --PLS-00306: wrong number or types of arguments in call to 'PROCTEST'
    --procTest(10,20,30); --PLS-00363: expression 'TO_NUMBER(SQLDEVBIND1Z_1)' cannot be used as an assignment targe
    procTest(10,20,vresult); --공간 그 자체를 매개변수를 넘긴다.(참조 변수) > 변수의 주소값 전달
    dbms_output.put_line(vresult);
end;


-- 직원번호 전달 > 이름, 나이, 부서, 직위 반환

create or replace procedure procGetInsa(
    -- pnum in tblInsa.num%type -- 일반 변수처럼 타입 참조가 불가능
    -- pnum in number(10)       -- 일반 변수처럼 길이 지정이 불가능
    pnum in number,
    pname out varchar2,
    page out number,
    pbuseo out varchar2,
    pjikwi out varchar2      -- 메소드와 달리 반환값 여러개 가능
)
is 
begin

    select 
        name, 
       floor(months_between(sysdate,to_date('19' || substr(ssn,1,6), 'yyyymmdd'))/12),
       buseo,
       jikwi into pname, page, pbuseo,pjikwi
    from tblInsa
        where num = pnum;

end procGetInsa;

-- 나이 구하기
-- 먼저 ansi로 해보고 pl에 복붙할 것
select 
        name, 
        floor(months_between(sysdate,to_date('19' || substr(ssn,1,6), 'yyyymmdd'))/12)
from tblInsa;


declare 
    vname  tblInsa.name%type;
    vage  number;
    vbuseo  tblInsa.name%type;
    vjikwi  tblInsa.name%type;
begin
    procGetInsa(1001,vname,vage,vbuseo,vjikwi);
    dbms_output.put_line(vname);
    dbms_output.put_line(vage);
    dbms_output.put_line(vbuseo);
    dbms_output.put_line(vjikwi);
end;
    


-- 직원 추가 프로시저
insert into tblInsa (num, name, ssn, ibsadate, city, tel, buseo, jikwi, basicpay, sudang)
    values ( (select max(num) + 1 from tblInsa), '','','','','','','',0,0);

-- seq 계산
select max(num) + 1 from tblInsa;


create or replace procedure procAddInsa(
    pname varchar2,
    pssn varchar2,
    pibsadate varchar2,
    pcity varchar2,
    ptel varchar2,
    pbuseo varchar2,
    pjikwi varchar2,
    pbasicpay number,
    psudang number,
    presult out number --성공(1) or 실패(0)
)
is 
begin
    insert into tblInsa (num, name, ssn, ibsadate, city, tel, buseo, jikwi, basicpay, sudang)
        values ( (select max(num) + 1 from tblInsa), pname,pssn,pibsadate,pcity,ptel,pbuseo,pjikwi,0,0);
    presult := 1;

exception
    when others then
        presult := 0;
end procAddInsa;


declare
    vresult number;
begin 
    procAddInsa ('아무개', '951129-2012345','2018-05-10', '서울', '010-1234-5678', '영업부','사원',200000,100000,vresult);

    if vresult = 1 then
        dbms_output.put_line('성공');
    else
        dbms_output.put_line('실패');
    end if;
end;

--확인
select * from tblInsa;



select * from tblBonus;

--문제1. 직원번호(num)와 보너스배율(1.2, 1.5..)을 전달하면 tblBonus에 항목을 추가하는 프로시저를 만드시오.
    -- in > num, bonus
    -- out > result
-- a. num > select > basicpay
-- b. num + basicpay * 보너스배율 > insert
-- c. result > 확인용 out 매개변수 사용

select bonus from tblBonus;


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


-- 강사 풀이
create or replace procedure procBonus (
    pnum in number,
    pbonus in number,
    presult out number
)
is 
    vbasicpay tblInsa.basicpay%type;
begin
    --1.
    select basicpay into vbasicpay from tblInsa where num = pnum;

    --2.
    insert into tblBonus (seq, num, bonus)
        values ( seqBonus.nextVal, pnum, vbasicpay * pbonus );
    --3.
    presult := 1;

exception
    when others then
        presult := 0;        
        
end procBonus;


declare
    vresult number;
begin 
    procBonus (1001, 3, vresult);

    if vresult = 1 then
        dbms_output.put_line('성공');
    else
        dbms_output.put_line('실패');
    end if;
end;


select * from tblBonus;

select * from tblStaff;
select * from tblProject;
--문제2. 직원이 퇴사하는 프로시저를 만드시오.
    -- in > num
    -- out > result
--  a. 해당 직원이 담당하는 프로젝트가 있는지 확인
--  b. 다른 직원에게 프로젝트를 위임한다.
--  c. 해당 직원이 퇴사한다.
--  d. result > 확인용 out 매개변수 사용 

create or replace procedure procDeleteStaff (
    pseq number,  --퇴사자
    pseq2 number, --위임자
    presult out number
)
is
    vcnt number;
begin
    --1
    select count(*) into vcnt from tblProject where staff_seq = pseq;

    --2
    if vcnt > 0 then
        update tblProject set
            staff_seq = pseq2
                where staff_seq = pseq;
    end if;
    
    --3
    delete from tblStaff where seq = pseq;
    --4
    
    presult := 1;

exception
    when others then
        presult := 0;    
        
end procDeleteStaff;



declare
    vresult number;
begin 
    procDeleteStaff(2, 3, vresult);

    if vresult = 1 then
        dbms_output.put_line('성공');
    else
        dbms_output.put_line('실패');
    end if;
end;


select * from tblStaff;
select * from tblProject;



/*

프로시저
    - in > N개
    - out > N개
함수
    - in > N개
    - out > 1개

2. 저장 함수 > Stored Procedure
    - 실행 후 결과값을 반드시 1개만 반환하는 프로시저
    - 함수에서도 out 매개변수를 사용할 수 있다. > 사용하면 안된다 > return문을 사용해야 한다.


*/

-- public int sum(int a, int b)

create or replace function fnSum(
    pnum1 number,
    pnum2 number    
) return number
is
begin
    return pnum1 + pnum2;
end fnSum;


declare 
    vsum number;
begin
    vsum := fnSum(10,20);
    dbms_output.put_line(vsum);
end;


--A
select
    name,
    buseo,
    jikwi,
    case 
        when substr(ssn,8,1) = '1' then '남자'
        when substr(ssn,8,1) = '2' then '여자'
    end as gender
from
    tblInsa;
    
-- A작업을 빈번하게 사용 > view

-- B.
create or replace view vwInsa
as
select
    name,
    buseo,
    jikwi,
    case 
        when substr(ssn,8,1) = '1' then '남자'
        when substr(ssn,8,1) = '2' then '여자'
    end as gender
from
    tblInsa;
    
select * from vwInsa;


-- C. 성별이 다른 조합으로 select
--      - B의 결과물은 사용 불가능
--        - view는 select구문이 조금만 바뀌어도 다시 만들어야 함
select
    num,
    basicpay,
    case 
        when substr(ssn,8,1) = '1' then '남자'
        when substr(ssn,8,1) = '2' then '여자'
    end as gender
from
    tblInsa;
    

create or replace procedure procGender(
    pssn varchar2,
    pgender out varchar2
)
is 
begin
    
    if substr(pssn,8,1) = '1' then
        pgender := '남자';
    elsif substr(pssn, 8,1) = '2' then
        pgender := '여자';
    end if;
end procGender;

declare 
    vgender varchar2(6);
begin
    procGender('951202-2012457', vgender);
    dbms_output.put_line(vgender);
end;
    
-- ****** 저장 프로시저는 ANSI-SQL 내에서 사용이 불가능 > 이유 : 반환값 형태와 개수
select 
    num,
    basicpay,
    procGender(ssn, ?) as gender
from tblInsa;


-- ****** 저장 함수는 ANSI-SQL 내에서 사용이 가능 > 이유 : 반환값 개수가 1개이므로
    -- 프로시저 VS 함수
        -- 공통 : 코드의 집합
        -- 차이 : 프로시저는 PL/SQL에서만 사용, 함수는 ANSI/SQL에서 사용


create or replace function fnGender(
    pssn varchar2  
)return varchar2
is 
begin
    
    if substr(pssn,8,1) = '1' then
        return '남자';
    elsif substr(pssn, 8,1) = '2' then
        return '여자';
    end if;
end fnGender;

select
    name,
    buseo,
    jikwi,
    fnGender(ssn) as gender
from
    tblInsa;

select 
    num,
    basicpay,
    fnGender(ssn) as gender
from tblInsa;







/*
Trigger, 트리거
    - 프로시저의 일종 > 이름이 있다 + 저장이 된다.
    - 특정 사건이 발생하면 (미리 예약) 자동으로 호출되는 프로시저
    - 특정 테이블 지정(목표) > 감시 > insert or update or delete > 미리 준비해놓은 프로시저 호출 
    
1. 프로시저 > 사용자가 호출 > PL/SQL 상에서...
2. 함수 > 사용자가 호출 > PL/SQL + ANSI-SQL 상에서...
3. 트리거 > 시스템이 호출 > ?? > 이벤트가 발생하면 미리 등록해놓은 트리거가 실행된다.



CREATE OR REPLACE TRIGGER 트리거명
    -- 트리거 옵션
    BEFORE|AFTER
    INSERT|UPDATE|DELETE ON 테이블명
    FOR EACH ROW
DECLARE
    선언부;
BEGIN
    실행부;
EXCEPTION
    예외처리부;
END;


*/

select * from tblStaff;

create table tblLogStaff (
    seq number primary key,
    message varchar2(1000) not null,
    regdate date default sysdate not null

);

create sequence seqLogStaff start with 5;


-- 직원 추가, 수정, 삭제 > tblLogStaff에 기록 

-- A. 하드 작업
insert into tblStaff (seq, name, salary, address) values (5, '유재석',300, '서울시');
insert into tblLogStaff (seq, message, regdate) values (seqLogStaff.nextVal, '유재석 직원을 추가했습니다.', default);

insert into tblStaff (seq, name, salary, address) values (6, '강호동',350, '부산시');

select * from tblStaff;
select * from tblLogStaff;

-- B. 프로시저

create or replace procedure procAddStaff(
    pseq number,
    pname varchar2,
    psalary number,
    paddress varchar2

)
is
begin
    insert into tblStaff (seq, name, salary, address) values (pseq, pname,psalary, paddress);
    insert into tblLogStaff (seq, message, regdate) values (seqLogStaff.nextVal, pname||'직원을 추가했습니다.', default);
end procAddStaff;

-- + 공지 : 앞으로 직원을 추가할 때 ANSI-SQL를 직접 사용하지 말고, procAddStaff를 사용하세요 

begin
    procAddStaff(7,'제시',250, '울산시');
end;

select * from tblStaff;
select * from tblLogStaff;

-- 공지대로 안하고 직접 ANSI쓰는 사람이 생김

-- C. 트리거

create or replace trigger trgLogStaff 
    after 
    insert on tblStaff --tblStaff에 새로운 행이 insert되면 그 직후에 (after의 의미)  이 트리거를 호출해라
declare 

begin

    insert into tblLogStaff (seq, message, regdate) values (seqLogStaff.nextVal, '새 직원을 추가했습니다.', default);

end trgLogStaff;


insert into tblStaff (seq, name, salary, address) values (9, '조세호', 200, '부천시');

select * from tblStaff;
select * from tblLogStafsf;


/*

연속된 2개의 작업을 할 때.. (직원 추가 > 로그 기록)
    - 직원 추가(주업무) > 로그 기록(보조업무)
    - 계좌 송금(주업무) > 계좌 인출(주업무)

1. 프로시저
    - 연속된 작업이 모두 주업무일 때...(동등한 수준의 업무들...)
    - 눈에 보인다. 

2. 트리거 
    - 선행 작업은 주업무이고, 후생 작업은 보조업무일 때... (수준이 다른 업무들...)
    - 눈에 안보인다.

*/



/*


FOR EACH ROW

1. 사용 O
    - 행 단위 트리거 > 트리거 실행 반복
    - 감시하던 작업이 여러개의 레코드에서 발생하면 그 횟수만큼 트리거를 실행

2. 사용 X
    - 문장 단위 트리거 > 트리거 실행 1회
    - 감시하던 작업이 여러 개의 레코드에서 발생해도 트리거는 단 한번만 실행
    
    
FOR EACH ROW에서만 사용 가능한 상관 관계
    - 사건이 발생한 레코드를 참조하는 역할
    1. :new
        - 새로운 데이터로 추가(변경)된 행을 참조한다.
        - insert or update -> 새로운 정보를 가져오는 역할
    2. :old
        - 변경이 되거나 삭제되는 이전 행을 참조한다.
        - update or delete -> 이전 정보를 가져오는 역할
    

*/

select * from tblTodo;


create or replace trigger trgTodo
    after 
    update on tblTodo -- 이 테이블에서 update 작업이 일어나면 그 직후에 아래의 내용을 실행해라
    for each row
begin 
    --dbms_output.put_line('tblTodo가 수정되었습니다.');
    --dbms_output.put_line(:new.title || '이 수정되었습니다.');
    dbms_output.put_line('수정전:' || :old.title); 
    dbms_output.put_line('수정후:' || :new.title); 
end;

set serveroutput on;

update tblTodo set title = '고양이 산책시키기' where seq = 5;           --적용되는 행의 개수 > 1개
update tblTodo set completedate = sysdate where completedate is null; -- 적용되는 행의 개수 > N개

rollback;


select * from tblStaff;
select * from tblProject;


--업무 위임 프로시저
declare 
    vresult number;
begin
    procDeleteStaff(4,3,vresult);
    dbms_output.put_line(vresult);
end;

-- 트리거(퇴사 -> 어떤 업무를 누구에게 위임했는지 기록)

-- 삭제 시 발생하는 트리거
DROP TRIGGER trgDeleteStaff;

create or replace trigger trgDeleteStaff
    before
    delete on tblStaff
    for each row
declare
    vname1 tblStaff.name%type;
begin
        
    select name into vname1 from tblStaff where seq = :old.seq; -- mutating걸림 -> 프로시저에 추가해버리기
    dbms_output.put_line('['||to_char(sysdate, 'HH24:MI:SS')|| ']퇴사자(' || vname1 || ')');
    
end trgDeleteStaff;

DROP TRIGGER trgDelegateStaff;




-- 위임 시 발생하는 트리거
create or replace trigger trgDelegateStaff
    after
    update on tblProject
    for each row
declare
    vname1 tblStaff.name%type;
    vname2 tblStaff.name%type;
begin

    --:new.staff_seq --> 인수인계받은 직원번호
    --:old.staff_seq --> 퇴사하는 직원번호
    
    select name into vname1 from tblStaff where seq = :old.staff_seq; --퇴사자
    
    select name into vname2 from tblStaff where seq = :new.staff_seq; --퇴사자
    
    dbms_output.put_line('['||to_char(sysdate, 'HH24:MI:SS')|| ']퇴사자(' || vname1 || ')인계자(' || vname2 || ')');
    
end trgDelegateStaff;


-- 트리거에서 mutating 발생되면 : 그 작업을 포기하고, 프로시저 (프로그램)을 짜자. 해결이 안된다.


/*

테이블 삭제
    - 테이블 관계 (부모-자식) : 참조하고 있는 자식이 있다면 삭제 불가
    - 삭제하려는 테이블과 관계를 맺고 있는 자식 테이블을 확인하는 방법
        1. ERD (FM)
    
    - 삭제 방법
        1. 자식 테이블 삭제 > 부모 테이블 삭제
        2. FK 제약사항을 삭제 > 부모 테이블 삭제
        3. drop table tblStaff cascade constraints purge -- 2번을 먼저 실행한 뒤 drop을 합친 행동

        --> 1번은 관계를 파악하고 지우는 것인 반면, cascade 옵션은 관계를 모르고 하는 것이므로, 쓰지 말자... 위험하다.
        --> 그리고 웬만하면 이런 상황을 만들지 말자. 
*/

drop table tblStaff; --tblProject (자식테이블)을 먼저 삭제
drop table tblStaff cascade constraints purge; 



-- 자식 테이블 목록을 보여주는 쿼리
SELECT fk.owner, fk.constraint_name , fk.table_name
  FROM all_constraints fk, all_constraints pk
    WHERE fk.R_CONSTRAINT_NAME = pk.CONSTRAINT_NAME
        AND fk.CONSTRAINT_TYPE = 'R'
        AND pk.TABLE_NAME = 'DEPARTMENTS' --대문자
            ORDER BY fk.TABLE_NAME;