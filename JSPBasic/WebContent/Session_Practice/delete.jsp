<%@page import="user.User"%>
<%@page import="user.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// **User import 해주기**
	User user = (User) session.getAttribute("login");
	UserRepository.deleteUser(user.getAccount());
	session.invalidate();
	response.sendRedirect("login_form.jsp");

%>