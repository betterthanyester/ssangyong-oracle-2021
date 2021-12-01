package createData;
import java.text.SimpleDateFormat;
import java.util.Calendar;
 
public class tblAttendanceQuestion {

	public static void main(String[] args) {
		
		
		//수강신청번호
		int sugangSeq = 1;
		//개설과목코드 리스트 (해당 수강신청번호가 과정번호에 대응되고, 그 과정번호에 대응되는 개설과목번호 리스트) 
		String subjectStartDateList[] = {"2020-06-01"};
		String subjectEndDateList[] = {"2021-05-30"};
		
		for (int i = 0; i < subjectStartDateList.length; i++) {
		System.out.println(i);
		print(subjectStartDateList[i], subjectEndDateList[i]);
		
		
	}
	
		
	}//main
		
		
		

	private static void print(String start, String end)   {
			int startYear = Integer.parseInt(start.substring(0, 4));
			int startMonth = Integer.parseInt(start.substring(5, 7)) - 1;
			int startDay = Integer.parseInt(start.substring(8));
			
			int endYear = Integer.parseInt(end.substring(0, 4));
			int endMonth = Integer.parseInt(end.substring(5, 7)) - 1;
			int endDay = Integer.parseInt(end.substring(8));
		
		 	SimpleDateFormat dateFormat;
	        dateFormat = new SimpleDateFormat("'yyyy-MM-dd'"); //년월일 표시
	        
	        Calendar cal = Calendar.getInstance();
	        
	        
	        cal.set ( endYear, endMonth, endDay ); //종료 날짜 셋팅
	        String endDate = dateFormat.format(cal.getTime());
	        
	        cal.set ( startYear, startMonth, startDay ); //시작 날짜 셋팅
	        String startDate = dateFormat.format(cal.getTime());    
	        
	        int i = 0;
	 
	        while(!startDate.equals(endDate)){ //다르다면 실행, 동일 하다면 빠져나감
	            
            if(i==0) { //최초 실행 출력
	                System.out.println(dateFormat.format(cal.getTime()));
            }
          
	            cal.add(Calendar.DATE, 1); //1일 더해줌
	            startDate = dateFormat.format(cal.getTime()); //비교를 위한 값 셋팅
	            
	            System.out.println(dateFormat.format(cal.getTime()));
	            
	            i++;
	 
	}

	}//print method
	

}	
	

