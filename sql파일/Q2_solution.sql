-- Q2_solution

-- Q16

select * from tblInsa;

select
* 
from tblInsa
    where basicpay*12 >= 20000000 and city = '서울' and jikwi in ('과장','부장');
    
--Q17

select 
*
from tblCountry
    where name like '_국';
    
select
*
from tblCountry
    where name like '%국';
    

--Q18
select * from employees;

select
*
from employees
    where phone_number like '515%';


--Q19

select 
*
from employees
    where job_id like 'SA%'; 
    
    
--Q20
select  
*
from employees
    where first_name like '%de%' 
        or first_name like '%De%' 
        or first_name like '%dE%'
        or first_name like '%DE%';
        
--Q21

select * from tblInsa;
SELECT
    *
FROM
    tblinsa
WHERE
    ssn LIKE '%-1%';

--Q22
SELECT
    *
FROM
    tblinsa
WHERE
    ssn LIKE '%-2%';

--Q23
SELECT
    *
FROM
    tblinsa
WHERE
    ssn LIKE '___7%'
    or ssn LIKE '___8%'
    or ssn LIKE '___9%';   
    
    
--Q24
SELECT
    *
FROM
    tblinsa
WHERE
    city in ('서울','인천')
    and name like '김%';
    
--Q25
SELECT
    *
FROM
    tblinsa
WHERE
    buseo in ('영업부','총무부','개발부')
    and jikwi in ('사원','대리')
    and tel like '010%';
    
--Q26
SELECT
    *
FROM
    tblinsa
WHERE
    city in ('서울','경기','인천')
    and ibsadate between '2008-01-01' and '2010-12-31';

--Q27
select * from employees;

SELECT
    *
FROM
    employees
WHERE
    department_id is null;
    
--Q28

SELECT
    distinct job_id
FROM
    employees;
    
--Q29
SELECT
    distinct department_id
FROM
    employees
where
    hire_date between '2002-01-01' and '2004-12-31';

--Q30
SELECT
    employee_id, manager_id, salary
FROM
    employees
where
    salary >= 5000;
    
--Q31
SELECT
    distinct jikwi
FROM
    tblinsa
where
    ssn like '8%';
    
    
--Q32
SELECT
    distinct city
FROM
    tblinsa
where
    sudang > 200000;


--Q33
SELECT
    name, buseo, tel
FROM
    tblinsa
where
    tel is null;
