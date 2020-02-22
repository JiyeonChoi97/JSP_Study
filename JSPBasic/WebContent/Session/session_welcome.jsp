<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	/*
	1. 로그인하지 않은 사용자가 주소창에 이 페이지의  URL을 적고 들어왔을 경우 로그인창으로 돌려보내는 코드를 작성하세요(sendRedirect)
	2. 로그인한 회원 아이디와 별명을 통해 "nick(id)님 환영합니다!"를 출력하세요.
	3. a 태그로 로그인창으로 가는 링크와 request폴더에 앨범 페이지로 갈 수 있는 링크 2개를 작성하세요.
	
	
	*/
	String userId = (String) session.getAttribute("user_id");
	String usernick = (String) session.getAttribute("user_nick");
	if(userId == null){
		response.sendRedirect("session_login.jsp");
	} 
	
%>
<%@ include file="../Application/app_basic.jsp" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<h3><%= usernick %>(<%= userId %>)님 환영합니다.</h3>
		<a href="session_login.jsp">다시 로그인하기</a>
		<a href="/JSPBasic/WebContent/JspObjRequest/req_album.jsp">앨범 리스트 보기</a>
		<a href="session_logout.jsp">로그아웃</a>

		<hr>
		<h3> 방문자 수 : <%=count %></h3>



</body>
</html>