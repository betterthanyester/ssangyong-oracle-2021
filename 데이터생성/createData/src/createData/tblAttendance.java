package createData;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
 
public class tblAttendance {

	public static void main(String[] args) throws IOException {
		
		
		int codeNum = 1;
			
		int startYear = 2021;
		int startMonthArr1[] = {7,8,9,10,11};
		int startDayArr1[] = {2,17,6,21,16};
		
		int startMonthArr3[] = {7,7,8,9,10};
		int startDayArr3[] = {2,25,27,26,29};
		
		int endYear = 2021;
		int endMonthArr1[] = {8,9,10,11,12};
		int endDayArr1[] = {16,5,20,15,11};
		
		int endMonthArr3[] = {7,8,9,10,12};
		int endDayArr3[] = {24,26,25,28,27};
		
		String gunteArr[] = {"정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상","정상",
				"결석","결석",
				"조퇴","조퇴",
				"지각","지각",
				"병가","병가"}; 

		
		
		
		
		
		BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\rlgus\\Documents\\ssangyong-oracle-2021\\오라클프로젝트\\데이터\\중간값\\tblAttendance3.sql"));	
		
		String sql = "";
		String strDate = "";
		
	 	SimpleDateFormat dateFormat;
        dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //����� ǥ��
        
        Calendar cal = Calendar.getInstance();
        
        //과정1
        //각 학생에 대해
        for (int i =1; i<=30; i++) {
        	//각시작일과 종료일에 대해
        	for (int j = 0; j<5; j++) {
        		
        		int courseNum = j+1;
        		
        		startYear = 2021;
        		int startMonth = startMonthArr1[j];
        		int startDay = startDayArr1[j];
        		
        		endYear = 2021;
        		int endMonth = endMonthArr1[j];
        		int endDay = endDayArr1[j];
        		
        		cal.set ( endYear, endMonth-1, endDay ); //���� ��¥ ����
    	        String endDate = dateFormat.format(cal.getTime());
    	        
    	        cal.set ( startYear, startMonth-1, startDay ); //���� ��¥ ����
    	        String startDate = dateFormat.format(cal.getTime());    
    	        
    	        int k = 0;
    	 
    	        while(!startDate.equals(endDate)){ //�ٸ��ٸ� ����, ���� �ϴٸ� ��������
    	            
    	        	
    	        	
    	            if(k==0) { //���� ���� ���
    	                //System.out.printf("%s\n",dateFormat.format(cal.getTime()));
    	                
    	            	strDate = dateFormat.format(cal.getTime());
    	            	
    	            	String[] arr = gunteResult(gunteArr);
    	            	
    	                sql = String.format("insert into tblAttendance values (%d,'%s',%d, %d, '%s', '%s', '%s');", codeNum, strDate , courseNum ,i, arr[0], arr[1], arr[2]);
    	                
    	                System.out.println(sql);
    					
    	    			writer.write(sql+"\r\n");
    	    			
    	                codeNum++;
    	                
    	            }
    	            
    	            cal.add(Calendar.DATE, 1); //1�� ������
    	            startDate = dateFormat.format(cal.getTime()); //�񱳸� ���� �� ����
    	            
    	            strDate = dateFormat.format(cal.getTime());
    	            
    	            String[] arr = gunteResult(gunteArr);
    	            
    	            sql = String.format("insert into tblAttendance values (%d,'%s',%d, %d, '%s', '%s', '%s');", codeNum, strDate , courseNum ,i, arr[0], arr[1], arr[2]);
	                
	                System.out.println(sql);
					
	    			writer.write(sql+"\r\n");
	    			
	                codeNum++;
    	            k++;
    	        }//while
        	}//j
        	
        	
        }//for i
        
        
      //과정3
        //각 학생에 대해
        for (int i =61; i<=90; i++) {
        	//각시작일과 종료일에 대해
        	for (int j = 0; j<5; j++) {
        		
        		int courseNum = j+6;
        		
        		startYear = 2021;
        		int startMonth = startMonthArr3[j];
        		int startDay = startDayArr3[j];
        		
        		endYear = 2021;
        		int endMonth = endMonthArr3[j];
        		int endDay = endDayArr3[j];
        		
        		cal.set ( endYear, endMonth-1, endDay ); //���� ��¥ ����
    	        String endDate = dateFormat.format(cal.getTime());
    	        
    	        cal.set ( startYear, startMonth-1, startDay ); //���� ��¥ ����
    	        String startDate = dateFormat.format(cal.getTime());    
    	        
    	        int k = 0;
    	 
    	        while(!startDate.equals(endDate)){ //�ٸ��ٸ� ����, ���� �ϴٸ� ��������
    	            
    	        	
    	        	
    	            if(k==0) { //���� ���� ���
    	                //System.out.printf("%s\n",dateFormat.format(cal.getTime()));
    	                
    	            	strDate = dateFormat.format(cal.getTime());
    	            	
    	            	String[] arr = gunteResult(gunteArr);
        	            
        	            sql = String.format("insert into tblAttendance values (%d,'%s',%d, %d, '%s', '%s', '%s');", codeNum, strDate , courseNum ,i, arr[0], arr[1], arr[2]);
        	            
    	                System.out.println(sql);
    					
    	    			writer.write(sql+"\r\n");
    	    			
    	                codeNum++;
    	                
    	            }
    	            
    	            cal.add(Calendar.DATE, 1); //1�� ������
    	            startDate = dateFormat.format(cal.getTime()); //�񱳸� ���� �� ����
    	            
    	            strDate = dateFormat.format(cal.getTime());
	            	
    	            String[] arr = gunteResult(gunteArr);
    	            
    	            sql = String.format("insert into tblAttendance values (%d,'%s',%d, %d, '%s', '%s', '%s');", codeNum, strDate , courseNum ,i, arr[0], arr[1], arr[2]);
	                System.out.println(sql);
					
	    			writer.write(sql+"\r\n");
	    			
	                codeNum++;
    	            k++;
    	        }//while
        	}//j
        	
        	
        }//for i
        
        
        writer.close();
//        

	}//main

	
	
	
	
	
	
