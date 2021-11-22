--ex20_join.sql\

/*

관계형 데이터베이스 시스템이 지양하는 것들
    1. 테이블에 기본키가 없는 상태
    2. null이 많은 상태 
        > 공간 낭비...
    3. 데이터가 중복되는 상태 > 공간낭비 + 관리 곤란...
    4. 하나의 속성값(셀)이 원자값이 아닌 상태
        > 더이상 쪼개지지 않는 값을 가져야 한다.

*/


--테이블 관계
--상황] 직원(번호(PK), 직원명, 급여, 거주지, 담당프로젝트명)

create table tblStaff (

    seq number primary key,         --직원번호(PK)
    name varchar2(30) not null,     -- 직원명
    salary number not null,         -- 급여
    address varchar2(300) not null, --거주지
    project varchar2(300) null      --담당프로젝트

);

insert into tblstaff(seq,name,salary, address, project)
    values (1,'홍길동',300,'서울시','홍콩 수출');
insert into tblstaff(seq,name,salary, address, project)
    values (2,'아무개',250,'인천시','TV 광고');
insert into tblstaff(seq,name,salary, address, project)
    values (3,'하하하',350,'의정부시','매출 분석');
    
    
-- 3. 데이터가 중복되는 상태 > 공간낭비 + 관리 곤란...
-- '홍길동'에게 담당프로젝트 1건 추가하기

insert into tblstaff(seq,name,salary, address, project)
    values (4,'홍길동',300,'서울시','고객 관리');
    
    -- 이렇게 넣으면, 수정할 때 또는 삭제할 때 관련 튜플 다 해줘야 하는 문제...



--4. 하나의 속성값(셀)이 원자값이 아닌 상태 > 더이상 쪼개지지 않는 값을 가져야 한다.
    
-- '호호호' 직원 추가 + '게시판 관리. 회원 응대'

insert into tblstaff(seq,name,salary, address, project)
    values (5,'호호호',250,'서울시','게시판 관리, 회원 응대');
   
-- 'TV 광고' 당당자 호출
select * from tblStaff where project = 'TV 광고';


-- '회원 응대' 당당자 호출
select * from tblstaff where project = '회원 응대';
select * from tblstaff where instr(project, '회원 응대')>0 ; -- 4번 원칙을 여겨서 발생하는 번거로운 문제

-- 'TV 광고' > 'SNS 광고'
update tblstaff set project = 'SNS 광고' where seq =2;
update tblstaff set project = 'SNS 광고' where seq =(select seq from tblstaff where project = 'TV 광고' ); -- 이렇게 짜면 굳이 확인안해봐도 됨

-- '회원 응대' > '고객 응대'
update tblstaff set project = '고객 응대' where seq = 5; -- "게시판 관리, 회원 응대" 전체를 바꾸므로, 게시판 관리가 날라가버림
                                                        -- 4번 원칙을 여겨서 발생하는 번거로운 문제

    
select * from tblstaff;



--------------------------------문제점 해결하기

drop table tblstaff;



create table tblStaff (

    seq number primary key,         --직원번호(PK)
    name varchar2(30) not null,     -- 직원명
    salary number not null,         -- 급여
    address varchar2(300) not null --거주지

);

drop table tblproject;

create table tblproject (
    seq number primary key,             --프로젝트번호(PK)
    projectname varchar2(300) not null, --프로젝트명
    --staff_seq number not null           --담당직원번호
    staff_seq number not null references tblstaff(seq)    --담당직원번호(FK) 외래키(참조키)
);


insert into tblstaff(seq, name, salary, address) values (1, '홍길동',300,'서울시');

insert into tblstaff(seq, name, salary, address) values (2, '아무개',250,'인천시');

insert into tblstaff(seq, name, salary, address) values (3, '하하하',350,'의정부시');

insert into tblproject (seq, projectname, staff_seq) values (1, '홍콩 수출', 1);

insert into tblproject (seq, projectname, staff_seq) values (2, 'TV 광고', 2);
insert into tblproject (seq, projectname, staff_seq) values (3, '매출 분석', 3);
insert into tblproject (seq, projectname, staff_seq) values (4, '노조 협상', 1);
insert into tblproject (seq, projectname, staff_seq) values (5, '대리점 분양', 3);



-- A. 신입 사원 입사 > 신규 프로젝트 담당
-- A.1 신입 사원 추가 : 잘됨
insert into tblstaff (seq, name, salary, address) values (4, '호호호',200,'성남시');

