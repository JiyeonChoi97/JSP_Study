<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//post 방식 인코딩
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if(id.equals("abc1234") && pw.equals("aaa1111")){
		Cookie idCookie = new Cookie("id_cookie", id);
		idCookie.setMaxAge(5);
		response.addCookie(idCookie);
		
		if(request.getParameter("id_remember") != null){
			Cookie idMemory = new Cookie("remember_id", id);
			idMemory.setMaxAge(15);
			response.addCookie(idMemory);
		}
		
		
		
		response.sendRedirect("cookie_welcome.jsp");
		
	} else{
		response.sendRedirect("cookie_login.jsp");
	}
	
	
%>