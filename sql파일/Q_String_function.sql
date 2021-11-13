--Q_String_function

--Q1
select 
    first_name||' '||last_name, length(first_name||' '||last_name) as namelength
from employees
    order by namelength asc;
    
--Q2. 전체 이름 (first_name+last_name)이 가장 긴 사람은 몇글자? 가장 짧은 사람은 몇 글자? 평균 몇 글자?
--      > 컬럼 리스트 > 숫자3개 칼럼

select
    max(length(first_name || last_name)) as maxlength,
    min(length(first_name || last_name)) as minlength,
    round(avg(length(first_name || last_name))) as avglength
from employees;


3. last_name이 4자인 사람들의 first_name 가져오기
    > 컬럼 리스트 > first_name, last_name
    > 정렬(first_name, 오름차순)

select 
    first_name, last_name
from employees
    where length(last_name) =4
    order by length(first_name) asc;


    