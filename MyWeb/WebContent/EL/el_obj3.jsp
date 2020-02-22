<%@page import="el.basic.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Person person = (Person) request.getAttribute("p"); %>
<p>
	# 이름: <%=person.getName() %>
	# 나이: <%=person.getAge() %>
	# 성별: <%=person.getGender() %>
	# 주소: <%=person.getAddress() %>
</p>
<hr>
<p>
	# 이름: ${p.name }
	# 나이: ${p.age }
	# 성별: ${p.gender }
	# 주소: ${p.address }
</p>
</body>
</html>