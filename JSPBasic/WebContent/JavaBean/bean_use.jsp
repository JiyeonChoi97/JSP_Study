<%@page import="kr.co.jiyeon.jspbasic.user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="user" class="kr.co.jiyeon.jspbasic.user.UserBean" scope="request"/>

# 아이디 : <jsp:getProperty name="user" property="id"/> <br>
# 비밀번호 : <jsp:getProperty name="user" property="pw"/> <br>
# 이름 : <jsp:getProperty name="user" property="name"/> <br>
# 이메일 : <jsp:getProperty name="user" property="email"/>

<%-- 

<% UserBean user = (UserBean) request.getAttribute("user"); %>

# 아이디 : <%=user.getId() %>
# 비밀번호 : <%=user.getPw() %>
# 이름 : <%=user.getName() %>
# 이메일 : <%=user.getEmail() %> 
--%>


</body>
</html>