--23. tblStaff, tblProject. 현재 재직중인 모든 직원의 이름, 주소, 월급, 담당프로젝트명을 가져오시오.

select * from tblStaff; -- 부모
select * from tblProject; -- 자식

select 
s.name,
s.address,
s.salary,
p.projectname
from tblStaff s inner join tblProject p 
    on s.seq = p.staff_seq;

--24. tblVideo, tblRent, tblMember. '뽀뽀할까요' 라는 비디오를 빌려간 회원의 이름은?

select * from tblVideo;
select * from tblRent;
select * from tblMember;


select 
m.name as mname,
v.name as vname
from tblMember m inner join tblRent r
    on m.seq = r.member
        inner join tblVideo v
            on v.seq = r.video
where v.name = '뽀뽀할까요';

--25. tblStaff, tblProejct. 'TV 광고'을 담당한 직원의 월급은 얼마인가?

select 
s.name,
s.salary,
p.projectname
from tblStaff s inner join tblProject p 
    on s.seq = p.staff_seq
where p.projectname = 'TV 광고';



--26. tblVideo, tblRent, tblMember. '털미네이터' 비디오를 한번이라도 빌려갔던 회원들의 이름은?

select 
m.name as mname,
v.name as vname
from tblMember m inner join tblRent r
    on m.seq = r.member
        inner join tblVideo v
            on v.seq = r.video
where v.name = '털미네이터';

--27. tblStaff, tblProject. 서울시에 사는 직원을 제외한 나머지 직원들의 이름, 월급, 담당프로젝트명을 가져오시오.

select 
s.name,
s.salary,
s.address,
p.projectname
from tblStaff s inner join tblProject p 
    on s.seq = p.staff_seq
where not s.address  like '%서울%';


--28. tblCustomer, tblSales. 상품을 2개(단일상품) 이상 구매한 회원의 연락처, 이름, 구매상품명, 수량을 가져오시오.

select * from tblCustomer;
select * from tblSales;


select 
    c.tel,
    c.name,
    s.item,
    s.qty
from tblCustomer c inner join tblSales s
    on c.seq = s.cseq
where qty >=2;


--29. tblVideo, tblRent, tblGenre. 모든 비디오 제목, 보유수량, 대여가격을 가져오시오.
select * from tblGenre;
select * from tblVideo;
select 
    v.name, v.qty, g.price
from tblGenre g inner join tblVideo v
    on g.seq = v.genre
        --inner join tblRent r
            --on v.seq = r.video
;

--30. tblVideo, tblRent, tblMember, tblGenre. 2007년 2월에 대여된 구매내역을 가져오시오. 회원명, 비디오명, 언제, 대여가격

select * from tblRent;

select 
--회원명
    m.name,
--비디오명
    v.name,
--대여날짜
    r.rentdate
from tblMember m inner join tblRent r
    on m.seq = r.member
        inner join tblVideo v
            on v.seq = r.video
                inner join tblGenre g
                    on v.genre = g.seq
where to_char(r.rentdate,'yyyy-mm') = '2007-02';

--31. tblVideo, tblRent, tblMember. 현재 반납을 안한 회원명과 비디오명, 대여날짜를 가져오시오.
select 
--회원명
    m.name,
--비디오명
    v.name,
--대여날짜
    r.rentdate
from tblMember m inner join tblRent r
    on m.seq = r.member
        inner join tblVideo v
            on v.seq = r.video
where r.retdate is null;


--33. employees, departments. 사원들의 이름, 부서번호, 부서명을 가져오시오.

select * from departments;
select * from employees;

select
e.first_name ||' ' || e.last_name,
d.department_id,
d.department_name
from departments d inner join employees e
    on d.department_id = e.department_id;


--34. employees, jobs. 사원들의 정보와 직업명을 가져오시오.
select * from jobs;

select
e.first_name ||' ' || e.last_name,
j.job_title
from jobs j inner join employees e
    on j.job_id = e.job_id;

-- ** 35. employees, jobs. 직무(job_id)별 최고급여(max_salary) 받는 사원 정보를 가져오시오.

select * 
    from jobs j inner join employees e on j.job_id = e.job_id
        where e.salary = j.max_salary;

    
--36. departments, locations. 모든 부서와 각 부서가 위치하고 있는 도시의 이름을 가져오시오.

select * from departments;
select * from locations;

select 
    d.department_name,
    l.city
from locations l inner join departments d
    on l.location_id = d.location_id;

--37. locations, countries. location_id 가 2900인 도시가 속한 국가 이름을 가져오시오.

select
    c.country_name
from countries c inner join locations l
    on c.country_id = l.country_id
where l.location_id = 2900;

--38. employees. 급여를 12000 이상 받는 사원과 같은 부서에서 근무하는 사원들의 이름, 급여, 부서번호를 가져오시오.

select 
--이름
    first_name ||' ' || last_name,
--급여
    salary,
--부서번호
    department_id
