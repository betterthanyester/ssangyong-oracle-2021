-- SQL question1(2021-11-10).sql

-- Q1
SELECT * FROM tblcountry;

--Q2
SELECT NAME, capital FROM tblcountry;

--Q3  --- 이름으로 사용하면 오류나는 문자 ([])는 쌍따옴표 붙이면 된다.
SELECT NAME AS "[국가명]", 
    capital AS "[수도명]", 
    population AS "[인구수]", 
    area AS "[면적]", 
    continent AS "[대륙]"  
FROM tblcountry

--Q4
SELECT '국가명:'||NAME||
        ',수도명:'||capital||
        ',인구수:'||population AS 국가정보
FROM tblcountry;




--Q5
--select * from employees;
SELECT first_name ||' '|| last_name AS "[이름]",
        email ||'@gmail.com' AS "[이메일]",
        phone_number AS "[연락처]",
        '$'||salary AS "[급여]" 
FROM employees;

--Q6
SELECT NAME, area 
    FROM tblcountry
        WHERE area <=100;
        
        
--Q7
--select * from tblcountry;

SELECT *
FROM tblcountry
WHERE continent IN ('AS','EU');


--Q8
SELECT * FROM employees;

SELECT first_name||' '||last_name, 
        phone_number
FROM employees
    WHERE job_id = 'IT_PROG';

--Q9
SELECT  first_name||' '||last_name, 
        phone_number,
        hire_date
FROM employees
    WHERE last_name = 'Grant';

--Q10
--테이블 스키마에 대한 이해가 없으면, 조작을 못한다.
--도큐먼트를 보거나 ERD를 봐서 파악해야함.
DESC employees;

SELECT 
    first_name||' '||last_name, 
    salary,
    phone_number
FROM employees
    WHERE manager_id = 120;


--Q11
--select * from employees;
DESC employees;
SELECT  
    first_name||' '||last_name, 
    phone_number,
    email,
    department_id
FROM employees
    WHERE department_id IN (60, 80, 100);



--Q12
SELECT * FROM tblinsa
    WHERE buseo = '기획부';
    
    
--Q13
SELECT 
    NAME, 
    jikwi, 
    tel
FROM tblinsa
    WHERE city = '서울' AND jikwi = '부장';
    
--Q14
SELECT 
    * 
FROM tblinsa
    WHERE (basicpay + sudang >=1500000) AND city = '서울';
    
--Q15
SELECT 
    *
FROM tblinsa 
    WHERE sudang <= 150000 AND jikwi IN ('사원','대리');
    
    