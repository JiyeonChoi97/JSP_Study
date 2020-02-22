package kr.co.jiyeon.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JdbcInsert {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		
		System.out.println("# 회원정보 입력을 시작합니다. ");
		System.out.println("# 아이디 : ");
		String id = sc.next();
		
		System.out.println("# 비밀번호 : ");
		String pw = sc.next();
		
		System.out.println("# 이름 : ");
		String name = sc.next();
		
		System.out.println("# 이메일 : ");
		String email = sc.next();
		
		// DB 연동 순서
		// 1. DB 사용자 계정명과 암호, DB url 등 초기 데이터 변수를 설정
		String uid = "jsp"; // root
		String upw = "jsp"; // mysql
		// **DB에 접근할 수 있도록 경로 설정**
		String url = "jdbc:mysql://localhost:3306/jsp_practice?serverTimezone=Asia/Seoul";
		
		Connection conn = null;
		Statement stmt = null;
		try {
			// 2. JDBC 커넥터 드라이버 호출
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// 3. DB 연동을 위한 클래스들의 객체를 생성
			/*
			 # a - Connection 객체
			 	: DB와의 연결을 위한 객체 . Connection 객체를 생성하려면 직접 new 연산자를 통해 객체를 생성할 수 없습니다. 
			 	  DriverManager 클래스가 제공하는 정적 메서드인 getConnection()을 호출하여 객체를 생성합니다. 
			 */
			// java.sql import
			conn = DriverManager.getConnection(url, uid, upw);
			
			/*
			 # b - Statement 객체
			 	: SQL문을 실행할 객체
			 	  Statement 객체는 COnnection 객체가 제공하는 createStatement()메서드를 호출하여 생성합니다. 
			 */
			// java.sql import
			stmt = conn.createStatement();
			
			/*
			 # c - SQL문 작성
			 	: SQL문은 string 형태로 작성합니다.
			 */
			String sql = "INSERT INTO members VALUES " + "('" + id +"', '" + pw + "', '" + name +"', '" + email + "')";
			
			/*
			 # d - Statement 객체를 통한 SQL문 실행
			 1. insert, update, delete 명령일 경우 executeUpdate()를 호출합니다.
			 2. select 명령일 경우 executeQuery()를 호출합니다. 
			 
			 3. executeUpdate() 메서드는 SQL문 실행 성공시 성공한 쿼리의 갯수를, 실패시 0을 리턴합니다. 
			 */
			
			int resultNum = stmt.executeUpdate(sql);
			if(resultNum == 1) {
				System.out.println("DB에 회원정보 저장 성공!");
			} else {
				System.out.println("DB에 회원정보 저장 실패!");
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			/*
			 4. DB연동 객체들 자원을 반납.
			 - 원활한 JDBC 프로그래밍을 위해 사용한 자원들을 반납합니다. 
			 */
			try {
				conn.close(); stmt.close(); sc.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
	
		
		
		
		
		
	}

}
