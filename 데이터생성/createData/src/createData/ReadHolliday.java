package createData;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.util.Scanner;

public class ReadHolliday {

	public static void main(String[] args) throws FileNotFoundException {
		
		Scanner scanner = new Scanner(new File("C:\\Users\\rlgus\\Documents\\ssangyong-oracle-2021\\오라클프로젝트\\데이터\\중간값\\holiday.txt"));

	
		while (scanner.hasNextLine()) {
			String line = scanner.nextLine();

			String info[] = line.split(",");

			String holidate = info[0].substring(0,4) + "-" +info[0].substring(4,6)+"-"+ info[0].substring(6);
			
			System.out.println(holidate);

			
			
	}
	
	
	}	
}
