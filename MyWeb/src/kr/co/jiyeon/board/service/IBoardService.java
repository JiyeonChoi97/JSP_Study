package kr.co.jiyeon.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IBoardService {

	// 추상 메서드
	void execute(HttpServletRequest request, HttpServletResponse response);
}