-- A.2 신규 프로젝트 추가 : 잘됨
insert into tblproject (seq, projectname, staff_seq) values (6, '자재 매입', 4);

-- A.3 신규 프로젝트 추가
--      > 오류
--      > 5번 직원이 없음. 존재하는 직원번호 적어야 하는데, 없는 직원을 적어버림
insert into tblproject (seq, projectname, staff_seq) values (7, '고겍 유치', 5);

    -- 당당자 찾으면 : null 나옴
select * from tblstaff
    where seq = (select staff_seq from tblproject where projectname = '고객 유치');


-- B. '홍길동' 퇴사 : 문제 있음 (참조하는 데이터들에서 문제가 발생)
-- B.1 '홍길동' 삭제
delete from tblstaff where seq = 1;

-- B.2 '홍길동' 퇴사 : 문제 없음
--        > 퇴사 전에 위임
update tblproject set staff_seq = 2 where staff_seq = 1;
--        > 퇴사
delete from tblstaff where seq = 1;


---------------외래키의 도입---------------------
---외래키는 관계형 데이터베이스에서 일종의 '안전장치'
---부모 테이블의 기본키를 자식테이블이 외래키로 참조하는 상황 : 90%에 해당하는 케이스----
-- 생성 순서 : 부모 테이블 -> 자식 테이블
-- 삭제 순서 : 자식 테이블 -> 부모 테이블



 

drop table tblstaff;


-- 부모 테이블
create table tblStaff (

    seq number primary key,         --직원번호(PK)
    name varchar2(30) not null,     -- 직원명
    salary number not null,         -- 급여
    address varchar2(300) not null --거주지

);


drop table tblproject;


-- 자식 테이블
create table tblproject (
    seq number primary key,             --프로젝트번호(PK)
    projectname varchar2(300) not null, --프로젝트명
    --staff_seq number not null           --담당직원번호
    staff_seq number not null references tblstaff(seq)    --담당직원번호(FK) 외래키(참조키)
);






insert into tblstaff(seq, name, salary, address) values (1, '홍길동',300,'서울시');
insert into tblstaff(seq, name, salary, address) values (2, '아무개',250,'인천시');
insert into tblstaff(seq, name, salary, address) values (3, '하하하',350,'의정부시');

insert into tblproject (seq, projectname, staff_seq) values (1, '홍콩 수출', 1);
insert into tblproject (seq, projectname, staff_seq) values (2, 'TV 광고', 2);
insert into tblproject (seq, projectname, staff_seq) values (3, '매출 분석', 3);
insert into tblproject (seq, projectname, staff_seq) values (4, '노조 협상', 1);
insert into tblproject (seq, projectname, staff_seq) values (5, '대리점 분양', 3);



-- A. 신입 사원 입사 > 신규 프로젝트 담당
-- A.1 신입 사원 추가 : 잘됨
insert into tblstaff (seq, name, salary, address) values (4, '호호호',200,'성남시');

-- A.2 신규 프로젝트 추가 : 잘됨
insert into tblproject (seq, projectname, staff_seq) values (6, '자재 매입', 4);

-- A.3 신규 프로젝트 추가
--      > 오류 -- ORA-02291: integrity constraint (HR.SYS_C007172) violated - parent key not found
--                            > 무결성 제약 위반 : 부모 키를 찾을 수 없음
--                            > 아까와는 달리, 오라클이 알아서 멈춰버림
insert into tblproject (seq, projectname, staff_seq) values (7, '고겍 유치', 5);


-- B. '홍길동' 퇴사 : 문제 있음 (참조하는 데이터들에서 문제가 발생)
-- B.1 '홍길동' 삭제
--        > 오류 --ORA-02292: integrity constraint (HR.SYS_C007172) violated - child record found
--                          > 무결성 제약 위반 : 자식 레코드가 있음
--                          > 역시 아까와는 달리, 오라클이 알아서 멈춰버림

delete from tblstaff where seq = 1;

-- B.2 '홍길동' 퇴사 : 문제 없음
--        > 퇴사 전에 위임
update tblproject set staff_seq = 2 where staff_seq = 1;
--        > 퇴사
delete from tblstaff where seq = 1;




select * from tblstaff;
select * from tblproject;


-----------------------------------------------------------------
-----------------------------------------------------------------

