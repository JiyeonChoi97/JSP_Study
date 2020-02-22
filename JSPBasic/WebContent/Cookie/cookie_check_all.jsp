<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie[] cookies = request.getCookies();

	for(Cookie c : cookies) {
		String n = c.getName();
		String v = c.getValue();
		out.print(n + " : " + v + "<br>");
		out.print("=========================<br>");
	}
	

%>
