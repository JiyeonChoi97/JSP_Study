package kr.co.jiyeon.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jiyeon.board.model.BoardDAO;
import kr.co.jiyeon.board.model.BoardVO;

public class ContentServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		Long bId = Long.parseLong(request.getParameter("boardId"));
		BoardDAO.getInstance().upHit(bId);
		BoardVO vo = BoardDAO.getInstance().contentBoard(bId);
		
		request.setAttribute("content_board", vo);
	}

}
