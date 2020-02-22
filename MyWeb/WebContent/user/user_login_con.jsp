<%@page import="kr.co.jiyeon.user.model.UserVO"%>
<%@page import="kr.co.jiyeon.user.model.UserDAO"%>
<%@page import="kr.co.jiyeon.user.model.IUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
		1. 파라미터값 얻어오기
		2. DAO 주소값 얻어오기
		3. 로그인 유효성 검증 메서드 호출(userCheck)
			// 아이디가 없으면 스크립트로 경고창 출력 후 user_join.jsp 로 이동
			// 비밀번호가 틀린 경우 비밀번호가 틀렸다고 출력 후 뒤로가기 진행
			// 로그인 성공인 경우 이름과 id값으로 각각 세션을 하나씩 생성(user_name, user_id)
			// user_mypage.jsp로 리다이렉팅
	*/

    request.setCharacterEncoding("utf-8");
	
	//1
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    //2
    IUserDAO dao = UserDAO.getInstance();
	
    //3
    dao.userCheck(id, pw);
    
    int result = dao.userCheck(id, pw);
    
    if(result == -1) { 		
%>
	<script>
		alert("아이디가 존재하지 않습니다. ");
		location.href="user_join.jsp";
	</script>
<%   } else if(result == 0) { 
	%>
	<script>
	alert("비밀번호가 틀렸습니다. ");
	history.back();
	</script>
<%} else { //로그인 성공
	
	UserVO vo = dao.getUserInfo(id);
	session.setAttribute("user_name", vo.getName());
	session.setAttribute("user_id", id);
	response.sendRedirect("user_mypage.jsp");
}

%>
	
	
	
	
	
%>