--1. traffic_accident. 각 교통 수단 별(지하철, 철도, 항공기, 선박, 자동차) 발생한 총 교통 사고 발생 수, 총 사망자 수, 사건 당 평균 사망자 수를 가져오시오.
SELECT * FROM traffic_accident;
SELECT 
    trans_type as "교통수단명", 
    sum(total_acct_num) as "총 교통사고 발생 수",
    sum(death_person_num) as "총 사망자수", 
    round(sum(death_person_num)/sum(total_acct_num),3) as "사건 당 평균 사망자" 
FROM traffic_accident
    where total_acct_num > 0
        GROUP BY trans_type;
        
        

--2. tblZoo. 종류(family)별 평균 다리의 갯수를 가져오시오.
SELECT * FROM tblZoo;
SELECT family as "종" , round(avg(leg),2) as "평균 다리 갯수" FROM tblZoo
    GROUP BY family;
    
    

    
--3. tblZoo. 체온이 변온인 종류 중 아가미 호흡과 폐 호흡을 하는 종들의 갯수를 가져오시오.
SELECT * FROM tblzoo;
SELECT 
    count(case
        when breath in ('lung') then 1
    end) as "변온,폐 호흡",
    count(case
        when breath in ('gill') then 1
    end) as "변온,아가미 호흡"
FROM tblzoo
    GROUP BY thermo
        HAVING thermo = 'variable';
        
        

--4. tblZoo. 사이즈와 종류별로 그룹을 나누고 각 그룹의 갯수를 가져오시오.
SELECT * FROM tblZoo;
SELECT family||decode(sizeof,'small','소형','medium','중형','large','대형') as 분류, count(family) FROM tblzoo
    GROUP BY family,sizeof 
        ORDER BY family asc, sizeof desc;
        
        
        

--5. tblMen. tblWomen. 서로 짝이 있는 사람 중 남자와 여자의 정보를 모두 가져오시오.
--    [남자]        [남자키]   [남자몸무게]     [여자]    [여자키]   [여자몸무게]
--    홍길동         180       70              장도연     177        65
--    아무개         175       null            이세영     163        null
--    ..
SELECT name as "[남자]", height as "[남자키]", weight as "[남자몸무게]", couple as "[여자]", (SELECT height FROM tblwomen where tblmen.couple = name) as "[여자키]", (SELECT weight FROM tblwomen where tblmen.couple = name) as "[여자몸무게]" FROM tblmen 
    where couple is not null;
    
    
    

--10. tblAddressBook. 가장 많은 사람들이 가지고 있는 직업은 주로 어느 지역 태생(hometown)인가?
select 
    distinct hometown
from tblAddressBook
    where job = (select job from tblAddressBook group by job having count(*) = (select max(count(*)) from tblAddressBook group by job))
        order by hometown asc;
        
        

--12. tblAddressBook. 관리자의 실수로 몇몇 사람들의 이메일 주소가 중복되었다. 중복된 이메일 주소만 가져오시오.
SELECT 
    email, count(email)
FROM tbladdressbook 
    group by email having count(email) > 1;
    
    

--13. tblAddressBook. 이메일 도메인들 중 평균 아이디 길이가 가장 긴 이메일 사이트의 도메인은 무엇인가?
select 
    substr(email,instr(email,'@')+1), 
    avg(length(substr(email,1,instr(email,'@')-1)))
from tbladdressbook
    group by substr(email,instr(email,'@')+1)
        having avg(length(substr(email,1,instr(email,'@')-1))) 
            = (select max(avg(length(substr(email,1,instr(email,'@')-1)))) from tbladdressbook group by substr(email,instr(email,'@')+1));
            
            
            

--14. tblAddressBook. 평균 나이가 가장 많은 출신(hometown)들이 가지고 있는 직업 중 가장 많은 직업은?
select 
    job
from tblAddressBook
    where hometown = (select hometown from tblAddressBook group by hometown having avg(age) = (select max(avg(age)) from tblAddressBook group by hometown))
        group by job
            having count(*) = (select max(count(*)) from tblAddressBook where hometown = (select hometown from tblAddressBook group by hometown having avg(age) = (select max(avg(age)) from tblAddressBook group by hometown)) group by job); 
            
            

--15. tblAddressBook. 성씨별 인원수가 100명 이상 되는 성씨들을 가져오시오.
SELECT substr(name,1,1) FROM tbladdressbook group by substr(name,1,1) having count(substr(name,1,1)) >= 100;



