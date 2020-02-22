<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%--
	* 요청 파라미터(request parameter)
	
	- 클라이언트 측에서 서버로 데이터를 요청할 때 전달되는 값들을 담은 변수를 파라미터라고 합니다. 
	- 요청 파라미터는 URL 주소 뒤에 ?를 붙인 이후 [파라미터변수명 = 값]의 형식을 통해 서버로 데이터를 전달합니다. 
	- 요청 파라미터를 여러개 전달할 때는 &기호를 사용하여 나열해서 전달합니다. 
 --%>
 <%
 
 	// 클라이언트에서 전송된 요청 파라미터의 값을 읽는 방법
 	// 내장 객체  request의 메서드인 getParameter("파라미터변수명");
 	
 	String breakfast = request.getParameter("bf");
 	String lunch = request.getParameter("lunch");
 	String dinner = request.getParameter("dinner");
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>
		- 아침밥 : <%=breakfast %>
		- 점심밥 : <%=lunch %>
		- 저녁밥 : <%=dinner %>
		
	</p>

</body>
</html>