package kr.co.jiyeon.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO implements IBoardDAO {

	DataSource ds;

	private static BoardDAO dao = new BoardDAO();

	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}

	///////////////////////////////////////////////////////////////////////////////////


	@Override
	public void regist(String writer, String title, String content) {
		// TODO Auto-generated method stub

		String sql = "INSERT INTO my_board(writer, title, content)"
				+ " VALUES(?, ?, ?)";

		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){

			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BoardVO> listBoard() {
		List<BoardVO> articles = new ArrayList<>();
		String sql = "SELECT * FROM my_board ORDER BY board_id DESC";

		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){

			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				BoardVO article = new BoardVO(
						rs.getLong("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getTimestamp("date"),
						rs.getInt("hit")
						);
				articles.add(article);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}

	@Override
	public BoardVO contentBoard(Long bId) {
		BoardVO vo = null;
		String sql = "SELECT * FROM my_board WHERE board_id=?";

		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){

			pstmt.setLong(1, bId);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				vo = new BoardVO(
						rs.getLong("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getTimestamp("date"),
						rs.getInt("hit")
						);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}

	@Override
	public void updateBoard(Long bId, String title, String content) {
		String sql = "UPDATE my_board SET title=?, content=? WHERE board_id=?";

		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setLong(3, bId);

			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void deleteBoard(Long bId) {

		String sql = "DELETE FROM my_board WHERE board_id=?";

		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){

			pstmt.setLong(1, bId);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<BoardVO> searchList(String keyword) {
		List<BoardVO> articles = new ArrayList<>();
		String sql = "SELECT * FROM my_board WHERE title LIKE ?";

		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){

			pstmt.setString(1, "%" + keyword + "%");
			
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				BoardVO article = new BoardVO(
						rs.getLong("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getTimestamp("date"),
						rs.getInt("hit")
						);
				articles.add(article);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;

	}

	@Override
	public void upHit(Long bId) {
		String sql = "UPDATE my_board SET hit = hit+1 WHERE board_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){

			pstmt.setLong(1, bId);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}








}