from employees
where department_id in (select
                        distinct(department_id)
                    from employees 
                    where salary >=12000);

select
    distinct(department_id)
from employees 
where salary >=12000;



--39. employees, departments. locations.  'Seattle'에서(LOC) 근무하는 사원의 이름, 직위, 부서번호, 부서이름을 가져오시오.


select 
--이름, 직위, 부서번호, 부서이름
e.first_name ||' ' || e.last_name, e.job_id, e.department_id, d.department_name
from locations l inner join departments d
    on l.location_id = d.location_id
        inner join employees e
            on d.department_id = e.department_id
    where l.city = 'Seattle'             
;

--40. employees, departments. first_name이 'Jonathon'인 직원과 같은 부서에 근무하는 직원들 정보를 가져오시오.

select
e.first_name ||' ' || e.last_name,
d.department_id,
d.department_name
from departments d inner join employees e
    on d.department_id = e.department_id
    where d.department_id = (select d.department_id
                            from departments d inner join employees e
                                on d.department_id = e.department_id
                                where e.first_name = 'Jonathon');
/*   
select d.department_id
from departments d inner join employees e
    on d.department_id = e.department_id
    where e.first_name = 'Jonathon';
  */  




--41. employees, departments. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을 출력하는데 월급이 3000이상인 사원을 가져오

select
--사원이름,부서명,월급
    e.first_name ||' ' || e.last_name,
    d.department_name,
    e.salary
from departments d inner join employees e
    on d.department_id = e.department_id
   ;



--42. employees, departments. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름, 월급을 가져오시오.

select * from departments;

select
--부서번호, 부서이름, 사원이름, 월급
    e.first_name ||' ' || e.last_name,
    d.department_name,
    d.department_id,
    e.salary
from departments d inner join employees e
    on d.department_id = e.department_id
    where d.department_id = 10
   ;



--44. departments, job_history. 퇴사한 사원의 입사일, 퇴사일, 근무했던 부서 이름을 가져오시오.
select * from job_history;

select 
-- 입사일, 퇴사일, 근무했던 부서 이름
    h.start_date,
    h.end_date,
    d.department_name
from departments d inner join job_history h
    on d.department_id = h.department_id
    ;


--** 45. employees. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호', '사원이름', '관리자번호', '관리자이름'으로 하여 가져오시오.
    -- 셀프조인 문제
    -- TODO


--** 46. employees, jobs. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 가져오시오. 년도를 기준으로 오름차순 정렬.


select * from jobs j inner join employees e on j.job_id = e.job_id;
select to_char(e.hire_date, 'yyyy') from jobs j inner join employees e on j.job_id = e.job_id;


select 
    to_char(e.hire_date, 'yyyy'),
    round(avg(salary))
        from jobs j inner join employees e on j.job_id = e.job_id
            group by to_char(e.hire_date, 'yyyy')
                order by to_char(e.hire_date, 'yyyy') asc;

--47. employees, departments. locations. 
--  각 도시(city)에 있는 모든 부서 사원들의 평균급여가 가장 낮은 도시부터 
--  도시명(city)과 평균연봉, 해당 도시의 사원수를 가져오시오. 
--  단, 도시에 근 무하는 사원이 10명 이상인 곳은 제외하고 가져오시오.

select * from locations l inner join departments d on l.location_id = d.location_id inner join employees e on d.department_id = e.department_id;


select 
    l.city, 
    round(avg(e.salary)),
    count(*) 
        from locations l inner join departments d on l.location_id = d.location_id inner join employees e on d.department_id = e.department_id
            -- where 사원 수>=10 : X... city로 그룹화된 결과에 대해 추가 기준 적용하여 소그룹을 도출하는 것이므로, having 써야함
            group by l.city
                having count(*) >=10
                    order by avg(e.salary) asc;

--48. employees, jobs, job_history. 
--  ‘Public  Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 가져오시오. 
--  현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 말것.
select * from job_history;
select * from jobs;
select * from jobs j inner join employees e on j.job_id = e.job_id inner join job_history h on j.job_id = h.job_id;


select
    distinct(e.employee_id), e.first_name ||' ' || e.last_name
    from jobs j inner join employees e on j.job_id = e.job_id inner join job_history h on j.job_id = h.job_id
        where j.job_title = 'Public Accountant';

--49. employees, departments, locations. 
--  커미션을 받는 모든 사람들의 first_name, last_name, 부서명, 지역 id, 도시명을 가져

select 
--이름, 직위, 부서번호, 부서이름
e.first_name ||' ' || e.last_name, d.department_name, l.location_id,l.city
from locations l inner join departments d
    on l.location_id = d.location_id
        inner join employees e
            on d.department_id = e.department_id
    where e.COMMISSION_PCT is not null             
;


--** 50. employees. 자신의 매니저보다 먼저 고용된 사원들의 first_name, last_name, 고용일을 가져오시오.
    -- 셀프조인 문제
    -- TODO
