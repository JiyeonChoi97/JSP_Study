<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	public String name = "홍길동";
%>

<%
	String address = "서울특별시";
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	이름: <%= name %> <br>
	주소: <%= address %> <br>
	난수값: <%= Math.random() %>

	<%-- out.print("이름: " + name + "<br>");
			out.print("주소: " + address + "<br>");--%>

</body>
</html>









