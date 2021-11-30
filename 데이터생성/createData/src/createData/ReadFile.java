package createData;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class ReadFile {
	public static void main(String[] args) throws IOException {
		
		
		Scanner scanner = new Scanner(new File("C:\\Users\\rlgus\\Documents\\ssangyong-oracle-2021\\프로젝트\\데이터\\중간값\\취업현황.csv"));

	
		while (scanner.hasNextLine()) {
			String line = scanner.nextLine();

			String info[] = line.split(",");
			String month = String.format("%02d", (int) (Math.random()*(13-1)) + 1);
			String day = String.format("%02d", (int) (Math.random()*(29-1)) + 1);
			
			String ibsadate = info[3] +"-" +month+ "-" +  day;
			
			String sql = String.format("insert into tblMember values (%s,'%s','%s', '%s', %s);", info[0], info[1],info[2],ibsadate, info[6]);
			
			System.out.println(sql);
				
			}//while

}


}