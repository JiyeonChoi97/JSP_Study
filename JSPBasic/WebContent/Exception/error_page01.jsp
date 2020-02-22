<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 지시자를 통해서 에러페이지 설정 --%>
<%@ page errorPage="error_page02.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%= request.getParameter("id").toLowerCase() %>

</body>
</html>