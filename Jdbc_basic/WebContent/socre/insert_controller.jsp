<%@page import="kr.co.jiyeon.score.model.IScoreDAO"%>
<%@page import="kr.co.jiyeon.score.model.ScoreDAO"%>
<%@page import="kr.co.jiyeon.score.model.Scores"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// **import**
	Scores scores = new Scores();
	
	scores.setName(request.getParameter("name"));
	// ** kor의 타입은 int
	scores.setKor(Integer.parseInt(request.getParameter("kor")));
	scores.setEng(Integer.parseInt(request.getParameter("eng")));
	scores.setMath(Integer.parseInt(request.getParameter("math")));

	scores.setTotal();
	scores.setAverage();
	
	// **import
	IScoreDAO dao = ScoreDAO.getInstance();
	if(dao.insert(scores)) {
		response.sendRedirect("insert_success.jsp");
	} else {
		response.sendRedirect("insert_form.jsp");
		
	};


%>