<%@page import="kr.co.jiyeon.user.model.UserVO"%>
<%@page import="kr.co.jiyeon.user.model.UserDAO"%>
<%@page import="kr.co.jiyeon.user.model.IUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    /*
    	1. 폼 액션으로 날아온 폼 데이터들 (parameters)을 얻어옴.
    	
    	2. DAO 객체를 공개된 메서드를 호출하여 주소값을 얻어오기
    	
    	3. 회원가입 승인 전에 이미 DB에 존재하는 ID인지를 검사. (confirmId)
    	       이미 회원 가입된 id라면 alert으로 아이디가 중복되었다고 경고한 후 뒤로가기 실행
    		
    	4. 가입된 회원이 아닐 경우에는 객체에 포장 후 회원 가입을 승인하는 메서드 실행. 
    		"회원가입을 축하합니다!" alert -> location.href="user_login.jsp"
    		"회원가입에 실패했습니다!" -> 뒤로가기
    */
    
    //1
    request.setCharacterEncoding("utf-8");
    		
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    
    //2
    IUserDAO dao = UserDAO.getInstance();
    
    //3
	if(dao.confirmID(id)) { %>
		<script>
			alert("아이디가 중복되어있습니다. ");
			history.back();
		</script>
	<% } else { // 아이디 중복 안됨
		UserVO vo = new UserVO(id, pw, name, email, address);
	
	//4
		if(dao.insertUser(vo)){%>
		<script>
			alert("회원가입을 축하합니다. ");
			location.href="user_login.jsp";
		</script>
		<% } else { %>
		<script>
			alert("회원가입에 실패했습니다. . ");
			history.back();
		</script>
	<% }
		
	};

    
    
    %>