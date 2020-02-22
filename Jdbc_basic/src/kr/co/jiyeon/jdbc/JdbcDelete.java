package kr.co.jiyeon.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class JdbcDelete {

	public static void main(String[] args) {

		/*
		 - 삭제할 회원의 ID를 입력받아서 해당 회원을 테이블에서 삭제하세요.
		 */

		Scanner sc = new Scanner(System.in);

		System.out.println("삭제할 회원의 ID를 입력하세요.");
		System.out.print("> ");
		String userid = sc.next();

		String url = "jdbc:mysql://localhost:3306/jsp_practice?serverTimezone=Asia/Seoul";
		String uid = "jsp";
		String upw = "jsp";

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM members WHERE id=?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);

			int rn = pstmt.executeUpdate();
			
			if(rn == 1){
				System.out.println("회원 ID(" + userid + ")가 삭제되었습니다.");
			} else {
				System.out.println("삭제에 실패했습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close(); pstmt.close(); sc.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}


	}

}
