package kr.co.jiyeon.board.model;

import java.util.List;

public interface IBoardDAO {

	// DB에 작성글을 등록하는 메서드
	void regist(String writer, String title, String content);
	
	// 모든 게시글을 가져오는 메서드(글 목록 리스트)
	List<BoardVO> listBoard();
	
	// 글 상세보기 메서드
	BoardVO contentBoard(Long bId);
	
	// 조회수를 증가시키는 메서드
	void upHit(Long bId);
	
	// 게시글 수정 메서드
	void updateBoard(Long bId, String title, String content);
	
	// 게시글 삭제
	void deleteBoard(Long bId);
	
	// 게시글 검색
	List<BoardVO> searchList(String keyword);
	
}
