<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% for(int i=0; i<5; i++) { %>
	<h2>이클립스와 톰캣으로 JSP파일 렌더링하기~~~</h2>
	<p>	<!-- p태그는 문단을 구성해주는 태그입니다. -->
		안녕하세요. 오늘은 11월 16일 입니다.
		스크립틀릿 연습을 하고 있습니다.
	</p>
	<% } %>
	
	<hr>
	
	<h2>구구단 2단</h2>
	
	<% for(int hang=1; hang<10; hang++) { 
		//out.print메서드는 브라우저에 자바 코드를 바로 출력해주는 메서드입니다.
		out.print("2 x " + hang + " = " + (2 * hang) + "<br>");
	}
	%>
	
	<!-- 조건문과 반복문을 이용하여 구구단을 짝수(2, 4, 6, 8)단만 출력해 보세요. -->
	
	<%
	for(int dan=2; dan<=9; dan++) {
		if(dan % 2 == 0) {
			out.println("<h2> 구구단" + dan + "단 </h2><hr>");
			for(int hang=1; hang<=9; hang++){
				out.println(dan + "x" + hang + "=" 
					+ (dan * hang) + "<br>");
			}
		}
	}
	
	%>
		
	
	
	
</body>
</html>

















