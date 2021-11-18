--1. traffic_accident. 각 교통 수단 별(지하철, 철도, 항공기, 선박, 자동차) 
--발생한 총 교통 사고 발생 수, 
--총 사망자 수, 
--사건 당 평균 사망자 수를 가져오시오.

select * from traffic_accident;

select
    trans_type,
    sum(total_acct_num),
    sum(death_person_num),
    round(sum(death_person_num)/sum(total_acct_num))
from traffic_accident
    group by trans_type;

--2. tblZoo. 종류(family)별 평균 다리의 갯수를 가져오시오.

select  * from tblzoo;

select 
    family,
    round(sum(leg)/count(*))
from tblzoo
    group by family
    ;
    
--3. tblZoo. 체온이 변온인 종류 중 아가미 호흡과 폐 호흡을 하는 종들의 갯수를 가져오시오.
select  * from tblzoo;

select
    breath,
    count(distinct(family))
from tblzoo
where thermo = 'variable'
    group by breath
;


--4. tblZoo. 사이즈와 종류별로 그룹을 나누고 각 그룹의 갯수를 가져오시오.

select
    sizeof,
    family,
    count(*)
from tblzoo
    group by rollup (sizeof, family)
;

--5. tblMen. tblWomen. 서로 짝이 있는 사람 중 남자와 여자의 정보를 모두 가져오시오.
--    [남자]        [남자키]   [남자몸무게]     [여자]    [여자키]   [여자몸무게]
--    홍길동         180       70            장도연     177        65
--    아무개         175       null          이세영     163        null
--    ..

select * from tblmen;

select 
    name as "남자",
    height as "남자키",
    weight as "남자몸무게",
    (select name from tblwomen where couple = tblmen.name) as "여자",
    (select height from tblwomen where couple = tblmen.name) as "여자키",
    (select weight from tblwomen where couple = tblmen.name) as "여자몸무게"
from tblMen
    where couple is not null
;

--10. tblAddressBook. 가장 많은 사람들이 가지고 있는 직업은 주로 어느 지역 태생(hometown)인가?

select * from tbladdressbook;

    --직업 / count 테이블
select job,count(*) as num from tbladdressbook group by job;

 
    -- 직업 max 값 
select max(count(*))from tblAddressbook group by job;
    
    -- max인 직업 (학생)
select job 
from (select job,count(*) as num from tbladdressbook group by job
) table1 
where table1.num = (select max(count(*))from tblAddressbook group by job
);

    -- max직업의 hometown, count 테이블
select hometown,count(*)as num2
from tblAddressBook
    where job = (select job 
from (select job,count(*) as num from tbladdressbook group by job
) table1 
where table1.num = (select max(count(*))from tblAddressbook group by job
)) 
    group by rollup(hometown)
    ;
    
    
    --max hometown 값 : 167
    select max(num2) from (select hometown,count(*)as num2
from tblAddressBook
    where job = (select job 
from (select job,count(*) as num from tbladdressbook group by job
) table1 
where table1.num = (select max(count(*))from tblAddressbook group by job
)) 
    group by hometown);
    
    
    
    
    
    
    
    -- hometown (최종 결과) : 서울
    select
        hometown 
    from (select hometown,count(*)as num2
from tblAddressBook
    where job = (select job 
from (select job,count(*) as num from tbladdressbook group by job
) table1 
where table1.num = (select max(count(*))from tblAddressbook group by job
)) 
    group by rollup(hometown))
    where num2 = (select max(num2) from (select hometown,count(*)as num2
from tblAddressBook
    where job = (select job 
from (select job,count(*) as num from tbladdressbook group by job
) table1 
where table1.num = (select max(count(*))from tblAddressbook group by job
)) 
    group by hometown));

--12. tblAddressBook. 관리자의 실수로 몇몇 사람들의 이메일 주소가 중복되었다. 중복된 이메일 주소만 가져오시오.


select * from tblAddressbook;

s

select table1.email
from (select email, count(*) as num from tbladdressbook group by email) table1
where table1.num > 1
;

--13. tblAddressBook. 이메일 도메인들 중 평균 아이디 길이가 가장 긴 이메일 사이트의 도메인은 무엇인가?

select substr(email, 1, instr(email,'@')-1) from tbladdressbook;
select substr(email, instr(email,'@')+1 ) from tbladdressbook;

    -- 아이디 길이, 도메인 테이블     
select 
    length(substr(email, 1, instr(email,'@')-1)) as id_length,
    substr(email, instr(email,'@')+1 ) as domain
  from tbladdressbook;

    -- 도메인, 아이디 길이 평균 테이블
    select domain, avg(id_length) as average
    from (select length(substr(email, 1, instr(email,'@')-1)) as id_length, substr(email, instr(email,'@')+1 ) as domain
            from tbladdressbook)
    group by domain;


    --max 값
    select 
        max(average)
    from (
            select domain, avg(id_length) as average
            from (select length(substr(email, 1, instr(email,'@')-1)) as id_length, substr(email, instr(email,'@')+1 ) as domain
            from tbladdressbook)
            group by domain
        );
        
    -- 도메인 값
    select 
        domain
    from (
            select domain, avg(id_length) as average
            from (select length(substr(email, 1, instr(email,'@')-1)) as id_length, substr(email, instr(email,'@')+1 ) as domain
            from tbladdressbook)
            group by domain
        )
    where (
        average = (
                    
                    select 
                        max(average)
                    from (
                            select domain, avg(id_length) as average
                            from (select length(substr(email, 1, instr(email,'@')-1)) as id_length, substr(email, instr(email,'@')+1 ) as domain
                            from tbladdressbook)
                            group by domain
                        )           
                    
                    )
            );



