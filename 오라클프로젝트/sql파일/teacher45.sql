--[교사4번 : 성적입출력}
--    - 성적이 null인 학생의 성적을 입력하는 기능
--            - 1번 과목의 1번 수강생의 필기/실기/출결 성적을 null로 변경
                    begin
                        procrevisescore(1,1,null,null,null);
                    end;
--            - 교사 10번이 자신이 미등록한 성적이 있는지 목록을  출력
                    select distinct * from vwscoremember
                        where "교사번호" = 10
                        and ("필기점수" is null or "실기점수" is null or "출석점수" is null)
                            order by "수강번호";
--            - 미등록된 1번 과목의 1번 수강생의 성적을 기입
                    begin
                        procrevisescore(1,1,70,80,100);
                    end;
                    
                    
--[교사5번: 출결조회]
--        - 10번 교사가 자신이 강의한 1번 과목에 대해, '2021-07-02'부터 '2021-07-25'의 기간동안 해당 과목을 수강한 전체 학생의 출결정보를 조회
                select
                *
                from vwattendance
                        where "교사번호" = 10 
                        and "날짜" between to_date('2021-07-02', 'yyyy-mm-dd') and to_date('2021-07-25', 'yyyy-mm-dd') 
                        and "과목번호" = 1 
                            order by "수강번호", "날짜";        