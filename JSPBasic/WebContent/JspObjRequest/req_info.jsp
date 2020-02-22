<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%
	// 서버가 알아서 객체를 생성, URL 요청
	StringBuffer reqURl = request.getRequestURL();   
String seqUri = request.getRequestURI();
String protocol = request.getProtocol();
String conPath = request.getContextPath();
int serverPort = request.getServerPort();
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<p>
	# 요청 URL : <%= reqURl %> <br>
	# 요청 URI : <%= seqUri %><br>
	# 요청 프로토콜 : <%= protocol %><br>
	# 요청 컨텍스트 루트 경로 : <%= conPath %><br>
	# 서버 포트번호 : <%= serverPort %><br>
</p>
</body>
</html>