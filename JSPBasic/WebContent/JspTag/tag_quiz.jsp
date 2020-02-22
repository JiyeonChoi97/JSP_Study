<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Integer> lotto = new ArrayList<>();

	while(lotto.size() < 6){
		int rn = (int) (Math.random() * 45) +1;
		if(!lotto.contains(rn)){
			lotto.add(rn);
		}
		Collections.sort(lotto);
	}

	/*
		- 리스트를 사용하여(ArrayList) 중복이 되지 않는 1~45까지의 난수를 발생시켜서
		 로또 번호를 리스트에 담아주세요.
		 
		- html의 body태그에
		
		ex) 로또 번호 생성 결과

			이번주 로또 번호는 이 번호다!!!
			[1,2,3,4,5,6]
					
		를 출력하세요.
	*/


%>    
    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>로또 번호 생성 결과~!</h1>
	<p>
		이번주 로또 번호는 이 번호다!!<br>
		<%= lotto %>
	</p>

</body>
</html>










