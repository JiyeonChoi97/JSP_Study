<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	/*
	1. 로그인하지 않은 사용자가 주소창에 이 페이지의 URL을 적고 들어왔을 경우 로그인 창으로 돌려보내세요.
	
	2. 로그인한 회원의 아이디와 별명을 통해 "nick(id)님 환영합니다."를 출력하세요.
	
	3. 로그인 화면으로, 로그아웃하기 (logout.jsp), 회원 탈퇴하기(delete.jsp)에 대한 링크를 삽입하세요.
	
	회원 탈퇴하기는 UserRepository에 메서드를 선언합니다. (public static void delete(???))
	회원의 아이디를 매개값으로 받은 후 회원 정보에 해당 아이디의 회원이 존재하는지를 파악하여 있다면  userList 에서 회원정보를 삭제해 주시고 세션도 만료시켜 주시면 됩니다. 
	
	*/
	User user = (User) session.getAttribute("login");
	if(user == null){
		response.sendRedirect("login_form.jsp");
	}

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=user.getNickName() %>(<%=user.getAccount() %>)님 환영합니다.</h2>
	<a href = "login_form.jsp">로그인 화면으로</a>
	<a href = "logout.jsp">로그아웃 하기</a>
	<a href = "delete.jsp">회원 탈퇴하기</a>
</body>
</html>