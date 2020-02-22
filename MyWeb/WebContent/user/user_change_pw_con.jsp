<%@page import="kr.co.jiyeon.user.model.UserDAO"%>
<%@page import="kr.co.jiyeon.user.model.IUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	1. 폼 데이터를 처리하세요. (기존 비번, 변경하려는 비번)
	2. dao 주소값 받아오시고 userCheck()메서드를 활용해서 기존 비번과 아이디정보를 바탕으로
	       해당 비밀번호가 일치하는지를 확인하세요.
 
	3. 일치한다면 비밀번호를 바꾸는 메서드 changePassword()를 호출.
	4. "비밀번호가 정상적으로 변경되었습니다." 를 출력 후 mypage로 이동.
	5. 일치하지 않는다면 "현재 비밀번호가 다릅니다." 출력 후 뒤로가기.
	6. 비밀번호 변경 실패시 "비밀번호 변경에 실패했습니다." 출력 후 mypage로 이동.
*/
	request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("user_id");
	String old_pw = request.getParameter("old_pw");
	String new_pw = request.getParameter("new_pw");
	
	IUserDAO dao = UserDAO.getInstance();
	
	int result = dao.userCheck(id, old_pw);
	    
	if(result == 1) { 	
	    	if(dao.changePassword(id, new_pw)){
	%>
		<script>
			alert("비밀번호가 정상적으로 변경되었습니다. ");
			location.href="user_mypage.jsp";
		</script>
		<%   } else {	%>
			<script>
				alert("비밀번호 변경에 실패했습니다.  ");
				location.href="user_mypage.jsp";
			</script>
	<% }
	} else  { 
		
		%>
		<script>
		alert("현재 비밀번호가 다릅니다. ");
		history.back();
		</script>
	<%}	%>