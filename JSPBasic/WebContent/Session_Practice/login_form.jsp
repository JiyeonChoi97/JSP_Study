<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 로그인했던 회원이 이 화면으로 진입할 경우 "이미 로그인한 회원입니다" 메세지 출력
	User user = (User) session.getAttribute("login");
	


%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(user == null) { %>

	<h1> 로그인 양식</h1>
	<form action="login_controller.jsp" method="post">
		<p>
			<input type="text" name="account" placeholder="아이디"><br>
			<input type="password" name="password" placeholder="비밀번호"><br>
			<input type="submit" value="로그인">
			<button type="button" onclick="location.href='register_form.jsp'">회원가입</button>
			<%-- 
				onclick 속성은 태그 내에서 자바스크립트 문법을 사용할때 지정하는 속성입니다. 
				location.href는 자바스크립트 문법입니다.
				페이지 이동을 시킬때 사용합니다. 
			 --%>
		</p>
	</form>
	
	<% } else { %>
		<h1><%=user.getName() %>님은 현재 로그인 중입니다.</h1>
		<a href="login_welcome.jsp">웰컴 페이지로</a>
	<% } %>
	
</body>
</html>