package createData;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class DeleteWeekendAndHolidays {

	public static void main(String[] args) throws ParseException, IOException {
		
		BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\rlgus\\Documents\\ssangyong-oracle-2021\\오라클프로젝트\\데이터\\중간값\\tblAttendanceRevised.sql"));	
		
		ArrayList<String> holidayList = new ArrayList<String>(); 
		
		Scanner scanner = new Scanner(new File("C:\\Users\\rlgus\\Documents\\ssangyong-oracle-2021\\오라클프로젝트\\데이터\\중간값\\holiday.txt"));
		while (scanner.hasNextLine()) {
			String line = scanner.nextLine();

			String info[] = line.split(",");

			String holidate = info[0].substring(0,4) + "-" +info[0].substring(4,6)+"-"+ info[0].substring(6);
			
			holidayList.add(holidate);

			
			
		}//while
	
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	  
	    Calendar cal = Calendar.getInstance() ;
	  
	    int dayNum = 0;
	    
	    int isHoliday = 0;
		
		
		
		
		Scanner scanner2 = new Scanner(new File("C:\\Users\\rlgus\\Documents\\ssangyong-oracle-2021\\오라클프로젝트\\데이터\\중간값\\tblAttendanceMain.sql"));

		while (scanner2.hasNextLine()) {
			
			isHoliday = 0;
			
			String line = scanner2.nextLine();


		
			String date = line.substring(line.indexOf("'")+1, line.indexOf("'")+11);			

			
		    Date nDate = dateFormat.parse(date);
		    cal.setTime(nDate);
		    dayNum = cal.get(Calendar.DAY_OF_WEEK) ;

		    
		    if (dayNum == 1 || dayNum ==7) {
		    	continue;
		    	
		    	//확인용  line = line + "주말";
		    	
		    }//주말
		    
		    
		    
		    for (String i : holidayList) {
		    	
		    	if (i.equals(date)) {
		    		isHoliday = 1;
		    	}
		    }//for
		    
		    if (isHoliday == 1) {
		    	continue;
		    	
		    	//확인용  line = line + "공휴일";
		    	
		    }//공휴일
	
		    
			writer.write(line+"\r\n");

		    
		    
			
			
		}//while
		
        writer.close();

		
		
		
		
		
	
	}//main	
}