<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	//Declaration (선언자)
	//jsp파일에서 사용할 멤버변수나 메서드를 선언할 때 사용하는 구역.
	
	public int total;
	
	int randomNumber() {
		//정수 1~10까지의 난수를 발생.
		Random r = new Random();
		return r.nextInt(10) + 1;
	}
	
	String randomColor() {
		
		double d = Math.random();
		
		if(d >= 0.66) {
			return "빨강";
		} else if(d >= 0.33) {
			return "노랑";
		} else {
			return "파랑";
		}
		
	}

%>

<%
	//Scriptlet(스크립틀릿)
	//지역변수 및 메서드 내부의 코드를 작성하는 태그.
	//페이지 요청이 발생할 때마다 실행할 로직을 작성.
	
	int each = 0;
	total++;
	each++;
	
	int rn = randomNumber();
	String rc = randomColor();

%>

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>오늘의 운세</h2>
	
	<p>
		페이지 누적 요청 수: <%= total %>
		페이지 개별 요청 수: <%= each %>
	</p>
	
	<h3>오늘의 행운의 숫자와 행운의 컬러</h3>
	
	<p>
		행운의 숫자: <strong><%=rn %></strong> <br>
		행운의 색깔: <%=rc %>
	</p>
	

</body>
</html>












