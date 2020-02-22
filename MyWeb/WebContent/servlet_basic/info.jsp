<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 정보 확인하기</h3>
	
	<p>
		# 이름 : ${sessionScope.user.name } <br>
		# 계정명 : ${user.id } <br>
		# 이메일 : ${user.email } <br>
		# 주소 : ${user.address } <br>
	</p>
</body>
</html>