/* group by 내에서 서브 쿼리 사용 불가... ORA-22818: subquery expressions not allowed here

select
    (select substr(email, instr(email,'@')+1 ) from tbladdressbook) as domain,
    sum(length(substr(email, 1, instr(email,'@')-1)))
from tblAddressbook
group by (select substr(email, instr(email,'@')+1 ) from tbladdressbook);
*/


--14. tblAddressBook. 평균 나이가 가장 많은 출신(hometown)들이 가지고 있는 직업 중 가장 많은 직업은?



--15. tblAddressBook. 성씨별 인원수가 100명 이상 되는 성씨들을 가져오시오.
select * from tblAddressbook;




select
    first,
    num
from (
    select substr(name,1,1) as first, count(*) as num
    from tblAddressbook
        group by substr(name,1,1)

    )
    where num > 100;

--16. tblAddressBook. 남자 평균 나이보다 나이가 많은 서울 태생 + 직업을 가지고 있는 사람들을 가져오시오.


select * from tbladdressbook;

select * 
from tbladdressbook
    where age > (select avg(age) from tbladdressbook where gender = 'm')
        and hometown = '서울'
        and not job in ('백수', '학생', '취업준비생');



--17. tblAddressBook. 이메일이 스네이크 명명법으로 만들어진 사람들 중에서 여자이며, 20대이며, 키가 150~160cm 사이며, 고향이 서울 또는 인천인 사람들만 가져오시오.

--18. tblAddressBook. gmail.com을 사용하는 사람들의 성별 > 세대별(10,20,30,40대) 인원수를 가져오시오.

select
    gender,
    floor(age/10),
    count(*)
from tblAddressbook
where substr(email, instr(email,'@')+1 ) = 'gmail.com'
group by gender, floor(age/10);



--19. tblAddressBook. 가장 나이가 많으면서 가장 몸무게가 많이 나가는 사람과 같은 직업을 가지는 사람들을 가져오시오.
select * 
from tblAddressBook
where job = (
    select 
    job
    from tbladdressbook
    where age = (select max(age) from tblAddressbook)
        and weight = (select max(weight) from tbladdressbook)
        );
--20. tblAddressBook. '건물주'와 '건물주자제분'들의 거주지가 서울과 지방의 비율이 어떻게 되느냐?
select 
    job,
    address,
    case
        when address like '%서울%' then 1
        else 2
    end as 서울
from tblAddressbook
where job in ('건물주', '건물주자제분');


select
    job,
    count(case
        when 서울 = 1 then 1
    end)/count(*) as seoul,
    count(case
        when 서울 = 2 then 1
    end)/count(*) as not_seoul
from (select 
        job,
        address,
        case
            when address like '%서울%' then 1
            else 2
        end as 서울
    from tblAddressbook
    where job in ('건물주', '건물주자제분'))
group by job;

--21. tblAddressBook.  동명이인이 여러명 있습니다. 이 중 가장 인원수가 많은 동명이인(모든 이도윤)의 명단을 가져오시오.

select name,count(*) as freq  from tbladdressbook group by name;

select name
from (select name,count(*) as freq  from tbladdressbook group by name)
where freq =(select max(freq) from (select name,count(*) as freq  from tbladdressbook group by name));


select * 
from tbladdressbook
where name = ( select name
            from (select name,count(*) as freq  from tbladdressbook group by name)
            where freq =(select max(freq) from (select name,count(*) as freq  from tbladdressbook group by name)));            )

--22. tblAddressBook. 가장 사람이 많은 직업의(332명) 세대별 비율을 구하시오.
--    [10대]       [20대]       [30대]       [40대]
--    8.7%        30.7%        28.3%        32.2%

select job
from ( select  job, count(*) as freq from tbladdressbook group by job)
where freq = (select max(freq) from (select  job, count(*) as freq from tbladdressbook group by job));


select  job, count(*) as freq from tbladdressbook group by job;


select
    count(case
    when floor(age/10)= 1 then 1
    end)/count(*) as "10대",
    count(case
    when floor(age/10)= 2 then 1
    end)/count(*) as "20대",
    count(case
    when floor(age/10)= 3 then 1
    end)/count(*) as "30대",
    count(case
    when floor(age/10)= 4 then 1
    end)/count(*) as "40대"
from 
    tblAddressbook
where job = (select job
from ( select  job, count(*) as freq from tbladdressbook group by job)
where freq = (select max(freq) from (select  job, count(*) as freq from tbladdressbook group by job)));