	private static String[] gunteResult(String[] gunteArr) {
		
		
		String[] arr = {"","",""};
		
		int index = (int) (Math.random() * 32);
		
		
		if (gunteArr[index].equals("정상")) {
			
			arr[0] = "정상";
			arr[1] = String.format("%02d",(int) (Math.random()*2) +7)+":"+ String.format("%02d",(int) (Math.random()*60) + 0);
			arr[2] = String.format("%02d",(int) (Math.random()*1) +18)+":"+ String.format("%02d",(int) (Math.random()*60) + 0);
			
		}else if (gunteArr[index].equals("결석")) {
			
			arr[0] = "결석";
			arr[1] = "0";
			arr[2] = "0";
		
			
		}else if (gunteArr[index].equals("조퇴")) {
			
			arr[0] = "조퇴";
			arr[1] = String.format("%02d",(int) (Math.random()*2) +7)+":"+ String.format("%02d",(int) (Math.random()*60) + 0);
			arr[2] = String.format("%02d",(int) (Math.random()*4) +14)+":"+ String.format("%02d",(int) (Math.random()*60) + 0);
			
			
		}else if (gunteArr[index].equals("지각")) {
			
			arr[0] = "지각";
			arr[1] = String.format("%02d",(int) (Math.random()*3) +9)+":"+ String.format("%02d",(int) (Math.random()*50) + 10);
			arr[2] = String.format("%02d",(int) (Math.random()*1) +18)+":"+ String.format("%02d",(int) (Math.random()*60) + 0);
			
			
		}else if (gunteArr[index].equals("병가")) {
			arr[0] = "병가";
			arr[1] = "0";
			arr[2] = "0";
			
		}	
		
		return arr;
		

	}//method
		
		

		
		
		



}	
	

