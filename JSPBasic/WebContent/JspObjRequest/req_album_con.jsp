<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%
	String album = request.getParameter("title");

	if(album.equals("chatshire")){
		response.sendRedirect("req_chatshire.jsp");
	} else if(album.equals("꽃갈피")){
		response.sendRedirect("req_flower.jsp");

	}



%>