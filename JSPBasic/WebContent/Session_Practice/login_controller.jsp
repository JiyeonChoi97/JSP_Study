<%@page import="user.User"%>
<%@page import="user.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	/*
		1. 폼 태그에 입력된 회원 정보를 가져오세요.
		
		2. 로그인을 시도하는 회원의 모든 정보를 얻어오세요. (UserRepository.getUser(????))
		
		3. 조건문을 사용하여 User객체의 변수에 null 값을 리턴받았는지를 확인하여 회원가입이 되어있지 않은 사람이 로그인 시도를 한 것이 확인되었을 경우 로그인 페이지로 돌려보냅니다. 
			(script태그로 경고창 출력 후 뒤로가기)
		
		4. User 객체의 변수가 null값이 들어있는게 아니라면 회원 가입 당시에 작성했던 비밀번호가 로그인할때 작성한 비밀번호와 같은지를 판단하여 같다면
			세션에 로그인 데이터를 저장해 주세요.("login", user)
			
		5. 세셔을 만든 후 "login_welcome.jsp" 페이지로 이동시켜 주세요.
		
		6. 비밀번호가 일치하지 않는다면  <script> 태그로 "비밀번호가 일치하지 않습니다." 경고창을 띄워주시고 다시 로그인 페이지로 돌려보내주세요.(뒤로가기)
	*/


		request.setCharacterEncoding("utf-8");
		
		// 1
		String id = request.getParameter("account");
		String pw = request.getParameter("password");
		
		// 2. 로그인을 시도하는 회원의 모든 정보 얻기(**import 해주기**)
		User user = UserRepository.getUser(id);
		
		// 3
		if(user != null) {
			if(pw.equals(user.getPassword())){
				//4
				session.setAttribute("login", user);
				//5
				response.sendRedirect("login_welcome.jsp");
			} else { %>
				<%-- 6 --%>
				<script>
					alert("비밀번호가 틀렸습니다.");
					history.back();
				</script>
			<%} 
			} else { %>
				<script >
					alert("존재하지 않는 회원입니다. ");
					location.href="login_form.jsp";
				</script>
		
		<%} %>
		 
	