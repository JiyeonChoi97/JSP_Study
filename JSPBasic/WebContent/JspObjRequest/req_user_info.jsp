<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String major = request.getParameter("major");
	String region = request.getParameter("region");
	String[] hobbys = request.getParameterValues("hobby");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>form태그로 전달된 데이터 읽기 학습!</h2>

	<p>
		# 이름 : <%=name %>
		# ID : <%=id %>
		# PW : <%=pw %>
		# 전공 : <%=major %>
		# 지역 : <%=region %>
		# 취미 : <%=Arrays.toString(hobbys) %> 
	</p>



</body>
</html>