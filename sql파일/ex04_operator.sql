--ex04_operator.sql

/*

연산자, Operator

1. 산술 연산자
    -  +, -, *, /
    -  %(없음) -> 함수로 제공 ( mod() )
    
2. 문자열 연산자
    -  +(X) -> || (O)
    
3. 비교 연산자
    - >, >=, <, <=
    - = (자바에서 ==)
    - <> (자바에서 !=)
    - 논리값 반환 > 비교 연산의 결과는 논리값 > ANSI-SQL에는 boolean이 없다.
        > 결과를 눈에 보이게 표현 불가능 > 결과셋 포함 불가능 (테이블에 저장 불가능)
        > 컬럼 리스트에서 사용 불가
        > 조건에만 사용!
*/

-- ORA-00923: FROM keyword not found where expected
select 10>5 from book;

select * from book where price > 7000;


/*
4. 논리 연산자
- and(&&), or(||), not(!)
- 컬럼 리스트에서 사용 불가
- 조건에서 사용

*/


select * from book where price > 7000 and price < 10000;


/*
5. 대입 연산자
    -  = 
    - 컬럼 = 값
    - 복합 대입 연산자 없음 (+= 등...)
    - insert, update문에서만 주로 사용


6. 3항 연산자
    - 없음
    - 제어문 없음
    
7. 증감 연산자
    - 없음
    
8. SQL 연산자
    - 자바 : instanceof, typeof 등...
    - SQL : in, between, like, is 등..
            -> 일반 구문(절)로 보는 사람도 있고, 연산자로 보는 사람도 있다.
    
*/

select * from book;
select bookname, price;

-- 모든 도서 정가 10% 할인
-- 결과 테이블을 스키마(컬럼 구성) -> 컬럼명

select bookname, price, price*0.9 from book;

-- ** 컬럼명의 별칭(Alias) 만들기
-- 컬럼명 as 별명

select bookname as 제목, price from book;
select bookname as 제목, price as 가격 from book; -- 지금 select할 때만 바꾼거임. 원본은 그대로임
select bookname as 제목, price as 가격, price * 0.9 as 할인가격 
from book;

-- 식별자에 공백을 넣으면 안됨
-- ORA-00923: FROM keyword not found where expected
select bookname as 책 제목 from book;

-- 안됨
-- ORA-00923: FROM keyword not found where expected
select bookname as 10+20+30 from book;

-- 예약어도 안됨
-- ORA-00923: FROM keyword not found where expected
select bookname as select from book;

/*
알려주긴 하지만 쓰지 말것! (반드시 해당 별명을 써야 하는 경우...)
        > 쌍따옴표 사용 
        > escape 시킴
        > 의미없게 만든 식별자
*/              
select bookname as "책 제목" from book;
select bookname as "10+20+30" from book;
select bookname as "select" from book;

-- 결론
--- -> 별칭 : 영어 + 숫자 + _ 만 사용!