--16. tblAddressBook. 남자 평균 나이보다 나이가 많은 서울 태생 + 직업을 가지고 있는 사람들을 가져오시오.
select 
    *
from tblAddressBook
    where age > (select avg(age) from tblAddressBook where gender='m')
            and hometown='서울' and job not in ('취업준비생','백수');
            
            

--17. tblAddressBook. 이메일이 스네이크 명명법으로 만들어진 사람들 중에서 여자이며, 20대이며, 키가 150~160cm 사이며, 고향이 서울 또는 인천인 사람들만 가져오시오.
또는 인천인 사람들만 가져오시오.
SELECT * FROM tbladdressbook;
SELECT * FROM tbladdressbook
    where instr(email,'_') <> 0 and gender = 'f' and age like ('2_') and height <= 160 and height >= 150 and hometown in ('서울','인천');



--18. tblAddressBook. gmail.com을 사용하는 사람들의 성별 > 세대별(10,20,30,40대) 인원수를 가져오시오.
SELECT age FROM tbladdressbook where substr(email,instr(email,'@') + 1) = (SELECT substr(email,instr(email,'@') + 1) FROM tbladdressbook 
    where substr(email,instr(email,'@') + 1) = 'gmail.com'
    group by substr(email,instr(email,'@') + 1)) group by age  ;

SELECT substr(email,instr(email,'@') + 1) FROM tbladdressbook 
    where substr(email,instr(email,'@') + 1) = 'gmail.com'
    group by substr(email,instr(email,'@') + 1);
    
SELECT 
    case
        when gender = 'm' then '남자'
        when gender = 'f' then '여자'
    end as "성별",
    count(case
        when age BETWEEN 10 and 19 then 1
    end) as "10대",
    count(case
        when age BETWEEN 20 and 29 then 1
    end) as "20대",
    count(case
        when age BETWEEN 30 and 39 then 1
    end) as "30대",
    count(case
        when age BETWEEN 40 and 49 then 1
    end) as "40대"
FROM tbladdressbook
    where email like('%gmail.com%')
    group by gender;

--19. tblAddressBook. 가장 나이가 많으면서 가장 몸무게가 많이 나가는 사람과 같은 직업을 가지는 사람들을 가져오시오.
SELECT * FROM tbladdressbook where job = (SELECT job FROM tbladdressbook
where weight = (SELECT max(weight) FROM tbladdressbook where age = (SELECT max(age) FROM tbladdressbook)) and age = (SELECT max(age) FROM tbladdressbook));

--20. tblAddressBook. '건물주'와 '건물주자제분'들의 거주지가 서울과 지방의 비율이 어떻게 되느냐?
SELECT job,
    round(count(case
        when substr(address,1,2) like ('%서울%') then 1 
    end)/count(job)*100,2)||'%' as "서울 거주자",
     round(count(case
        when substr(address,1,2) not like ('%서울%') then 1 
    end)/count(job)*100,2)||'%' as "(비)서울 거주자"   
FROM tbladdressbook group by job having job in ('건물주','건물주자제분');



--21. tblAddressBook.  동명이인이 여러명 있습니다. 이 중 가장 인원수가 많은 동명이인(모든 이도윤)의 명단을 가져오시오.
select 
    *
from tblAddressBook
    where name = (select name from tblAddressBook group by name having count(*) = (select max(count(*)) from tblAddressBook group by name));

--22. tblAddressBook. 가장 사람이 많은 직업의(332명) 세대별 비율을 구하시오.
--    [10대]       [20대]       [30대]       [40대]
--    8.7%        30.7%        28.3%        32.2%
SELECT 
    job,
    round(count(CASE
        when age between 10 and 19 then 1
    end)/count(*)*100,2)||'%' as "[10대]",
    round(count(CASE
        when age between 20 and 29 then 1
    end)/count(*)*100,2)||'%' as "[20대]",
    round(count(CASE
        when age between 30 and 39 then 1
    end)/count(*)*100,2)||'%' as "[30대]",
    round(count(CASE
        when age between 40 and 49 then 1
    end)/count(*)*100,2)||'%' as "[40대]"
FROM tbladdressbook group by job having count(job) = (SELECT max(count(job)) FROM tbladdressbook group by job);







