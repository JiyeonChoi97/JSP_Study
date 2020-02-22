package kr.co.jiyeon.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jiyeon.board.model.BoardDAO;
import kr.co.jiyeon.board.model.BoardVO;

public class SearchServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		List<BoardVO> articles = BoardDAO.getInstance().searchList(request.getParameter("search"));
		
		request.setAttribute("boardList", articles);

	}

}
