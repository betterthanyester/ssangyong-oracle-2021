package createData;
import java.text.SimpleDateFormat;
import java.util.Calendar;
 
public class tblAttendanceQuestion {

	public static void main(String[] args) {
		
		
		//������û��ȣ
		int sugangSeq = 1;
		//���������ڵ� ����Ʈ (�ش� ������û��ȣ�� ������ȣ�� �����ǰ�, �� ������ȣ�� �����Ǵ� ���������ȣ ����Ʈ) 
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
	        dateFormat = new SimpleDateFormat("'yyyy-MM-dd'"); //����� ǥ��
	        
	        Calendar cal = Calendar.getInstance();
	        
	        
	        cal.set ( endYear, endMonth, endDay ); //���� ��¥ ����
	        String endDate = dateFormat.format(cal.getTime());
	        
	        cal.set ( startYear, startMonth, startDay ); //���� ��¥ ����
	        String startDate = dateFormat.format(cal.getTime());    
	        
	        int i = 0;
	 
	        while(!startDate.equals(endDate)){ //�ٸ��ٸ� ����, ���� �ϴٸ� ��������
	            
            if(i==0) { //���� ���� ���
	                System.out.println(dateFormat.format(cal.getTime()));
            }
          
	            cal.add(Calendar.DATE, 1); //1�� ������
	            startDate = dateFormat.format(cal.getTime()); //�񱳸� ���� �� ����
	            
	            System.out.println(dateFormat.format(cal.getTime()));
	            
	            i++;
	 
	}

	}//print method
	

}	
	

