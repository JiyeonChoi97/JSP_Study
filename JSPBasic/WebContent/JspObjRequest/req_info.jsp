<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%
	// ������ �˾Ƽ� ��ü�� ����, URL ��û
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
	# ��û URL : <%= reqURl %> <br>
	# ��û URI : <%= seqUri %><br>
	# ��û �������� : <%= protocol %><br>
	# ��û ���ؽ�Ʈ ��Ʈ ��� : <%= conPath %><br>
	# ���� ��Ʈ��ȣ : <%= serverPort %><br>
</p>
</body>
</html>