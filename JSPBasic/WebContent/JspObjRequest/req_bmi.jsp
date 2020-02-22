<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%--
	bmi 지수 계산 공식 = [체중(kg) / 신장(m) * 신장(m)]
	* bmi 지수가 23을 초과한다면 "당신은 과체중입니다."
	  18.5 미만이라면 "당신은 저체중입니다."
	  그 외에는 "당신은 정상체중입니다. "를 출력하세요
	  
	  파라미터 변수명 -> 신장 = cm, 체중 = kg
	  
	  *문자열 내부에 들어있는 데이터를 기본 데이터 타입으로 변환하는 방법
	   포장(wrapper)클래스에 들어있는 parse + 기본타입이름() 메서드 활용.
	  -> Integer.parseInt(문자열), Double.parseDouble(문자열)
	    
	    request.getParameter() 리턴 타입이  String이기 떄문에 
	    bmi 지수를 계산하려면 실수나 정수로 변환해 주셔야 합니다.
	         신장과 체중 둘다 소수점까지 표현합니다. 
 --%>

<%
 
	String cm = request.getParameter("cm");
	String kg = request.getParameter("kg");
 	double height = Double.parseDouble(cm);
 	double m = height/100;
 	double kg2 = Double.parseDouble(kg);
 	double bmi = kg2 / m * m;
 	bmi= Math.round(bmi*100)/100.0;
 	

 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>체질량 지수(BMI) 계산</title>
</head>
<body>
	<h1>체질량 지수(BMI) 계산</h1>
	<hr>
	<p>
		- 신장 : <%=cm %>cm<br>
		- 체중:  <%=kg %>kg<br>
		- bmi 지수 : <strong><%=bmi %></strong><br>
		<%		 	
		if(bmi > 23){
 			out.print("당신은 과체중입니다. ");
 		} else if( bmi <18.5){
 			out.print("당신은 저체중입니다. ");
 		} else {
 			out.print("당신은 정상체중입니다. ");
 		}
 
 		%>

	</p>
</body>
</html>