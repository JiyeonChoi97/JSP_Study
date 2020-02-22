<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	score_bean_make 에서 전송된 ScoreBean 객체를 활용하여 5가지 데이터를 브라우저에 출력하세요.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="score" class="kr.co.jiyeon.jspbasic.score.ScoreBean" scope="request"/>

국어 점수 : <jsp:getProperty property="kor" name="score"/>점<br>
영어 점수 : <jsp:getProperty property="eng" name="score"/>점<br>
수학 점수 : <jsp:getProperty property="math" name="score"/>점<br>
총점 : <jsp:getProperty property="total" name="score"/>점<br>
평균 : <jsp:getProperty property="average" name="score"/>점

</body>
</html>