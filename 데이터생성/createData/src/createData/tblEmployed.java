package createData;

public class tblEmployed {

	public static void main(String[] args) {
	
		String[] buseoList = {"모바일 개발부", "웹 개발부", "시스템소프트웨어 개발부", "응용소프트웨어 개발부", "임베디드 개발부", "데이터베이스 관리부","정보보안부"};
		
		// System.out.println(buseoList.length);  =  7
		
		
		String[] jikwiList = {"사원", "대리", "과장", "부장"};


		
		/* 부서
		int min = 0;
		int max = 6;
		for(int i = 0; i <30; i++) {
			int index = (int) (Math.random()*(max-min)) + min;
			System.out.println(buseoList[index]);
		*/
		
		/* 직위
		int min = 0;
		int max = 3;
		for(int i = 0; i <30; i++) {
			int index = (int) (Math.random()*(max-min)) + min;
			System.out.println(jikwiList[index]);*/
		
		
		//수강신청코드
		int min = 1;
		int max = 50;
		for(int i = 0; i <30; i++) {
			int index = (int) (Math.random()*(max-min)) + min;
			System.out.println(index);
		
		/*입사년도
		int min = 2019;
		int max = 2022;
		for(int i = 0; i <30; i++) {
			int index = (int) (Math.random()*(max-min)) + min;
			System.out.println(index);
		*/
		
		/* 입사일
		int min = 1;
		int max = 29;
		for(int i = 0; i <30; i++) {
			int index = (int) (Math.random()*(max-min)) + min;
			System.out.printf("%02d\n",index);
		*/

		
			
		
			
	
		
		
	}
	
	
	
	
	
	}	
}