-- 고객 테이블
create table tblCustomer (
    seq number primary key,                 --고객번호(PK)
    name varchar2(30) not null,             --고객명
    tel varchar2(15) not null,              --연락처
    address varchar2(100) not null          --주소
    --sseq number null reference tblSales(seq)     --참조키(판매번호)
);

-- 판매내역 테이블
create table tblSales (
    seq number primary key,                         --판매번호(PK)
    item varchar2(50) not null,                     --제품명
    qty number not null,                            --수량
    regdate date default sysdate not null,          --판매날짜
    cseq number not null references tblCustomer(seq)       --고객번호(FK)
);



-----------------------------------------
-------------------비디오 대여점

create table tblGenre (
    seq number primary key,                         --장르번호(PK)
    name varchar2(30) not null,                     --장르명
    price number not null,                          --대여가격
    period number not null                          --대여기간(일)
);

-- 비디오 테이블
create table tblVideo (
    seq number primary key,                         --비디오번호(PK)
    name varchar2(100) not null,                    --제목
    qty number not null,                            --보유 수량
    company varchar2(50) null,                      --제작사
    director varchar2(50) null,                     --감독
    major varchar2(50) null,                        --주연배우
    genre number not null references tblGenre(seq)  --장르(FK)
);

-- 고객 테이블
create table tblMember (
    seq number primary key,                         --회원번호(PK)
    name varchar2(30) not null,                     --회원명
    grade number(1) not null,                       --회원등급(1,2,3)
    byear number(4) not null,                       --생년
    tel varchar2(15) not null,                      --연락처
    address varchar2(300) null,                 --주소
    money number not null                           --예치금
);

-- 대여 테이블
create table tblRent (
    seq number primary key,                                 --대여번호(PK)
    member number not null references tblMember(seq),       --회원번호(FK)
    video number not null references tblVideo(seq),         --비디오번호(FK)
    rentdate date default sysdate not null,                 --대여시각
    retdate date null,                                      --반납시각
    remark varchar2(500) null                               --비고
);



-- 장르 데이터
INSERT INTO tblGenre VALUES (1, '액션',1500,2);
INSERT INTO tblGenre VALUES (2, '에로',1000,1);
INSERT INTO tblGenre VALUES (3, '어린이',1000,3);
INSERT INTO tblGenre VALUES (4, '코미디',2000,2);
INSERT INTO tblGenre VALUES (5, '멜로',2000,1);
INSERT INTO tblGenre VALUES (6, '기타',1800,2);




