package kr.co.jiyeon.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jiyeon.board.model.BoardDAO;
import kr.co.jiyeon.board.model.BoardVO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		List<BoardVO> list = BoardDAO.getInstance().listBoard();
		
		// DB로부터 얻은 list를 request 객체에 저장.
		request.setAttribute("boardList", list);


	}

}
