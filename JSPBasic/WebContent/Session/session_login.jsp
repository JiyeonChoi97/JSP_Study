<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(session.getAttribute("user_id") != null) {
		String nick = (String) session.getAttribute("user_nick");%>
	<p><%=nick %>님이 현재 로그인 중입니다.</p>
	<a href="session_welcome.jsp">웰컴 페이지로</a>
	<%} else { %>

	<form action="session_login_con.jsp" method="post">
		<input type="text" name="id" size="10" placeholder="ID">
		<input type="password" name="pw" size="10" placeholder="PW">
		<input type="text" name="nick" size="10" placeholder="별명">
		<input type="submit" value="확인">
	</form>
	<%} %>

</body>
</html>