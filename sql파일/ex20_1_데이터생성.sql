-- ex20_1_데이터생성.sql

/*
데이터 확보
    --1. 랜덤 생성 : 이클립스
    
package choboAlgoLeet;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class creatingData {
	
	
	public static void main(String[] args) throws IOException {
		
		BufferedWriter writer = new BufferedWriter(new FileWriter("member.sql"));
		
		
		String[] name = {"홍길동", "아무개","하하하"};
		
		for (int i = 0; i < 3; i++) {
			
			String sql = String.format("insert into tblMember (seq,name) values (memberSeq.nextval,'%s');", name[i]);
		writer.write(sql+"\r\n");
		
			
		}
		writer.close();
		
	}

}

    --2. 복붙
        --2.1 테이블 생성
        --2.2 데이터 가져오기

*/

create table tblMovie (
    
    seq number primary key,             --PK
    title varchar2(200) not null,       --영화제목(한글)
    title_en varchar2(100) null,        --영화제목(영문)
    year varchar2(4) null,              --제작년도
    country varchar2(100) not null,     --제작국가
    type varchar2(20) not null,         --유형
    genre varchar2(100) null,           --장르
    status varchar2(4) not null,        --제작상태
    director varchar2(300) null,        --감독
    company varchar2(500) null          --회사
    
    
);


select * from tblMovie;