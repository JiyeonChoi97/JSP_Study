package kr.co.jiyeon.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class JdbcSelect2 {

	public static void main(String[] args) {


		/*
		 - 회원의 ID를 입력받아 해당 ID의 회원정보를 모두 출력하는 JDBC 프로그래밍 코드를 작성하세요.
		 */
		
		Scanner sc = new Scanner(System.in);

		System.out.println("# 아이디를 입력하세요.");
		System.out.print("# 아이디 : ");
		String userid = sc.next();
		
		String url = "jdbc:mysql://localhost:3306/jsp_practice?serverTimezone=Asia/Seoul";
		String uid = "jsp";
		String upw = "jsp";
		
		String sql = "SELECT * FROM members WHERE id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select 문에서만 사용하는 객체

		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			
			System.out.println("-------------------------------------");
			if(rs.next()){
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");

				System.out.printf("# 아이디 : %s\n# 비밀번호 : %s\n# 이름 : %s\n# 이메일 : %s\n", id, pw, name, email);
				System.out.println("---------------------------------");
			} else {
				System.out.println("해당 정보가 없습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close(); pstmt.close(); rs.close(); sc.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}


	}

}
