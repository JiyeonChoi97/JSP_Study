<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="i" begin="1" end="9">
		<c:forEach var="j" begin="1" end="9">
			${i } X ${j } = ${i*j } <br>
		</c:forEach>
	<hr>
	</c:forEach>
	
	<h4>배열이나 컬렉션 내부의 값을 출력</h4>
	<c:set var="arr" value="<%= new int[] {1,3,5,7,9} %>"/>
	
	<c:forEach var="n" items="${arr }">
		${n } &nbsp;	
	</c:forEach>
</body>
</html>