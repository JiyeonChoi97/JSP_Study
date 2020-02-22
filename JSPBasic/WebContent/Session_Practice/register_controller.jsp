<%@page import="user.UserRepository"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	// user import 해야 사용 가능 (외부 객체)
	User user = new User(
				request.getParameter("account"),		
				request.getParameter("password"),		
				request.getParameter("name"),		
				request.getParameter("nickname")		
				);

	UserRepository.save(user);
	UserRepository.showUsers();
	
	response.sendRedirect("register_result.jsp");


%>