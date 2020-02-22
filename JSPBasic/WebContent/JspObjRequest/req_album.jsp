<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	   <form action="req_album_result.jsp">
		
		<table border="1" width="700">
		<tr align = "center">
		<%--	<td></td> --%>
			<td>앨범 커버</td>
			<td>가수</td>
			<td>앨범 제목</td>
			<td>발매일</td>
		</tr>
		<tr align = "center">
		<%--	<td><input type="radio" name="title" value="chat-shire"/></td> --%>
			<td><img src="IU.jpg" width="100" height="100"></td>
			<td>IU</td>
			<td><a href="req_album_con.jsp?title=chatshire">CHAT_SHIRE</a></td>
			<td>2019.05.22</td>
		</tr>
		<tr align = "center">
		<%--	<td><input type="radio" name="title" value="꽃갈피"/></td> --%>
			<td><img src="IU2.jpg" width="100" height="100"></td>
			<td>IU</td>
			<td><a href="req_album_con.jsp?title=꽃갈피">꽃갈피</a></td>
			<td>2019.11.11</td>
		</tr>
	<%--	<tr>
			<td align="center" colspan="5"> <input type="submit" value="확인"></td>
		</tr>	--%>
		</table>
		</form>
		</div>
</body>
</html>