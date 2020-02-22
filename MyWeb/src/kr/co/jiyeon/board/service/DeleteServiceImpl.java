package kr.co.jiyeon.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jiyeon.board.model.BoardDAO;

public class DeleteServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		Long bId = Long.parseLong(request.getParameter("bId"));
		BoardDAO.getInstance().deleteBoard(bId);

	}

}
