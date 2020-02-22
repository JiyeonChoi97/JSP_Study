<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%--
	* jsp action tag 사용법
	- <jsp:forward 속성=값, 속성=값 ....></jsp:forward>
	- 닫는 태그는 태그 내부에 추가적으로 종속되어있는 태그가 없다면 닫는 태그를 생략하고 열린 태그 끝부분을 />로 마감할 수 있습니다. 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:forward page="forward_ex02.jsp"/>
	
	<h3>forward_ex01 페이지입니다.</h3>
	<p>포워드 기능 때문에 이 메세지를 보실 수 없을 거에요</p>

</body>
</html>