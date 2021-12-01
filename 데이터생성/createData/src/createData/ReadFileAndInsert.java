package createData;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class ReadFileAndInsert {
	public static void main(String[] args) throws IOException {
		
		
		Scanner scanner = new Scanner(new File("C:\\Users\\rlgus\\Documents\\ssangyong-oracle-2021\\오라클프로젝트\\데이터\\중간값\\tblAttendance2.csv"));

		BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\rlgus\\Documents\\ssangyong-oracle-2021\\오라클프로젝트\\데이터\\중간값\\tblAttendance2.sql"));	
	
		while (scanner.hasNextLine()) {
			String line = scanner.nextLine();

			String info[] = line.split(",");
//			String month = String.format("%02d", (int) (Math.random()*(13-1)) + 1);
//			String day = String.format("%02d", (int) (Math.random()*(29-1)) + 1);
//			
//			String ibsadate = info[3] +"-" +month+ "-" +  day;
			
			String sql = String.format("insert into tblAttendance values (%s,'%s',%s, %s);", info[0], info[1],info[2],info[3]);
			
			System.out.println(sql);
				
			writer.write(sql+"\r\n");
			
			}//while
			writer.close();

}


}