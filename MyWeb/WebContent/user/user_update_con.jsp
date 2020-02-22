<%@page import="kr.co.jiyeon.user.model.UserVO"%>
<%@page import="kr.co.jiyeon.user.model.UserDAO"%>
<%@page import="kr.co.jiyeon.user.model.IUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

/*
	1. 폼 데이터 연동
	2. DAO 연동을 통해 updateUser() 메서드 호출하여 회원정보 수정
		회원 정보 수정에 성공했다면 이름에 대한 세션도 다시 작성해 주셔야 합니다. 
	3. 수정 성공시 "회원정보가 수정되었습니다."를 출력 후 마이페이지로 이동
	4. 수정 실패시 "회원정보 수정에 실패했습니다." 출력 후 마이페이지로 이동
	
	String sql = "UPDATE user SET user_name=?, user_email=?, user_address=?, WHERE user_id=?"
			
*/

	request.setCharacterEncoding("utf-8");

	UserVO vo = new UserVO();
	
	vo.setId(request.getParameter("id"));
	vo.setName(request.getParameter("name"));
	vo.setEmail(request.getParameter("email"));
	vo.setAddress(request.getParameter("address"));
	
	IUserDAO dao = UserDAO.getInstance();
	
	if(dao.updateUser(vo)){
	
		// 이름 정보를 변경했으니 세션도 다시 제작
		session.setAttribute("user_name", request.getParameter("name")); %>
	
		<script>
			alert("회원정보가 수정되었습니다.");
			location.href="user_mypage.jsp";
		</script>
	<% } else { %>
		<script>
			alert("회원정보 수정에 실패했습니다.");
			location.href="user_mypage.jsp";
		</script>
	<%}%>
	

