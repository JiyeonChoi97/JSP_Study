package kr.co.jiyeon.score.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


/*
 * (non-Javadoc)
 * @see kr.co.jiyeon.score.model.IScoreDAO#insert(kr.co.jiyeon.score.model.Scores)
 */
public class ScoreDAO implements IScoreDAO {
	//싱글톤 패턴 적용(객체의 생성을 하나로 제한하기 위한 방법)
		//1. 클래스 외부에서 객체를 생성하지 못하도록 생성자에 private 제한을 붙임.
		
		// jsvax.util import
		private DataSource ds;// 데이터 소스 객체 생성.
		
		private ScoreDAO() {
			try {
				Context ct = new InitialContext();	// 이니셜컨텍스트 객체 생성
				ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			// connection pool 사용하므로 Class.forName("com.mysql.jdbc.Driver") 쓸 필요 없다.
//			try {
//				Class.forName("com.mysql.jdbc.Driver");
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			
		}
		
		//2. 자신의 클래스 내부에서 스스로의 객체를 단 1개만 생성.
		private static ScoreDAO scoreDAO = new ScoreDAO();
		
		//3. 외부에서 객체를 요구할 시 공개된 메서드를 선언하여
		//2번에서 미리 만들어 놓은 단 하나의 객체를 리턴함.
		
		public static ScoreDAO getInstance() {
			if(scoreDAO == null) {
				scoreDAO = new ScoreDAO();
			}
			return scoreDAO;
		}
		//////////////////////////////////////////////////////////////////////////////////////////
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		/* connection pool 사용하므로
		// 커넥션 객체를 생성하여 리턴해 주는 유틸 메서드 선언
		private Connection getConnection() throws Exception {
			String url ="jdbc:mysql://localhost:3306/jsp_practice?serverTimezone=Asia/Seoul";
			String uid = "jsp";
			String upw = "jsp";
			
			// ** 오류 호출부에 떠넘김 (직접 트라이캐치하지 않고)
			return DriverManager.getConnection(url, uid, upw);
		}
		
		*/
		
		@Override
		public boolean insert(Scores score) {
			boolean flag = false;
			String sql = "INSERT INTO scores (name, kor, eng, math, total, average)"
					+ " VALUES(?,?,?,?,?,?)";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, score.getName());
				pstmt.setInt(2, score.getKor());
				pstmt.setInt(3, score.getEng());
				pstmt.setInt(4, score.getMath());
				pstmt.setInt(5, score.getTotal());
				pstmt.setDouble(6, score.getAverage());
				
				int rn = pstmt.executeUpdate();
				if(rn== 1) flag = true;
				else flag = false;

				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(conn != null) conn.close();
					if(pstmt != null) pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}

			
			return flag;
		}



		@Override
		public List<Scores> list() {
			List<Scores> scoreList = new ArrayList<>();
			
			String sql = "SELECT * FROM scores ORDER BY id ASC";
			
			/*
			 - DB에 연결한 후 필요한 객체를 생성 (Scores)
			 - 테이블을 조회해서 모든 학생의 정보를 얻은 후 Scores 객체로 포장
			 - 포장한 객체를 리스트에 추가 -> 리스트를 리턴
			 */
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Scores scores = new Scores(
							rs.getLong("id"),
							rs.getString("name"),
							rs.getInt("kor"),
							rs.getInt("eng"),
							rs.getInt("math"),
							rs.getInt("total"),
							rs.getDouble("average")
							);
					scoreList.add(scores);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn!=null) conn.close();
					if(pstmt!=null) pstmt.close();
					if(rs!=null) rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return scoreList;
		}
		
		
		public List<Scores> search(String keyword) {
			List<Scores> scoreList = new ArrayList<>();
			String sql = "SELECT * FROM scores WHERE name LIKE ? ORDER BY id ASC";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, keyword);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Scores scores = new Scores(
							rs.getLong("id"),
							rs.getString("name"),
							rs.getInt("kor"),
							rs.getInt("eng"),
							rs.getInt("math"),
							rs.getInt("total"),
							rs.getDouble("average")
							);
					scoreList.add(scores);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn!=null) conn.close();
					if(pstmt!=null) pstmt.close();
					if(rs!=null) rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return scoreList;
		}



		@Override
		public boolean delete(Long id) {
			boolean flag = false;
			String sql = "DELETE FROM scores WHERE id=?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setLong(1, id);

				int rn = pstmt.executeUpdate();
				
				if(rn == 1){
					flag = true;
				} else {
					flag = false;
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn!=null) conn.close();
					if(pstmt!=null) pstmt.close();
				} catch(Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return flag;
		}
		
		

}