-- 비디오 데이터
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (1, '영구와 땡칠이',5,'영구필름','심영래','땡칠이',3);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (2, '어쭈구리',5,'에로 프로덕션','김감독','박에로',2);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (3, '털미네이터',3,'파라마운트','James','John',1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (4, '육복성',3,'대만영화사','홍군보','생룡',4);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (5, '뽀뽀할까요',6,'뽀뽀사','박감독','최지후',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (6, '우정과 영혼',2,'파라마운트','James','Mike',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (7, '주라기 유원지',1,NULL,NULL,NULL,1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (8, '타이거 킹',4,'Walt','Kebin','Tiger',3);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (9, '텔미 에브리 딩',10,'영구필름','강감독','심으나',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (10, '동무',7,'부산필름','박감독','장동근',1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (11, '공동경쟁구역',2,'뽀뽀사','박감독','이병흔',1);




-- 회원 데이터
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (1, '김유신',1,1970,'123-4567','12-3번지 301호',10000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (2, '강감찬',1,1978,'111-1111','777-2번지 101호',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (3, '유관순',1,1978,'222-2222','86-9번지',20000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (4, '이율곡',1,1982,'333-3333',NULL,15000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (5, '신숙주',1,1988,'444-4444','조선 APT 1012호',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (6, '안중근',1,1981,'555-5555','대한빌라 102호',1000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (7, '윤봉길',1,1981,'666-6666','12-1번지',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (8, '이순신',1,1981,'777-7777',NULL,1500);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (9, '김부식',1,1981,'888-8888','73-6번지',-1000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (10, '박지원',1,1981,'999-9999','조선 APT 902호',1200);



-- 대여 데이터

INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (1, 1,1,'2007-01-01',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (2, 2,2,'2007-02-02','2001-02-03');
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (3, 3,3,'2007-02-03',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (4, 4,3,'2007-02-04','2001-02-08');
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (5, 5,5,'2007-02-05',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (6, 1,2,'2007-02-10',NULL);


select * from tblGenre;
select * from tblVideo;
select * from tblMember;
select * from tblRent;



/*


조인, JOIN
    - (서로 관계를 맺은) 2개(1개) 이상의 테이블의 내용을 가져와서 1개의 결과셋을 만드는 작업
    
    
조인의 종류
    1. 단순 조인, CROSS JOIN, 카티션곱(데카르트곱)
    2. 내부 조인, INNER JOIN ********
    3. 외부 조인, OUTER JOIN ********
    4. 셀프 조인, SELF JOIN
    5. 전체 외부 조인, FULL OUTER JOIN


*/

--1. 단순 조인, CROSS JOIN, 카티션곱(데카르트곱)
--     > 쓸모 없다 : 가치가 있는 행과 가치가 없는 행이 뒤섞여 있기 때문
--            > 기본키와 외래키가 다른데도 엮여 있는 행의 경우, 쓸모가 없음
--            > 이론적으로는 존재하지만, 현실에서는 잘 안쓰임
--            > 다른 조인의 베이스가 되므로 배움
--     > 결과셋 행의 개수 : 튜플 개수의 곱 = 27개
--      > 결과셋 컬럼 개수 : 속성 개수의 합 = 9개
select * from tblcustomer;  --부모 : 3명 , 속성 4게
select * from tblsales;     --자식 : 9건 , 속성 5개


select * from tblcustomer cross join tblsales; -- ANSI-SQL 방식(추천)
--tblcustomer cross join tblsales 이거 하나가 테이블임

select * from tblCustomer, tblSales;  -- Oracle 방식
    

-- **별칭(Alias) 붙이는 방식
--  1. 컬럼 별칭
--      컬럼명 as 별칭
--  2.테이블 별칭
--      테이블명 별칭

select name, buseo. jikwi from tblInsa; -- 모든걸 생략 했을때
select hr.tblInsa.name, hr.tblInsa.buseo, hr.tblInsa.jikwi from hr.tblInsa; -- 모든걸 생략 안했을떄 (테이블의 소유주, 테이블 명시)

-- 테이블 별칭 쓰는 이유 : 테이블 명시해야 되는 상황에서 코딩량을 줄이기 위해
--                      > 보통은 가독성보다는, 편리성을 위해 매우 짧게 지음
select a.name, a.buseo,a.jikwi --2(이게 from보다 뒤이기 때문에, 테이블 alias 인식 가능)
from tblInsa a;  --1(실행순서)


--고객번호
--ORA-00918: column ambiguously defined
--크로스 조인된 테이블에 seq가 여러개이기 때문
--join을 하면, 거의 많은 경우 생기는 문제
--컬럼 앞에 테이블 이름을 명시해야 함.

select seq from tblcustomer cross join tblsales; -- ANSI-SQL 방식(추천)
select tblcustomer.seq from tblcustomer cross join tblsales;
select tblsales.seq from tblcustomer cross join tblsales; 
select c.seq from tblcustomer c cross join tblsales s; -- 별칭 붙이는 이유
select s.seq from tblcustomer c cross join tblsales s; -- 별칭 붙이는 이유
select tblcustomer.seq from tblcustomer c cross join tblsales s; -- 별칭 붙이고 원본이름 쓰면? 에러남 : ORA-00904: "TBLCUSTOMER"."SEQ": invalid identifier
                                                                -- 별칭이 아니라, '개명'이다...


select * from (select name, buseo from tblInsa);
select * from (select name as 이름, buseo from tblInsa); --컬럼 이름이 바뀜
select 이름 from (select name as 이름, buseo from tblInsa); --OK
select name from (select name as 이름, buseo from tblInsa); --ORA-00904: "NAME": invalid identifier
                                                            --위와 동일한 맥락 : '개명'이다




select count(*), sum(basicpay), 1+1 from tblinsa;

select * from (select count(*), sum(basicpay), 1+1 from tblinsa);
select count(*) from (select count(*), sum(basicpay), 1+1 from tblinsa); --별칭을 반드시 써야 되는 경우
                                                                        --컬럼명이 함수명인 경우
                                                                        --불러오려고 함수명을 쓰면 컬럼명을 지칭하는 게 아니라 함수 실행이 되버림
select cnt from (select count(*) as cnt, sum(basicpay) as total, 1+1 as const from tblinsa);
select total from (select count(*) as cnt, sum(basicpay) as total, 1+1 as const from tblinsa);
select const from (select count(*) as cnt, sum(basicpay) as total, 1+1 as const from tblinsa);


/*
2. 내부 조인, INNER JOIN *******
    - 단순 조인에서 유효한 레코드만 추출한 조인
          > 카티션 곱의 결과에서 올바른 것만 추출

    - 문법
        - SELECT 컬럼리스트 FROM 테이블A CROSS JOIN 테이블B;
        - SELECT 컬럼리스트 FROM 테이블A INNER JOIN 테이블B ON 테이블A.PK = 테이블B.FK;
        -   SELECT 컬럼리스트 
            FROM 테이블A 
                INNER JOIN 테이블B 
                    ON 테이블A.PK = 테이블B.FK; -- WHERE절과 유사

        - 오라클 표현 (위는 ANSI-SQL)
         :  SELECT 컬럼리스트 
            FROM 테이블A, 테이블B 
                WHERE 테이블A.PK = 테이블B.FK; 
      
    -- 내부 조인의 결과셋 레코드 수?  > 자식 테이블 레코드 수가 된다.
*/
-- 고객의 정보(tblcustomer)와 판매내역(
select * from tblcustomer c inner join tblSales s on c.seq = s.seq;

-- 고객명, 물품명, 수량
-- 테이블명 다 붙여주는게 편함
-- "테이블명."
-- 프로그램이 seq_1 등으로 구별해서 표시해주기도 하는데, 이게 구별된 게 아님!
select c.seq, s.seq, c.name, s.item, s.qty 
from tblcustomer c inner join tblsales s
    on c.seq = s.seq;

select * from (select c.seq, s.seq, c.name, s.item, s.qty 
from tblcustomer c inner join tblsales s
    on c.seq = s.seq);    --ORA-00918: column ambiguously defined    
                            -- seq이 구별이 안되기 때문
                            -- alias 줘야 함

select * from (select c.seq as seq1, s.seq as seq2, c.name, s.item, s.qty 
from tblcustomer c inner join tblsales s
    on c.seq = s.seq);
    
    
select * from tblGenre;  --부모(seq) 
select * from tblvideo; --자식(genre)

--비디오 제목(tblvideo)와 그 비디오의 대여가격(tblGenre)을 가져오시오.
    
select * from tblGenre g inner join tblVideo v 
    on g.seq = v.genre;          --웬만하면 alias 붙이는 게 편함
    
-- inner join 으로 푸는 방식
select v.name, g.price from tblGenre g inner join tblVideo v 
    on g.seq = v.genre;          --웬만하면 alias 붙이는 게 편함

-- 상관 서브쿼리로 푸는 방식
    -- 메인 테이블의 변수를 내부 서브쿼리에서 가져와서 쓸 수 있음
        --: 마치 서브쿼리는 지역메서드, 메인 테이블은 클래스 변수
    -- 자식 테이블을 메인으로 두거나
    -- 메인 작업 테이블을 메인으로 두거나
select name, 가격 from tblVideo;
select name, (select price from tblGenre where seq = tblVideo.genre) as price from tblVideo;
-- 그니까 이게 




----------------------------


select * from tblstaff;
select * from tblProject;

-- 직원명(tblstaff)과 담당 프로젝트명(tblProject)를 가져오시오.

select * from tblStaff s inner join tblProject p on s.seq =p.staff_seq;

select s.name, p.projectname from tblStaff s inner join tblProject p on s.seq =p.staff_seq;

--inner join으로 푸는 방식
select name, projectname from tblStaff s inner join tblProject p on s.seq =p.staff_seq; -- 여기선 사실 컬럼명 겹치는 게 없어서 alias. 안써도 되는데, 그냥 습관처럼 하자.

--상관 서브쿼리로 푸는 방식
select name, (select projectname from tblProject where staff_seq = s.seq) from tblStaff s; --single-row subquery returns more than one row : 한사람이 두개 이상의 프로젝트를 하고 있는 경우가 있어서
    -- 위에꺼는 안될때도 있음. 그냥 아래처럼 자식 테이블을 메인으로 한다고 생각하자.
select projectname, (select name from tblStaff where seq = p.staff_seq) from tblproject p; --tblStaff의 seq는 기본키이므로 위에서처럼 여러개가 나올 수 없고, 단일값이 나오므로 오류가 나지 않음


-----------------

-- 하면 안되는 조인
--      > 데이터가 관계가 있지 않으면 하지 말 것!!
select * from tblCustomer c
    inner join tblGenre g
        on c.seq = g.seq;

--테이블 조인 순서는 상관없으나, 강사는 부모테이블 먼저 자식테이블 뒤에 쓰는 방식을 선호



-- 2개의 테이블을 조인
select * from tblGenre g
    inner join tblVideo v
        on g.seq = v.genre;

--3개의 테이블을 조인 : tblGenre inner join tblVideo inner join tblRent 
--                  : tblGenre + tblVideo + tblRent

select * from tblGenre g
    inner join tblVideo v
        on g.seq = v.genre        -- (연결) 기본키 - 해당 기본키를 참조하는 외래키
            inner join tblRent r 
                on v.seq = r.video;  -- (연결) 기본키 - 해당 기본키를 참조하는 외래키

--4개의 테이블을 조인 : tblGenre inner join tblVideo inner join tblRent 
--                  : tblGenre + tblVideo + tblRent

select * from tblGenre g
    inner join tblVideo v
        on g.seq = v.genre        -- (연결) 기본키 - 해당 기본키를 참조하는 외래키
            inner join tblRent r 
                on v.seq = r.video  -- (연결) 기본키 - 해당 기본키를 참조하는 외래키
                    inner join tblMember m
                        on m.seq = r.member;


-- 어떤 회원? 어떤 비디오? 언제 대여? 가격?


select 
    m.name as mname,
    v.name as vname,
    r.rentdate,
    g.price
from tblGenre g
    inner join tblVideo v
        on g.seq = v.genre        -- (연결) 기본키 - 해당 기본키를 참조하는 외래키
            inner join tblRent r 
                on v.seq = r.video  -- (연결) 기본키 - 해당 기본키를 참조하는 외래키
                    inner join tblMember m
                        on m.seq = r.member;


-- 내부 조인의 결과셋 레코드 수?  > 자식 테이블 레코드 수가 된다.
--          > 위의 예에선, tblRent의 레코드 수 (6개)
--          > 이건 ERD 보고 판단해야 함. join 순서가 아니라



-- 강사는 기본키를 일률적으로 seq으로 정해서, 누가 부모인지 쉽게 알아보게 하는 방식
-- 아래는 기본키를 테이블명_id로 하는 방식


----------------------hr.erd 참고---
select * from jobs;

select e.last_name||' '||e.first_name as name, 
        j.job_title,
        d.department_name,
        l.city,
        c.country_name,
        r.region_name
from employees e
    inner join jobs j
        on e.job_id = j.job_id
            inner join departments d
                on d.department_id = e.department_id
                    inner join locations l
                        on l.location_id = d.location_id
                            inner join countries c
                                on c.country_id = l.country_id
                                    inner join regions r
                                        on r.region_id = c.region_id;
                                        
                                        
                                        
/*
3. 외부 조인, OUTER JOIN *******
    - 내부 조인 + 조인의 결과셋에 포함되지 못한 부모 테이블의 나머지 레코드
    - SELECT 컬럼리스트 FROM 테이블A (LEFT|RIGHT) OUTER JOIN 테이블B ON 테이블A.컬럼 = 테이블B.컬럼
(비교 : SELECT  컬럼리스트 FROM 테이블A            INNER JOIN 테이블B ON 테이블A.컬럼 = 테이블B.컬럼 -> INNER JOIN)
    - 방향 (LEFT/RIGHT)는 부모 테이블을 가리키는 방향으로 작성

*/                                        
-- 물건을 한번이라도 구매한 이력이 있는 고객과 판매 정보를 같이 가져오시오 
select * from tblCustomer c
    inner join tblSales s
        on c.seq = s.cseq;
        

insert into tblCustomer values (4, '호호호', '010-1234-5678', '서울시');
select * from tblcustomer;

-- 구매 이력과 무관하게 모든 고객과 판매 정보를 같이 가져오시오
        
select * from tblCustomer c
    left outer join tblSales s
        on c.seq = s.cseq;
        
-- tblVideo, tblRent
--대여가 한번이라도 된 비디오와 그 대여 내역을 가져오시오.
select * from tblVideo v
    inner join tblRent r
        on v.seq = r.video;

-- 대여와 상관없이 모든 비디오와 그 대여 내역을 가져오시오.
select * from tblVideo v
    left outer join tblRent r
        on v.seq = r.video;

-- tblMember + tblRent
--대여를 한번이라도 한 회원과 그 대여 내역을 가져오시오.
select * from tblMember m
    inner join tblRent r
        on m.seq = r.member;                                        
                  
--대여와 상관없이 모든 회원과 그 대여 내역을 가져오시오.
select * from tblMember m
    left outer join tblRent r
        on m.seq = r.member; 
                      
--대여를 한번이라도 한 회원의 이름을 가져오시오.
select distinct(m.name) from tblMember m
    inner join tblRent r
        on m.seq = r.member;         
        
--대여를 한번이라도 한 회원의 수
select count(distinct(name)) from tblMember m
    inner join tblRent r
        on m.seq = r.member;  
        
--대여를 한번이라도 한 회원의 이름과 대여 횟수를 가져오시오.
select m.name, count(*) from tblMember m
    inner join tblRent r
        on m.seq = r.member
            group by m.name;   --from tblMember m inner join tblRent r on m.seq = r.member  : 이거 전체가 테이블이라고 생각
        
--모든 회원의 이름과 대여 횟수를 가져오시오. 
select m.name, count(r.seq) from tblMember m
    left outer join tblRent r
        on m.seq = r.member
                group by m.name;
                
-- 직원명 + 부서명
select * from employees;
select * from departments;

select 
    first_name || ' ' || last_name as name,
    department_name
    from employees e
        inner join departments d
            on e.department_id = d.department_id;

--인라인뷰 
select 
    first_name || ' ' || last_name as name,
    department_name
    from (select department_id, first_name, last_name from employees) e
        inner join (select department_id, department_name from departments) d
            on e.department_id = d.department_id; 
            
--뷰를 사용하는 방식     
create or replace view vmA
as
select department_id, first_name, last_name from employees;
            
create or replace view vmB
as
select department_id, department_name from departments;    

select 
    first_name || ' ' || last_name as name,
    department_name
    from vmA e
        inner join vmB d
            on e.department_id = d.department_id; 
            
--------            
create or replace view vmC
as
select 
    first_name || ' ' || last_name as name,
    department_name
    from (select department_id, first_name, last_name from employees) e
        inner join (select department_id, department_name from departments) d
            on e.department_id = d.department_id;

select * from vmC;
            
/*
4. 셀프 조인, SELF JOIM
    - 1개의 테이블을 사용해서 조인
    - 테이블이 스스로 관계를 맺는 경우에 사용
    - 셀프조인 + 내부조인
    - 셀프조인 + 외부조인

*/

-- 직원 테이블
create table tblSelf (
    seq number primary key,                     --직원번호(PK)
    name varchar2(30) not null,                 --직원명
    department varchar2(50) null,               --부서명
    super number null references tblSelf(seq)   --자기참조, 상사번호(FK)
      
);

insert into tblSelf values (1, '홍사장', null,null );
insert into tblSelf values (2, '김부장', '영업부', 1);
insert into tblSelf values (3, '이과장', '영업부', 2);
insert into tblSelf values (4, '정대리', '영업부', 3);
insert into tblSelf values (5, '최사원', '영업부', 4);

insert into tblSelf values (6, '박부장', '개발부', 1);
insert into tblSelf values (7, '하과장', '개발부', 6);

select * from tblSelf;


-- 직원 명단을 가져오시오.(단, 상사의 이름도 같이)
    --방법 1: join
--select * from 직원테이블 outer join 상사테이블 on 직원테이블.super = 상사테이블. seq;
--근데 직원테이블 = 상사테이블 = tblSelf

select 
    a.name as "직원명",
    b.name as "상사명"
    from tblSelf a 
        left outer join tblSelf b
            on a.super = b.seq
                order by a.seq asc;
        
        
    --방법 2: subquery
select * from tblSelf;

            --  상관성 쿼리로 풀면 됨
select 
    name as "직원명",
    (select name from tblSelf where a.super = seq) as "상사명" --바깥테이블의 상사번호 = 안쪽 테이블의 직원번호
from tblSelf a;                 

/*
5. 전체 외부조인 (FULL OUTER JOIN)
    - 외부조인인데, 부모테이블뿐만 아니라 자식테이블에서도 누락된 컬럼을 살리는 것.
    - 쓸 일이 많이 없다.

*/


