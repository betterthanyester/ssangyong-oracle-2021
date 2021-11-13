--ex10_string_function.sql

/*
문자열 함수

upper(), lower(), initcap()
    - varchar2 upper(컬럼명)   : 대문자로
    - varchar2 lower(컬럼명)   : 소문자로
    - varchar2 initcap(컬럼명) : 첫번째 문자만 대문자로

*/

select first_name, upper(first_name),lower(first_name) from employees;
select initcap('abc') from dual;


--first_name에 'DE'가 포함된 직원
select first_name from employees
where upper(first_name) like '%DE%';


/*

substr()
    - 문자열 추출 함수
    - varchar2 substr(컬럼명, 시작위치, 가져올 문자개수)
    - varchar2 substr(컬럼명, 시작위치) --> 끝까지 가져옴
    
    **SQL은 One-based Index 사용
        : 첨자를 1부터 시작한다. 

*/

select
    title,
    substr(title, 3, 4)
from tblTodo;

select 
    first_name || last_name,
    substr(first_name || last_name, 3,4),
    substr(first_name || last_name, 3)
from employees;

-- 남자 직원 (1900년대생 + 2000년대생)
select count(*) from tblInsa where ssn like '%-1%' or ssn like '%-3%';
select count(*) from tblInsa where substr(ssn,8,1) in ('1','3');
-- 여자직원 (//)
select count(*) from tblInsa where substr(ssn,8,1) in ('2','4');

-- 직원명, 태어난 년도를 가져오시오 -> 모두 1900년대생이라고 가정
select 
    name,
    '19' || substr(ssn,1,2) as birthyear
from tblInsa;


-- 서울에 사는 여직원 중 80년대생 몇 명?
select count(*) from tblInsa
where city = '서울' and substr(ssn,8,1) = '2' and substr(ssn,1,1) = '8';

-- 직원들의 성이 어떤 것들이 있는지?
select 
    distinct(substr(name,1,1))
from tblInsa;

-- 김,이,박,최,정 -> 몇 명?

select
    count(case when substr(name,1,1) = '김' then 1 end) as 김,
    count(case when substr(name,1,1) = '이' then 1 end) as 이,
    count(case when substr(name,1,1) = '박' then 1 end) as 박,
    count(case when substr(name,1,1) = '최' then 1 end) as 최,
    count(case when substr(name,1,1) = '정' then 1 end) as 정,
    count(case when substr(name,1,1) not in ('김','이','박','최','정') then 1 end) as 기타
from tblInsa;

/*

length()
    - 문자열 길이(문자수 반환)
    - number length(컬럼명)

*/

-- 컬럼리스트에서 사용
select name, length(name) from tblCountry;

-- 조건절에서 사용
select name from tblCountry where length(name) > 3;
select name from tblCountry where length(name) between 4 and 6;

select  name from tblCountry where mod(length(name), 2) = 1; -- 국가명 글자수가 홀수인 나라들

-- 정렬에서 사용
select name from tblCountry order by length(name) asc, name asc;

-- 남자 > 여자
select * from tblInsa order by substr(ssn,8,1) asc, ssn asc;

-- substr() + length() + case
select 
    title,
    case
        when length(title) >=8 then substr(title, 1, 8) || '..'
        when length(title) <8 then title
    end
from tblTodo;


/*

instr()
    - 검색 함수 (=indexOf())
    - 검색어의 위치를 반화
    - number instr(컬럼명, 검색어)
    - number instr(컬럼명, 검색어, 시작위치)

*/


select 
    '안녕하세요. 홍길동님',
    instr('안녕하세요. 홍길동님', '홍길동') as c2,
    instr('안녕하세요. 홍길동님', '아무개') as c3,  ---못찾으면 : 최소 인덱스 - 1  을 반환  (SQL은 최소 인덱스 = 1)
    instr('안녕하세요. 홍길동님. 반갑습니다 홍길동님', '홍길동') as c4,  ---첫번째를 찾음
    instr('안녕하세요. 홍길동님. 반갑습니다 홍길동님', '홍길동', 11) as c5
from dual;

select * from tblInsa where tel like '010%';
select * from tblInsa where substr(tel, 1,3) = '010';
select * from tblInsa where instr(tel, '010') = 1;

select * from tblTodo order by instr(title, '하');


/*

lpad(), rpad()
    - left padding, right padding
    - varchar2 lpad(컬럼명, 개수, 문자)
    - varchar2 rpad(컬럼명, 개수, 문자)
    

*/

select 
    'a',
    lpad('a',5,'b'),
    '1',
    lpad('1',3,'0'),
    rpad('a',5,'b')
from dual;
/*

--trim() ltrim() rtrim()
-- varchar2 trim(컬럼명)
*/

select 
    '   홍길동    ',
    trim('   홍길동    '),
    ltrim('   홍길동    '),
    rtrim('   홍길동    ')
from dual;



/*
replace()
    - 문자열 치환
    - varchar2 replace(컬럼명, 찾을 문자열, 바꿀 문자열)

*/

select 
    replace('홍길동', '홍', '김'),
    replace('홍길동', '이', '김')  --바꿀게 없으면 그냥 원본이 리턴됨
from dual;

--직원명, 주민번호, 성별(남자|여자)
select name, ssn, substr(ssn,8,1) from tblInsa;


select 
    name, ssn,
    case
        when substr(ssn, 8,1) = '1' then '남자'
        when substr(ssn, 8,1) = '2' then '여자'
    end
from tblInsa;


select 
    name, ssn,
    case
        when substr(ssn, 8,1) = '1' then '남자'
        when substr(ssn, 8,1) = '2' then '여자'
    end
from tblInsa;



select 
    name, ssn,
    case
        when substr(ssn, 8,1) = '1' then '남자'
        when substr(ssn, 8,1) = '2' then '여자'
    end
from tblInsa;


select 
    name, ssn,
    replace( replace(substr(ssn,8,1) , '1', '남자'),
            '2',
            '여자')        ---안쪽의 replace가 1을 남자로 변경 > 바깥쪽 replace가 속성값이 2인 것들을 여자로 변경
from tblInsa;


select 
    name,
    continent,
    replace(replace(replace(replace( replace(continent, 'AS', '아시아'),'SA','아메리카'), 'EU', '유럽'),'AF','아프리카'),'AU','호주') as 분류
    ,
    case
        when continent = 'AS' then '아시아'
        when continent = 'SA' then '아메리카'
        when continent = 'EU' then '유럽'
        when continent = 'AF' then '아프리카'
        when continent = 'AU' then '호주'
    end as 분류2
from tblCountry;

/*
decode()
    - 문자열 치환
    - replace(), case 유사
        - 조건을 만족하면 바꾼다는 점에서 replace와 유사
        - 조건 만족하지 않으면 null반환한다는 점에서 case-end 와 유사
    - varchar2 decode(컬럼명, 찾을 문자열, 바꿀 문자열, 찾을 문자열, 바꿀 문자열, ...)
    
    
    
*/ 

select decode(substr(ssn,8,1), '1', '남자') from tblInsa; --- 못찾으면 null을 반환 <-> replace는 원본을 반환

select decode(substr(ssn,8,1), '1', '남자', '2', '여자') from tblInsa; --- 못찾으면 null을 반환 <-> replace는 원본을 반환



select 
    continent,
    decode(continent, 'AS', '아시아','SA','아메리카', 'EU', '유럽','AF','아프리카','AU','호주')
from tblCountry;



--decode() 함수가 찾지 못했을 때 null 반환하는 특성이 case문과 유사
--  > case 응용하던 구문에 decode() 사용할 수 있다 (decode가 훨씬 낫다)


select * from tblComedian;
select 
    count(case
        when gender = 'm' then 1
    end),
    count(case
        when gender = 'f' then 1
    end)
from tblComedian;

select 
    count(decode(gender, 'm',1)) as 남자,
    count(decode(gender, 'f',1)) as 여자
from tblComedian;



select * from tbladdressbook;


-- tblInsa. 부장 몇명? 과장 몇명? 대리 몇명? 사원 몇명?   (decode로)

select 
    count(decode(jikwi, '부장',1)) as 부장,
    count(decode(jikwi, '과장',1)) as 과장,
    count(decode(jikwi, '대리',1)) as 대리,
    count(decode(jikwi, '사원',1)) as 사원
from tblInsa;


-- 간부(부장,과장) 몇명? 사원(대리,사원) 몇명?

select 
    count(decode(jikwi, '부장',1)) + count(decode(jikwi, '과장',1)) as 간부,
    count(decode(jikwi, '대리',1)) + count(decode(jikwi, '사원',1)) as 사원
from tblInsa;

select
    count(decode(jikwi, '부장' ,1, '과장', 2)) as 간부,
    count(decode(jikwi, '대리' ,3, '사원', 4)) as 사원
from tblInsa;    




-- 기획부, 영업부, 총무부, 개발부의 각각 평균 급여?

select
    round(avg(decode(buseo, '기획부', basicpay))) as 기획부,
    round(avg(decode(buseo, '영업부', basicpay))) as 영업부,
    round(avg(decode(buseo, '총무부', basicpay))) as 총무부,
    round(avg(decode(buseo, '개발부', basicpay))) as 개발부
from tblInsa;


select * from tblInsa;

-- 남자 직원 가장 나이가 많은 사람이 몇년도 태생? 여자 직원 가장 나이가 어린 사람이 몇년도 태생?

-- varchar2 substr(컬럼명, 시작위치, 가져올 문자개수)

select ssn,substr(ssn,1,2) from tblInsa;
select ssn,substr(ssn,7,2) from tblInsa;

select
    '19' || min(decode(substr(ssn,7,2), '-1', substr(ssn,1,2)))as 남자,
    '19' || max(decode(substr(ssn,7,2), '-2', substr(ssn,1,2)))as 여자
from tblInsa;




-- tblAddressBook. 학생 몇명? 건물주 몇 명?

select * from tblAddressBook;



select
    count(decode(job, '학생' , 1)) as 학생,
    count(decode(job, '건물주' , 1)) as 건물주
from tblAddressBook;



-- 강동구 몇명? 마포구 몇명?
select substr(address, 7,3) from tblAddressBook;
select
    count(decode(substr(address, 7,3), '강동구' , 1)) as 강동구,
    count(decode(substr(address, 7,3), '마포구' , 1)) as 마포구
from tblAddressBook;

select 
    count(case
        when instr(address, '강동구') >0 then 1
        end) as 강동구,
    count(case
        when instr(address, '마포구') >0 then 1
        end) as 마포구
from tblAddressBook;

select 
    count(*) - count(decode(instr(address, '강동구'),0,1)),
    count(*) - count(decode(instr(address, '마포구'),0,1))
from tbladdressbook;



