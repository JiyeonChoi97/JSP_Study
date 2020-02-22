package kr.co.jiyeon.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO implements IUserDAO {
	
	//javax import
	DataSource ds;
	
	// 싱글톤 디자인 패턴
	// 1. 스스로의 객체 생성
	private static UserDAO dao = new UserDAO();
	
	// 2. 외부에서 객체생성 못하게 생성자에 private 붙이기
	private UserDAO() {
		// 커넥션 풀 구하기
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 3. 외부에서 객체 요구시 공개된 메서드를 통해 가지고 있던 DAO 객체의 주소값 반환
	
	public static UserDAO getInstance() {
		if(dao ==null) {
			dao = new UserDAO();
		}
		return dao;
	}

	///////////////////////////////////////////////////////////////////////////////////

	@Override
	public boolean confirmID(String id) {
		boolean flag = false;
		String sql = "SELECT * FROM user WHERE user_id=?";
		
		//finally 안써도 되는법
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) flag = true; // 아이디가 존재
			else flag = false; // 아이디 존재하지 않음
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return flag;
	}


	@Override
	public boolean insertUser(UserVO vo) {
		boolean flag = false;
		
		String sql = "INSERT INTO user VALUES(?, ?, ?, ?, ?)";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddress());
			
			if(pstmt.executeUpdate() == 1) flag = true;
			else flag = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}


	@Override
	public int userCheck(String id, String pw) {
		int check = 0;
		// DB에서 ID를 조회해서 아이디가 존재하지 않으면 -1
		// ID가 존재한다면 해당 아이디의 비밀번호를 얻어와서 매개값으로 받은 비밀번호와 같은지 비교해서 틀리다면 0을 리턴, 
		// 일치한다면 1을 리턴
		String sql = "SELECT * FROM user WHERE user_id=?";
		
		try (Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			 
				pstmt.setString(1, id);
				
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {// 아이디가 존재
					String dbPw = rs.getString("user_pw"); // DB에 저장된 비밀번호 얻어옴
					if(dbPw.equals(pw)) {
						check = 1;	// 로그인 성공
					} else check = 0; // 비밀번호 오류
				}
				else check = -1; // 아이디 존재하지 않음
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return check;
	}


	@Override
	public UserVO getUserInfo(String id) {
		UserVO vo = null;
		String sql = "SELECT * FROM user WHERE user_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new UserVO(
						rs.getString("user_id"),
						rs.getString("user_pw"),
						rs.getString("user_name"),
						rs.getString("user_email"),
						rs.getString("user_address")
						);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}


	@Override
	public boolean changePassword(String id, String pw) {
		boolean flag = false;
		String sql = "UPDATE user SET user_pw=? WHERE user_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			
			if(pstmt.executeUpdate() == 1) flag = true;
			else flag = false;
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return flag;
	}


	@Override
	public boolean updateUser(UserVO vo) {
		boolean flag = false;
		String sql = "UPDATE user SET user_name=?, user_email=?, user_address=? WHERE user_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getId());
			
			if(pstmt.executeUpdate() ==1 ) flag = true;
			else flag = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}


	@Override
	public boolean deleteUser(String id) {
		boolean flag = false;
		String sql = "DELETE FROM user WHERE user_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			
			if(pstmt.executeUpdate() == 1) flag = true;
			else flag = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	

	
	
	
	
	
	
}
