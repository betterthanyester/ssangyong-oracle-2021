--ex09_numerical_function.sql

/*

숫자 함수(=수학 함수)
- 자바의 Math클래스


round()
    - 반올림 함수
    - number round(컬럼명) : 정수 반환
    - number round(컬럼명, 소수이하 자릿수) : 실수 반환

*/ 

select round(height / weight), height/weight from tblComedian;

select 
    height/weight,
    round(height/weight),
    round(height/weight, 1),
    round(height/weight, 2),
    round(height/weight, 3),
    round(height/weight, 0) -- 그냥 정수, 0 안쓴 것과 결과 동일
from tblComedian;

select round(avg(basicpay)) from tblInsa;

/*

floor(), trunc()
    - 절삭 함수
    - 무조건 내림 함수
    - number floor(컬럼명)
    - number trunc(컬럼명 [,소수이하 자릿수])

*/

select 
    height/weight,
    floor(height/weight),
    trunc(height/weight),
    trunc(height/weight,1),
    trunc(height/weight,2)
from tblComedian;

/*

ceil()
    - 무조건 올림 함수
    - number ceil(컬럼명)

*/

select 
    height/weight,
    round(height/weight),
    floor(height/weight),
    ceil(height/weight)
from tblComedian;

/*

mod()
    - 나머지 함수
    - number mod(피제수, 제수)  -- 피제수 : 나눠지는 수, 제수 : 나누는 수

*/

select 
    mod(height, weight)
from tblComedian;

select 
    mod(10,3), first
from tblComedian;

select
    mod(10,3), name
from tblCountry;

-- dual : 임시 테이블
--      > 테이블과 무관하게 연산결과를 보고 싶을 때 사용
select * from dual;

select
    mod(10,3)
from dual;

--100분 -> 1시간 50분
--100/60 -> 몫(시간)
--100%60 -> 나머지(분)

select 
    floor(100/60) as 시, 
    mod(100,60) as 분
from dual;

select
    abs(10), abs(-10),
    power(2,2),power(2,3),power(2,4),
    sqrt(4), sqrt(16), sqrt(64)
from dual;

