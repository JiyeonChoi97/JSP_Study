package kr.co.jiyeon.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jiyeon.board.model.BoardDAO;

public class UpdateServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		Long bId = Long.parseLong(request.getParameter("bId"));
		String title = request.getParameter("bTitle");
		String content = request.getParameter("bContent");
		
		BoardDAO.getInstance().updateBoard(bId, title, content);

	}

}
