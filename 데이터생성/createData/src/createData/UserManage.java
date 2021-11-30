package com.group1.bankproject.bankproduct;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

import com.group1.bankproject.MyPath;



/**
 * 
 * 은행상품과 관련된 고객정보를 관리하는 클래스입니다.
 * @author 1조
 *
 */

public class UserManage {
	
	
	
	/**
	 * 
	 * 환불 시 환급기능을 구현한 메소드입니다.
	 * 
	 * 
	 * 
	 */
	
	


	public String refundDeposit (String account, String date, double refundMoney) {
		
		String accountFile = account+".csv";
		
		String path = MyPath.INDIVIDUAL_ACCOUNT + "" + accountFile;
		
		try {
			Scanner scan = new Scanner(new File(path));
			String str = "";
			String lastLine = "";
			
			
			while (scan.hasNextLine()) {
				
				String line = scan.nextLine();
				
				str += line+"\r\n";
				lastLine = line;
				
			}
			
			String[] lastInfo = lastLine.split(",");

			double lastMoney = refundMoney*10000 + Double.parseDouble(lastInfo[3]);
			
			String refundString = String.format("%.0f", refundMoney*10000);
			
			String lastString = String.format("%.0f", lastMoney);
			
			
			String newString = date + "," + "입금" + "," + refundString + "," + lastString;
			str += newString;
			
			System.out.println(newString);
			
			scan.close();
			
			FileWriter writer = new FileWriter(path);
			writer.write(str);
			writer.close();
			
			
			
			
			return refundString;
			

			
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		
		return "";
		
		
		
	}//refundDeposit


	
	/**
	 * 
	 * 적금 해지 기능을 구현한 메소드입니다.
	 * 
	 */
	
	public void deleteSavings (Integer userNum, Integer savingsNum) {


		try {
			
			String path_userSavingsData = MyPath.USERSAVINGDATA;
			
			String userNumString = Integer.toString(userNum);
			String savingsNumString = Integer.toString(savingsNum);
			
			Scanner scan = new Scanner(new File(path_userSavingsData));

			String str = "";
					
			while (scan.hasNextLine()) {
				
				String[] savingsInfo = scan.nextLine().split(",");
				
		
				if (savingsInfo[0].equals(userNumString) && 
					savingsInfo[2].equals(savingsNumString)) {
					
					continue;
					
					
				}else {
					
					str += savingsInfo[0]+","+
							savingsInfo[1]+","+
							savingsInfo[2]+","+
							savingsInfo[3]+","+
							savingsInfo[4]+","+
							savingsInfo[5]+"\r\n";
				}
				
			}
			
			
			scan.close();
			
			FileWriter writer = new FileWriter(path_userSavingsData);
			writer.write(str);
			writer.close();
		
			
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}//deleteSavings
		
	
	/**
	 * 
	 * 편드 해지 기능을 구현한 메소드입니다.
	 * 
	 */
	
	public void deleteFund (Integer userNum, Integer fundNum) {


		try {
			
			String path_userFundData = MyPath.USERFUNDDATA;
			
			String userNumString = Integer.toString(userNum);
			String fundNumString = Integer.toString(fundNum);
			
			Scanner scan = new Scanner(new File(path_userFundData));

			String str = "";
					
			while (scan.hasNextLine()) {
				
				String[] fundInfo = scan.nextLine().split(",");
				
		
				if (fundInfo[0].equals(userNumString) && 
					fundInfo[2].equals(fundNumString)) {
					
					continue;
					
					
				}else {
					
					str += fundInfo[0]+","+fundInfo[1]+","+fundInfo[2]+","+fundInfo[3]+"\r\n";
				}
				
			}
			
			
			scan.close();
			
			FileWriter writer = new FileWriter(path_userFundData);
			writer.write(str);
			writer.close();
		
			
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}//deleteFund
		
		
	
	
	/**
	 * 
	 * 펀드 가입 시 데이터를 추가하는 기능을 구현한 메소드입니다.
	 * 
	 * 
	 */
	
	
	public void createFund (Integer userNum,Integer fundNum, int money) {
		
		try {
			
			String path_userFundData = MyPath.USERFUNDDATA;
			
			
			
			Scanner scan = new Scanner(new File(path_userFundData));
			ArrayList<String> user = new ArrayList<String>();
			Set<String> set = new HashSet<String>();
			String str = "";
					
			while (scan.hasNextLine()) {
				
				String line = scan.nextLine();
				
				str += line+"\r\n";
				user.add(line);
			}
			
			
			for (String line : user) {
				
				String[] fundInfo = line.split(",");
				set.add(fundInfo[1]);
				
			}
			
			
			String newString = userNum + "," + createFundAccount(set) + "," + fundNum +"," + money;
			
			//System.out.println(newString);
					
			str += newString;
			
					
			scan.close();
			
			FileWriter writer = new FileWriter(path_userFundData);
			writer.write(str);
			writer.close();
			
			
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}//createFund
	
	

	private String createFundAccount(Set<String> set) {
		
		int setSize = set.size() + 1;
		
		String first = "116";
		
		int second = (int) (Math.random() * (999 - 000 + 1) + 000);
		int third = (int) (Math.random() * (9999 - 0000 + 1) + 0000);
		
		String account = first + "-"+String.format("%03d", second)+"-"+String.format("%04d", third);
		
		set.add(account);
		
		if (set.size() == setSize) {
			return account;
		}else { createFundAccount(set);
			
		}
		return account;
		
	}//createFund



	

	int debtPrint = 0;

	/**
	 * 
	 * 대출 시 부채금액 데이터를 갱신하는 기능을 구현한 메소드입니다.
	 * 
	 * 
	 */
	
	
	public int updateDebt (Integer userNum,Integer debt) {
		
		
		try {
			
			String path_userData = MyPath.USERDATA;
			
			
			
			Scanner scan = new Scanner(new File(path_userData));
			ArrayList<String> user = new ArrayList<String>();
			
			String str = "";
					
			while (scan.hasNextLine()) {
				user.add(scan.nextLine());
			}
			
			for (String line : user) {
				
				String[] userInfo = line.split(",");
				
				if (Integer.parseInt(userInfo[0]) == userNum) {
					
					int temp = Integer.parseInt(userInfo[8])+debt;
					
					debtPrint = temp;
					
					userInfo[8] = Integer.toString(temp);
					
					str += String.join(",", userInfo) + "\r\n";
					
				}else {
					str += line+"\r\n";
				}
						
					
				
				
			}//for
			
			scan.close();
			
			FileWriter writer = new FileWriter(path_userData);
			writer.write(str);
			writer.close();
			
			return debtPrint;
			
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return 0;
		
	}

	
	
	/**
	 * 
	 * 적금계좌데이터를 고객정보 리스트에 포함시키는 기능을 구현한 메소드입니다.
	 */
	
	public ArrayList<User> addDeposit() {
			ArrayList<User> userList = userList();
		try {
		
			
			
			String path_userDepositData = MyPath.USERACCOUNTDATA;
			
			Scanner scan = new Scanner(new File(path_userDepositData));
			ArrayList<String> deposit = new ArrayList<String>();

			while (scan.hasNextLine()) {
				deposit.add(scan.nextLine());
			}
			

			
			for (User userObject : userList) {
				
				HashMap<Integer, String> tempMap = new HashMap<Integer, String>();
				int count = 0;
				for (String line : deposit) {
					
					String[] depositInfo = line.split(",");
					
					if (depositInfo[0].equals(""+userObject.getUserNum())) {
						
						count++;
							
						tempMap.put(count, depositInfo[1]);	
						
						
						}//if
					
					userObject.setDepositMap(tempMap);	
					
				}//for line
				
			
				
			}//for userobject
			
			scan.close();
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
			return userList;
		
		
		
		
	}//addDeposit
	
	
	
	/**
	 * 펀드계좌데이터를 고객정보 리스트에 포함시키는 기능을 구현한 메소드입니다.
	 */
	
	
	public ArrayList<User> addFund() {
		
		try {
		
			ArrayList<User> userList = userList();
			
			String path_userFundData = MyPath.USERFUNDDATA;
			
			Scanner scan = new Scanner(new File(path_userFundData));
			ArrayList<String> fund = new ArrayList<String>();

			while (scan.hasNextLine()) {
				fund.add(scan.nextLine());
			}
			
			for (User userObject : userList) {
				
				HashMap<String, Integer> tempMap = new HashMap<String, Integer>();
			
				for (String line : fund) {
				
					String[] fundInfo = line.split(",");
						if (fundInfo[0].equals(""+userObject.getUserNum())) {
						
					tempMap.put(fundInfo[1], Integer.parseInt(fundInfo[2]));	
						
						
					}//if
					
					userObject.setFundMap(tempMap);	
					
				}//for userObject
				
			}//for fundLine
			
			scan.close();
			
			return userList;
			
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
			return null;
		
		
		
		
	}//addFund
	
	
	
	/**
	 * 고객정보 리스트를 생성하는 메소드입니다.
	 * 
	 */
	
	public ArrayList<User> userList() {
		
		try {
			
			String path_userData = MyPath.USERDATA;
			
			 
			
			
			
			Scanner scan = new Scanner(new File(path_userData));
			ArrayList<String> user = new ArrayList<String>();
			
					
			while (scan.hasNextLine()) {
				user.add(scan.nextLine());
			}
			
			
			ArrayList<User> userList = new ArrayList<User>();
			for (String line : user) {
				String[] userInfo = line.split(",");
				User userObject = new User();
				userObject.setUserNum(Integer.parseInt(userInfo[0])); //1
				userObject.setId(userInfo[1]);
				userObject.setPassword(userInfo[2]);
				userObject.setName(userInfo[3]);
				userObject.setJumin(userInfo[4]);
				userObject.setAddress(userInfo[6]);
				userObject.setTel(userInfo[7]);
				userObject.setDebt(Integer.parseInt(userInfo[8]));
				
				userList.add(userObject);
				
			}
			
			scan.close();
			
			return userList;  //ArrayList <userObject>를 return
				
			
			
			
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
			return null;
		
		
			
			
	}//userList
	
	
	
	

}
