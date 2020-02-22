<%@page import="kr.co.jiyeon.score.model.IScoreDAO"%>
<%@page import="kr.co.jiyeon.score.model.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Long id = Long.parseLong(request.getParameter("id"));

	IScoreDAO dao = ScoreDAO.getInstance();
	boolean flag = dao.delete(id);
	
	if(flag) {
		response.sendRedirect("score_list.jsp");
	} else {
		response.sendRedirect("score_list.jsp");
	}


%>