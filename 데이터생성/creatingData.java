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
