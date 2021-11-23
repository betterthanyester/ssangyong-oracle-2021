    -- A. 정렬
select * from tblAddressbook order by name asc;
    -- B. 서브쿼리 + rownum
select a.*, rownum as rnum from (select * from tblAddressbook order by name asc) a;
    -- C. 서브쿼리 + 조건
select * from (select a.*, rownum as rnum from (select * from tblAddressbook order by name asc) a)
    where rnum between 21 and 40;    


-- 1. tblInsa. 남자 급여(기본급+수당)을 (내림차순)순위대로 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)
select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc;
select a.*, rownum as rnum
    from (select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc) a;

select rnum, name, buseo, jikwi, basicpay+sudang 
    from (select a.*, rownum as rnum from (select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc) a);


-- 2. tblInsa. 여자 급여(기본급+수당)을 (오름차순)순위대로 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)
select rnum, name, buseo, jikwi, basicpay+sudang 
    from (select a.*, rownum as rnum from (select * from tblInsa where ssn like '%-2%' order by (basicpay+sudang) desc) a)
        ;


-- 3. tblInsa. 여자 인원수가 (가장 많은 부서 및 인원수) 가져오시오.
select buseo, count(*) as people from tblInsa where ssn like '%-2%' group by buseo order by count(*) desc;

select buseo, people
    from (select a.*, rownum as rnum from (select buseo, count(*) as people from tblInsa where ssn like '%-2%' group by buseo order by count(*) desc) a)
        where people = (select max(people) from (select buseo, count(*) as people from tblInsa where ssn like '%-2%' group by buseo order by count(*) desc))
    ;

-- 4. tblInsa. 지역별 인원수 (내림차순)순위를 가져오시오.(city, 인원수)
select * from tblInsa;
select city, count(*) as people from tblInsa group by city order by count(*) desc;

select rnum, city, people 
    from (select a.*, rownum as rnum from (select city, count(*) as people from tblInsa group by city order by count(*) desc) a)
        ;

-- 5. tblInsa. 부서별 인원수가 가장 많은 부서 및원수 출력.
select buseo, count(*) as people from tblInsa group by buseo order by count(*) desc;

select buseo, people
    from (select a.*, rownum as rnum from (select buseo, count(*) as people from tblInsa group by buseo order by count(*) desc) a)
        where people = (select max(people) from (select buseo, count(*) as people from tblInsa group by buseo order by count(*) desc))
    ;


--6. tblInsa. 남자 급여(기본급+수당)을 (내림차순) 3~5등까지 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)
select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc;
select a.*, rownum as rnum
    from (select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc) a;

select rnum, name, buseo, jikwi, basicpay+sudang 
    from (select a.*, rownum as rnum from (select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc) a)
        where rnum between 1 and 3;


-- 7. tblInsa. 입사일이 빠른 순서로 5순위까지만 가져오시오.
select * from tblInsa order by ibsadate asc;

select * 
    from (select a.*, rownum as rnum from (select * from tblInsa order by ibsadate asc) a)
        where rnum between 1 and 5;

-- 8. tblhousekeeping. 지출 내역(가격 * 수량) 중 가장 많은 금액을 지출한 내역 3가지를 가져오시오.
select * from tblhousekeeping order by price*qty desc;

select * 
    from (select a.*, rownum as rnum from (select * from tblhousekeeping order by price*qty desc) a)
        where rnum between 1 and 3;
--9. tblinsa. 평균 급여 2위인 부서에 속한 직원들을 가져오시오.

select * from tblInsa;
select buseo, avg(basicpay+sudang) as averagePay from tblInsa group by buseo order by avg(basicpay+sudang) desc;

select buseo from (select a.*, rownum as rnum from (select buseo, avg(basicpay+sudang) as averagePay from tblInsa group by buseo order by avg(basicpay+sudang) desc) a) where rnum =2;

select * from tblinsa 
    where buseo = (select buseo from (select a.*, rownum as rnum from (select buseo, avg(basicpay+sudang) as averagePay from tblInsa group by buseo order by avg(basicpay+sudang) desc) a) where rnum =2);

-- 10. tbltodo. 등록 후 가장 빠르게 완료한 할일을 순서대로 5개 가져오시오.

select * from tbltodo where completedate is not null order by completedate asc;

select * 
    from (select a.*, rownum as rnum from (select * from tbltodo where completedate is not null order by completedate asc) a)
        where rnum between 1 and 5;

-- 11. tblinsa. 남자 직원 중에서 급여를 3번째로 많이 받는 직원과 9번째로 많이 받는 직원의 급여 차액은 얼마인가?
select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc;

select (select basicpay+sudang 
    from (select a.*, rownum as rnum from (select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc) a)
        where rnum = 3)-(select basicpay+sudang 
    from (select a.*, rownum as rnum from (select * from tblInsa where ssn like '%-1%' order by (basicpay+sudang) desc) a)
        where rnum = 9) as 차이
from dual;
